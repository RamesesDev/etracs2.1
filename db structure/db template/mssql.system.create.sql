/*Table structure for table "rule" */

CREATE TABLE "rule" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(25) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "docstate" varchar(25) NOT NULL,
  "rulename" varchar(50) NOT NULL,
  "description" varchar(100) NOT NULL,
  "packagename" varchar(100) NOT NULL,
  "author" varchar(50) NOT NULL,
  "salience" int NOT NULL,
  "agendagroupid" varchar(50) NOT NULL,
  "agendagroup" varchar(25) NOT NULL,
  "ruleset" varchar(50) NOT NULL,
  "effectivefrom" date default NULL,
  "effectiveto" date default NULL,
  "ruletext" text,
  "conditions" text,
  "actions" text,
  "extended" text,
  PRIMARY KEY  ("objid"),
  UNIQUE ("rulename","ruleset")
);

/*Table structure for table "rule_package" */

CREATE TABLE "rule_package" (
  "ruleset" varchar(50) NOT NULL,
  "rulegroup" varchar(50) NOT NULL,
  "packagename" varchar(255) NOT NULL,
  "orderindex" int default NULL,
  "type" varchar(10) default NULL,
  "content" text,
  "lastmodified" datetime default NULL,
  PRIMARY KEY  ("ruleset","rulegroup","packagename")
);

/*Table structure for table "rule_sets" */

CREATE TABLE "rule_sets" (
  "name" varchar(50) NOT NULL default '',
  "rulegroup" varchar(50) NOT NULL,
  PRIMARY KEY  ("name","rulegroup")
);

/*Table structure for table "rulegroup" */

CREATE TABLE "rulegroup" (
  "objid" varchar(50) NOT NULL,
  "name" varchar(50) default NULL,
  "sortorder" int default NULL,
  "ruleset" varchar(50) NOT NULL,
  PRIMARY KEY  ("objid","ruleset")
);

/*Table structure for table "sys_async_response" */

CREATE TABLE "sys_async_response" (
  "objid" varchar(50) NOT NULL,
  "requestId" varchar(50) default NULL,
  "data" binary,
  "expiryDate" datetime default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "sys_cache" */

CREATE TABLE "sys_cache" (
  "id" varchar(50) NOT NULL,
  "host" varchar(50) default NULL,
  PRIMARY KEY  ("id")
  /*KEY ("host")*/
);

/*Table structure for table "sys_cluster_host" */

CREATE TABLE "sys_cluster_host" (
  "name" varchar(50) NOT NULL,
  "context" varchar(50) default NULL,
  "host" varchar(50) default NULL,
  PRIMARY KEY  ("name"),
  UNIQUE ("name")
);

/*Table structure for table "sys_ds" */

CREATE TABLE "sys_ds" (
  "name" varchar(50) NOT NULL,
  "host" varchar(20) default NULL,
  "dbname" varchar(50) default NULL,
  "user" varchar(50) default NULL,
  "pwd" varchar(50) default NULL,
  "scheme" varchar(10) default NULL,
  PRIMARY KEY  ("name")
);

/*Table structure for table "sys_module" */

CREATE TABLE "sys_module" (
  "name" varchar(50) NOT NULL,
  "title" varchar(50) default NULL,
  "description" varchar(255) default NULL,
  "version" decimal(10,4) default NULL,
  "filename" varchar(255) default NULL,
  "lastmodified" datetime default NULL,
  "permissions" text,
  PRIMARY KEY  ("name")
);

/*Table structure for table "sys_roleclass" */

CREATE TABLE "sys_roleclass" (
  "name" varchar(50) NOT NULL,
  "description" varchar(50) default NULL,
  "rolelevel" int default NULL,
  "tags" text,
  PRIMARY KEY  ("name")
);

/*Table structure for table "sys_roleclass_module" */

CREATE TABLE "sys_roleclass_module" (
  "roleclass" varchar(50) NOT NULL,
  "module" varchar(50) NOT NULL,
  PRIMARY KEY  ("roleclass","module"),
  /*KEY "FK_roleclass_module_module1" ("module"),*/
  CONSTRAINT "FK_roleclass_module_module" FOREIGN KEY ("module") REFERENCES "sys_module" ("name"),
  CONSTRAINT "FK_sys_roleclass_module" FOREIGN KEY ("roleclass") REFERENCES "sys_roleclass" ("name")
);

/*Table structure for table "sys_schema" */

CREATE TABLE "sys_schema" (
  "name" varchar(50) NOT NULL,
  "content" text,
  "category" varchar(255) default NULL,
  PRIMARY KEY  ("name")
);

/*Table structure for table "sys_script" */

CREATE TABLE "sys_script" (
  "name" varchar(50) NOT NULL,
  "content" text,
  "category" varchar(255) default NULL,
  "notes" text,
  PRIMARY KEY  ("name")
);

/*Table structure for table "sys_sequence" */

CREATE TABLE "sys_sequence" (
  "objid" varchar(100) NOT NULL,
  "nextSeries" int NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "sys_session" */

CREATE TABLE "sys_session" (
  "sessionid" varchar(50) NOT NULL,
  "username" varchar(50) default NULL,
  "host" varchar(50) default NULL,
  "dtaccessed" datetime default NULL,
  PRIMARY KEY  ("sessionid")
  /* KEY "username" ("username") */
);

/*Table structure for table "sys_sql" */

CREATE TABLE "sys_sql" (
  "name" varchar(50) NOT NULL,
  "content" text,
  "category" varchar(255) default NULL,
  PRIMARY KEY  ("name")
);

/*Table structure for table "sys_task" */

CREATE TABLE "sys_task" (
  "id" varchar(50) NOT NULL,
  "appcontext" varchar(50) default NULL,
  "apphost" varchar(50) default NULL,
  "service" varchar(50) default NULL,
  "servicetype" varchar(10) default NULL,
  "method" varchar(50) default NULL,
  "startdate" datetime default NULL,
  "enddate" datetime default NULL,
  "currentdate" datetime default NULL,
  "interval" varchar(5) default NULL,
  "parameters" text,
  "allowedhost" varchar(50) default NULL,
  "description" varchar(255) default NULL,
  PRIMARY KEY  ("id")
);

/*Table structure for table "sys_task_active" */

CREATE TABLE "sys_task_active" (
  "id" varchar(50) NOT NULL,
  "host" varchar(50) default NULL,
  PRIMARY KEY  ("id")
);

/*Table structure for table "sys_task_error" */

CREATE TABLE "sys_task_error" (
  "id" varchar(50) NOT NULL,
  "message" text,
  PRIMARY KEY  ("id")
);

/*Table structure for table "sys_task_suspended" */

CREATE TABLE "sys_task_suspended" (
  "id" varchar(50) NOT NULL,
  PRIMARY KEY  ("id")
);

/*Table structure for table "sys_template" */

CREATE TABLE "sys_template" (
  "name" varchar(50) NOT NULL,
  "content" text,
  "category" varchar(255) default NULL,
  PRIMARY KEY  ("name")
);

/*Table structure for table "sys_var" */

CREATE TABLE "sys_var" (
  "name" varchar(50) NOT NULL,
  "value" text,
  "description" varchar(255) default NULL,
  "datatype" varchar(15) default NULL,
  "category" varchar(50) default NULL,
  PRIMARY KEY  ("name")
);
