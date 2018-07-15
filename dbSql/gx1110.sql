prompt PL/SQL Developer Export Tables for user GX1110@ORCL
prompt Created by Administrator on 2018年7月15日
set feedback off
set define off

prompt Creating ACT_GE_PROPERTY...
create table ACT_GE_PROPERTY
(
  name_  NVARCHAR2(64) not null,
  value_ NVARCHAR2(300),
  rev_   INTEGER
)
tablespace USER_TABLESPACE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACT_GE_PROPERTY
  add primary key (NAME_)
  using index 
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ACT_HI_ACTINST...
create table ACT_HI_ACTINST
(
  id_                NVARCHAR2(64) not null,
  proc_def_id_       NVARCHAR2(64) not null,
  proc_inst_id_      NVARCHAR2(64) not null,
  execution_id_      NVARCHAR2(64) not null,
  act_id_            NVARCHAR2(255) not null,
  task_id_           NVARCHAR2(64),
  call_proc_inst_id_ NVARCHAR2(64),
  act_name_          NVARCHAR2(255),
  act_type_          NVARCHAR2(255) not null,
  assignee_          NVARCHAR2(255),
  start_time_        TIMESTAMP(6) not null,
  end_time_          TIMESTAMP(6),
  duration_          NUMBER(19)
)
tablespace USER_TABLESPACE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ACT_IDX_HI_ACT_INST_END on ACT_HI_ACTINST (END_TIME_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ACT_IDX_HI_ACT_INST_EXEC on ACT_HI_ACTINST (EXECUTION_ID_, ACT_ID_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ACT_IDX_HI_ACT_INST_PROCINST on ACT_HI_ACTINST (PROC_INST_ID_, ACT_ID_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ACT_IDX_HI_ACT_INST_START on ACT_HI_ACTINST (START_TIME_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACT_HI_ACTINST
  add primary key (ID_)
  using index 
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ACT_HI_ATTACHMENT...
create table ACT_HI_ATTACHMENT
(
  id_           NVARCHAR2(64) not null,
  rev_          INTEGER,
  user_id_      NVARCHAR2(255),
  name_         NVARCHAR2(255),
  description_  NVARCHAR2(2000),
  type_         NVARCHAR2(255),
  task_id_      NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64),
  url_          NVARCHAR2(2000),
  content_id_   NVARCHAR2(64)
)
tablespace USER_TABLESPACE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table ACT_HI_ATTACHMENT
  add primary key (ID_)
  using index 
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating ACT_HI_DETAIL...
create table ACT_HI_DETAIL
(
  id_           NVARCHAR2(64) not null,
  type_         NVARCHAR2(255) not null,
  proc_inst_id_ NVARCHAR2(64),
  execution_id_ NVARCHAR2(64),
  task_id_      NVARCHAR2(64),
  act_inst_id_  NVARCHAR2(64),
  name_         NVARCHAR2(255) not null,
  var_type_     NVARCHAR2(64),
  rev_          INTEGER,
  time_         TIMESTAMP(6) not null,
  bytearray_id_ NVARCHAR2(64),
  double_       NUMBER(*,10),
  long_         NUMBER(19),
  text_         NVARCHAR2(2000),
  text2_        NVARCHAR2(2000)
)
tablespace USER_TABLESPACE
  pctfree 10
  initrans 1
  maxtrans 255;
create index ACT_IDX_HI_DETAIL_ACT_INST on ACT_HI_DETAIL (ACT_INST_ID_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255;
create index ACT_IDX_HI_DETAIL_NAME on ACT_HI_DETAIL (NAME_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255;
create index ACT_IDX_HI_DETAIL_PROC_INST on ACT_HI_DETAIL (PROC_INST_ID_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255;
create index ACT_IDX_HI_DETAIL_TASK_ID on ACT_HI_DETAIL (TASK_ID_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255;
create index ACT_IDX_HI_DETAIL_TIME on ACT_HI_DETAIL (TIME_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255;
alter table ACT_HI_DETAIL
  add primary key (ID_)
  using index 
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating ACT_HI_IDENTITYLINK...
create table ACT_HI_IDENTITYLINK
(
  id_           NVARCHAR2(64) not null,
  group_id_     NVARCHAR2(255),
  type_         NVARCHAR2(255),
  user_id_      NVARCHAR2(255),
  task_id_      NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64)
)
tablespace USER_TABLESPACE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ACT_IDX_HI_IDENT_LNK_PROCINST on ACT_HI_IDENTITYLINK (PROC_INST_ID_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ACT_IDX_HI_IDENT_LNK_TASK on ACT_HI_IDENTITYLINK (TASK_ID_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ACT_IDX_HI_IDENT_LNK_USER on ACT_HI_IDENTITYLINK (USER_ID_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACT_HI_IDENTITYLINK
  add primary key (ID_)
  using index 
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ACT_HI_PROCINST...
create table ACT_HI_PROCINST
(
  id_                        NVARCHAR2(64) not null,
  proc_inst_id_              NVARCHAR2(64) not null,
  business_key_              NVARCHAR2(255),
  proc_def_id_               NVARCHAR2(64) not null,
  start_time_                TIMESTAMP(6) not null,
  end_time_                  TIMESTAMP(6),
  duration_                  NUMBER(19),
  start_user_id_             NVARCHAR2(255),
  start_act_id_              NVARCHAR2(255),
  end_act_id_                NVARCHAR2(255),
  super_process_instance_id_ NVARCHAR2(64),
  delete_reason_             NVARCHAR2(2000)
)
tablespace USER_TABLESPACE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ACT_IDX_HI_PRO_INST_END on ACT_HI_PROCINST (END_TIME_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ACT_IDX_HI_PRO_I_BUSKEY on ACT_HI_PROCINST (BUSINESS_KEY_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index ACT_UNIQ_HI_BUS_KEY on ACT_HI_PROCINST (CASE  WHEN BUSINESS_KEY_ IS NULL THEN NULL ELSE PROC_DEF_ID_ END, CASE  WHEN BUSINESS_KEY_ IS NULL THEN NULL ELSE BUSINESS_KEY_ END)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACT_HI_PROCINST
  add primary key (ID_)
  using index 
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACT_HI_PROCINST
  add unique (PROC_INST_ID_)
  using index 
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ACT_HI_TASKINST...
create table ACT_HI_TASKINST
(
  id_             NVARCHAR2(64) not null,
  proc_def_id_    NVARCHAR2(64),
  task_def_key_   NVARCHAR2(255),
  proc_inst_id_   NVARCHAR2(64),
  execution_id_   NVARCHAR2(64),
  parent_task_id_ NVARCHAR2(64),
  name_           NVARCHAR2(255),
  description_    NVARCHAR2(2000),
  owner_          NVARCHAR2(255),
  assignee_       NVARCHAR2(255),
  start_time_     TIMESTAMP(6) not null,
  claim_time_     TIMESTAMP(6),
  end_time_       TIMESTAMP(6),
  duration_       NUMBER(19),
  delete_reason_  NVARCHAR2(2000),
  priority_       INTEGER,
  due_date_       TIMESTAMP(6),
  form_key_       NVARCHAR2(255)
)
tablespace USER_TABLESPACE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACT_HI_TASKINST
  add primary key (ID_)
  using index 
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ACT_HI_VARINST...
create table ACT_HI_VARINST
(
  id_           NVARCHAR2(64) not null,
  proc_inst_id_ NVARCHAR2(64),
  execution_id_ NVARCHAR2(64),
  task_id_      NVARCHAR2(64),
  name_         NVARCHAR2(255) not null,
  var_type_     NVARCHAR2(100),
  rev_          INTEGER,
  bytearray_id_ NVARCHAR2(64),
  double_       NUMBER(*,10),
  long_         NUMBER(19),
  text_         NVARCHAR2(2000),
  text2_        NVARCHAR2(2000)
)
tablespace USER_TABLESPACE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ACT_IDX_HI_PROCVAR_NAME_TYPE on ACT_HI_VARINST (NAME_, VAR_TYPE_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ACT_IDX_HI_PROCVAR_PROC_INST on ACT_HI_VARINST (PROC_INST_ID_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACT_HI_VARINST
  add primary key (ID_)
  using index 
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ACT_ID_GROUP...
create table ACT_ID_GROUP
(
  id_   NVARCHAR2(64) not null,
  rev_  INTEGER,
  name_ NVARCHAR2(255),
  type_ NVARCHAR2(255)
)
tablespace USER_TABLESPACE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table ACT_ID_GROUP
  add primary key (ID_)
  using index 
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating ACT_ID_USER...
create table ACT_ID_USER
(
  id_         NVARCHAR2(64) not null,
  rev_        INTEGER,
  first_      NVARCHAR2(255),
  last_       NVARCHAR2(255),
  email_      NVARCHAR2(255),
  pwd_        NVARCHAR2(255),
  picture_id_ NVARCHAR2(64)
)
tablespace USER_TABLESPACE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table ACT_ID_USER
  add primary key (ID_)
  using index 
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating ACT_ID_MEMBERSHIP...
create table ACT_ID_MEMBERSHIP
(
  user_id_  NVARCHAR2(64) not null,
  group_id_ NVARCHAR2(64) not null
)
tablespace USER_TABLESPACE
  pctfree 10
  initrans 1
  maxtrans 255;
create index ACT_IDX_MEMB_GROUP on ACT_ID_MEMBERSHIP (GROUP_ID_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255;
create index ACT_IDX_MEMB_USER on ACT_ID_MEMBERSHIP (USER_ID_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255;
alter table ACT_ID_MEMBERSHIP
  add primary key (USER_ID_, GROUP_ID_)
  using index 
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255;
alter table ACT_ID_MEMBERSHIP
  add constraint ACT_FK_MEMB_GROUP foreign key (GROUP_ID_)
  references ACT_ID_GROUP (ID_);
alter table ACT_ID_MEMBERSHIP
  add constraint ACT_FK_MEMB_USER foreign key (USER_ID_)
  references ACT_ID_USER (ID_);

prompt Creating ACT_RE_DEPLOYMENT...
create table ACT_RE_DEPLOYMENT
(
  id_          NVARCHAR2(64) not null,
  name_        NVARCHAR2(255),
  category_    NVARCHAR2(255),
  deploy_time_ TIMESTAMP(6)
)
tablespace USER_TABLESPACE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACT_RE_DEPLOYMENT
  add primary key (ID_)
  using index 
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ACT_RE_MODEL...
create table ACT_RE_MODEL
(
  id_                           NVARCHAR2(64) not null,
  rev_                          INTEGER,
  name_                         NVARCHAR2(255),
  key_                          NVARCHAR2(255),
  category_                     NVARCHAR2(255),
  create_time_                  TIMESTAMP(6),
  last_update_time_             TIMESTAMP(6),
  version_                      INTEGER,
  meta_info_                    NVARCHAR2(2000),
  deployment_id_                NVARCHAR2(64),
  editor_source_value_id_       NVARCHAR2(64),
  editor_source_extra_value_id_ NVARCHAR2(64)
)
tablespace USER_TABLESPACE
  pctfree 10
  initrans 1
  maxtrans 255;
create index ACT_IDX_MODEL_DEPLOYMENT on ACT_RE_MODEL (DEPLOYMENT_ID_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255;
create index ACT_IDX_MODEL_SOURCE on ACT_RE_MODEL (EDITOR_SOURCE_VALUE_ID_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255;
create index ACT_IDX_MODEL_SOURCE_EXTRA on ACT_RE_MODEL (EDITOR_SOURCE_EXTRA_VALUE_ID_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255;
alter table ACT_RE_MODEL
  add primary key (ID_)
  using index 
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255;
alter table ACT_RE_MODEL
  add constraint ACT_FK_MODEL_DEPLOYMENT foreign key (DEPLOYMENT_ID_)
  references ACT_RE_DEPLOYMENT (ID_);
alter table ACT_RE_MODEL
  add constraint ACT_FK_MODEL_SOURCE foreign key (EDITOR_SOURCE_VALUE_ID_)
  references ACT_GE_BYTEARRAY (ID_);
alter table ACT_RE_MODEL
  add constraint ACT_FK_MODEL_SOURCE_EXTRA foreign key (EDITOR_SOURCE_EXTRA_VALUE_ID_)
  references ACT_GE_BYTEARRAY (ID_);

prompt Creating ACT_RE_PROCDEF...
create table ACT_RE_PROCDEF
(
  id_                 NVARCHAR2(64) not null,
  rev_                INTEGER,
  category_           NVARCHAR2(255),
  name_               NVARCHAR2(255),
  key_                NVARCHAR2(255) not null,
  version_            INTEGER not null,
  deployment_id_      NVARCHAR2(64),
  resource_name_      NVARCHAR2(2000),
  dgrm_resource_name_ VARCHAR2(4000),
  description_        NVARCHAR2(2000),
  has_start_form_key_ NUMBER(1),
  suspension_state_   INTEGER
)
tablespace USER_TABLESPACE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACT_RE_PROCDEF
  add primary key (ID_)
  using index 
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACT_RE_PROCDEF
  add constraint ACT_UNIQ_PROCDEF unique (KEY_, VERSION_)
  using index 
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACT_RE_PROCDEF
  add check (HAS_START_FORM_KEY_ IN (1,0));

prompt Creating ACT_RU_EXECUTION...
create table ACT_RU_EXECUTION
(
  id_               NVARCHAR2(64) not null,
  rev_              INTEGER,
  proc_inst_id_     NVARCHAR2(64),
  business_key_     NVARCHAR2(255),
  parent_id_        NVARCHAR2(64),
  proc_def_id_      NVARCHAR2(64),
  super_exec_       NVARCHAR2(64),
  act_id_           NVARCHAR2(255),
  is_active_        NUMBER(1),
  is_concurrent_    NUMBER(1),
  is_scope_         NUMBER(1),
  is_event_scope_   NUMBER(1),
  suspension_state_ INTEGER,
  cached_ent_state_ INTEGER
)
tablespace USER_TABLESPACE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ACT_IDX_EXEC_BUSKEY on ACT_RU_EXECUTION (BUSINESS_KEY_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ACT_IDX_EXE_PARENT on ACT_RU_EXECUTION (PARENT_ID_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ACT_IDX_EXE_PROCDEF on ACT_RU_EXECUTION (PROC_DEF_ID_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ACT_IDX_EXE_PROCINST on ACT_RU_EXECUTION (PROC_INST_ID_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ACT_IDX_EXE_SUPER on ACT_RU_EXECUTION (SUPER_EXEC_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index ACT_UNIQ_RU_BUS_KEY on ACT_RU_EXECUTION (CASE  WHEN BUSINESS_KEY_ IS NULL THEN NULL ELSE PROC_DEF_ID_ END, CASE  WHEN BUSINESS_KEY_ IS NULL THEN NULL ELSE BUSINESS_KEY_ END)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACT_RU_EXECUTION
  add primary key (ID_)
  using index 
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACT_RU_EXECUTION
  add constraint ACT_FK_EXE_PARENT foreign key (PARENT_ID_)
  references ACT_RU_EXECUTION (ID_);
alter table ACT_RU_EXECUTION
  add constraint ACT_FK_EXE_PROCDEF foreign key (PROC_DEF_ID_)
  references ACT_RE_PROCDEF (ID_);
alter table ACT_RU_EXECUTION
  add constraint ACT_FK_EXE_PROCINST foreign key (PROC_INST_ID_)
  references ACT_RU_EXECUTION (ID_);
alter table ACT_RU_EXECUTION
  add constraint ACT_FK_EXE_SUPER foreign key (SUPER_EXEC_)
  references ACT_RU_EXECUTION (ID_);
alter table ACT_RU_EXECUTION
  add check (IS_ACTIVE_ IN (1,0));
alter table ACT_RU_EXECUTION
  add check (IS_CONCURRENT_ IN (1,0));
alter table ACT_RU_EXECUTION
  add check (IS_SCOPE_ IN (1,0));
alter table ACT_RU_EXECUTION
  add check (IS_EVENT_SCOPE_ IN (1,0));

prompt Creating ACT_RU_EVENT_SUBSCR...
create table ACT_RU_EVENT_SUBSCR
(
  id_            NVARCHAR2(64) not null,
  rev_           INTEGER,
  event_type_    NVARCHAR2(255) not null,
  event_name_    NVARCHAR2(255),
  execution_id_  NVARCHAR2(64),
  proc_inst_id_  NVARCHAR2(64),
  activity_id_   NVARCHAR2(64),
  configuration_ NVARCHAR2(255),
  created_       TIMESTAMP(6) not null
)
tablespace USER_TABLESPACE
  pctfree 10
  initrans 1
  maxtrans 255;
create index ACT_IDX_EVENT_SUBSCR on ACT_RU_EVENT_SUBSCR (EXECUTION_ID_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255;
create index ACT_IDX_EVENT_SUBSCR_CONFIG_ on ACT_RU_EVENT_SUBSCR (CONFIGURATION_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255;
alter table ACT_RU_EVENT_SUBSCR
  add primary key (ID_)
  using index 
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255;
alter table ACT_RU_EVENT_SUBSCR
  add constraint ACT_FK_EVENT_EXEC foreign key (EXECUTION_ID_)
  references ACT_RU_EXECUTION (ID_);

prompt Creating ACT_RU_TASK...
create table ACT_RU_TASK
(
  id_               NVARCHAR2(64) not null,
  rev_              INTEGER,
  execution_id_     NVARCHAR2(64),
  proc_inst_id_     NVARCHAR2(64),
  proc_def_id_      NVARCHAR2(64),
  name_             NVARCHAR2(255),
  parent_task_id_   NVARCHAR2(64),
  description_      NVARCHAR2(2000),
  task_def_key_     NVARCHAR2(255),
  owner_            NVARCHAR2(255),
  assignee_         NVARCHAR2(255),
  delegation_       NVARCHAR2(64),
  priority_         INTEGER,
  create_time_      TIMESTAMP(6),
  due_date_         TIMESTAMP(6),
  suspension_state_ INTEGER
)
tablespace USER_TABLESPACE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ACT_IDX_TASK_CREATE on ACT_RU_TASK (CREATE_TIME_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ACT_IDX_TASK_EXEC on ACT_RU_TASK (EXECUTION_ID_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ACT_IDX_TASK_PROCDEF on ACT_RU_TASK (PROC_DEF_ID_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ACT_IDX_TASK_PROCINST on ACT_RU_TASK (PROC_INST_ID_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACT_RU_TASK
  add primary key (ID_)
  using index 
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACT_RU_TASK
  add constraint ACT_FK_TASK_EXE foreign key (EXECUTION_ID_)
  references ACT_RU_EXECUTION (ID_);
alter table ACT_RU_TASK
  add constraint ACT_FK_TASK_PROCDEF foreign key (PROC_DEF_ID_)
  references ACT_RE_PROCDEF (ID_);
alter table ACT_RU_TASK
  add constraint ACT_FK_TASK_PROCINST foreign key (PROC_INST_ID_)
  references ACT_RU_EXECUTION (ID_);

prompt Creating ACT_RU_IDENTITYLINK...
create table ACT_RU_IDENTITYLINK
(
  id_           NVARCHAR2(64) not null,
  rev_          INTEGER,
  group_id_     NVARCHAR2(255),
  type_         NVARCHAR2(255),
  user_id_      NVARCHAR2(255),
  task_id_      NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64),
  proc_def_id_  NVARCHAR2(64)
)
tablespace USER_TABLESPACE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ACT_IDX_ATHRZ_PROCEDEF on ACT_RU_IDENTITYLINK (PROC_DEF_ID_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ACT_IDX_IDENT_LNK_GROUP on ACT_RU_IDENTITYLINK (GROUP_ID_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ACT_IDX_IDENT_LNK_USER on ACT_RU_IDENTITYLINK (USER_ID_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ACT_IDX_IDL_PROCINST on ACT_RU_IDENTITYLINK (PROC_INST_ID_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ACT_IDX_TSKASS_TASK on ACT_RU_IDENTITYLINK (TASK_ID_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACT_RU_IDENTITYLINK
  add primary key (ID_)
  using index 
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACT_RU_IDENTITYLINK
  add constraint ACT_FK_ATHRZ_PROCEDEF foreign key (PROC_DEF_ID_)
  references ACT_RE_PROCDEF (ID_);
alter table ACT_RU_IDENTITYLINK
  add constraint ACT_FK_IDL_PROCINST foreign key (PROC_INST_ID_)
  references ACT_RU_EXECUTION (ID_);
alter table ACT_RU_IDENTITYLINK
  add constraint ACT_FK_TSKASS_TASK foreign key (TASK_ID_)
  references ACT_RU_TASK (ID_);

prompt Creating ACT_RU_JOB...
create table ACT_RU_JOB
(
  id_                  NVARCHAR2(64) not null,
  rev_                 INTEGER,
  type_                NVARCHAR2(255) not null,
  lock_exp_time_       TIMESTAMP(6),
  lock_owner_          NVARCHAR2(255),
  exclusive_           NUMBER(1),
  execution_id_        NVARCHAR2(64),
  process_instance_id_ NVARCHAR2(64),
  proc_def_id_         NVARCHAR2(64),
  retries_             INTEGER,
  exception_stack_id_  NVARCHAR2(64),
  exception_msg_       NVARCHAR2(2000),
  duedate_             TIMESTAMP(6),
  repeat_              NVARCHAR2(255),
  handler_type_        NVARCHAR2(255),
  handler_cfg_         NVARCHAR2(2000)
)
tablespace USER_TABLESPACE
  pctfree 10
  initrans 1
  maxtrans 255;
create index ACT_IDX_JOB_EXCEPTION on ACT_RU_JOB (EXCEPTION_STACK_ID_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255;
alter table ACT_RU_JOB
  add primary key (ID_)
  using index 
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255;
alter table ACT_RU_JOB
  add constraint ACT_FK_JOB_EXCEPTION foreign key (EXCEPTION_STACK_ID_)
  references ACT_GE_BYTEARRAY (ID_);
alter table ACT_RU_JOB
  add check (EXCLUSIVE_ IN (1,0));

prompt Creating ACT_RU_VARIABLE...
create table ACT_RU_VARIABLE
(
  id_           NVARCHAR2(64) not null,
  rev_          INTEGER,
  type_         NVARCHAR2(255) not null,
  name_         NVARCHAR2(255) not null,
  execution_id_ NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64),
  task_id_      NVARCHAR2(64),
  bytearray_id_ NVARCHAR2(64),
  double_       NUMBER(*,10),
  long_         NUMBER(19),
  text_         NVARCHAR2(2000),
  text2_        NVARCHAR2(2000)
)
tablespace USER_TABLESPACE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ACT_IDX_VARIABLE_TASK_ID on ACT_RU_VARIABLE (TASK_ID_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ACT_IDX_VAR_BYTEARRAY on ACT_RU_VARIABLE (BYTEARRAY_ID_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ACT_IDX_VAR_EXE on ACT_RU_VARIABLE (EXECUTION_ID_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ACT_IDX_VAR_PROCINST on ACT_RU_VARIABLE (PROC_INST_ID_)
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACT_RU_VARIABLE
  add primary key (ID_)
  using index 
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACT_RU_VARIABLE
  add constraint ACT_FK_VAR_BYTEARRAY foreign key (BYTEARRAY_ID_)
  references ACT_GE_BYTEARRAY (ID_);
alter table ACT_RU_VARIABLE
  add constraint ACT_FK_VAR_EXE foreign key (EXECUTION_ID_)
  references ACT_RU_EXECUTION (ID_);
alter table ACT_RU_VARIABLE
  add constraint ACT_FK_VAR_PROCINST foreign key (PROC_INST_ID_)
  references ACT_RU_EXECUTION (ID_);

prompt Creating EB_BRAND...
create table EB_BRAND
(
  brand_id   NUMBER(11) not null,
  brand_name VARCHAR2(80) not null,
  brand_desc VARCHAR2(1200),
  imgs       VARCHAR2(100),
  website    VARCHAR2(240),
  brand_sort NUMBER(5)
)
tablespace GX1110
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EB_BRAND.brand_id
  is '品牌主键';
comment on column EB_BRAND.brand_name
  is '品牌名称';
comment on column EB_BRAND.brand_desc
  is '品牌描述';
comment on column EB_BRAND.imgs
  is '存储图片地址';
comment on column EB_BRAND.website
  is '品牌网址';
comment on column EB_BRAND.brand_sort
  is '前台显示排序';
alter table EB_BRAND
  add constraint BRAND_ID_PRIMARYKEY primary key (BRAND_ID)
  using index 
  tablespace GX1110
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating EB_CAT...
create table EB_CAT
(
  cat_id    NUMBER(11) not null,
  cat_name  VARCHAR2(80),
  cat_desc  VARCHAR2(80),
  parent_id NUMBER(11) not null,
  cat_sort  NUMBER(5),
  keywords  VARCHAR2(80),
  path      VARCHAR2(200),
  mark      VARCHAR2(80),
  isdisplay NUMBER(5),
  full_path VARCHAR2(200),
  cat_type  NUMBER(5)
)
tablespace GX1110
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EB_CAT.cat_id
  is '类目主键';
comment on column EB_CAT.cat_name
  is '类目名称';
comment on column EB_CAT.cat_desc
  is '类目描述';
comment on column EB_CAT.parent_id
  is '父类目ID,0表示根节点';
comment on column EB_CAT.cat_sort
  is '前台显示排序';
comment on column EB_CAT.keywords
  is '关键词';
comment on column EB_CAT.path
  is '静态化访问路径';
comment on column EB_CAT.mark
  is '分类标识';
comment on column EB_CAT.isdisplay
  is '是否前台显示';
comment on column EB_CAT.full_path
  is '静态化面包屑导航全路径';
comment on column EB_CAT.cat_type
  is '0,不分类;1,实体';
alter table EB_CAT
  add constraint CAT_ID_PK primary key (CAT_ID)
  using index 
  tablespace GX1110
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating EB_CATBRAND...
create table EB_CATBRAND
(
  cat_id   NUMBER(11) not null,
  brand_id NUMBER(11) not null
)
tablespace GX1110
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table EB_CATBRAND
  add constraint CAT_BRAND_ID primary key (CAT_ID, BRAND_ID)
  using index 
  tablespace GX1110
  pctfree 10
  initrans 2
  maxtrans 255;
alter table EB_CATBRAND
  add constraint CATBRAND_BRAND_FK foreign key (BRAND_ID)
  references EB_BRAND (BRAND_ID);
alter table EB_CATBRAND
  add constraint CATBRAND_CAT_FK foreign key (CAT_ID)
  references EB_CAT (CAT_ID);

prompt Creating EB_CONSOLE_LOG...
create table EB_CONSOLE_LOG
(
  console_log_id NUMBER(11) not null,
  entity_name    VARCHAR2(50),
  entity_id      NUMBER(11),
  user_id        NUMBER(11),
  op_type        VARCHAR2(50),
  op_time        TIMESTAMP(6),
  notes          VARCHAR2(200),
  table_name     VARCHAR2(100)
)
tablespace GX1110
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EB_CONSOLE_LOG.console_log_id
  is '后台操作日志主键';
comment on column EB_CONSOLE_LOG.entity_name
  is '操作实体的名称(数据库表的中文名字)';
comment on column EB_CONSOLE_LOG.entity_id
  is '操作实体的数据库记录主键';
comment on column EB_CONSOLE_LOG.user_id
  is '操作者id';
comment on column EB_CONSOLE_LOG.op_type
  is '操作类型';
comment on column EB_CONSOLE_LOG.op_time
  is '操作时间';
comment on column EB_CONSOLE_LOG.notes
  is '备注';
comment on column EB_CONSOLE_LOG.table_name
  is '操作的数据库表名';

prompt Creating EB_FEATURE...
create table EB_FEATURE
(
  feature_id    NUMBER(11) not null,
  cat_id        NUMBER(11),
  feature_name  VARCHAR2(80),
  is_spec       NUMBER(1),
  is_select     NUMBER(1),
  is_show       NUMBER(1),
  select_values VARCHAR2(800),
  input_type    NUMBER(2),
  feature_sort  NUMBER(5)
)
tablespace GX1110
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EB_FEATURE.feature_id
  is '商品属性主键';
comment on column EB_FEATURE.cat_id
  is '所属类别id';
comment on column EB_FEATURE.feature_name
  is '属性名称';
comment on column EB_FEATURE.is_spec
  is '是否为规格：0为否，1为是';
comment on column EB_FEATURE.is_select
  is '是否为筛选：0为否，1为是';
comment on column EB_FEATURE.is_show
  is '是否前台展示：0位否,1为是';
comment on column EB_FEATURE.select_values
  is '属性可选值：用英文逗号分隔的可选值';
comment on column EB_FEATURE.input_type
  is '录入方式：1，树状菜单，2单选，3复选,4文本框';
comment on column EB_FEATURE.feature_sort
  is '前台显示排序';
alter table EB_FEATURE
  add constraint FF primary key (FEATURE_ID)
  using index 
  tablespace GX1110
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EB_FEATURE
  add constraint FEATURE_CAT_FK foreign key (CAT_ID)
  references EB_CAT (CAT_ID);

prompt Creating EB_ITEM...
create table EB_ITEM
(
  item_id                NUMBER(11) not null,
  item_name              VARCHAR2(400),
  item_no                VARCHAR2(120),
  brand_id               NUMBER(11) not null,
  cat_id                 NUMBER(11) not null,
  tag_img_id             NUMBER(11),
  is_new                 NUMBER(1) default 1,
  is_good                NUMBER(1) default 0,
  is_hot                 NUMBER(1) default 0,
  promotion              VARCHAR2(200),
  audit_status           NUMBER(2),
  show_status            NUMBER(2),
  imgs                   VARCHAR2(3000),
  keywords               VARCHAR2(120),
  page_desc              VARCHAR2(640),
  item_recycle           NUMBER(2),
  on_sale_time           TIMESTAMP(6),
  check_time             TIMESTAMP(6),
  update_time            TIMESTAMP(6),
  update_user_id         NUMBER(11),
  create_time            TIMESTAMP(6),
  check_user_id          NUMBER(11),
  full_path_deploy       VARCHAR2(600),
  full_path_deploy_offer VARCHAR2(600),
  original_item_id       NUMBER(11),
  last_status            NUMBER(1),
  merchant_id            NUMBER(11),
  item_sort              NUMBER(10),
  sales                  NUMBER(10),
  create_user_id         NUMBER(11),
  sim_level              NUMBER(1),
  tag_img                VARCHAR2(80)
)
tablespace GX1110
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EB_ITEM.item_id
  is '商品主键';
comment on column EB_ITEM.item_name
  is '商品名称';
comment on column EB_ITEM.item_no
  is '商品编号,自动生成';
comment on column EB_ITEM.brand_id
  is '商品品牌,树状菜单';
comment on column EB_ITEM.cat_id
  is '商品分类,树状菜单';
comment on column EB_ITEM.tag_img_id
  is '商品标签图片id';
comment on column EB_ITEM.is_new
  is '是否新品;0否1是,默认1';
comment on column EB_ITEM.is_good
  is '是否精品;0否1是,默认0';
comment on column EB_ITEM.is_hot
  is '是否热销;0否1是,默认0';
comment on column EB_ITEM.promotion
  is '促销语,用于前台展示';
comment on column EB_ITEM.audit_status
  is '实体商品审核状态；0待审核,,1审核通过,2审核未通过';
comment on column EB_ITEM.show_status
  is '上下架状态,0为上架,1为下架';
comment on column EB_ITEM.imgs
  is '上传图片；最多5张图';
comment on column EB_ITEM.keywords
  is '页面关键词';
comment on column EB_ITEM.page_desc
  is '页面描述:文本区';
comment on column EB_ITEM.item_recycle
  is '是否删除；0：未删除1：已经删除';
comment on column EB_ITEM.on_sale_time
  is '上架时间';
comment on column EB_ITEM.check_time
  is '审批时间';
comment on column EB_ITEM.update_time
  is '最后修改时间';
comment on column EB_ITEM.update_user_id
  is '最后修改人员';
comment on column EB_ITEM.create_time
  is '创建时间';
comment on column EB_ITEM.check_user_id
  is '审批人';
comment on column EB_ITEM.full_path_deploy
  is '未参加活动的静态化页面全路径';
comment on column EB_ITEM.full_path_deploy_offer
  is '参加活动的商品的静态化页面全路径';
comment on column EB_ITEM.original_item_id
  is '原始item_id';
comment on column EB_ITEM.last_status
  is '最新状态位;0是历史记录;1最新';
comment on column EB_ITEM.merchant_id
  is '店铺商户ID';
comment on column EB_ITEM.item_sort
  is '权重';
comment on column EB_ITEM.sales
  is '销量';
comment on column EB_ITEM.create_user_id
  is '创建人员';
comment on column EB_ITEM.sim_level
  is '号卡靓度：单选框：1超级靓号，2普通靓号，3普通号';
alter table EB_ITEM
  add constraint ITEM_PK primary key (ITEM_ID)
  using index 
  tablespace GX1110
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EB_ITEM
  add constraint ITEM_BRAND_FK foreign key (BRAND_ID)
  references EB_BRAND (BRAND_ID);
alter table EB_ITEM
  add constraint ITEM_CAT_ID foreign key (CAT_ID)
  references EB_CAT (CAT_ID);

prompt Creating EB_ORDER...
create table EB_ORDER
(
  order_id          NUMBER(11) not null,
  ptl_user_id       NUMBER(11),
  username          VARCHAR2(100),
  order_num         VARCHAR2(80),
  payment           NUMBER(1),
  pay_platform      NUMBER(2),
  delivery          NUMBER(1),
  is_confirm        NUMBER(1),
  order_sum         NUMBER(20,2),
  ship_fee          NUMBER(20,2),
  is_paid           NUMBER(1),
  order_state       NUMBER(2),
  payment_cash      NUMBER(1),
  distri_id         NUMBER(11),
  delivery_method   NUMBER(1),
  payment_no        VARCHAR2(30),
  order_time        TIMESTAMP(6),
  pay_time          TIMESTAMP(6),
  deposit_time      TIMESTAMP(6),
  success_time      TIMESTAMP(6),
  update_time       TIMESTAMP(6),
  srv_type          NUMBER(2),
  self_collect_site VARCHAR2(200),
  is_deleted        NUMBER(1),
  is_display        NUMBER(1),
  notes             VARCHAR2(400),
  ship_name         VARCHAR2(80),
  province          VARCHAR2(40),
  city              VARCHAR2(40),
  district          VARCHAR2(40),
  zip_code          VARCHAR2(40),
  addr              VARCHAR2(400),
  phone             VARCHAR2(60),
  payable           NUMBER(1),
  company           VARCHAR2(240),
  contents          NUMBER(2),
  is_call           NUMBER(1),
  delivery_no       VARCHAR2(300),
  area_code         VARCHAR2(50),
  area_name         VARCHAR2(50),
  is_print          NUMBER(1),
  crm_calls_time    TIMESTAMP(6),
  is_offer_release  NUMBER(1),
  job_num           VARCHAR2(300)
)
tablespace GX1110
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EB_ORDER.payment
  is '支付方式；1.在线支付，2.货到付款，3.营业厅充值';
comment on column EB_ORDER.is_confirm
  is '送货前电话确认';
alter table EB_ORDER
  add constraint ORDER_ID_PK primary key (ORDER_ID)
  using index 
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating EB_ORDER_DETAIL...
create table EB_ORDER_DETAIL
(
  order_detail_id   NUMBER(11) not null,
  order_id          NUMBER(11),
  item_id           NUMBER(11),
  item_name         VARCHAR2(400),
  item_no           VARCHAR2(120),
  sku_id            NUMBER(11),
  sku               VARCHAR2(80),
  sku_img           VARCHAR2(80),
  sku_name          VARCHAR2(500),
  sku_cat_type      VARCHAR2(5),
  sku_spec          VARCHAR2(1000),
  market_price      NUMBER(20,2),
  sku_discount      NUMBER(20,2),
  sku_price         NUMBER(20,2),
  offer_group_id    NUMBER(11),
  offer_group_name  VARCHAR2(200),
  offer_type        NUMBER(2),
  short_name        VARCHAR2(80),
  offer_id          NUMBER(11),
  offer_name        VARCHAR2(800),
  offer_no          VARCHAR2(120),
  short_name2       VARCHAR2(50),
  offer_term        NUMBER(2),
  commit_monthly    NUMBER(20,2),
  prepaid           NUMBER(20,2),
  refund_preiod     NUMBER(2),
  refund_monthly    NUMBER(20,2),
  refund_1st_month  NUMBER(20,2),
  refund_last_month NUMBER(20,2),
  order_detail_type NUMBER(2),
  merchant_id       NUMBER(11),
  quantity          NUMBER(5),
  price             NUMBER(20,2),
  seriescode        VARCHAR2(3000),
  offer_group_no    VARCHAR2(300),
  promo_type        NUMBER(4),
  cond_id           NUMBER(8)
)
tablespace GX1110
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EB_ORDER_DETAIL
  add constraint ORDER_DETAIL_ID primary key (ORDER_DETAIL_ID)
  using index 
  tablespace USER_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating EB_PARA_VALUE...
create table EB_PARA_VALUE
(
  para_id    NUMBER(11) not null,
  item_id    NUMBER(11) not null,
  feature_id NUMBER(11) not null,
  para_value VARCHAR2(100)
)
tablespace GX1110
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EB_PARA_VALUE
  add constraint PARAID_PK primary key (PARA_ID)
  using index 
  tablespace GX1110
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EB_PARA_VALUE
  add constraint ITEMID_FK foreign key (ITEM_ID)
  references EB_ITEM (ITEM_ID);

prompt Creating EB_SHIP_ADDR...
create table EB_SHIP_ADDR
(
  ship_addr_id NUMBER(11),
  ptl_user_id  NUMBER(11),
  ship_name    VARCHAR2(80),
  province     VARCHAR2(40),
  city         VARCHAR2(40),
  district     VARCHAR2(40),
  zip_code     VARCHAR2(40),
  addr         VARCHAR2(400),
  phone        VARCHAR2(60),
  default_addr NUMBER(1)
)
tablespace GX1110
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating EB_SKU...
create table EB_SKU
(
  sku_id          NUMBER(11),
  item_id         NUMBER(11),
  sku             VARCHAR2(80),
  sku_price       NUMBER(20,2),
  show_status     NUMBER(2),
  stock_inventory NUMBER(5),
  sku_upper_limit NUMBER(5),
  location        VARCHAR2(80),
  sku_img         VARCHAR2(80),
  sku_sort        NUMBER(5),
  sku_name        VARCHAR2(500),
  market_price    NUMBER(20),
  create_time     TIMESTAMP(6),
  update_time     TIMESTAMP(6),
  create_user_id  NUMBER(11),
  update_user_id  NUMBER(11),
  original_sku_id NUMBER(11),
  last_status     NUMBER(1),
  merchant_id     NUMBER(11),
  sku_type        NUMBER(1),
  sales           NUMBER(10),
  res_code        VARCHAR2(300),
  pack_id         NUMBER(8)
)
tablespace GX1110
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EB_SKU.sku_id
  is '最小销售单元主键';
comment on column EB_SKU.sku
  is '货号';
comment on column EB_SKU.sku_price
  is '以分币为单位售价,号卡预存话费';
comment on column EB_SKU.show_status
  is '上下架状态；0上架，1下架';
comment on column EB_SKU.stock_inventory
  is '库存';
comment on column EB_SKU.sku_upper_limit
  is '购买上限';
comment on column EB_SKU.location
  is '货位；可以输入特殊祖父';
comment on column EB_SKU.sku_img
  is '图片存储位置。1~5';
comment on column EB_SKU.sku_sort
  is '前台显示排序';
comment on column EB_SKU.sku_name
  is 'sku名称';
comment on column EB_SKU.market_price
  is '以分币为单位市场价';
comment on column EB_SKU.last_status
  is '0是历史记录；1最新';
comment on column EB_SKU.sku_type
  is '0为赠品；1为普通sku';
comment on column EB_SKU.res_code
  is 'cm返回参数，给cm开通的终端类';
comment on column EB_SKU.pack_id
  is 'cm导入，资源包id';

prompt Creating EB_SPEC_VALUE...
create table EB_SPEC_VALUE
(
  spec_id    NUMBER(11),
  sku_id     NUMBER(11),
  feature_id NUMBER(11),
  spec_value VARCHAR2(100)
)
tablespace GX1110
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating TS_PTL_USER...
create table TS_PTL_USER
(
  ptl_user_id   NUMBER(11),
  username      VARCHAR2(100),
  gender        NUMBER(1),
  password      VARCHAR2(40),
  nickname      VARCHAR2(80),
  real_name     VARCHAR2(80),
  phone         VARCHAR2(100),
  resi_prov     VARCHAR2(40),
  resi_city     VARCHAR2(40),
  resi_dist     VARCHAR2(40),
  addr          VARCHAR2(400),
  zip_code      NUMBER(6),
  login_time    TIMESTAMP(6),
  status        NUMBER(1),
  email         VARCHAR2(100),
  group_id      NUMBER(11),
  birthday      VARCHAR2(20),
  qq_num        VARCHAR2(20),
  msn_num       VARCHAR2(50),
  cellphone     VARCHAR2(20),
  intro_info    VARCHAR2(1500),
  login_count   NUMBER(11),
  register_time TIMESTAMP(6)
)
tablespace GX1110
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Disabling triggers for ACT_GE_PROPERTY...
alter table ACT_GE_PROPERTY disable all triggers;
prompt Disabling triggers for ACT_HI_ACTINST...
alter table ACT_HI_ACTINST disable all triggers;
prompt Disabling triggers for ACT_HI_ATTACHMENT...
alter table ACT_HI_ATTACHMENT disable all triggers;
prompt Disabling triggers for ACT_HI_DETAIL...
alter table ACT_HI_DETAIL disable all triggers;
prompt Disabling triggers for ACT_HI_IDENTITYLINK...
alter table ACT_HI_IDENTITYLINK disable all triggers;
prompt Disabling triggers for ACT_HI_PROCINST...
alter table ACT_HI_PROCINST disable all triggers;
prompt Disabling triggers for ACT_HI_TASKINST...
alter table ACT_HI_TASKINST disable all triggers;
prompt Disabling triggers for ACT_HI_VARINST...
alter table ACT_HI_VARINST disable all triggers;
prompt Disabling triggers for ACT_ID_GROUP...
alter table ACT_ID_GROUP disable all triggers;
prompt Disabling triggers for ACT_ID_USER...
alter table ACT_ID_USER disable all triggers;
prompt Disabling triggers for ACT_ID_MEMBERSHIP...
alter table ACT_ID_MEMBERSHIP disable all triggers;
prompt Disabling triggers for ACT_RE_DEPLOYMENT...
alter table ACT_RE_DEPLOYMENT disable all triggers;
prompt Disabling triggers for ACT_RE_MODEL...
alter table ACT_RE_MODEL disable all triggers;
prompt Disabling triggers for ACT_RE_PROCDEF...
alter table ACT_RE_PROCDEF disable all triggers;
prompt Disabling triggers for ACT_RU_EXECUTION...
alter table ACT_RU_EXECUTION disable all triggers;
prompt Disabling triggers for ACT_RU_EVENT_SUBSCR...
alter table ACT_RU_EVENT_SUBSCR disable all triggers;
prompt Disabling triggers for ACT_RU_TASK...
alter table ACT_RU_TASK disable all triggers;
prompt Disabling triggers for ACT_RU_IDENTITYLINK...
alter table ACT_RU_IDENTITYLINK disable all triggers;
prompt Disabling triggers for ACT_RU_JOB...
alter table ACT_RU_JOB disable all triggers;
prompt Disabling triggers for ACT_RU_VARIABLE...
alter table ACT_RU_VARIABLE disable all triggers;
prompt Disabling triggers for EB_BRAND...
alter table EB_BRAND disable all triggers;
prompt Disabling triggers for EB_CAT...
alter table EB_CAT disable all triggers;
prompt Disabling triggers for EB_CATBRAND...
alter table EB_CATBRAND disable all triggers;
prompt Disabling triggers for EB_CONSOLE_LOG...
alter table EB_CONSOLE_LOG disable all triggers;
prompt Disabling triggers for EB_FEATURE...
alter table EB_FEATURE disable all triggers;
prompt Disabling triggers for EB_ITEM...
alter table EB_ITEM disable all triggers;
prompt Disabling triggers for EB_ORDER...
alter table EB_ORDER disable all triggers;
prompt Disabling triggers for EB_ORDER_DETAIL...
alter table EB_ORDER_DETAIL disable all triggers;
prompt Disabling triggers for EB_PARA_VALUE...
alter table EB_PARA_VALUE disable all triggers;
prompt Disabling triggers for EB_SHIP_ADDR...
alter table EB_SHIP_ADDR disable all triggers;
prompt Disabling triggers for EB_SKU...
alter table EB_SKU disable all triggers;
prompt Disabling triggers for EB_SPEC_VALUE...
alter table EB_SPEC_VALUE disable all triggers;
prompt Disabling triggers for TS_PTL_USER...
alter table TS_PTL_USER disable all triggers;
prompt Disabling foreign key constraints for ACT_ID_MEMBERSHIP...
alter table ACT_ID_MEMBERSHIP disable constraint ACT_FK_MEMB_GROUP;
alter table ACT_ID_MEMBERSHIP disable constraint ACT_FK_MEMB_USER;
prompt Disabling foreign key constraints for ACT_RE_MODEL...
alter table ACT_RE_MODEL disable constraint ACT_FK_MODEL_DEPLOYMENT;
alter table ACT_RE_MODEL disable constraint ACT_FK_MODEL_SOURCE;
alter table ACT_RE_MODEL disable constraint ACT_FK_MODEL_SOURCE_EXTRA;
prompt Disabling foreign key constraints for ACT_RU_EXECUTION...
alter table ACT_RU_EXECUTION disable constraint ACT_FK_EXE_PARENT;
alter table ACT_RU_EXECUTION disable constraint ACT_FK_EXE_PROCDEF;
alter table ACT_RU_EXECUTION disable constraint ACT_FK_EXE_PROCINST;
alter table ACT_RU_EXECUTION disable constraint ACT_FK_EXE_SUPER;
prompt Disabling foreign key constraints for ACT_RU_EVENT_SUBSCR...
alter table ACT_RU_EVENT_SUBSCR disable constraint ACT_FK_EVENT_EXEC;
prompt Disabling foreign key constraints for ACT_RU_TASK...
alter table ACT_RU_TASK disable constraint ACT_FK_TASK_EXE;
alter table ACT_RU_TASK disable constraint ACT_FK_TASK_PROCDEF;
alter table ACT_RU_TASK disable constraint ACT_FK_TASK_PROCINST;
prompt Disabling foreign key constraints for ACT_RU_IDENTITYLINK...
alter table ACT_RU_IDENTITYLINK disable constraint ACT_FK_ATHRZ_PROCEDEF;
alter table ACT_RU_IDENTITYLINK disable constraint ACT_FK_IDL_PROCINST;
alter table ACT_RU_IDENTITYLINK disable constraint ACT_FK_TSKASS_TASK;
prompt Disabling foreign key constraints for ACT_RU_JOB...
alter table ACT_RU_JOB disable constraint ACT_FK_JOB_EXCEPTION;
prompt Disabling foreign key constraints for ACT_RU_VARIABLE...
alter table ACT_RU_VARIABLE disable constraint ACT_FK_VAR_BYTEARRAY;
alter table ACT_RU_VARIABLE disable constraint ACT_FK_VAR_EXE;
alter table ACT_RU_VARIABLE disable constraint ACT_FK_VAR_PROCINST;
prompt Disabling foreign key constraints for EB_CATBRAND...
alter table EB_CATBRAND disable constraint CATBRAND_BRAND_FK;
alter table EB_CATBRAND disable constraint CATBRAND_CAT_FK;
prompt Disabling foreign key constraints for EB_FEATURE...
alter table EB_FEATURE disable constraint FEATURE_CAT_FK;
prompt Disabling foreign key constraints for EB_ITEM...
alter table EB_ITEM disable constraint ITEM_BRAND_FK;
alter table EB_ITEM disable constraint ITEM_CAT_ID;
prompt Disabling foreign key constraints for EB_PARA_VALUE...
alter table EB_PARA_VALUE disable constraint ITEMID_FK;
prompt Deleting TS_PTL_USER...
delete from TS_PTL_USER;
commit;
prompt Deleting EB_SPEC_VALUE...
delete from EB_SPEC_VALUE;
commit;
prompt Deleting EB_SKU...
delete from EB_SKU;
commit;
prompt Deleting EB_SHIP_ADDR...
delete from EB_SHIP_ADDR;
commit;
prompt Deleting EB_PARA_VALUE...
delete from EB_PARA_VALUE;
commit;
prompt Deleting EB_ORDER_DETAIL...
delete from EB_ORDER_DETAIL;
commit;
prompt Deleting EB_ORDER...
delete from EB_ORDER;
commit;
prompt Deleting EB_ITEM...
delete from EB_ITEM;
commit;
prompt Deleting EB_FEATURE...
delete from EB_FEATURE;
commit;
prompt Deleting EB_CONSOLE_LOG...
delete from EB_CONSOLE_LOG;
commit;
prompt Deleting EB_CATBRAND...
delete from EB_CATBRAND;
commit;
prompt Deleting EB_CAT...
delete from EB_CAT;
commit;
prompt Deleting EB_BRAND...
delete from EB_BRAND;
commit;
prompt Deleting ACT_RU_VARIABLE...
delete from ACT_RU_VARIABLE;
commit;
prompt Deleting ACT_RU_JOB...
delete from ACT_RU_JOB;
commit;
prompt Deleting ACT_RU_IDENTITYLINK...
delete from ACT_RU_IDENTITYLINK;
commit;
prompt Deleting ACT_RU_TASK...
delete from ACT_RU_TASK;
commit;
prompt Deleting ACT_RU_EVENT_SUBSCR...
delete from ACT_RU_EVENT_SUBSCR;
commit;
prompt Deleting ACT_RU_EXECUTION...
delete from ACT_RU_EXECUTION;
commit;
prompt Deleting ACT_RE_PROCDEF...
delete from ACT_RE_PROCDEF;
commit;
prompt Deleting ACT_RE_MODEL...
delete from ACT_RE_MODEL;
commit;
prompt Deleting ACT_RE_DEPLOYMENT...
delete from ACT_RE_DEPLOYMENT;
commit;
prompt Deleting ACT_ID_MEMBERSHIP...
delete from ACT_ID_MEMBERSHIP;
commit;
prompt Deleting ACT_ID_USER...
delete from ACT_ID_USER;
commit;
prompt Deleting ACT_ID_GROUP...
delete from ACT_ID_GROUP;
commit;
prompt Deleting ACT_HI_VARINST...
delete from ACT_HI_VARINST;
commit;
prompt Deleting ACT_HI_TASKINST...
delete from ACT_HI_TASKINST;
commit;
prompt Deleting ACT_HI_PROCINST...
delete from ACT_HI_PROCINST;
commit;
prompt Deleting ACT_HI_IDENTITYLINK...
delete from ACT_HI_IDENTITYLINK;
commit;
prompt Deleting ACT_HI_DETAIL...
delete from ACT_HI_DETAIL;
commit;
prompt Deleting ACT_HI_ATTACHMENT...
delete from ACT_HI_ATTACHMENT;
commit;
prompt Deleting ACT_HI_ACTINST...
delete from ACT_HI_ACTINST;
commit;
prompt Deleting ACT_GE_PROPERTY...
delete from ACT_GE_PROPERTY;
commit;
prompt Loading ACT_GE_PROPERTY...
insert into ACT_GE_PROPERTY (name_, value_, rev_)
values ('schema.version', '5.14', 1);
insert into ACT_GE_PROPERTY (name_, value_, rev_)
values ('schema.history', 'create(5.14)', 1);
insert into ACT_GE_PROPERTY (name_, value_, rev_)
values ('next.dbid', '601', 7);
commit;
prompt 3 records loaded
prompt Loading ACT_HI_ACTINST...
insert into ACT_HI_ACTINST (id_, proc_def_id_, proc_inst_id_, execution_id_, act_id_, task_id_, call_proc_inst_id_, act_name_, act_type_, assignee_, start_time_, end_time_, duration_)
values ('207', 'OrderFlow:1:4', '201', '201', 'paidOrder', '208', null, '已付款单', 'userTask', 'paidOrderer', to_timestamp('10-07-2018 19:04:27.925000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into ACT_HI_ACTINST (id_, proc_def_id_, proc_inst_id_, execution_id_, act_id_, task_id_, call_proc_inst_id_, act_name_, act_type_, assignee_, start_time_, end_time_, duration_)
values ('502', 'OrderFlow:1:4', '501', '501', 'startevent1', null, null, 'Start', 'startEvent', null, to_timestamp('15-07-2018 20:36:35.248000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('15-07-2018 20:36:35.290000', 'dd-mm-yyyy hh24:mi:ss.ff'), 42);
insert into ACT_HI_ACTINST (id_, proc_def_id_, proc_inst_id_, execution_id_, act_id_, task_id_, call_proc_inst_id_, act_name_, act_type_, assignee_, start_time_, end_time_, duration_)
values ('503', 'OrderFlow:1:4', '501', '501', 'noPaidOrder', '504', null, '未付款单', 'userTask', 'noPaidOrderer', to_timestamp('15-07-2018 20:36:35.290000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into ACT_HI_ACTINST (id_, proc_def_id_, proc_inst_id_, execution_id_, act_id_, task_id_, call_proc_inst_id_, act_name_, act_type_, assignee_, start_time_, end_time_, duration_)
values ('202', 'OrderFlow:1:4', '201', '201', 'startevent1', null, null, 'Start', 'startEvent', null, to_timestamp('10-07-2018 19:03:38.799000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-07-2018 19:03:38.807000', 'dd-mm-yyyy hh24:mi:ss.ff'), 8);
insert into ACT_HI_ACTINST (id_, proc_def_id_, proc_inst_id_, execution_id_, act_id_, task_id_, call_proc_inst_id_, act_name_, act_type_, assignee_, start_time_, end_time_, duration_)
values ('203', 'OrderFlow:1:4', '201', '201', 'noPaidOrder', '204', null, '未付款单', 'userTask', 'noPaidOrderer', to_timestamp('10-07-2018 19:03:38.807000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-07-2018 19:04:27.925000', 'dd-mm-yyyy hh24:mi:ss.ff'), 49118);
insert into ACT_HI_ACTINST (id_, proc_def_id_, proc_inst_id_, execution_id_, act_id_, task_id_, call_proc_inst_id_, act_name_, act_type_, assignee_, start_time_, end_time_, duration_)
values ('102', 'OrderFlow:1:4', '101', '101', 'startevent1', null, null, 'Start', 'startEvent', null, to_timestamp('10-07-2018 18:55:01.217000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-07-2018 18:55:01.233000', 'dd-mm-yyyy hh24:mi:ss.ff'), 16);
insert into ACT_HI_ACTINST (id_, proc_def_id_, proc_inst_id_, execution_id_, act_id_, task_id_, call_proc_inst_id_, act_name_, act_type_, assignee_, start_time_, end_time_, duration_)
values ('103', 'OrderFlow:1:4', '101', '101', 'noPaidOrder', '104', null, '未付款单', 'userTask', 'noPaidOrderer', to_timestamp('10-07-2018 18:55:01.233000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into ACT_HI_ACTINST (id_, proc_def_id_, proc_inst_id_, execution_id_, act_id_, task_id_, call_proc_inst_id_, act_name_, act_type_, assignee_, start_time_, end_time_, duration_)
values ('302', 'OrderFlow:1:4', '301', '301', 'startevent1', null, null, 'Start', 'startEvent', null, to_timestamp('12-07-2018 17:38:46.617000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('12-07-2018 17:38:46.625000', 'dd-mm-yyyy hh24:mi:ss.ff'), 8);
insert into ACT_HI_ACTINST (id_, proc_def_id_, proc_inst_id_, execution_id_, act_id_, task_id_, call_proc_inst_id_, act_name_, act_type_, assignee_, start_time_, end_time_, duration_)
values ('303', 'OrderFlow:1:4', '301', '301', 'noPaidOrder', '304', null, '未付款单', 'userTask', 'noPaidOrderer', to_timestamp('12-07-2018 17:38:46.628000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('12-07-2018 17:39:21.554000', 'dd-mm-yyyy hh24:mi:ss.ff'), 34926);
insert into ACT_HI_ACTINST (id_, proc_def_id_, proc_inst_id_, execution_id_, act_id_, task_id_, call_proc_inst_id_, act_name_, act_type_, assignee_, start_time_, end_time_, duration_)
values ('307', 'OrderFlow:1:4', '301', '301', 'paidOrder', '308', null, '已付款单', 'userTask', 'paidOrderer', to_timestamp('12-07-2018 17:39:21.554000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('12-07-2018 18:17:57.944000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2316390);
insert into ACT_HI_ACTINST (id_, proc_def_id_, proc_inst_id_, execution_id_, act_id_, task_id_, call_proc_inst_id_, act_name_, act_type_, assignee_, start_time_, end_time_, duration_)
values ('401', 'OrderFlow:1:4', '301', '301', 'readyItemOrder', '402', null, '备货单', 'userTask', null, to_timestamp('12-07-2018 18:17:57.982000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
commit;
prompt 11 records loaded
prompt Loading ACT_HI_ATTACHMENT...
prompt Table is empty
prompt Loading ACT_HI_DETAIL...
prompt Table is empty
prompt Loading ACT_HI_IDENTITYLINK...
insert into ACT_HI_IDENTITYLINK (id_, group_id_, type_, user_id_, task_id_, proc_inst_id_)
values ('209', null, 'participant', 'paidOrderer', null, '201');
insert into ACT_HI_IDENTITYLINK (id_, group_id_, type_, user_id_, task_id_, proc_inst_id_)
values ('505', null, 'participant', 'noPaidOrderer', null, '501');
insert into ACT_HI_IDENTITYLINK (id_, group_id_, type_, user_id_, task_id_, proc_inst_id_)
values ('205', null, 'participant', 'noPaidOrderer', null, '201');
insert into ACT_HI_IDENTITYLINK (id_, group_id_, type_, user_id_, task_id_, proc_inst_id_)
values ('105', null, 'participant', 'noPaidOrderer', null, '101');
insert into ACT_HI_IDENTITYLINK (id_, group_id_, type_, user_id_, task_id_, proc_inst_id_)
values ('305', null, 'participant', 'noPaidOrderer', null, '301');
insert into ACT_HI_IDENTITYLINK (id_, group_id_, type_, user_id_, task_id_, proc_inst_id_)
values ('309', null, 'participant', 'paidOrderer', null, '301');
commit;
prompt 6 records loaded
prompt Loading ACT_HI_PROCINST...
insert into ACT_HI_PROCINST (id_, proc_inst_id_, business_key_, proc_def_id_, start_time_, end_time_, duration_, start_user_id_, start_act_id_, end_act_id_, super_process_instance_id_, delete_reason_)
values ('501', '501', '6', 'OrderFlow:1:4', to_timestamp('15-07-2018 20:36:35.248000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, 'startevent1', null, null, null);
insert into ACT_HI_PROCINST (id_, proc_inst_id_, business_key_, proc_def_id_, start_time_, end_time_, duration_, start_user_id_, start_act_id_, end_act_id_, super_process_instance_id_, delete_reason_)
values ('201', '201', '4', 'OrderFlow:1:4', to_timestamp('10-07-2018 19:03:38.799000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, 'startevent1', null, null, null);
insert into ACT_HI_PROCINST (id_, proc_inst_id_, business_key_, proc_def_id_, start_time_, end_time_, duration_, start_user_id_, start_act_id_, end_act_id_, super_process_instance_id_, delete_reason_)
values ('101', '101', '3', 'OrderFlow:1:4', to_timestamp('10-07-2018 18:55:01.217000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, 'startevent1', null, null, null);
insert into ACT_HI_PROCINST (id_, proc_inst_id_, business_key_, proc_def_id_, start_time_, end_time_, duration_, start_user_id_, start_act_id_, end_act_id_, super_process_instance_id_, delete_reason_)
values ('301', '301', '5', 'OrderFlow:1:4', to_timestamp('12-07-2018 17:38:46.617000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, 'startevent1', null, null, null);
commit;
prompt 4 records loaded
prompt Loading ACT_HI_TASKINST...
insert into ACT_HI_TASKINST (id_, proc_def_id_, task_def_key_, proc_inst_id_, execution_id_, parent_task_id_, name_, description_, owner_, assignee_, start_time_, claim_time_, end_time_, duration_, delete_reason_, priority_, due_date_, form_key_)
values ('208', 'OrderFlow:1:4', 'paidOrder', '201', '201', null, '已付款单', null, null, 'paidOrderer', to_timestamp('10-07-2018 19:04:27.926000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 50, null, null);
insert into ACT_HI_TASKINST (id_, proc_def_id_, task_def_key_, proc_inst_id_, execution_id_, parent_task_id_, name_, description_, owner_, assignee_, start_time_, claim_time_, end_time_, duration_, delete_reason_, priority_, due_date_, form_key_)
values ('504', 'OrderFlow:1:4', 'noPaidOrder', '501', '501', null, '未付款单', null, null, 'noPaidOrderer', to_timestamp('15-07-2018 20:36:35.290000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 50, null, null);
insert into ACT_HI_TASKINST (id_, proc_def_id_, task_def_key_, proc_inst_id_, execution_id_, parent_task_id_, name_, description_, owner_, assignee_, start_time_, claim_time_, end_time_, duration_, delete_reason_, priority_, due_date_, form_key_)
values ('204', 'OrderFlow:1:4', 'noPaidOrder', '201', '201', null, '未付款单', null, null, 'noPaidOrderer', to_timestamp('10-07-2018 19:03:38.807000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, to_timestamp('10-07-2018 19:04:27.908000', 'dd-mm-yyyy hh24:mi:ss.ff'), 49101, 'completed', 50, null, null);
insert into ACT_HI_TASKINST (id_, proc_def_id_, task_def_key_, proc_inst_id_, execution_id_, parent_task_id_, name_, description_, owner_, assignee_, start_time_, claim_time_, end_time_, duration_, delete_reason_, priority_, due_date_, form_key_)
values ('104', 'OrderFlow:1:4', 'noPaidOrder', '101', '101', null, '未付款单', null, null, 'noPaidOrderer', to_timestamp('10-07-2018 18:55:01.233000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 50, null, null);
insert into ACT_HI_TASKINST (id_, proc_def_id_, task_def_key_, proc_inst_id_, execution_id_, parent_task_id_, name_, description_, owner_, assignee_, start_time_, claim_time_, end_time_, duration_, delete_reason_, priority_, due_date_, form_key_)
values ('304', 'OrderFlow:1:4', 'noPaidOrder', '301', '301', null, '未付款单', null, null, 'noPaidOrderer', to_timestamp('12-07-2018 17:38:46.629000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, to_timestamp('12-07-2018 17:39:21.533000', 'dd-mm-yyyy hh24:mi:ss.ff'), 34904, 'completed', 50, null, null);
insert into ACT_HI_TASKINST (id_, proc_def_id_, task_def_key_, proc_inst_id_, execution_id_, parent_task_id_, name_, description_, owner_, assignee_, start_time_, claim_time_, end_time_, duration_, delete_reason_, priority_, due_date_, form_key_)
values ('308', 'OrderFlow:1:4', 'paidOrder', '301', '301', null, '已付款单', null, null, 'paidOrderer', to_timestamp('12-07-2018 17:39:21.555000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, to_timestamp('12-07-2018 18:17:57.914000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2316359, 'completed', 50, null, null);
insert into ACT_HI_TASKINST (id_, proc_def_id_, task_def_key_, proc_inst_id_, execution_id_, parent_task_id_, name_, description_, owner_, assignee_, start_time_, claim_time_, end_time_, duration_, delete_reason_, priority_, due_date_, form_key_)
values ('402', 'OrderFlow:1:4', 'readyItemOrder', '301', '301', null, '备货单', null, null, null, to_timestamp('12-07-2018 18:17:57.983000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, 50, null, null);
commit;
prompt 7 records loaded
prompt Loading ACT_HI_VARINST...
insert into ACT_HI_VARINST (id_, proc_inst_id_, execution_id_, task_id_, name_, var_type_, rev_, bytearray_id_, double_, long_, text_, text2_)
values ('206', '201', '201', null, 'outcome', 'string', 0, null, null, null, '支付', null);
insert into ACT_HI_VARINST (id_, proc_inst_id_, execution_id_, task_id_, name_, var_type_, rev_, bytearray_id_, double_, long_, text_, text2_)
values ('306', '301', '301', null, 'outcome', 'string', 1, null, null, null, '外呼成功', null);
commit;
prompt 2 records loaded
prompt Loading ACT_ID_GROUP...
prompt Table is empty
prompt Loading ACT_ID_USER...
prompt Table is empty
prompt Loading ACT_ID_MEMBERSHIP...
prompt Table is empty
prompt Loading ACT_RE_DEPLOYMENT...
insert into ACT_RE_DEPLOYMENT (id_, name_, category_, deploy_time_)
values ('1', null, null, to_timestamp('10-07-2018 18:15:26.391000', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 1 records loaded
prompt Loading ACT_RE_MODEL...
prompt Table is empty
prompt Loading ACT_RE_PROCDEF...
insert into ACT_RE_PROCDEF (id_, rev_, category_, name_, key_, version_, deployment_id_, resource_name_, dgrm_resource_name_, description_, has_start_form_key_, suspension_state_)
values ('OrderFlow:1:4', 1, 'http://www.activiti.org/test', '订单流程', 'OrderFlow', 1, '1', 'com/rl/ecps/diagrams/OrderFlow.bpmn', 'com/rl/ecps/diagrams/OrderFlow.png', null, 0, 1);
commit;
prompt 1 records loaded
prompt Loading ACT_RU_EXECUTION...
insert into ACT_RU_EXECUTION (id_, rev_, proc_inst_id_, business_key_, parent_id_, proc_def_id_, super_exec_, act_id_, is_active_, is_concurrent_, is_scope_, is_event_scope_, suspension_state_, cached_ent_state_)
values ('501', 1, '501', '6', null, 'OrderFlow:1:4', null, 'noPaidOrder', 1, 0, 1, 0, 1, 2);
insert into ACT_RU_EXECUTION (id_, rev_, proc_inst_id_, business_key_, parent_id_, proc_def_id_, super_exec_, act_id_, is_active_, is_concurrent_, is_scope_, is_event_scope_, suspension_state_, cached_ent_state_)
values ('201', 2, '201', '4', null, 'OrderFlow:1:4', null, 'paidOrder', 1, 0, 1, 0, 1, 2);
insert into ACT_RU_EXECUTION (id_, rev_, proc_inst_id_, business_key_, parent_id_, proc_def_id_, super_exec_, act_id_, is_active_, is_concurrent_, is_scope_, is_event_scope_, suspension_state_, cached_ent_state_)
values ('101', 1, '101', '3', null, 'OrderFlow:1:4', null, 'noPaidOrder', 1, 0, 1, 0, 1, 2);
insert into ACT_RU_EXECUTION (id_, rev_, proc_inst_id_, business_key_, parent_id_, proc_def_id_, super_exec_, act_id_, is_active_, is_concurrent_, is_scope_, is_event_scope_, suspension_state_, cached_ent_state_)
values ('301', 3, '301', '5', null, 'OrderFlow:1:4', null, 'readyItemOrder', 1, 0, 1, 0, 1, 2);
commit;
prompt 4 records loaded
prompt Loading ACT_RU_EVENT_SUBSCR...
prompt Table is empty
prompt Loading ACT_RU_TASK...
insert into ACT_RU_TASK (id_, rev_, execution_id_, proc_inst_id_, proc_def_id_, name_, parent_task_id_, description_, task_def_key_, owner_, assignee_, delegation_, priority_, create_time_, due_date_, suspension_state_)
values ('208', 1, '201', '201', 'OrderFlow:1:4', '已付款单', null, null, 'paidOrder', null, 'paidOrderer', null, 50, to_timestamp('10-07-2018 19:04:27.926000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 1);
insert into ACT_RU_TASK (id_, rev_, execution_id_, proc_inst_id_, proc_def_id_, name_, parent_task_id_, description_, task_def_key_, owner_, assignee_, delegation_, priority_, create_time_, due_date_, suspension_state_)
values ('504', 1, '501', '501', 'OrderFlow:1:4', '未付款单', null, null, 'noPaidOrder', null, 'noPaidOrderer', null, 50, to_timestamp('15-07-2018 20:36:35.290000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 1);
insert into ACT_RU_TASK (id_, rev_, execution_id_, proc_inst_id_, proc_def_id_, name_, parent_task_id_, description_, task_def_key_, owner_, assignee_, delegation_, priority_, create_time_, due_date_, suspension_state_)
values ('104', 1, '101', '101', 'OrderFlow:1:4', '未付款单', null, null, 'noPaidOrder', null, 'noPaidOrderer', null, 50, to_timestamp('10-07-2018 18:55:01.233000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 1);
insert into ACT_RU_TASK (id_, rev_, execution_id_, proc_inst_id_, proc_def_id_, name_, parent_task_id_, description_, task_def_key_, owner_, assignee_, delegation_, priority_, create_time_, due_date_, suspension_state_)
values ('402', 1, '301', '301', 'OrderFlow:1:4', '备货单', null, null, 'readyItemOrder', null, null, null, 50, to_timestamp('12-07-2018 18:17:57.982000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 1);
commit;
prompt 4 records loaded
prompt Loading ACT_RU_IDENTITYLINK...
insert into ACT_RU_IDENTITYLINK (id_, rev_, group_id_, type_, user_id_, task_id_, proc_inst_id_, proc_def_id_)
values ('209', 1, null, 'participant', 'paidOrderer', null, '201', null);
insert into ACT_RU_IDENTITYLINK (id_, rev_, group_id_, type_, user_id_, task_id_, proc_inst_id_, proc_def_id_)
values ('505', 1, null, 'participant', 'noPaidOrderer', null, '501', null);
insert into ACT_RU_IDENTITYLINK (id_, rev_, group_id_, type_, user_id_, task_id_, proc_inst_id_, proc_def_id_)
values ('205', 1, null, 'participant', 'noPaidOrderer', null, '201', null);
insert into ACT_RU_IDENTITYLINK (id_, rev_, group_id_, type_, user_id_, task_id_, proc_inst_id_, proc_def_id_)
values ('105', 1, null, 'participant', 'noPaidOrderer', null, '101', null);
insert into ACT_RU_IDENTITYLINK (id_, rev_, group_id_, type_, user_id_, task_id_, proc_inst_id_, proc_def_id_)
values ('305', 1, null, 'participant', 'noPaidOrderer', null, '301', null);
insert into ACT_RU_IDENTITYLINK (id_, rev_, group_id_, type_, user_id_, task_id_, proc_inst_id_, proc_def_id_)
values ('309', 1, null, 'participant', 'paidOrderer', null, '301', null);
commit;
prompt 6 records loaded
prompt Loading ACT_RU_JOB...
prompt Table is empty
prompt Loading ACT_RU_VARIABLE...
insert into ACT_RU_VARIABLE (id_, rev_, type_, name_, execution_id_, proc_inst_id_, task_id_, bytearray_id_, double_, long_, text_, text2_)
values ('206', 1, 'string', 'outcome', '201', '201', null, null, null, null, '支付', null);
insert into ACT_RU_VARIABLE (id_, rev_, type_, name_, execution_id_, proc_inst_id_, task_id_, bytearray_id_, double_, long_, text_, text2_)
values ('306', 2, 'string', 'outcome', '301', '301', null, null, null, null, '外呼成功', null);
commit;
prompt 2 records loaded
prompt Loading EB_BRAND...
insert into EB_BRAND (brand_id, brand_name, brand_desc, imgs, website, brand_sort)
values (9, '鸭梨', '很大', '/upload/20180715201603678326.jpg', 'http://yalihendaya', 1);
insert into EB_BRAND (brand_id, brand_name, brand_desc, imgs, website, brand_sort)
values (10, 'oppo', 'http://www.oppo.com', '/upload/20180602123605422097.jpg', 'http://www.oppo.com', 1);
insert into EB_BRAND (brand_id, brand_name, brand_desc, imgs, website, brand_sort)
values (8, '苹果3', '超好用', 'http://yalida', 'http://yalida', 1);
insert into EB_BRAND (brand_id, brand_name, brand_desc, imgs, website, brand_sort)
values (3976, '红米3', '699', 'kkk', 'kkk', 1);
insert into EB_BRAND (brand_id, brand_name, brand_desc, imgs, website, brand_sort)
values (3859, '尼采', '功能很强大', '/upload/20141126104650191824.png', 'http://nicai', 1);
insert into EB_BRAND (brand_id, brand_name, brand_desc, imgs, website, brand_sort)
values (3819, '小米', 'http://xiaomi', null, 'http://xiaomi', 1);
insert into EB_BRAND (brand_id, brand_name, brand_desc, imgs, website, brand_sort)
values (3919, '锤子', null, null, null, null);
insert into EB_BRAND (brand_id, brand_name, brand_desc, imgs, website, brand_sort)
values (1003, '三星', null, null, null, null);
insert into EB_BRAND (brand_id, brand_name, brand_desc, imgs, website, brand_sort)
values (1004, '中兴', null, null, null, null);
insert into EB_BRAND (brand_id, brand_name, brand_desc, imgs, website, brand_sort)
values (1005, '天语', null, null, null, null);
insert into EB_BRAND (brand_id, brand_name, brand_desc, imgs, website, brand_sort)
values (1006, '天迈', null, null, null, null);
insert into EB_BRAND (brand_id, brand_name, brand_desc, imgs, website, brand_sort)
values (1007, '酷派', null, null, null, null);
insert into EB_BRAND (brand_id, brand_name, brand_desc, imgs, website, brand_sort)
values (5, '苹果3', '超好用', 'http://yalida', 'http://yalida', 1);
insert into EB_BRAND (brand_id, brand_name, brand_desc, imgs, website, brand_sort)
values (7, '苹果4', '超好用', 'http://yalida', 'http://yalida', 1);
commit;
prompt 14 records loaded
prompt Loading EB_CAT...
insert into EB_CAT (cat_id, cat_name, cat_desc, parent_id, cat_sort, keywords, path, mark, isdisplay, full_path, cat_type)
values (1, '手机', '手机', 0, 1, '手机', null, null, 1, null, null);
commit;
prompt 1 records loaded
prompt Loading EB_CATBRAND...
prompt Table is empty
prompt Loading EB_CONSOLE_LOG...
insert into EB_CONSOLE_LOG (console_log_id, entity_name, entity_id, user_id, op_type, op_time, notes, table_name)
values (11, '商品表', null, 1, '上架', to_timestamp('15-07-2018 19:57:06.613000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 'EB_ITEM');
insert into EB_CONSOLE_LOG (console_log_id, entity_name, entity_id, user_id, op_type, op_time, notes, table_name)
values (14, '商品表', 4244, 1, '审核通过', to_timestamp('15-07-2018 20:32:44.016000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 'EB_ITEM');
insert into EB_CONSOLE_LOG (console_log_id, entity_name, entity_id, user_id, op_type, op_time, notes, table_name)
values (15, '商品表', null, 1, '上架', to_timestamp('15-07-2018 20:32:55.600000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 'EB_ITEM');
insert into EB_CONSOLE_LOG (console_log_id, entity_name, entity_id, user_id, op_type, op_time, notes, table_name)
values (8, '商品表', null, 1, '下架', to_timestamp('30-06-2018 22:23:21.806000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 'EB_ITEM');
insert into EB_CONSOLE_LOG (console_log_id, entity_name, entity_id, user_id, op_type, op_time, notes, table_name)
values (9, '商品表', null, 1, '上架', to_timestamp('30-06-2018 22:23:29.119000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 'EB_ITEM');
insert into EB_CONSOLE_LOG (console_log_id, entity_name, entity_id, user_id, op_type, op_time, notes, table_name)
values (3, '商品表', null, 1, '上架', to_timestamp('06-06-2018 16:02:53.693000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 'EB_ITEM');
insert into EB_CONSOLE_LOG (console_log_id, entity_name, entity_id, user_id, op_type, op_time, notes, table_name)
values (4, '商品表', null, 1, '下架', to_timestamp('06-06-2018 16:02:59.122000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 'EB_ITEM');
insert into EB_CONSOLE_LOG (console_log_id, entity_name, entity_id, user_id, op_type, op_time, notes, table_name)
values (5, '商品表', null, 1, '上架', to_timestamp('06-06-2018 16:21:00.608000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 'EB_ITEM');
insert into EB_CONSOLE_LOG (console_log_id, entity_name, entity_id, user_id, op_type, op_time, notes, table_name)
values (6, '商品表', 4241, 1, '审核通过', to_timestamp('06-06-2018 16:27:56.997000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 'EB_ITEM');
insert into EB_CONSOLE_LOG (console_log_id, entity_name, entity_id, user_id, op_type, op_time, notes, table_name)
values (7, '商品表', null, 1, '上架', to_timestamp('06-06-2018 16:28:16.937000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 'EB_ITEM');
insert into EB_CONSOLE_LOG (console_log_id, entity_name, entity_id, user_id, op_type, op_time, notes, table_name)
values (2, '商品表', 4240, 1, '审核通过', to_timestamp('06-06-2018 15:13:54.628000', 'dd-mm-yyyy hh24:mi:ss.ff'), '信息无误，审核通过', 'EB_ITEM');
insert into EB_CONSOLE_LOG (console_log_id, entity_name, entity_id, user_id, op_type, op_time, notes, table_name)
values (10, '商品表', null, 1, '下架', to_timestamp('15-07-2018 18:57:17.608000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 'EB_ITEM');
insert into EB_CONSOLE_LOG (console_log_id, entity_name, entity_id, user_id, op_type, op_time, notes, table_name)
values (12, '商品表', null, 1, '下架', to_timestamp('15-07-2018 20:05:18.843000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 'EB_ITEM');
insert into EB_CONSOLE_LOG (console_log_id, entity_name, entity_id, user_id, op_type, op_time, notes, table_name)
values (13, '商品表', null, 1, '上架', to_timestamp('15-07-2018 20:05:30.980000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 'EB_ITEM');
commit;
prompt 14 records loaded
prompt Loading EB_FEATURE...
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (3101, 1, '像素', 0, 1, 1, '1024,768,1380', 2, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2145, 1, '手机尺寸', 0, 0, 1, '151.1x80.5x9.4mm', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2146, 1, '手机重量', 0, 0, 1, '180g ', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2147, 1, '其他特性', 0, 0, 1, '大容量电池,NFC功能', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2148, 1, '用户界面', 0, 0, 1, 'Touch Wiz 5.0', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2149, 1, 'CPU频率', 0, 0, 1, '1638MHz ', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2150, 1, 'SIM卡类型', 0, 0, 1, 'Micro SIM卡', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2151, 1, '电池类型', 0, 0, 1, '可拆卸式电池', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2152, 1, '输入法', 0, 0, 1, '中文输入法,英文输入法,第三方输入法', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2153, 1, '输入方式', 0, 0, 1, '手写', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2154, 1, '通话记录', 0, 0, 1, '已接+已拨+未接电话', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2020, 1, '操作系统', 0, 1, 1, 'Windows8,Android2.3,Android4.0,Android4.1,Android2.3.5,Android,IOS,Windows Mobile,Symbian,其他', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2160, 1, 'GPS导航', 0, 0, 1, '内置GPS,支持A-GPS', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2161, 1, '感应器类型', 0, 0, 1, '重力感应器,加速传感器,光线传感器,距离传感器', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2162, 1, '摄像头类型', 0, 0, 1, '双摄像头(前后)', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2163, 1, '前置摄像头像素', 0, 0, 1, '190万像素', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2164, 1, '后置摄像头像素', 0, 0, 1, '800万像素', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2165, 1, '闪光灯', 0, 0, 1, 'LED补光灯', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2166, 1, '自动对焦', 0, 0, 1, '支持', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2167, 1, '通讯录', 0, 0, 1, '名片式存储', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2168, 1, '地图软件', 0, 0, 1, '支持3D地图', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2169, 1, '电子罗盘', 0, 0, 1, '支持数字罗盘', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2170, 1, '摄像头', 0, 0, 1, '内置', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2171, 1, '传感器类型', 0, 0, 1, 'CMOS', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2172, 1, '图像尺寸', 0, 0, 1, '最大支持3264×2448像素照片拍摄', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2173, 1, '视频拍摄', 0, 0, 1, '1080p视频录制(1920×1080,30帧/秒)', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2174, 1, '视频播放', 0, 0, 1, '3GP,MP4,WMV,ASF,AVI,FLV,MKV,WebM', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2175, 1, '音频播放', 0, 0, 1, 'MP3,OGG,WMA,AAC,ACC+,eAAC+,AMR(NB,WB),MIDI,WAV,AC-3,Flac', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2176, 1, '图形格式', 0, 0, 1, '支持JPEG等格式', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2177, 1, '收音机', 0, 0, 1, '支持RDS功能的FM收音机', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2178, 1, '游戏', 0, 0, 1, '内置游戏,支持下载', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2179, 1, '社交应用', 0, 0, 1, '内置QQ,MSN,人人网,开心网,新浪微博,QQ空间', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2180, 1, '应用特点', 0, 0, 1, 'WikiAR,淘宝,腾讯新闻', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2181, 1, '服务特色', 0, 0, 1, '社交圈,影视圈,悦读圈,音乐圈,S Pen程序,S Planner,S Memo ', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2182, 1, '蓝牙传输', 0, 0, 1, '支持蓝牙4.0+EDR+A2DP ', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2183, 1, 'WLAN功能', 0, 0, 1, 'WIFI,IEEE 802.11 a/n/b/g', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2184, 1, '数据接口', 0, 0, 1, 'USB v2.0,支持USB OTG功能,TV-OUT ', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2185, 1, '耳机插孔', 0, 0, 1, '3.5mm', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2042, 1, 'CPU核心数', 0, 1, 1, '单核,双核,四核', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2043, 1, '网络支持', 0, 0, 1, 'WCDMA,TD-HSDPA,GSM,TD-SCDMA,GPRS,EDGE', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2044, 1, '机身内存ROM', 0, 0, 1, '32GB,8GB,53.9MB,512MB,1GB,1.5GB,2GB,2.5GB,3GB,4GB,16G', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2045, 1, '运行内存RAM', 0, 1, 1, '768MB,2471KB,256MB,512MB,1GB,1.5GB,2GB,2.5GB,3GB,4GB', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2060, 1, '存储扩展', 0, 0, 1, '可支持32GB以上,无,最高可支持64GB mircoSD,最大支持32GB MicroSD扩展卡,支持,最大支持16GB MicroSD扩展卡', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2061, 1, '屏幕尺寸', 0, 1, 1, '4.65英寸,5英寸,5.5英寸,4.8英寸,4.5英寸,4.3英寸,4.0英寸,3.7英寸,3.75英寸,3.5英寸,3.14英寸,2.8英寸,2.4英寸,2.2英寸,1.8英寸', 1, 3);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2062, 1, '网络频率', 0, 0, 1, 'TD-HSPA 1880-1920,TD-HSPA 2010-2025,WCDMA,GPRS 900/1800/1900,TD-HSDPA 1880/2010,EDGE 850/900/1900,GSM 850/900/1900,TD-SCDMA1900/2100,TDSCDMA 1900/2000MHz,HSDPA 1900/2000MHz,HSUPA 1900/2000MHz,2G 900/1800/1900MHz,WCDMA (900/2100MHz) ,EDGE900/1800/1900MHz,TD 1880/2010,2100MHz,GSM 900/1800/1900,TD-SCDMA 2010-2025,GSM 900/1800,GSM900/1800MHZ,TD-SCDMA 1880-1920', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2080, 1, '主屏分辨率', 0, 0, 1, '720×1200,940x540像素,480×854像素,1280×720像素,960×540像素,480×800像素,176×220像素,128×160像素,240×320像素,320×480像素', 1, 2);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2142, 1, '主屏材质', 0, 0, 1, 'HD Super AMOLED ', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2143, 1, '网络类型', 0, 0, 1, '单卡双模', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2144, 1, '理论速率', 0, 0, 1, 'HSDPA：21Mbps,HSUPA：5.76Mbps ', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2040, 1, '外观设计', 0, 1, 1, '直板,翻盖,滑盖,侧滑盖', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2041, 1, '操作方式', 0, 0, 1, '标准键盘,触摸屏,全键盘', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2063, 1, '屏幕色彩', 0, 1, 1, '1600万色,26万色,65536色', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2081, 1, 'CPU型号', 0, 0, 1, '高通骁龙S4,双核Tiger ,MTK MT6517A,联发科 MT6589,联发科 MT6517,展讯SC8810T 1GHz,Exynos 4412,高通MSM7627T,88PM8607,MARVELL 920H,88CP920,Marvell920,PXA920,ST-Ericsson 9500,MSM 7627T', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2100, 1, '电池容量', 0, 0, 1, '锂电池（1300mAh）,锂电池（1730mAh）,锂电池（1650mAh）,锂电池（1600mAh）,锂电池（1800mAh）,锂电池（2000mAh）,锂电池（1700mAh）,锂电池（1500mAh）,锂电池（2100mAh）,锂电池（3100mAh）,锂离子电池,锂电池（800mAh）,锂电池', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2101, 1, '上市时间', 0, 1, 1, '2010年,2011年01月,2011年12月,2011年,2012年,2013年', 1, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2140, 1, '手机类型', 0, 0, 1, '无,3G手机,智能手机,商务手机,拍照手机,平板手机', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (2141, 1, '触摸屏', 0, 1, 1, '电容屏,多点触控 ', 3, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (3061, 1, '内存', 1, 0, 1, '16G,32G,64G', 2, 1);
insert into EB_FEATURE (feature_id, cat_id, feature_name, is_spec, is_select, is_show, select_values, input_type, feature_sort)
values (3080, 1, '颜色', 1, 0, 1, '黑色,白色,土豪金', 2, 1);
commit;
prompt 59 records loaded
prompt Loading EB_ITEM...
insert into EB_ITEM (item_id, item_name, item_no, brand_id, cat_id, tag_img_id, is_new, is_good, is_hot, promotion, audit_status, show_status, imgs, keywords, page_desc, item_recycle, on_sale_time, check_time, update_time, update_user_id, create_time, check_user_id, full_path_deploy, full_path_deploy_offer, original_item_id, last_status, merchant_id, item_sort, sales, create_user_id, sim_level, tag_img)
values (4240, 'iphone4Plus', '20180605183348099', 7, 1, null, 1, 1, 1, '返璞归真，岂止于大', 1, 0, '/upload/20180605182402793050.jpg', '返璞归真，岂止于大', '返璞归真，岂止于大', null, to_timestamp('15-07-2018 20:05:30.976000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('06-06-2018 15:13:54.622000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 1, to_timestamp('05-06-2018 18:33:48.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, null, null, null, null, null, null, 0, null, null, null);
insert into EB_ITEM (item_id, item_name, item_no, brand_id, cat_id, tag_img_id, is_new, is_good, is_hot, promotion, audit_status, show_status, imgs, keywords, page_desc, item_recycle, on_sale_time, check_time, update_time, update_user_id, create_time, check_user_id, full_path_deploy, full_path_deploy_offer, original_item_id, last_status, merchant_id, item_sort, sales, create_user_id, sim_level, tag_img)
values (4241, '三星S7', '20180606162741901', 1003, 1, null, 1, 1, 1, '软屏柔软', 1, 0, '/upload/20180606162302098567.jpg', '软屏柔软', '软屏柔软', null, to_timestamp('15-07-2018 19:57:06.606000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('06-06-2018 16:27:56.995000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 1, to_timestamp('06-06-2018 16:27:42.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, null, null, null, null, null, null, 0, null, null, null);
insert into EB_ITEM (item_id, item_name, item_no, brand_id, cat_id, tag_img_id, is_new, is_good, is_hot, promotion, audit_status, show_status, imgs, keywords, page_desc, item_recycle, on_sale_time, check_time, update_time, update_user_id, create_time, check_user_id, full_path_deploy, full_path_deploy_offer, original_item_id, last_status, merchant_id, item_sort, sales, create_user_id, sim_level, tag_img)
values (4239, '小米3', '20150308153242174', 3819, 1, null, 1, 1, 1, '配置非常非常高', 1, 0, '/upload/20150308153050009097.jpg', '配置非常非常高', '配置非常非常高', null, to_timestamp('30-06-2018 22:23:29.116000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, 1, null, 1, null, null, null, 0, null, null, null, null, null, null);
insert into EB_ITEM (item_id, item_name, item_no, brand_id, cat_id, tag_img_id, is_new, is_good, is_hot, promotion, audit_status, show_status, imgs, keywords, page_desc, item_recycle, on_sale_time, check_time, update_time, update_user_id, create_time, check_user_id, full_path_deploy, full_path_deploy_offer, original_item_id, last_status, merchant_id, item_sort, sales, create_user_id, sim_level, tag_img)
values (4244, 'oppo7', '20180715202316617', 10, 1, null, 1, 0, 0, null, 1, 0, '/upload/20180715201913386969.jpg', '哈哈', null, null, to_timestamp('15-07-2018 20:32:55.599000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('15-07-2018 20:32:44.012000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 1, to_timestamp('15-07-2018 20:23:16.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, null, null, null, null, null, null, 0, null, null, null);
commit;
prompt 4 records loaded
prompt Loading EB_ORDER...
insert into EB_ORDER (order_id, ptl_user_id, username, order_num, payment, pay_platform, delivery, is_confirm, order_sum, ship_fee, is_paid, order_state, payment_cash, distri_id, delivery_method, payment_no, order_time, pay_time, deposit_time, success_time, update_time, srv_type, self_collect_site, is_deleted, is_display, notes, ship_name, province, city, district, zip_code, addr, phone, payable, company, contents, is_call, delivery_no, area_code, area_name, is_print, crm_calls_time, is_offer_release, job_num)
values (6, 1, 'zhao', '201807152036210', 1, null, 3, 0, 26000, null, 0, null, null, null, 1, null, to_timestamp('15-07-2018 20:36:34.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, null, null, null, null, '发票内容不支持修改；收货人、配送方式、支付方式等以上述选定值为准，在此备注无效', '赵先生', '吉林', '长春市', null, '553100', '黄浦路六号', '15242186247', 1, '亚信联创科技(中国)有限公司', 1, 0, null, null, null, null, null, null, null);
insert into EB_ORDER (order_id, ptl_user_id, username, order_num, payment, pay_platform, delivery, is_confirm, order_sum, ship_fee, is_paid, order_state, payment_cash, distri_id, delivery_method, payment_no, order_time, pay_time, deposit_time, success_time, update_time, srv_type, self_collect_site, is_deleted, is_display, notes, ship_name, province, city, district, zip_code, addr, phone, payable, company, contents, is_call, delivery_no, area_code, area_name, is_print, crm_calls_time, is_offer_release, job_num)
values (4, 1, 'zhao', '201807101903775', 1, null, 3, 0, 11000, null, 1, null, null, null, 1, null, to_timestamp('10-07-2018 19:03:38.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, null, null, null, null, '发票内容不支持修改；收货人、配送方式、支付方式等以上述选定值为准，在此备注无效', '赵先生', '吉林', '长春市', null, '553100', '黄浦路六号', '15242186247', 1, '亚信联创科技(中国)有限公司', 1, 0, null, null, null, null, null, null, null);
insert into EB_ORDER (order_id, ptl_user_id, username, order_num, payment, pay_platform, delivery, is_confirm, order_sum, ship_fee, is_paid, order_state, payment_cash, distri_id, delivery_method, payment_no, order_time, pay_time, deposit_time, success_time, update_time, srv_type, self_collect_site, is_deleted, is_display, notes, ship_name, province, city, district, zip_code, addr, phone, payable, company, contents, is_call, delivery_no, area_code, area_name, is_print, crm_calls_time, is_offer_release, job_num)
values (3, 1, 'zhao', '201807101854924', 1, null, 3, 0, 11000, null, 0, null, null, null, 1, null, to_timestamp('10-07-2018 18:55:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, null, null, null, null, '发票内容不支持修改；收货人、配送方式、支付方式等以上述选定值为准，在此备注无效', '赵先生', '吉林', '长春市', null, '553100', '黄浦路六号', '15242186247', 1, '亚信联创科技(中国)有限公司', 1, 1, null, null, null, null, null, null, null);
insert into EB_ORDER (order_id, ptl_user_id, username, order_num, payment, pay_platform, delivery, is_confirm, order_sum, ship_fee, is_paid, order_state, payment_cash, distri_id, delivery_method, payment_no, order_time, pay_time, deposit_time, success_time, update_time, srv_type, self_collect_site, is_deleted, is_display, notes, ship_name, province, city, district, zip_code, addr, phone, payable, company, contents, is_call, delivery_no, area_code, area_name, is_print, crm_calls_time, is_offer_release, job_num)
values (5, 1, 'zhao', '201807121738633', 1, null, 3, 0, 5000, null, 1, null, null, null, 1, null, to_timestamp('12-07-2018 17:38:46.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, null, null, null, null, '发票内容不支持修改；收货人、配送方式、支付方式等以上述选定值为准，在此备注无效', '赵先生', '吉林', '长春市', null, '553100', '黄浦路六号', '15242186247', 1, '亚信联创科技(中国)有限公司', 1, 1, null, null, null, null, null, null, null);
insert into EB_ORDER (order_id, ptl_user_id, username, order_num, payment, pay_platform, delivery, is_confirm, order_sum, ship_fee, is_paid, order_state, payment_cash, distri_id, delivery_method, payment_no, order_time, pay_time, deposit_time, success_time, update_time, srv_type, self_collect_site, is_deleted, is_display, notes, ship_name, province, city, district, zip_code, addr, phone, payable, company, contents, is_call, delivery_no, area_code, area_name, is_print, crm_calls_time, is_offer_release, job_num)
values (1, 1, null, '201807062144227', 1, null, 3, 0, 168381, null, 0, null, null, null, 1, null, to_timestamp('06-07-2018 21:44:09.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, null, null, null, null, '发票内容不支持修改；收货人、配送方式、支付方式等以上述选定值为准，在此备注无效', '赵先生', '吉林', '长春市', null, '553100', '黄浦路六号', '15242186247', 1, '亚信联创科技(中国)有限公司', 1, 0, null, null, null, 1, null, null, null);
insert into EB_ORDER (order_id, ptl_user_id, username, order_num, payment, pay_platform, delivery, is_confirm, order_sum, ship_fee, is_paid, order_state, payment_cash, distri_id, delivery_method, payment_no, order_time, pay_time, deposit_time, success_time, update_time, srv_type, self_collect_site, is_deleted, is_display, notes, ship_name, province, city, district, zip_code, addr, phone, payable, company, contents, is_call, delivery_no, area_code, area_name, is_print, crm_calls_time, is_offer_release, job_num)
values (2, 1, null, '201807062146691', 1, null, 3, 0, 168381, null, 0, null, null, null, 1, null, to_timestamp('06-07-2018 21:46:44.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null, null, null, null, null, null, null, '发票内容不支持修改；收货人、配送方式、支付方式等以上述选定值为准，在此备注无效', '赵先生', '吉林', '长春市', null, '553100', '黄浦路六号', '15242186247', 1, '亚信联创科技(中国)有限公司', 1, 0, null, null, null, 1, null, null, null);
commit;
prompt 6 records loaded
prompt Loading EB_ORDER_DETAIL...
insert into EB_ORDER_DETAIL (order_detail_id, order_id, item_id, item_name, item_no, sku_id, sku, sku_img, sku_name, sku_cat_type, sku_spec, market_price, sku_discount, sku_price, offer_group_id, offer_group_name, offer_type, short_name, offer_id, offer_name, offer_no, short_name2, offer_term, commit_monthly, prepaid, refund_preiod, refund_monthly, refund_1st_month, refund_last_month, order_detail_type, merchant_id, quantity, price, seriescode, offer_group_no, promo_type, cond_id)
values (10, 6, 4241, '三星S7', '20180606162741901', 4233, null, null, null, null, '32G,白色', 7000, null, 6000, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 1, null, null, null, null, null);
insert into EB_ORDER_DETAIL (order_detail_id, order_id, item_id, item_name, item_no, sku_id, sku, sku_img, sku_name, sku_cat_type, sku_spec, market_price, sku_discount, sku_price, offer_group_id, offer_group_name, offer_type, short_name, offer_id, offer_name, offer_no, short_name2, offer_term, commit_monthly, prepaid, refund_preiod, refund_monthly, refund_1st_month, refund_last_month, order_detail_type, merchant_id, quantity, price, seriescode, offer_group_no, promo_type, cond_id)
values (11, 6, 4241, '三星S7', '20180606162741901', 4232, null, null, null, null, '16G,黑色', 6000, null, 5000, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 4, null, null, null, null, null);
insert into EB_ORDER_DETAIL (order_detail_id, order_id, item_id, item_name, item_no, sku_id, sku, sku_img, sku_name, sku_cat_type, sku_spec, market_price, sku_discount, sku_price, offer_group_id, offer_group_name, offer_type, short_name, offer_id, offer_name, offer_no, short_name2, offer_term, commit_monthly, prepaid, refund_preiod, refund_monthly, refund_1st_month, refund_last_month, order_detail_type, merchant_id, quantity, price, seriescode, offer_group_no, promo_type, cond_id)
values (7, 4, 4241, '三星S7', '20180606162741901', 4232, null, null, null, null, '16G,黑色', 6000, null, 5000, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 1, null, null, null, null, null);
insert into EB_ORDER_DETAIL (order_detail_id, order_id, item_id, item_name, item_no, sku_id, sku, sku_img, sku_name, sku_cat_type, sku_spec, market_price, sku_discount, sku_price, offer_group_id, offer_group_name, offer_type, short_name, offer_id, offer_name, offer_no, short_name2, offer_term, commit_monthly, prepaid, refund_preiod, refund_monthly, refund_1st_month, refund_last_month, order_detail_type, merchant_id, quantity, price, seriescode, offer_group_no, promo_type, cond_id)
values (8, 4, 4241, '三星S7', '20180606162741901', 4233, null, null, null, null, '32G,白色', 7000, null, 6000, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 1, null, null, null, null, null);
insert into EB_ORDER_DETAIL (order_detail_id, order_id, item_id, item_name, item_no, sku_id, sku, sku_img, sku_name, sku_cat_type, sku_spec, market_price, sku_discount, sku_price, offer_group_id, offer_group_name, offer_type, short_name, offer_id, offer_name, offer_no, short_name2, offer_term, commit_monthly, prepaid, refund_preiod, refund_monthly, refund_1st_month, refund_last_month, order_detail_type, merchant_id, quantity, price, seriescode, offer_group_no, promo_type, cond_id)
values (5, 3, 4241, '三星S7', '20180606162741901', 4233, null, null, null, null, '32G,白色', 7000, null, 6000, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 1, null, null, null, null, null);
insert into EB_ORDER_DETAIL (order_detail_id, order_id, item_id, item_name, item_no, sku_id, sku, sku_img, sku_name, sku_cat_type, sku_spec, market_price, sku_discount, sku_price, offer_group_id, offer_group_name, offer_type, short_name, offer_id, offer_name, offer_no, short_name2, offer_term, commit_monthly, prepaid, refund_preiod, refund_monthly, refund_1st_month, refund_last_month, order_detail_type, merchant_id, quantity, price, seriescode, offer_group_no, promo_type, cond_id)
values (6, 3, 4241, '三星S7', '20180606162741901', 4232, null, null, null, null, '16G,黑色', 6000, null, 5000, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 1, null, null, null, null, null);
insert into EB_ORDER_DETAIL (order_detail_id, order_id, item_id, item_name, item_no, sku_id, sku, sku_img, sku_name, sku_cat_type, sku_spec, market_price, sku_discount, sku_price, offer_group_id, offer_group_name, offer_type, short_name, offer_id, offer_name, offer_no, short_name2, offer_term, commit_monthly, prepaid, refund_preiod, refund_monthly, refund_1st_month, refund_last_month, order_detail_type, merchant_id, quantity, price, seriescode, offer_group_no, promo_type, cond_id)
values (9, 5, 4241, '三星S7', '20180606162741901', 4232, null, null, null, null, '16G,黑色', 6000, null, 5000, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 1, null, null, null, null, null);
insert into EB_ORDER_DETAIL (order_detail_id, order_id, item_id, item_name, item_no, sku_id, sku, sku_img, sku_name, sku_cat_type, sku_spec, market_price, sku_discount, sku_price, offer_group_id, offer_group_name, offer_type, short_name, offer_id, offer_name, offer_no, short_name2, offer_term, commit_monthly, prepaid, refund_preiod, refund_monthly, refund_1st_month, refund_last_month, order_detail_type, merchant_id, quantity, price, seriescode, offer_group_no, promo_type, cond_id)
values (2, 1, 4240, 'iphone4Plus', '20180605183348099', 4230, null, null, null, null, '16G,白色', 2590, null, 1999, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 1, null, null, null, null, null);
insert into EB_ORDER_DETAIL (order_detail_id, order_id, item_id, item_name, item_no, sku_id, sku, sku_img, sku_name, sku_cat_type, sku_spec, market_price, sku_discount, sku_price, offer_group_id, offer_group_name, offer_type, short_name, offer_id, offer_name, offer_no, short_name2, offer_term, commit_monthly, prepaid, refund_preiod, refund_monthly, refund_1st_month, refund_last_month, order_detail_type, merchant_id, quantity, price, seriescode, offer_group_no, promo_type, cond_id)
values (3, 1, 4239, '小米3', '20150308153242174', 4228, null, null, null, null, '32G,白色', 2500, null, 2299, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 18, null, null, null, null, null);
insert into EB_ORDER_DETAIL (order_detail_id, order_id, item_id, item_name, item_no, sku_id, sku, sku_img, sku_name, sku_cat_type, sku_spec, market_price, sku_discount, sku_price, offer_group_id, offer_group_name, offer_type, short_name, offer_id, offer_name, offer_no, short_name2, offer_term, commit_monthly, prepaid, refund_preiod, refund_monthly, refund_1st_month, refund_last_month, order_detail_type, merchant_id, quantity, price, seriescode, offer_group_no, promo_type, cond_id)
values (4, 1, 4241, '三星S7', '20180606162741901', 4232, null, null, null, null, '16G,黑色', 6000, null, 5000, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 25, null, null, null, null, null);
commit;
prompt 10 records loaded
prompt Loading EB_PARA_VALUE...
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7786, 4240, 3101, '1024');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7787, 4240, 2145, '151.1x80.5x9.4mm');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7788, 4240, 2146, '180g');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7789, 4240, 2147, '大容量电池');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7790, 4240, 2148, 'Touch Wiz 5.0');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7791, 4240, 2149, '1638MHz');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7792, 4240, 2150, 'Micro SIM卡');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7793, 4240, 2151, '可拆卸式电池');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7794, 4240, 2152, '中文输入法,英文输入法');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7795, 4240, 2153, '手写');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7796, 4240, 2154, '已接+已拨+未接电话');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7797, 4240, 2020, 'IOS');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7798, 4240, 2160, '内置GPS');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7799, 4240, 2161, '重力感应器,光线传感器');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7800, 4240, 2162, '双摄像头(前后)');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7801, 4240, 2163, '190万像素');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7802, 4240, 2164, '800万像素');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7803, 4240, 2165, 'LED补光灯');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7804, 4240, 2166, '支持');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7805, 4240, 2167, '名片式存储');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7806, 4240, 2168, '支持3D地图');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7807, 4240, 2169, '支持数字罗盘');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7808, 4240, 2170, '内置');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7809, 4240, 2171, 'CMOS');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7810, 4240, 2172, '最大支持3264×2448像素照片拍摄');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7811, 4240, 2173, '1080p视频录制(1920×1080');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7812, 4240, 2176, '支持JPEG等格式');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7813, 4240, 2177, '支持RDS功能的FM收音机');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7814, 4240, 2182, '支持蓝牙4.0+EDR+A2DP');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7815, 4240, 2185, '3.5mm');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7816, 4240, 2042, '双核');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7817, 4240, 2044, '32GB');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7818, 4240, 2045, '2GB');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7819, 4240, 2060, '最大支持16GB MicroSD扩展卡');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7820, 4240, 2061, '4.65英寸');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7821, 4240, 2080, '940x540像素');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7822, 4240, 2142, 'HD Super AMOLED');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7823, 4240, 2143, '单卡双模');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7824, 4240, 2144, 'HSDPA：21Mbps');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7825, 4240, 2040, '直板');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7826, 4240, 2041, '触摸屏');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7827, 4240, 2063, '26万色');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7828, 4240, 2081, '高通骁龙S4');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7829, 4240, 2100, '锂电池（1730mAh）');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7830, 4240, 2101, '2013年');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7831, 4240, 2140, '3G手机,智能手机,商务手机,拍照手机');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7832, 4240, 2141, '电容屏,多点触控');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7833, 4241, 2020, 'Android4.0');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7834, 4241, 2166, '支持');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7835, 4241, 2167, '名片式存储');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7836, 4241, 2168, '支持3D地图');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7837, 4241, 2169, '支持数字罗盘');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7838, 4241, 2172, '最大支持3264×2448像素照片拍摄');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7839, 4241, 2060, '可支持32GB以上');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7840, 4241, 2061, '5英寸');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7841, 4241, 2080, '1280×720像素');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7842, 4241, 2142, 'HD Super AMOLED');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7843, 4241, 2040, '直板');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7844, 4241, 2063, '1600万色');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7845, 4241, 2101, '2011年');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7846, 4241, 2140, '3G手机,智能手机,商务手机');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7770, 4239, 2020, 'Android4.0');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7771, 4239, 2044, '32GB');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7772, 4239, 2045, '768MB');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7773, 4239, 2060, '可支持32GB以上');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7774, 4239, 2061, '5英寸');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7775, 4239, 2080, '480×854像素');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7776, 4239, 2142, 'HD Super AMOLED ');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7777, 4239, 2143, '单卡双模');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7778, 4239, 2040, '直板');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7779, 4239, 2041, '标准键盘');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7780, 4239, 2063, '1600万色');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7781, 4239, 2081, '高通骁龙S4');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7782, 4239, 2100, '锂电池（1650mAh）');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7783, 4239, 2101, '2013年');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7784, 4239, 2140, '3G手机,智能手机,商务手机');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7785, 4239, 2141, '电容屏,多点触控 ');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7847, 4244, 3101, '1024');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7848, 4244, 2145, '151.1x80.5x9.4mm');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7849, 4244, 2146, '180g');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7850, 4244, 2147, '大容量电池');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7851, 4244, 2148, 'Touch Wiz 5.0');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7852, 4244, 2149, '1638MHz');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7853, 4244, 2150, 'Micro SIM卡');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7854, 4244, 2151, '可拆卸式电池');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7855, 4244, 2152, '中文输入法');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7856, 4244, 2153, '手写');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7857, 4244, 2154, '已接+已拨+未接电话');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7858, 4244, 2020, 'Android2.3');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7859, 4244, 2160, '内置GPS');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7860, 4244, 2161, '加速传感器');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7861, 4244, 2162, '双摄像头(前后)');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7862, 4244, 2163, '190万像素');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7863, 4244, 2164, '800万像素');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7864, 4244, 2165, 'LED补光灯');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7865, 4244, 2166, '支持');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7866, 4244, 2167, '名片式存储');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7867, 4244, 2168, '支持3D地图');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7868, 4244, 2169, '支持数字罗盘');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7869, 4244, 2170, '内置');
commit;
prompt 100 records committed...
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7870, 4244, 2171, 'CMOS');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7871, 4244, 2172, '最大支持3264×2448像素照片拍摄');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7872, 4244, 2173, '1080p视频录制(1920×1080');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7873, 4244, 2174, '3GP');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7874, 4244, 2175, 'OGG');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7875, 4244, 2176, '支持JPEG等格式');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7876, 4244, 2177, '支持RDS功能的FM收音机');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7877, 4244, 2178, '内置游戏');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7878, 4244, 2179, 'MSN');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7879, 4244, 2180, '淘宝');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7880, 4244, 2181, '影视圈');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7881, 4244, 2182, '支持蓝牙4.0+EDR+A2DP');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7882, 4244, 2183, 'WIFI');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7883, 4244, 2184, 'USB v2.0');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7884, 4244, 2185, '3.5mm');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7885, 4244, 2042, '四核');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7886, 4244, 2043, 'WCDMA,TD-HSDPA');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7887, 4244, 2044, '32GB');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7888, 4244, 2045, '3GB');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7889, 4244, 2060, '最高可支持64GB mircoSD');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7890, 4244, 2061, '4.8英寸');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7891, 4244, 2062, 'TD-HSPA 1880-1920,HSDPA 1900/2000MHz');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7892, 4244, 2080, '960×540像素');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7893, 4244, 2143, '单卡双模');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7894, 4244, 2144, 'HSDPA：21Mbps');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7895, 4244, 2040, '直板');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7896, 4244, 2041, '触摸屏');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7897, 4244, 2063, '1600万色');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7898, 4244, 2081, '双核Tiger');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7899, 4244, 2100, '锂电池（1730mAh）');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7900, 4244, 2101, '2011年01月');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7901, 4244, 2140, '无');
insert into EB_PARA_VALUE (para_id, item_id, feature_id, para_value)
values (7902, 4244, 2141, '多点触控');
commit;
prompt 133 records loaded
prompt Loading EB_SHIP_ADDR...
insert into EB_SHIP_ADDR (ship_addr_id, ptl_user_id, ship_name, province, city, district, zip_code, addr, phone, default_addr)
values (2, 1, '赵先生', '吉林', '长春市', null, '553100', '黄浦路六号', '15242186247', 1);
commit;
prompt 1 records loaded
prompt Loading EB_SKU...
insert into EB_SKU (sku_id, item_id, sku, sku_price, show_status, stock_inventory, sku_upper_limit, location, sku_img, sku_sort, sku_name, market_price, create_time, update_time, create_user_id, update_user_id, original_sku_id, last_status, merchant_id, sku_type, sales, res_code, pack_id)
values (4228, 4239, null, 2299, 0, 0, null, null, null, null, null, 2500, null, null, null, null, null, null, null, 1, null, null, null);
insert into EB_SKU (sku_id, item_id, sku, sku_price, show_status, stock_inventory, sku_upper_limit, location, sku_img, sku_sort, sku_name, market_price, create_time, update_time, create_user_id, update_user_id, original_sku_id, last_status, merchant_id, sku_type, sales, res_code, pack_id)
values (4229, 4239, null, 2899, 0, 100, null, null, null, null, null, 3000, null, null, null, null, null, null, null, 1, null, null, null);
insert into EB_SKU (sku_id, item_id, sku, sku_price, show_status, stock_inventory, sku_upper_limit, location, sku_img, sku_sort, sku_name, market_price, create_time, update_time, create_user_id, update_user_id, original_sku_id, last_status, merchant_id, sku_type, sales, res_code, pack_id)
values (4230, 4240, null, 1999, 0, 0, 1000, null, null, null, null, 2590, null, null, null, null, null, null, null, 1, null, null, null);
insert into EB_SKU (sku_id, item_id, sku, sku_price, show_status, stock_inventory, sku_upper_limit, location, sku_img, sku_sort, sku_name, market_price, create_time, update_time, create_user_id, update_user_id, original_sku_id, last_status, merchant_id, sku_type, sales, res_code, pack_id)
values (4231, 4240, null, 2999, 0, 1000, 112, null, null, null, null, 3999, null, null, null, null, null, null, null, 1, null, null, null);
insert into EB_SKU (sku_id, item_id, sku, sku_price, show_status, stock_inventory, sku_upper_limit, location, sku_img, sku_sort, sku_name, market_price, create_time, update_time, create_user_id, update_user_id, original_sku_id, last_status, merchant_id, sku_type, sales, res_code, pack_id)
values (4232, 4241, null, 5000, 0, 68, null, null, null, null, null, 6000, null, null, null, null, null, null, null, 1, null, null, null);
insert into EB_SKU (sku_id, item_id, sku, sku_price, show_status, stock_inventory, sku_upper_limit, location, sku_img, sku_sort, sku_name, market_price, create_time, update_time, create_user_id, update_user_id, original_sku_id, last_status, merchant_id, sku_type, sales, res_code, pack_id)
values (4233, 4241, null, 6000, 0, 197, null, null, null, null, null, 7000, null, null, null, null, null, null, null, 1, null, null, null);
insert into EB_SKU (sku_id, item_id, sku, sku_price, show_status, stock_inventory, sku_upper_limit, location, sku_img, sku_sort, sku_name, market_price, create_time, update_time, create_user_id, update_user_id, original_sku_id, last_status, merchant_id, sku_type, sales, res_code, pack_id)
values (4234, 4244, null, 2005, 0, 125, null, null, null, null, null, 1999, null, null, null, null, null, null, null, 1, null, null, null);
commit;
prompt 7 records loaded
prompt Loading EB_SPEC_VALUE...
insert into EB_SPEC_VALUE (spec_id, sku_id, feature_id, spec_value)
values (4256, 4230, 3061, '16G');
insert into EB_SPEC_VALUE (spec_id, sku_id, feature_id, spec_value)
values (4257, 4230, 3080, '白色');
insert into EB_SPEC_VALUE (spec_id, sku_id, feature_id, spec_value)
values (4258, 4231, 3061, '32G');
insert into EB_SPEC_VALUE (spec_id, sku_id, feature_id, spec_value)
values (4259, 4231, 3080, '黑色');
insert into EB_SPEC_VALUE (spec_id, sku_id, feature_id, spec_value)
values (4260, 4232, 3061, '16G');
insert into EB_SPEC_VALUE (spec_id, sku_id, feature_id, spec_value)
values (4261, 4232, 3080, '黑色');
insert into EB_SPEC_VALUE (spec_id, sku_id, feature_id, spec_value)
values (4262, 4233, 3061, '32G');
insert into EB_SPEC_VALUE (spec_id, sku_id, feature_id, spec_value)
values (4263, 4233, 3080, '白色');
insert into EB_SPEC_VALUE (spec_id, sku_id, feature_id, spec_value)
values (4252, 4228, 3061, '32G');
insert into EB_SPEC_VALUE (spec_id, sku_id, feature_id, spec_value)
values (4253, 4228, 3080, '白色');
insert into EB_SPEC_VALUE (spec_id, sku_id, feature_id, spec_value)
values (4254, 4229, 3061, '64G');
insert into EB_SPEC_VALUE (spec_id, sku_id, feature_id, spec_value)
values (4255, 4229, 3080, '白色');
insert into EB_SPEC_VALUE (spec_id, sku_id, feature_id, spec_value)
values (4264, 4234, 3061, '32G');
insert into EB_SPEC_VALUE (spec_id, sku_id, feature_id, spec_value)
values (4265, 4234, 3080, null);
commit;
prompt 14 records loaded
prompt Loading TS_PTL_USER...
insert into TS_PTL_USER (ptl_user_id, username, gender, password, nickname, real_name, phone, resi_prov, resi_city, resi_dist, addr, zip_code, login_time, status, email, group_id, birthday, qq_num, msn_num, cellphone, intro_info, login_count, register_time)
values (1, 'zhao', 0, 'e10adc3949ba59abbe56e057f20f883e', 'jing', '晨', '6224251', '吉林省', '长春市', '龙亭区', '黄浦路六号', null, null, null, null, null, null, null, null, null, null, null, null);
commit;
prompt 1 records loaded
prompt Enabling foreign key constraints for ACT_ID_MEMBERSHIP...
alter table ACT_ID_MEMBERSHIP enable constraint ACT_FK_MEMB_GROUP;
alter table ACT_ID_MEMBERSHIP enable constraint ACT_FK_MEMB_USER;
prompt Enabling foreign key constraints for ACT_RE_MODEL...
alter table ACT_RE_MODEL enable constraint ACT_FK_MODEL_DEPLOYMENT;
alter table ACT_RE_MODEL enable constraint ACT_FK_MODEL_SOURCE;
alter table ACT_RE_MODEL enable constraint ACT_FK_MODEL_SOURCE_EXTRA;
prompt Enabling foreign key constraints for ACT_RU_EXECUTION...
alter table ACT_RU_EXECUTION enable constraint ACT_FK_EXE_PARENT;
alter table ACT_RU_EXECUTION enable constraint ACT_FK_EXE_PROCDEF;
alter table ACT_RU_EXECUTION enable constraint ACT_FK_EXE_PROCINST;
alter table ACT_RU_EXECUTION enable constraint ACT_FK_EXE_SUPER;
prompt Enabling foreign key constraints for ACT_RU_EVENT_SUBSCR...
alter table ACT_RU_EVENT_SUBSCR enable constraint ACT_FK_EVENT_EXEC;
prompt Enabling foreign key constraints for ACT_RU_TASK...
alter table ACT_RU_TASK enable constraint ACT_FK_TASK_EXE;
alter table ACT_RU_TASK enable constraint ACT_FK_TASK_PROCDEF;
alter table ACT_RU_TASK enable constraint ACT_FK_TASK_PROCINST;
prompt Enabling foreign key constraints for ACT_RU_IDENTITYLINK...
alter table ACT_RU_IDENTITYLINK enable constraint ACT_FK_ATHRZ_PROCEDEF;
alter table ACT_RU_IDENTITYLINK enable constraint ACT_FK_IDL_PROCINST;
alter table ACT_RU_IDENTITYLINK enable constraint ACT_FK_TSKASS_TASK;
prompt Enabling foreign key constraints for ACT_RU_JOB...
alter table ACT_RU_JOB enable constraint ACT_FK_JOB_EXCEPTION;
prompt Enabling foreign key constraints for ACT_RU_VARIABLE...
alter table ACT_RU_VARIABLE enable constraint ACT_FK_VAR_BYTEARRAY;
alter table ACT_RU_VARIABLE enable constraint ACT_FK_VAR_EXE;
alter table ACT_RU_VARIABLE enable constraint ACT_FK_VAR_PROCINST;
prompt Enabling foreign key constraints for EB_CATBRAND...
alter table EB_CATBRAND enable constraint CATBRAND_BRAND_FK;
alter table EB_CATBRAND enable constraint CATBRAND_CAT_FK;
prompt Enabling foreign key constraints for EB_FEATURE...
alter table EB_FEATURE enable constraint FEATURE_CAT_FK;
prompt Enabling foreign key constraints for EB_ITEM...
alter table EB_ITEM enable constraint ITEM_BRAND_FK;
alter table EB_ITEM enable constraint ITEM_CAT_ID;
prompt Enabling foreign key constraints for EB_PARA_VALUE...
alter table EB_PARA_VALUE enable constraint ITEMID_FK;
prompt Enabling triggers for ACT_GE_PROPERTY...
alter table ACT_GE_PROPERTY enable all triggers;
prompt Enabling triggers for ACT_HI_ACTINST...
alter table ACT_HI_ACTINST enable all triggers;
prompt Enabling triggers for ACT_HI_ATTACHMENT...
alter table ACT_HI_ATTACHMENT enable all triggers;
prompt Enabling triggers for ACT_HI_DETAIL...
alter table ACT_HI_DETAIL enable all triggers;
prompt Enabling triggers for ACT_HI_IDENTITYLINK...
alter table ACT_HI_IDENTITYLINK enable all triggers;
prompt Enabling triggers for ACT_HI_PROCINST...
alter table ACT_HI_PROCINST enable all triggers;
prompt Enabling triggers for ACT_HI_TASKINST...
alter table ACT_HI_TASKINST enable all triggers;
prompt Enabling triggers for ACT_HI_VARINST...
alter table ACT_HI_VARINST enable all triggers;
prompt Enabling triggers for ACT_ID_GROUP...
alter table ACT_ID_GROUP enable all triggers;
prompt Enabling triggers for ACT_ID_USER...
alter table ACT_ID_USER enable all triggers;
prompt Enabling triggers for ACT_ID_MEMBERSHIP...
alter table ACT_ID_MEMBERSHIP enable all triggers;
prompt Enabling triggers for ACT_RE_DEPLOYMENT...
alter table ACT_RE_DEPLOYMENT enable all triggers;
prompt Enabling triggers for ACT_RE_MODEL...
alter table ACT_RE_MODEL enable all triggers;
prompt Enabling triggers for ACT_RE_PROCDEF...
alter table ACT_RE_PROCDEF enable all triggers;
prompt Enabling triggers for ACT_RU_EXECUTION...
alter table ACT_RU_EXECUTION enable all triggers;
prompt Enabling triggers for ACT_RU_EVENT_SUBSCR...
alter table ACT_RU_EVENT_SUBSCR enable all triggers;
prompt Enabling triggers for ACT_RU_TASK...
alter table ACT_RU_TASK enable all triggers;
prompt Enabling triggers for ACT_RU_IDENTITYLINK...
alter table ACT_RU_IDENTITYLINK enable all triggers;
prompt Enabling triggers for ACT_RU_JOB...
alter table ACT_RU_JOB enable all triggers;
prompt Enabling triggers for ACT_RU_VARIABLE...
alter table ACT_RU_VARIABLE enable all triggers;
prompt Enabling triggers for EB_BRAND...
alter table EB_BRAND enable all triggers;
prompt Enabling triggers for EB_CAT...
alter table EB_CAT enable all triggers;
prompt Enabling triggers for EB_CATBRAND...
alter table EB_CATBRAND enable all triggers;
prompt Enabling triggers for EB_CONSOLE_LOG...
alter table EB_CONSOLE_LOG enable all triggers;
prompt Enabling triggers for EB_FEATURE...
alter table EB_FEATURE enable all triggers;
prompt Enabling triggers for EB_ITEM...
alter table EB_ITEM enable all triggers;
prompt Enabling triggers for EB_ORDER...
alter table EB_ORDER enable all triggers;
prompt Enabling triggers for EB_ORDER_DETAIL...
alter table EB_ORDER_DETAIL enable all triggers;
prompt Enabling triggers for EB_PARA_VALUE...
alter table EB_PARA_VALUE enable all triggers;
prompt Enabling triggers for EB_SHIP_ADDR...
alter table EB_SHIP_ADDR enable all triggers;
prompt Enabling triggers for EB_SKU...
alter table EB_SKU enable all triggers;
prompt Enabling triggers for EB_SPEC_VALUE...
alter table EB_SPEC_VALUE enable all triggers;
prompt Enabling triggers for TS_PTL_USER...
alter table TS_PTL_USER enable all triggers;

set feedback on
set define on
prompt Done
