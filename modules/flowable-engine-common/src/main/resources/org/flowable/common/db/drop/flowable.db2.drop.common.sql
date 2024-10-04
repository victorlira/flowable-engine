drop index FLW_IDX_BATCH_PART;

alter table FLW_RU_BATCH_PART
    drop foreign key FLW_FK_BATCH_PART_PARENT;

drop table FLW_RU_BATCH_PART;
drop table FLW_RU_BATCH;

drop index ACT_IDX_ENT_LNK_SCOPE;
drop index ACT_IDX_ENT_LNK_REF_SCOPE;
drop index ACT_IDX_ENT_LNK_ROOT_SCOPE;
drop index ACT_IDX_ENT_LNK_SCOPE_DEF;

drop table ACT_RU_ENTITYLINK;

drop index ACT_IDX_HI_ENT_LNK_SCOPE;
drop index ACT_IDX_HI_ENT_LNK_REF_SCOPE;
drop index ACT_IDX_HI_ENT_LNK_ROOT_SCOPE;
drop index ACT_IDX_HI_ENT_LNK_SCOPE_DEF;

drop table ACT_HI_ENTITYLINK;

drop index ACT_IDX_EVENT_SUBSCR_CONFIG_;
drop index ACT_IDX_EVENT_SUBSCR_EXEC_ID;
drop index ACT_IDX_EVENT_SUBSCR_PROC_ID;
drop index ACT_IDX_EVENT_SUBSCR_SCOPEREF_;

drop table ACT_RU_EVENT_SUBSCR;

drop index ACT_IDX_IDENT_LNK_USER;
drop index ACT_IDX_IDENT_LNK_GROUP;
drop index ACT_IDX_IDENT_LNK_SCOPE;
drop index ACT_IDX_IDENT_LNK_SUB_SCOPE;
drop index ACT_IDX_IDENT_LNK_SCOPE_DEF;

drop table ACT_RU_IDENTITYLINK;

drop index ACT_IDX_HI_IDENT_LNK_USER;
drop index ACT_IDX_HI_IDENT_LNK_SCOPE;
drop index ACT_IDX_HI_IDENT_LNK_SUB_SCOPE;
drop index ACT_IDX_HI_IDENT_LNK_SCOPE_DEF;

drop table ACT_HI_IDENTITYLINK;

drop index ACT_IDX_JOB_EXCEPTION_ID;
drop index ACT_IDX_JOB_CUSTOM_VAL_ID;
drop index ACT_IDX_JOB_CORRELATION_ID;
drop index ACT_IDX_JOB_SCOPE;
drop index ACT_IDX_JOB_SUB_SCOPE;
drop index ACT_IDX_JOB_SCOPE_DEF;

drop index ACT_IDX_TJOB_EXCEPTION_ID;
drop index ACT_IDX_TJOB_CUSTOM_VAL_ID;
drop index ACT_IDX_TJOB_CORRELATION_ID;
drop index ACT_IDX_TJOB_DUEDATE;
drop index ACT_IDX_TJOB_SCOPE;
drop index ACT_IDX_TJOB_SUB_SCOPE;
drop index ACT_IDX_TJOB_SCOPE_DEF;

drop index ACT_IDX_SJOB_EXCEPTION_ID;
drop index ACT_IDX_SJOB_CUSTOM_VAL_ID;
drop index ACT_IDX_SJOB_CORRELATION_ID;
drop index ACT_IDX_SJOB_SCOPE;
drop index ACT_IDX_SJOB_SUB_SCOPE;
drop index ACT_IDX_SJOB_SCOPE_DEF;

drop index ACT_IDX_DJOB_EXCEPTION_ID;
drop index ACT_IDX_DJOB_CUSTOM_VAL_ID;
drop index ACT_IDX_DJOB_CORRELATION_ID;
drop index ACT_IDX_DJOB_SCOPE;
drop index ACT_IDX_DJOB_SUB_SCOPE;
drop index ACT_IDX_DJOB_SCOPE_DEF;

drop index ACT_IDX_EJOB_EXCEPTION_ID;
drop index ACT_IDX_EJOB_CUSTOM_VAL_ID;
drop index ACT_IDX_EJOB_CORRELATION_ID;
drop index ACT_IDX_EJOB_SCOPE;
drop index ACT_IDX_EJOB_SUB_SCOPE;
drop index ACT_IDX_EJOB_SCOPE_DEF;

alter table ACT_RU_JOB
    drop foreign key ACT_FK_JOB_EXCEPTION;

alter table ACT_RU_JOB
    drop foreign key ACT_FK_JOB_CUSTOM_VAL;

alter table ACT_RU_TIMER_JOB
    drop foreign key ACT_FK_TJOB_EXCEPTION;

alter table ACT_RU_TIMER_JOB
    drop foreign key ACT_FK_TJOB_CUSTOM_VAL;

alter table ACT_RU_SUSPENDED_JOB
    drop foreign key ACT_FK_SJOB_EXCEPTION;

alter table ACT_RU_SUSPENDED_JOB
    drop foreign key ACT_FK_SJOB_CUSTOM_VAL;

alter table ACT_RU_DEADLETTER_JOB
    drop foreign key ACT_FK_DJOB_EXCEPTION;

alter table ACT_RU_DEADLETTER_JOB
    drop foreign key ACT_FK_DJOB_CUSTOM_VAL;

alter table ACT_RU_EXTERNAL_JOB
    drop foreign key ACT_FK_EJOB_EXCEPTION;

alter table ACT_RU_EXTERNAL_JOB
    drop foreign key ACT_FK_EJOB_CUSTOM_VAL;

drop table ACT_RU_JOB;
drop table ACT_RU_TIMER_JOB;
drop table ACT_RU_SUSPENDED_JOB;
drop table ACT_RU_DEADLETTER_JOB;
drop table ACT_RU_HISTORY_JOB;
drop table ACT_RU_EXTERNAL_JOB;

drop index ACT_IDX_TASK_CREATE;
drop index ACT_IDX_TASK_SCOPE;
drop index ACT_IDX_TASK_SUB_SCOPE;
drop index ACT_IDX_TASK_SCOPE_DEF;

drop table ACT_RU_TASK;

drop index ACT_IDX_ACT_HI_TSK_LOG_TASK;

drop table ACT_HI_TSK_LOG;

drop index ACT_IDX_HI_TASK_SCOPE;
drop index ACT_IDX_HI_TASK_SUB_SCOPE;
drop index ACT_IDX_HI_TASK_SCOPE_DEF;

drop table ACT_HI_TASKINST;

drop index ACT_IDX_RU_VAR_SCOPE_ID_TYPE;
drop index ACT_IDX_RU_VAR_SUB_ID_TYPE;
drop index ACT_IDX_VARIABLE_BA;

alter table ACT_RU_VARIABLE
    drop foreign key ACT_FK_VAR_BYTEARRAY;

drop table ACT_RU_VARIABLE;

drop index ACT_IDX_HI_PROCVAR_NAME_TYPE;
drop index ACT_IDX_HI_VAR_SCOPE_ID_TYPE;
drop index ACT_IDX_HI_VAR_SUB_ID_TYPE;

drop table ACT_HI_VARINST;

drop table ACT_GE_BYTEARRAY;
drop table ACT_GE_PROPERTY;

