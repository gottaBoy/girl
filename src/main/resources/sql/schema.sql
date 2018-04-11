drop table if exists t_sys_user;
drop table if exists t_sys_organization;
drop table if exists t_sys_resource;
drop table if exists t_sys_role;

create table t_sys_user (
  id bigint auto_increment,
  organization_id bigint,
  username varchar(100),
  password varchar(100),
  salt varchar(100),
  realname varchar(100),
  role_ids varchar(100),
  locked bool default false,
  constraint pk_sys_user primary key(id)
) charset=utf8 ENGINE=InnoDB;
create unique index idx_sys_user_username on t_sys_user(username);
create index idx_sys_user_organization_id on t_sys_user(organization_id);

create table t_sys_organization (
  id bigint auto_increment,
  name varchar(100),
  manager_id bigint,
  parent_id bigint,
  parent_ids varchar(100),
  available bool default false,
  constraint pk_sys_organization primary key(id)
) charset=utf8 ENGINE=InnoDB;
create index idx_sys_organization_parent_id on t_sys_organization(parent_id);
create index idx_sys_organization_parent_ids on t_sys_organization(parent_ids);


create table t_sys_resource (
  id bigint auto_increment,
  name varchar(100),
  type varchar(50),
  url varchar(200),
  parent_id bigint,
  parent_ids varchar(100),
  permission varchar(100),
  available bool default false,
  constraint pk_sys_resource primary key(id)
) charset=utf8 ENGINE=InnoDB;
create index idx_sys_resource_parent_id on t_sys_resource(parent_id);
create index idx_sys_resource_parent_ids on t_sys_resource(parent_ids);

create table t_sys_role (
  id bigint auto_increment,
  role varchar(100),
  description varchar(100),
  resource_ids varchar(100),
  available bool default false,
  constraint pk_sys_role primary key(id)
) charset=utf8 ENGINE=InnoDB;
create index idx_sys_role_resource_ids on t_sys_role(resource_ids);