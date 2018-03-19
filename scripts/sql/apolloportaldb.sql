CREATE DATABASE IF NOT EXISTS ApolloPortalDB ;
DROP TABLE IF EXISTS "App";

CREATE SEQUENCE app_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;

CREATE TABLE "App" (
  "Id" int  NOT NULL DEFAULT nextval('app_seq') ,
  "AppId" varchar(500) NOT NULL DEFAULT 'default',
  "Name" varchar(500) NOT NULL DEFAULT 'default',
  "OrgId" varchar(32) NOT NULL DEFAULT 'default',
  "OrgName" varchar(64) NOT NULL DEFAULT 'default',
  "OwnerName" varchar(500) NOT NULL DEFAULT 'default',
  "OwnerEmail" varchar(500) NOT NULL DEFAULT 'default',
  "IsDeleted" int4 NOT NULL DEFAULT '0',
  "DataChange_CreatedBy" varchar(32) NOT NULL DEFAULT 'default',
  "DataChange_CreatedTime" timestamp NOT NULL DEFAULT current_timestamp,
  "DataChange_LastModifiedBy" varchar(32) DEFAULT '',
  "DataChange_LastTime" timestamp ,
  PRIMARY KEY ("Id")
);


DROP TABLE IF EXISTS "AppNamespace";

CREATE SEQUENCE app_name_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


CREATE TABLE "AppNamespace" (
  "Id" int  NOT NULL DEFAULT nextval('app_name_seq'),
  "Name" varchar(32) NOT NULL DEFAULT '',
  "AppId" varchar(32) NOT NULL DEFAULT '',
  "Format" varchar(32) NOT NULL DEFAULT 'properties',
  "IsPublic" int4 NOT NULL DEFAULT '0',
  "Comment" varchar(64) NOT NULL DEFAULT '',
  "IsDeleted" int4 NOT NULL DEFAULT '0',
  "DataChange_CreatedBy" varchar(32) NOT NULL DEFAULT '',
  "DataChange_CreatedTime" timestamp NOT NULL DEFAULT current_timestamp,
  "DataChange_LastModifiedBy" varchar(32) DEFAULT '',
  "DataChange_LastTime" timestamp ,
  PRIMARY KEY ("Id")
 
 
 
);


DROP TABLE IF EXISTS "Consumer";
CREATE SEQUENCE consumer_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


CREATE TABLE "Consumer" (
  "Id" int  NOT NULL DEFAULT nextval('consumer_seq'),
  "AppId" varchar(500) NOT NULL DEFAULT 'default',
  "Name" varchar(500) NOT NULL DEFAULT 'default',
  "OrgId" varchar(32) NOT NULL DEFAULT 'default',
  "OrgName" varchar(64) NOT NULL DEFAULT 'default',
  "OwnerName" varchar(500) NOT NULL DEFAULT 'default',
  "OwnerEmail" varchar(500) NOT NULL DEFAULT 'default',
  "IsDeleted" int4 NOT NULL DEFAULT '0',
  "DataChange_CreatedBy" varchar(32) NOT NULL DEFAULT 'default',
  "DataChange_CreatedTime" timestamp NOT NULL DEFAULT current_timestamp,
  "DataChange_LastModifiedBy" varchar(32) DEFAULT '',
  "DataChange_LastTime" timestamp ,
  PRIMARY KEY ("Id")
);

DROP TABLE IF EXISTS "ConsumerAudit";
CREATE SEQUENCE consumer_audit_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


CREATE TABLE "ConsumerAudit" (
  "Id" int  NOT NULL DEFAULT nextval('consumer_audit_seq'),
  "ConsumerId" int  DEFAULT NULL,
  "Uri" varchar(1024) NOT NULL DEFAULT '',
  "Method" varchar(16) NOT NULL DEFAULT '',
  "DataChange_CreatedTime" timestamp NOT NULL DEFAULT current_timestamp,
  "DataChange_LastTime" timestamp ,
  PRIMARY KEY ("Id")
 
 
);


DROP TABLE IF EXISTS "ConsumerRole";
CREATE SEQUENCE consumer_role_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


CREATE TABLE "ConsumerRole" (
  "Id" int  NOT NULL DEFAULT nextval('consumer_role_seq'),
  "ConsumerId" int  DEFAULT NULL,
  "RoleId" int  DEFAULT NULL,
  "IsDeleted" int4 NOT NULL DEFAULT '0',
  "DataChange_CreatedBy" varchar(32) DEFAULT '',
  "DataChange_CreatedTime" timestamp NOT NULL DEFAULT current_timestamp,
  "DataChange_LastModifiedBy" varchar(32) DEFAULT '',
  "DataChange_LastTime" timestamp ,
  PRIMARY KEY ("Id")
);

---------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS "ConsumerToken";
CREATE SEQUENCE consumer_token_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


CREATE TABLE "ConsumerToken" (
  "Id" int  NOT NULL DEFAULT nextval('consumer_token_seq'),
  "ConsumerId" int  DEFAULT NULL,
  "Token" varchar(128) NOT NULL DEFAULT '',
  "Expires" timestamp NOT NULL DEFAULT '2099-01-01 00:00:00',
  "IsDeleted" int4 NOT NULL DEFAULT '0',
  "DataChange_CreatedBy" varchar(32) NOT NULL DEFAULT 'default',
  "DataChange_CreatedTime" timestamp NOT NULL DEFAULT current_timestamp,
  "DataChange_LastModifiedBy" varchar(32) DEFAULT '',
  "DataChange_LastTime" timestamp ,
  PRIMARY KEY ("Id")
);

DROP TABLE IF EXISTS "Favorite";
CREATE SEQUENCE favorite_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


CREATE TABLE "Favorite" (
  "Id" int  NOT NULL DEFAULT nextval('favorite_seq'),
  "UserId" varchar(32) NOT NULL DEFAULT 'default',
  "AppId" varchar(500) NOT NULL DEFAULT 'default',
  "Position" bigint NOT NULL DEFAULT '10000',
  "IsDeleted" int4 NOT NULL DEFAULT '0',
  "DataChange_CreatedBy" varchar(32) NOT NULL DEFAULT 'default',
  "DataChange_CreatedTime" timestamp NOT NULL DEFAULT current_timestamp,
  "DataChange_LastModifiedBy" varchar(32) DEFAULT '',
  "DataChange_LastTime" timestamp ,
  PRIMARY KEY ("Id")
 
) ;

DROP TABLE IF EXISTS "Permission";
CREATE SEQUENCE permission_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


CREATE TABLE "Permission" (
  "Id" int  NOT NULL DEFAULT nextval('permission_seq'),
  "PermissionType" varchar(32) NOT NULL DEFAULT '',
  "TargetId" varchar(256) NOT NULL DEFAULT '',
  "IsDeleted" int4 NOT NULL DEFAULT '0',
  "DataChange_CreatedBy" varchar(32) NOT NULL DEFAULT '',
  "DataChange_CreatedTime" timestamp NOT NULL DEFAULT current_timestamp,
  "DataChange_LastModifiedBy" varchar(32) DEFAULT '',
  "DataChange_LastTime" timestamp ,
  PRIMARY KEY ("Id")
 
 
);
DROP TABLE IF EXISTS "Role";
CREATE SEQUENCE role_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


CREATE TABLE "Role" (
  "Id" int  NOT NULL DEFAULT nextval('role_seq'),
  "RoleName" varchar(256) NOT NULL DEFAULT '',
  "IsDeleted" int4 NOT NULL DEFAULT '0',
  "DataChange_CreatedBy" varchar(32) NOT NULL DEFAULT 'default',
  "DataChange_CreatedTime" timestamp NOT NULL DEFAULT current_timestamp,
  "DataChange_LastModifiedBy" varchar(32) DEFAULT '',
  "DataChange_LastTime" timestamp ,
  PRIMARY KEY ("Id")
 
 
);
DROP TABLE IF EXISTS "RolePermission";
CREATE SEQUENCE role_permission_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


CREATE TABLE "RolePermission" (
  "Id" int  NOT NULL DEFAULT nextval('role_permission_seq'),
  "RoleId" int  DEFAULT NULL,
  "PermissionId" int  DEFAULT NULL,
  "IsDeleted" int4 NOT NULL DEFAULT '0',
  "DataChange_CreatedBy" varchar(32) DEFAULT '',
  "DataChange_CreatedTime" timestamp NOT NULL DEFAULT current_timestamp,
  "DataChange_LastModifiedBy" varchar(32) DEFAULT '',
  "DataChange_LastTime" timestamp ,
  PRIMARY KEY ("Id")
 
 
 
);
DROP TABLE IF EXISTS "ServerConfig";
CREATE SEQUENCE server_config_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


CREATE TABLE "ServerConfig" (
  "Id" int  NOT NULL DEFAULT nextval('server_config_seq'),
  "Key" varchar(64) NOT NULL DEFAULT 'default',
  "Value" varchar(2048) NOT NULL DEFAULT 'default',
  "Comment" varchar(1024) DEFAULT '',
  "IsDeleted" int4 NOT NULL DEFAULT '0',
  "DataChange_CreatedBy" varchar(32) NOT NULL DEFAULT 'default',
  "DataChange_CreatedTime" timestamp NOT NULL DEFAULT current_timestamp,
  "DataChange_LastModifiedBy" varchar(32) DEFAULT '',
  "DataChange_LastTime" timestamp ,
  PRIMARY KEY ("Id")
 
 
);
DROP TABLE IF EXISTS "UserRole";
CREATE SEQUENCE user_role_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


CREATE TABLE "UserRole" (
  "Id" int  NOT NULL DEFAULT nextval('user_role_seq'),
  "UserId" varchar(128) DEFAULT '',
  "RoleId" int  DEFAULT NULL,
  "IsDeleted" int4 NOT NULL DEFAULT '0',
  "DataChange_CreatedBy" varchar(32) DEFAULT '',
  "DataChange_CreatedTime" timestamp NOT NULL DEFAULT current_timestamp,
  "DataChange_LastModifiedBy" varchar(32) DEFAULT '',
  "DataChange_LastTime" timestamp ,
  PRIMARY KEY ("Id")
);
DROP TABLE IF EXISTS "Users";
CREATE SEQUENCE users_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


CREATE TABLE "Users" (
  "Id" int  NOT NULL DEFAULT nextval('users_seq'),
  "Username" varchar(64) NOT NULL DEFAULT 'default',
  "Password" varchar(64) NOT NULL DEFAULT 'default',
  "Email" varchar(64) NOT NULL DEFAULT 'default',
  "Enabled" int DEFAULT NULL,
  PRIMARY KEY ("Id")
);
DROP TABLE IF EXISTS "Authorities";
CREATE SEQUENCE authorities_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


CREATE TABLE "Authorities" (
  "Id" int  NOT NULL DEFAULT nextval('authorities_seq'),
  "Username" varchar(50) NOT NULL,
  "Authority" varchar(50) NOT NULL,
  PRIMARY KEY ("Id")
);
INSERT INTO "ServerConfig" ("Key", "Value", "Comment")
VALUES
    ('apollo.portal.envs', 'dev', '可支持的环境列表'),
    ('organizations', '[{\"orgId\":\"TEST1\",\"orgName\":\"样例部门1\"},{\"orgId\":\"TEST2\",\"orgName\":\"样例部门2\"}]', '部门列表'),
    ('superAdmin', 'apollo', 'Portal超级管理员'),
    ('api.readTimeout', '10000', 'http接口read timeout'),
    ('consumer.token.salt', 'someSalt', 'consumer token salt'),
    ('admin.createPrivateNamespace.switch', 'false', '是否允许项目管理员创建私有namespace');
INSERT INTO "Users" ("Username", "Password", "Email", "Enabled")
VALUES
	('apollo', '$2a$10$7r20uS.BQ9uBpf3Baj3uQOZvMVvB1RN3PYoKE94gtz2.WAOuiiwXS', 'apollo@acme.com', 1);
INSERT INTO "Authorities" ("Username", "Authority") VALUES ('apollo', 'ROLE_user');
