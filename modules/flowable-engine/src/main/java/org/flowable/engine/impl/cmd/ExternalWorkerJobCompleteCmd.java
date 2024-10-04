/* Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.flowable.engine.impl.cmd;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.flowable.bpmn.model.ExternalWorkerServiceTask;
import org.flowable.bpmn.model.IOParameter;
import org.flowable.common.engine.api.delegate.Expression;
import org.flowable.common.engine.api.scope.ScopeTypes;
import org.flowable.common.engine.impl.el.VariableContainerWrapper;
import org.flowable.common.engine.impl.interceptor.Command;
import org.flowable.common.engine.impl.interceptor.CommandContext;
import org.flowable.engine.impl.cfg.ProcessEngineConfigurationImpl;
import org.flowable.engine.impl.persistence.entity.ExecutionEntity;
import org.flowable.engine.impl.util.CommandContextUtil;
import org.flowable.engine.impl.util.CountingEntityUtil;
import org.flowable.job.service.JobServiceConfiguration;
import org.flowable.job.service.impl.persistence.entity.ExternalWorkerJobEntity;
import org.flowable.variable.service.VariableService;
import org.flowable.variable.service.VariableServiceConfiguration;
import org.flowable.variable.service.impl.persistence.entity.VariableInstanceEntity;

/**
 * @author Filip Hrisafov
 */
public class ExternalWorkerJobCompleteCmd extends AbstractExternalWorkerJobCmd implements Command<Void> {

    protected Map<String, Object> variables;

    public ExternalWorkerJobCompleteCmd(String externalJobId, String workerId, Map<String, Object> variables, JobServiceConfiguration jobServiceConfiguration) {
        super(externalJobId, workerId, jobServiceConfiguration);
        this.variables = variables;
    }

    @Override
    protected void runJobLogic(ExternalWorkerJobEntity externalWorkerJob, CommandContext commandContext) {
        // We need to remove the job handler configuration
        externalWorkerJob.setJobHandlerConfiguration(null);

        ProcessEngineConfigurationImpl processEngineConfiguration = CommandContextUtil.getProcessEngineConfiguration(commandContext);
        VariableServiceConfiguration variableServiceConfiguration = processEngineConfiguration.getVariableServiceConfiguration();
        VariableService variableService = variableServiceConfiguration.getVariableService();

        ExecutionEntity executionEntity = processEngineConfiguration.getExecutionEntityManager().findById(externalWorkerJob.getExecutionId());
        ExternalWorkerServiceTask externalWorkerServiceTask = (ExternalWorkerServiceTask) executionEntity.getCurrentFlowElement();
        List<IOParameter> outParameters = externalWorkerServiceTask.getOutParameters();

        if (outParameters != null && !outParameters.isEmpty()) {
            VariableContainerWrapper temporaryVariableContainer = new VariableContainerWrapper(variables);
            for (IOParameter outParameter : outParameters) {
                Object variableValue;
                if (StringUtils.isNotEmpty(outParameter.getSource())) {
                    variableValue = temporaryVariableContainer.getVariable(outParameter.getSource());
                } else {
                    Expression outParameterExpression = processEngineConfiguration.getExpressionManager()
                            .createExpression(outParameter.getSourceExpression());
                    variableValue = outParameterExpression.getValue(temporaryVariableContainer);
                }
                addVariable(externalWorkerJob, variableService, outParameter.getTarget(), variableValue);
            }

        } else if (variables != null && !variables.isEmpty()) {
            for (Map.Entry<String, Object> variableEntry : variables.entrySet()) {
                String varName = variableEntry.getKey();
                Object varValue = variableEntry.getValue();

                addVariable(externalWorkerJob, variableService, varName, varValue);
            }
        }

        moveExternalWorkerJobToExecutableJob(externalWorkerJob, commandContext);
    }

    protected void addVariable(ExternalWorkerJobEntity externalWorkerJob, VariableService variableService, String varName, Object varValue) {
        VariableInstanceEntity variableInstance = variableService.createVariableInstance(varName);
        variableInstance.setScopeId(externalWorkerJob.getProcessInstanceId());
        variableInstance.setSubScopeId(externalWorkerJob.getExecutionId());
        variableInstance.setScopeType(ScopeTypes.BPMN_EXTERNAL_WORKER);

        variableService.insertVariableInstanceWithValue(variableInstance, varValue, externalWorkerJob.getTenantId());

        CountingEntityUtil.handleInsertVariableInstanceEntityCount(variableInstance);
    }
}
