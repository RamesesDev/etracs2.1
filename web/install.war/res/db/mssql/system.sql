/*Table structure for table "rule" */

CREATE DATABASE @dbname;

USE @dbname;

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






/*----- Data for the rules are omitted because jdbc does not support multiline text value ------*/ 




/*Data for the table "rule_sets" */

insert  into "rule_sets"("name","rulegroup") values ('bpassessment','');
insert  into "rule_sets"("name","rulegroup") values ('bpbilling','');
insert  into "rule_sets"("name","rulegroup") values ('ctcassessment','');
insert  into "rule_sets"("name","rulegroup") values ('rptbilling','');


/*Data for the table "rulegroup" */

insert  into "rulegroup"("objid","name","sortorder","ruleset") values ('ABT','AFTER BUSINESS TAX',3,'bpassessment');
insert  into "rulegroup"("objid","name","sortorder","ruleset") values ('AOC','AFTER OTHER CHARGE',7,'bpassessment');
insert  into "rulegroup"("objid","name","sortorder","ruleset") values ('APPINFO','APPLICATION INFO',1,'bpassessment');
insert  into "rulegroup"("objid","name","sortorder","ruleset") values ('ARF','AFTER REGULATORY FEE',5,'bpassessment');
insert  into "rulegroup"("objid","name","sortorder","ruleset") values ('BT','BUSINESS TAX',2,'bpassessment');
insert  into "rulegroup"("objid","name","sortorder","ruleset") values ('DISCOUNT','DISCOUNT',3,'bpbilling');
insert  into "rulegroup"("objid","name","sortorder","ruleset") values ('DISCOUNT','DISCOUNT',3,'rptbilling');
insert  into "rulegroup"("objid","name","sortorder","ruleset") values ('INIT','INIT',0,'rptbilling');
insert  into "rulegroup"("objid","name","sortorder","ruleset") values ('INTEREST','INTEREST',1,'bpbilling');
insert  into "rulegroup"("objid","name","sortorder","ruleset") values ('OC','OTHER CHARGE',6,'bpassessment');
insert  into "rulegroup"("objid","name","sortorder","ruleset") values ('PENALTY','PENALTY',2,'rptbilling');
insert  into "rulegroup"("objid","name","sortorder","ruleset") values ('RF','REGULATORY FEE',4,'bpassessment');
insert  into "rulegroup"("objid","name","sortorder","ruleset") values ('SUM','SUMMARY',8,'bpassessment');
insert  into "rulegroup"("objid","name","sortorder","ruleset") values ('SURCHARGE','SURCHARGE',2,'bpbilling');
insert  into "rulegroup"("objid","name","sortorder","ruleset") values ('TAX','TAX',1,'rptbilling');

insert into rulegroup (objid,name,sortorder,ruleset)
values
 ('TAX', 'TAX', 1, 'ctcassessment'),
 ('ATAX', 'AFTER TAX', 2, 'ctcassessment'),
 ('INT', 'INTEREST', 3, 'ctcassessment'),
 ('AINT', 'AFTER INTEREST', 4, 'ctcassessment');


/*Data for the table "sys_ds" */

insert  into "sys_ds"("name","host","dbname","user","pwd","scheme") values ('etracsv1','${dbhost}','','${dbuser}','${dbpwd}','mssql');


/*Data for the table "sys_module" */

insert into "sys_module" ("name", "title", "description", "version", "filename", "lastmodified", "permissions") values('bp-rule-mgmt','BP Rule Management',NULL,NULL,NULL,NULL,'[ 	[action: ''bpassessmentrule.view'', title: ''Manage Business Assessment Rules''], 	[action: ''bpbillingrule.view'',    title: ''Manage Business Billing Rules''], 	[action: ''bpruleanalyzer.view'',   title: ''View BP Rule Analyzer''], ]');
insert into "sys_module" ("name", "title", "description", "version", "filename", "lastmodified", "permissions") values('bp2','BPLS',NULL,NULL,NULL,NULL,'[  [action:''bpadmin.setting'',                   title:''Manage Business Settings''],  [action:''bpadmin.bprulevariable'',                   title:''Manage Business Variable''],  [action:''bpadmin.lobattributes'',              title:''Manage LOB Attributes''],  [action:''bpadmin.bpruleanalyzer'',              title:''Manage Rule Analyzer''],   [action:''bpadmin.newrule'',                   title:''Create New Business Rule''],  [action:''bpadmin.openrule'',                   title:''Open Business Rule''],  [action:''bpadmin.deleterule'',                   title:''Delete Business Rule''],    [action:''bpadmin.lob'',                          title:''Create View and Update Line Of Business Transaction''],  [action:''bpadmin.lobclassification'',            title:''Create View and Update Line Of Business Classification Transaction''],    [action:''bpbillingrules.view''			,title:''View BP Billing Rules'' ],  [action:''bpbillingrules.create''		,title:''Create BP Billing Rule'' ],  [action:''bpbillingrules.delete''		,title:''Delete BP Billing Rule'' ],   [action:''bpassessmentrule.view''		,title:''View BP Assessment Rules'' ],  [action:''bpassessmentrule.create''		,title:''Create BP Assessment Rule'' ],  [action:''bpassessmentrule.delete''		,title:''Delete BP Assessment Rule'' ],  [action:''bpbilling.generate'',                title:''Generate BP Billing''],   [action:''bpmanagement.open''		,title:''Manage Master Files'' ],      [action:''bplicensing.newtransaction'',		title:''Create New Application Transaction''],   [action:''bplicensing.renewtransaction'',		title:''Create Renew Application Transaction''],   [action:''bplicensing.addlobtransaction'',		title:''Create Add Line of Business Application Transaction''],   [action:''bplicensing.retiretransaction'',		title:''Create Retire Application Transaction''],   [action:''bplicensing.capturenewtransaction'',		title:''Create Capture New Application Transaction''],   [action:''bplicensing.capturerenewtransaction'',		title:''Create Capture Renew Application Transaction''],      [action:''bplicensing.save'',                title:''Save Application Transaction''],   [action:''bplicensing.edit'',                title:''Edit Application Transaction''],   [action:''bplicensing.delete'',                title:''Delete Application Transaction''],   [action:''bplicensing.submit'',                title:''Submit Application Transaction''],      [action:''bplicensing.applicationlist'',       title:''View Application Listing''],   [action:''bplicensing.viewapplication'',         title:''View Business Application''],   [action:''bplicensing.viewassessment'',         title:''View Business Assessment''],   [action:''bplicensing.approve'',                title:''Approve Business Application''],   [action:''bplicensing.disapprove'',                title:''Disapprove Business Application''],   [action:''bplicensing.submitforreview'',                title:''Submit Business Application For Review''],   [action:''bplicensing.reassess'',                title:''Reassess Business Application For Review''],   [action:''bplicensing.assess'',                title:''Assess Business Application''],   [action:''bplicensing.cancelassessment'',                title:''Cancel Assessment''],   [action:''bpbilling.generate'',                title:''Generate BP Billing''],     [action:''bptransaction.view''		,title:''View Business Transactions''], [action:''bpadmin.changebusinessaddress'',        title:''Allow Change Business Address Transaction''],  [action:''bpadmin.changepermittee'',              title:''Allow Change Permittee Transaction''],  [action:''bpadmin.changetradename'',              title:''Allow Change Trade Name''],  [action:''bpadmin.changeadministrator'',          title:''Change Business Administrator''],  [action:''bpadmin.ledger'',                       title:''Manage Business Ledger''],   [action:''bpreportmgmt.open''		,title:''View Report Management'' ],  [action:''bpreport.delinquency''		,title:''Generate Delinquency Listing'' ],  [action:''bpreport.masterlist''		,title:''Generate Taxpayer Masterlist'' ],  [action:''bpreport.applisting''		,title:''Generate Application Listing'' ],  [action:''bpreport.apploblisting''	,title:''Generate Application With LOB Listing'' ],  [action:''bpreport.lobcountlisting''	,title:''Generate LOB Count Listing'' ],      [action:''bppermit.approvedapplications'',         title:''View Approved Business Applications''],  [action:''bppermit.forreleasepermits'',         title:''View For Relased Permits''],  [action:''bppermit.activepermits'',         title:''View Active Permits''],  [action:''bppermit.activepermits'',         title:''View Active Permits''],	  [action:''bppermit.release'',         title:''View Active Permits''],  [action:''bppermit.retire'',          title:''View Retired Applications''],  [action:''bppermit.forrenewapplications'',          title:''View Retired Applications'']   [action:''collection_bp.create'',	 title:''Create Business Collection''],  [action:''collection_bp.print'',	         title:''Print Business Collection''],  [action:''collection_bp.edit'',	         title:''Edit Business Collection''],  [action:''collection_bp.void'',	         title:''Void Business Collection''], ]');
insert into "sys_module" ("name", "title", "description", "version", "filename", "lastmodified", "permissions") values('ctc-rule-mgmt','CTC Rule Management',NULL,NULL,NULL,NULL,'[ 	[action: ''ctcassessmentrule.view'', title:''Manage CTC Rules''] ]');
insert into "sys_module" ("name", "title", "description", "version", "filename", "lastmodified", "permissions") values('ctc2','CTC Collection',NULL,NULL,'ctc2',NULL,'[ 	[action: ''collection_ctc_individual.edit'',   title: ''Edit CTC Individual Collection''], 	[action: ''collection_ctc_individual.print'',  title: ''Print CTC Individual Collection''], 	[action: ''collection_ctc_individual.void'',   title: ''Void CTC Individual Collection''], 	[action: ''collection_ctc_individual.create'', title: ''Create CTC Individual Collection''],  	[action: ''collection_ctc_corporate.edit'',    title: ''Edit CTC Corporate Collection''], 	[action: ''collection_ctc_corporate.void'',    title: ''Void CTC Corporate Collection''], 	[action: ''collection_ctc_corporate.create'',  title: ''Create CTC Corporate Collection''], 	[action: ''collection_ctc_corporate.print'',   title: ''Print CTC Corporate Collection''], ]');
insert into "sys_module" ("name", "title", "description", "version", "filename", "lastmodified", "permissions") values('etracs2-admin','Admin',NULL,NULL,NULL,NULL,'[  [action:''etracsadmin.manage''  ,title:''Manage ETRACS User Accounts''],  [action:''etracsuser.edit''     ,title:''Edit ETRACS User Account''],  [action:''etracstask.manage''   ,title:''Manage Task''],  [action:''etracstask.create''   ,title:''Create Task''],  [action:''etracstask.delete''   ,title:''Delete Task''],  [action:''etracstask.start''    ,title:''Start Task''],  [action:''etracstask.suspend''  ,title:''Suspend Task''],  [action:''etracstask.resume''   ,title:''Resume Task''], ]');
insert into "sys_module" ("name", "title", "description", "version", "filename", "lastmodified", "permissions") values('etracs2-entity','Entity Management',NULL,NULL,NULL,NULL,'[   [action:''entity.manage'',	title:''Manage Entity''],   [action:''individual.create'',    title:''Create Individual Entity''],   [action:''individual.edit'',    	title:''Edit Individual Entity''],   [action:''individual.delete'',    title:''Delete Individual Entity''],   [action:''juridical.create'',    	title:''Create Juridical Entity''],   [action:''juridical.edit'',    	title:''Edit Juridical Entity''],   [action:''juridical.delete'',    	title:''Delete Juridical Entity''],   [action:''multiple.create'',    	title:''Create Multiple Entity''],   [action:''multiple.edit'',    	title:''Edit Multiple Entity''],   [action:''multiple.delete'',    	title:''Delete Multiple Entity''], ]');
insert into "sys_module" ("name", "title", "description", "version", "filename", "lastmodified", "permissions") values('etracs2common','Shared',NULL,NULL,NULL,NULL,'[]');
insert into "sys_module" ("name", "title", "description", "version", "filename", "lastmodified", "permissions") values('jobposition','Jobposition Management',NULL,NULL,NULL,NULL,'[ 	[action:''jobposition.viewList''] ]');
insert into "sys_module" ("name", "title", "description", "version", "filename", "lastmodified", "permissions") values('orgunit','Org. Unit Management',NULL,NULL,'orgunit',NULL,'[ 	[action:''orgunit.viewList''], 	[action:''orgunit.create''], 	[action:''orgunit.read''], 	[action:''orgunit.update''], 	[action:''orgunit.delete''],  	[action:''controller1.create''], 	[action:''controller1.read''], 	[action:''controller1.update''], 	[action:''controller1.delete''], 	[action:''controller1.approve''], 	[action:''controller1.disapprove''],  	[action:''controller2.post''], 	[action:''controller2.submit''], 	[action:''controller2.approve''], 	[action:''controller2.disapprove''], ]');
insert into "sys_module" ("name", "title", "description", "version", "filename", "lastmodified", "permissions") values('personnel','Personnel Management',NULL,NULL,'personnel',NULL,'[ 	[action: ''personnel.viewList''] ]');
insert into "sys_module" ("name", "title", "description", "version", "filename", "lastmodified", "permissions") values('role','Role Management',NULL,NULL,NULL,NULL,'[ 	[action: ''role.viewList''] ]');
insert into "sys_module" ("name", "title", "description", "version", "filename", "lastmodified", "permissions") values('rpt-rule-mgmt','RPT Rule Management',NULL,NULL,NULL,NULL,'[ 	[action: ''rptbillingrule.view'', title:''Manage RPT Billing Rules''], ]');
insert into "sys_module" ("name", "title", "description", "version", "filename", "lastmodified", "permissions") values('rpt2','RPT Assessment',NULL,NULL,NULL,NULL,'[  [ action:''rpttransaction.open'' 		,title:''OPEN RPT Transaction'' ],   [ action:''consolidation.view''  		,title:''View Consolidation'' ],  [ action:''consolidation.update'' 		,title:''Update Consolidation'' ],  [ action:''consolidation.edit''  		,title:''Edit Consolidation'' ],  [ action:''consolidation.submit'' 		,title:''Submit Consolidation'' ],  [ action:''consolidation.remove'' 		,title:''Remove Consolidation'' ],  [ action:''consolidation.updateland'' 			,title:''Update Land Consolidation'' ],    [ action:''consolidationmgt.view'' 		,title:''View Consolidation Management'' ],  [ action:''consolidationmgt.create'' 	,title:''Create Consolidation Management'' ],  [ action:''consolidationmgt.view'' 		,title:''Approve Consolidation Management'' ],    [ action:''datacapture.create'' 		,title:''Create FAAS Data Capture'' ],  [ action:''transfer.create'' 		,title:''Create Transfer of Ownership'' ],  [ action:''reassessment.create'' 	,title:''Create Reassessment'' ],  [ action:''correction.create'' 		,title:''Create Correction of Entry'' ],  [ action:''newdiscovery.create'' 	,title:''Create New Discovery'' ],  [ action:''multipleclaim.create'' 	,title:''Create Multiple Claim'' ],    [ action:''cancelfaasmgt.view''		,title:''View Cancel FAAS Management'' ],  [ action:''cancelfaasmgt.create''	,title:''Create Cancel FAAS Management'' ],   [ action:''cancelfaasmgt.open''		,title:''Open Cancel FAAS Management'' ],   [ action:''cancelfaas.create''		,title:''Create Cancel FAAS'' ],  [ action:''cancelfaas.edit''		,title:''Edit Cancel FAAS'' ],  [ action:''cancelfaas.open''		,title:''Open Cancel FAAS'' ],  [ action:''cancelfaas.submit''		,title:''Submit Cancel FAAS for approval'' ],  [ action:''cancelfaas.delete''		,title:''Delete Cancel FAAS'' ],  [ action:''cancelfaas.approve''		,title:''Approve Cancel FAAS'' ],    [ action:''faasmgt.view''		,title:''View FAAS Management'' ],  [ action:''faasmgt.create''		,title:''Create FAAS Management'' ],   [ action:''faas.create''			,title:''Create FAAS'' ],  [ action:''faas.open''			,title:''Open FAAS'' ],  [ action:''faas.submit''			,title:''Submit FAAS for approval'' ],  [ action:''faas.delete''			,title:''Delete FAAS'' ],  [ action:''faas.disapprove''		,title:''Dispprove FAAS'' ],  [ action:''faas.approve''		,title:''Approve FAAS'' ],  [ action:''faas.submittoprovince''	,title:''Submit to Province FAAS'' ],  [ action:''faas.disapprove''		,title:''Disapprove FAAS'' ],  [ action:''faas.approvebyprovince''	,title:''Approve By Province FAAS'' ],    [ action:''subdivision.view'' 		,title:''View Subdivision'' ],  [ action:''subdivision.open'' 		,title:''View Subdivision'' ],  [ action:''subdivision.create''		,title:''Create Subdivision'' ],  [ action:''subdivision.update'' 			,title:''Update Subdivision'' ],  [ action:''subdivision.submit'' 			,title:''Submit Subdivision'' ],  [ action:''subdivision.remove'' 			,title:''Remove Subdivision'' ],    [ action:''subdivisionmgt.view''		,title:''View Subdivision Management'' ],  [ action:''subdivisionmgt.open''		,title:''Open Subdivision Management'' ],  [ action:''subdivisionmgt.create''	,title:''Create Subdivision Management'' ],    [ action:''truecopy.view''			,title:''View Certified True Copy'' ],  [ action:''truecopy.create''			,title:''Create Certified True Copy'' ],  [ action:''truecopy.viewReport''		,title:''View Report Certified True Copy'' ],   [ action:''rpttransaction.view''		,title:''View Real Property Transactions''],    [ action:''consolidation.disapprove'' 			,title:''Disapprove Consolidation'' ],  [ action:''consolidation.approve'' 				,title:''Approve Consolidation'' ],    [ action:''consolidation.disapproveByProvince'' 	,title:''Disapprove by Province Consolidation'' ],  [ action:''consolidation.approveByProvince''	,title:''Approve By Province Consolidation'' ],   [ action:''consolidation.submitToProvince'' 	,title:''Disapprove by Province Consolidation'' ],    [ action:''datacapture.approve'' 				,title:''Approve Data Capture'' ],  [ action:''datacapture.disapprove''				,title:''Disapprove Data Capture'' ],    [ action:''datacapture.submitToProvince'' 		,title:''Submit to Province Data Capture'' ],  [ action:''datacapture.disapproveByProvince''	,title:''Disapprove by Province Data Capture'' ],  [ action:''datacapture.approveByProvince''		,title:''Approve By Province Data Capture'' ],    [ action:''subdivision.disapprove'' 				,title:''Disapprove Subdivision'' ],  [ action:''subdivision.approve'' 				,title:''Approve Subdivision'' ],  [ action:''subdivision.submitToProvince'' 		,title:''Submit to Province Subdivision'' ],  [ action:''subdivision.disapproveByProvince'' 	,title:''Disapprove By Province Subdivision'' ],  [ action:''subdivision.approveByProvince'' 		,title:''Appry By Province Subdivision'' ],   	[ action: ''rptcertification_list.view'', title: ''RPT Certifications List View'' ], 	 	[ action: ''rptcertifications.open'', title: ''RPT Certifications Open'' ], 	 	[ action: ''noproperty.open'', 	title: ''RPT Certifications No Property Open'' ], 	[ action: ''noproperty.view'', 	title: ''RPT Certifications No Property View'' ], 	[ action: ''noproperty.create'', 	title: ''RPT Certifications No Property Create'' ], 	 	[ action: ''landholding.open'', 		title: ''RPT Certifications Land Holding Open'' ], 	[ action: ''landholding.view'', 		title: ''RPT Certifications Land Holding View'' ], 	[ action: ''landholding.create'', 	title: ''RPT Certifications Land Holding Create'' ], 	 	[ action: ''multipleproperty.open'', 		title: ''RPT Certifications Multiple Property Open'' ], 	[ action: ''multipleproperty.view'', 		title: ''RPT Certifications Multiple Property View'' ], 	[ action: ''multipleproperty.create'', 	title: ''RPT Certifications Multiple Property Create'' ], 	 	[ action: ''noimprovement.open'', 	title: ''RPT Certifications No Improvement Open'' ], 	[ action: ''noimprovement.view'', 	title: ''RPT Certifications No Improvement View'' ], 	[ action: ''noimprovement.create'', 	title: ''RPT Certifications No Improvement Create'' ], 	 	[ action: ''noimprovement.open'', 	title: ''RPT Certifications No Improvement Open'' ], 	[ action: ''noimprovement.view'', 	title: ''RPT Certifications No Improvement View'' ], 	[ action: ''noimprovement.create'', 	title: ''RPT Certifications No Improvement Create'' ], 	 	[ action: ''noimprovementbytdno.open'', 		title: ''RPT Certifications No Improvement By TD No Open'' ], 	[ action: ''noimprovementbytdno.view'', 		title: ''RPT Certifications No Improvement By TD No View'' ], 	[ action: ''noimprovementbytdno.create'', 	title: ''RPT Certifications No Improvement By TD No Create'' ], 	 	[ action: ''noimprovementbytdno.open'', 		title: ''RPT Certifications No Improvement By TD No Open'' ], 	[ action: ''noimprovementbytdno.view'', 		title: ''RPT Certifications No Improvement By TD No View'' ], 	[ action: ''noimprovementbytdno.create'', 	title: ''RPT Certifications No Improvement By TD No Create'' ], 	 	[ action: ''latestexistproperty.open'', 		title: ''RPT Certifications Latest Exist Property Open'' ], 	[ action: ''latestexistproperty.view'', 		title: ''RPT Certifications Latest Exist Property View'' ], 	[ action: ''latestexistproperty.create'', 	title: ''RPT Certifications Latest Exist Property Create'' ], 	 	[ action: ''latestexistproperty.open'', 		title: ''RPT Certifications Latest Exist Property Open'' ], 	[ action: ''latestexistproperty.view'', 		title: ''RPT Certifications Latest Exist Property View'' ], 	[ action: ''latestexistproperty.create'', 	title: ''RPT Certifications Latest Exist Property Create'' ], 	 	[ action: ''withimproveland.open'', 		title: ''RPT Certifications With Improvement ( Land ) Open'' ], 	[ action: ''withimproveland.view'', 		title: ''RPT Certifications With Improvement ( Land ) View'' ], 	[ action: ''withimproveland.create'', 	title: ''RPT Certifications With Improvement ( Land ) Create'' ], 	 	[ action: ''wimprovebytdno.open'', 	title: ''RPT Certifications With Improvement By TD No Open'' ], 	[ action: ''wimprovebytdno.view'', 	title: ''RPT Certifications With Improvement By TD No View'' ], 	[ action: ''wimprovebytdno.create'', 	title: ''RPT Certifications With Improvement By TD No Create'' ],   [ action:''rptreport.notice''		,title:''Generate Notice of Assessment'' ],  [ action:''rptreport.assessmentroll''    ,title:''Generate Assessment Roll'' ],  [ action:''rptreportmgmt.open''		,title:''Open Report Management'' ],  [ action:''rptreport.tmcr''		,title:''Generate TMCR Report'' ],  [ action:''rptreport.orf''  		,title:''Generate Ownership Record Form'' ],   [ action:''rptreport.jat'' 		,title:''Generate Journal of Assessment Transaction'' ],  [ action:''rptreport.accomplishmentrpa'' ,title:''Generate Accomplishment Report on Real Property Assessment''],  [ action:''rptreport.comparativeav''	,title:''Generate Comparative Data On Assessed Value'' ],  [ action:''rptreport.comparativerpucount'',title:''Generate Comparative Data on RPU Count'' ],  [ action:''rptreport.comparativemv''	,title:''Generate Comparative Data on Market Value'' ],  [ action:''rptreport.annotationlisting'' ,title:''Generate Annotation Listing'' ],   [ action:''rptbilling.generate''		,title:''Generate Real Property Billing'' ],  [ action:''rptbilling.printbill''	,title:''Print Real Property Billing'' ],  [ action:''rptbilling.previewbill''	,title:''Preview Real Property Billing'' ],    [ action:''rptledger.view''		,title:''View RPT Ledger'' ],   [ action:''rptledger.open''		,title:''Open RPT Ledger'' ],   [ action:''rptledger.approve''		,title:''Approve RPT Ledger'' ],  [ action:''rptledger.capturepayment''    ,title:''Capture RPT Ledger Payment'' ],  [ action:''rptledger.printbill''		,title:''Print RPT Bill'' ],  [ action:''rptledger.previewbill''	,title:''Preview RPT Bill'' ],   [ action:''propertypayer.view''		,title:''View Property Payers'' ],  [ action:''propertypayer.create''	,title:''Create Property Payer'' ],  [ action:''propertypayer.delete''	,title:''Delete Property Payer'' ],   [ action:''rptbillingrule.view''		,title:''View RPT Billing Rules'' ],  [ action:''rptbillingrule.create''	,title:''Create RPT Billing Rule'' ],  [ action:''rptbillingrule.delete''	,title:''Delete RPT Billing Rule'' ],    [action:''landtax.abstractrptcollection''	,title:''Generate Abstract of Realty Tax Collection'' ],  [action:''landtax.brgyshare''			,title:''Generate Barangay Share'' ],  [ action:''rptreport.delinquency''	,title:''Generate Realty Tax Delinquency Listing'' ],  [ action:''landtax.rptc''		,title:''Real Property Tax Collection'' ],   [action:''rptmanagement.open''			,title:''Open RPT Master Management''],  [action:''rysetting.view'',			,title:''View General Revision Year Setting''], 	  [action:''propertyclassification.view''		,title:''View Property Classifications'' ],  [action:''propertyclassification.create''	,title:''Create Property Classification'' ] ,  [action:''propertyclassification.edit''		,title:''Edit Property Classification'' ] ,  [action:''propertyclassification.delete''	,title:''Delete Property Classification'' ] ,   [action:''exemptiontypes.view''			,title:''View Exemption Types'' ] ,  [action:''exemptiontypes.create''		,title:''Create Exemption Types'' ] ,  [action:''exemptiontypes.edit''			,title:''Edit Exemption Types'' ] ,  [action:''exemptiontypes.delete''		,title:''Delete Exemption Types'' ] ,    [action:''kindofbldg.view''			,title:''View Kind of Building'' ] ,  [action:''kindofbldg.create''			,title:''Create Kind of Building'' ] ,  [action:''kindofbldg.edit''			,title:''Edit Kind of Building'' ] ,  [action:''kindofbldg.delete''			,title:''Delete Kind of Building'' ] ,   [action:''materials.view''			,title:''View Materials'' ] ,  [action:''materials.create''			,title:''Create Materials'' ] ,  [action:''materials.edit''			,title:''Edit Materials'' ] ,  [action:''materials.delete''			,title:''Delete Materials'' ] ,   [action:''structures.view''			,title:''View Structures'' ] ,  [action:''structures.create''			,title:''Create Structures'' ] ,  [action:''structures.edit''			,title:''Edit Structures'' ] ,  [action:''structures.delete''			,title:''Delete Structures'' ] ,   [action:''structuretemplates.view''		,title:''View Structure Templates'' ] ,  [action:''structuretemplates.edit''		,title:''Edit Structure Templates'' ] ,   [action:''machines.view''			,title:''View Machines'' ] ,  [action:''machines.create''			,title:''Create Machines'' ] ,  [action:''machines.edit''			,title:''Edit Machines'' ] ,  [action:''machines.delete''			,title:''Delete Machines'' ] ,    [action:''plantstrees.view''			,title:''View Plants and Trees'' ] ,  [action:''plantstrees.create''			,title:''Create Plants and Trees'' ] ,  [action:''plantstrees.edit''			,title:''Edit Plants and Trees'' ] ,  [action:''plantstrees.delete''			,title:''Delete Plants and Trees'' ] ,    [action:''miscitems.view''			,title:''View Miscellaneous Items'' ] ,  [action:''miscitems.create''			,title:''Create Miscellaneous Items'' ] ,  [action:''miscitems.edit''			,title:''Edit Miscellaneous Items'' ] ,  [action:''miscitems.delete''			,title:''Delete Miscellaneous Items'' ] ,   [action:''rptofficers.view''			,title:''View RPT OFFICERS'' ] ,  [action:''rptofficers.create''			,title:''Create RPT OFFICERS'' ] ,  [action:''rptofficers.edit''			,title:''Edit RPT OFFICERS'' ] ,  [action:''rptofficers.delete''			,title:''Delete RPT OFFICERS'' ] ,   [action:''canceltdreasons.view''			,title:''View Cancel TD Reasons'' ] ,  [action:''canceltdreasons.create''		,title:''Create Cancel TD Reasons'' ] ,  [action:''canceltdreasons.edit''			,title:''Edit Cancel TD Reasons'' ] ,  [action:''canceltdreasons.delete''		,title:''Delete Cancel TD Reasons'' ] ,   [action:''txnrequirements.view''			,title:''View Transaction Requirements'' ] ,  [action:''txnrequirements.create''		,title:''Create Transaction Requirements'' ] ,  [action:''txnrequirements.edit''			,title:''Edit Transaction Requirements'' ] ,  [action:''txnrequirements.delete''		,title:''Delete Transaction Requirements'' ] ,   [action:''rptparameters.view''			,title:''View RPT Parameters'' ] ,  [action:''rptparameters.create''			,title:''Create RPT Parameters'' ] ,  [action:''rptparameters.edit''			,title:''Edit RPT Parameters'' ] ,  [action:''rptparameters.delete''			,title:''Delete RPT Parameters'' ] ,   [action:''rptsetting.view''			,title:''View RPT Settings'' ] ,  [action:''rptsetting.save''			,title:''Save RPT Settings'' ] ,     [action:''annotationmgmt.view''		,title:''Manage Annotations'' ],  [action:''annotation.view''		,title:''View Annotation'' ],  [action:''annotation.delete''		,title:''Delete Annotation'' ],  [action:''annotation.submit''		,title:''Submit Annotation for Approval'' ],  [action:''annotation.approve''		,title:''Approve Annotation'' ],   [action:''cancelannotationmgmt.view''	,title:''Manage Cancelled Annotations'' ],  [action:''cancelannotation.open''	,title:''Open Cancel Annotation'' ],  [action:''cancelannotation.create''	,title:''Create Cancel Annotation'' ],  [action:''cancelannotation.view''	,title:''View Cancel Annotation'' ],  [action:''cancelannotation.delete''	,title:''Delete Cancel Annotation'' ],  [action:''cancelannotation.submit''	,title:''Submit Cancel Annotation for Approval'' ],  [action:''cancelannotation.approve''	,title:''Approve Cancel Annotation'' ],   [action:''mortgage.create''		,title:''Create Mortgage Annotation'' ],  [action:''bailbond.create''		,title:''Create BailBond Annotation'' ],  [action:''other.create''			,title:''Create Other Annotation'' ],   [action:''landtax.rptclearance'' ,title:''Realty Tax Clearance''],   [action:''realpropertyupdate.approve'', title:''Approve Real Property Update''],  [action:''realpropertyupdate.create'',  title:''Create Real Property Update''],  [action:''realpropertyupdate.edit'',    title:''Edit Real Property Update''],  [action:''realpropertyupdate.open'',    title:''Open Real Property Update''],  [action:''realpropertyupdate.view'',    title:''View Real Property Update List''],    [action:''titleupdate.approve'',  title:''Approve FAAS Title Update''],  [action:''titleupdate.create'',   title:''Create FAAS Title Update''],  [action:''titleupdate.edit'',     title:''Edit FAAS Title Update''],  [action:''titleupdate.open'',     title:''Open FAAS Title Update''],  [action:''titleupdate.view'',     title:''View FAAS Title Update List''],  [action:''rptutil.modifypin'', title:''Modify PIN'']    ]');
insert into "sys_module" ("name", "title", "description", "version", "filename", "lastmodified", "permissions") values('tc2','Treasury/Collection',NULL,NULL,NULL,NULL,'[  [ action:''account.view'',           title:''View Chart of Account'' ],  [ action:''account.addcategory'',    title:''Add Account Category'' ],  [ action:''account.addglacct'',      title:''Add GL Account'' ],  [ action:''account.addsubacct'',     title:''Add Sub-Account'' ],  [ action:''account.edit'',     title:''Edit Account Information'' ],  [ action:''account.delete'',   title:''Delete Account Information'' ],   [ action:''bank.view'',     title:''View Bank Information'' ],  [ action:''bank.create'',   title:''Create Bank'' ],  [ action:''bank.edit'',     title:''Edit Bank'' ],  [ action:''bank.delete'',   title:''Delete Bank'' ],   [ action:''bankacct.view'',     title:''View Bank Account Information'' ],  [ action:''bankacct.create'',   title:''Create Bank Account'' ],  [ action:''bankacct.edit'',     title:''Edit Bank Account'' ],  [ action:''bankacct.delete'',   title:''Delete Bank Account'' ],  [ action:''bankacct.approve'',  title:''Approve Bank Account'' ],   [ action:''collectionsetting.manage'', title:''Manage Collection Setting'' ],  [ action:''collectiontype.viewlist'',  title:''View Collection Type Listing'' ],  [ action:''collectiontype.create'',    title:''Create Collection Type'' ],  [ action:''collectiontype.edit'',      title:''Edit Collection Type'' ],  [ action:''collectiontype.delete'',    title:''Delete Collection Type'' ],   [ action:''fund.viewlist'',  title:''View Fund Listing'' ],  [ action:''fund.create'',    title:''Create Fund'' ],  [ action:''fund.edit'',      title:''Edit Fund'' ],  [ action:''fund.delete'',    title:''Delete Fund'' ],  [ action:''fund.approve'',   title:''Approve Fund'' ],   [ action:''incomeacct.viewlist'',  title:''View Income Account Listing'' ],  [ action:''incomeacct.create'',    title:''Create Income Account'' ],  [ action:''incomeacct.edit'',      title:''Edit Income Account'' ],  [ action:''incomeacct.delete'',    title:''Delete Income Account'' ],  [ action:''incomeacct.approve'',   title:''Approve Income Account'' ],   [ action:''incomeacctgroup.viewlist'',  title:''View Income Account Group Listing'' ],  [ action:''incomeacctgroup.create'',    title:''Create Income Account Group'' ],  [ action:''incomeacctgroup.delete'',    title:''Delete Income Account Group'' ],    [ action:''tcmanagement.open''	,title:''Manage TC Master Files'' ],     [ action:''af.viewlist'',  title:''View Accountable Form Listing'' ],  [ action:''af.create'',    title:''Create Accountable Form'' ],  [ action:''af.edit'',      title:''Edit Accountable Form'' ],  [ action:''af.delete'',    title:''Delete Accountable Form'' ],  [ action:''af.approve'',   title:''Approve Accountable Form'' ],   [ action:''afcontrol.changemode'',  title:''AF Control Change Mode'' ],  [ action:''afcontrol.activate'',    title:''Activate AF Control'' ],  [ action:''afcontrol.transfer''	,title:''Transfer AF Control'' ],  [ action:''afcontrol.adjustqty'' ,title:''Adjust AF Control Quantity (NonSerial)'' ],      [ action:''afinventory.view'', title:''View AF Inventory Information'' ],    [ action:''deposit.viewlist'',   title:''View Deposit Listing'' ],  [ action:''deposit.view'',       title:''View Deposit Information'' ],  [ action:''deposit.create'',     title:''Create Deposit Information'' ],  [ action:''deposit.close'',      title:''Close Deposit Information'' ],  [ action:''deposit.addnoncash'', title:''Add Non-Cash Payments for Deposit'' ],  [ action:''deposit.addexternalnoncash'',     title:''Add External Non-Cash for Deposit'' ],   [ action:''collection.create_online'',   title:''Create Online Collection''],  [ action:''collection.create_offline'',  title:''Create Offline Collection''],    [ action:''remittance.create'',          title:''Create Remittance'' ],  [ action:''remittance.submit'',          title:''Submit Remittance'' ],  [ action:''remittance.viewlist'',        title:''View Remittance Listing'' ],   [ action:''receipt.viewissued'',    title:''View Issued Receipt Listing'' ],  [ action:''receipt.inquire'',       title:''Inquire Receipt Information'' ],   [ action:''afcontrol.activate'',  title:''Activate AF Control'' ]    [action:''batchcapturemgmt.view''	,title:''View Batch Capture Management''],   [action:''batchcapture.create''		,title:''Create Batch Capture'' ],  [action:''batchcapture.open''		,title:''Open Batch Capture'' ],   [action:''batchcapture.view''		,title:''View Batch Capture'' ],  [action:''batchcapture.delete''		,title:''Delete Batch Capture'' ],  [action:''batchcapture.post''		,title:''Post Batch Capture'' ],   [ action:''collection_burial.create'',  title:''Create Burial Permit Fee Collection'' ],  [ action:''collection_burial.edit'',    title:''Edit Burial Permit Fee Collection'' ],  [ action:''collection_burial.print'',   title:''Print Burial Permit Fee Collection'' ],  [ action:''collection_burial.void'',    title:''Void Burial Permit Fee Collection'' ],  [ action:''collection_burial.inquire'', title:''Inquire Burial Permit Fee Collection'' ],   [ action:''collection_cashticket.create'',  title:''Create Cash Ticket Collection'' ],  [ action:''collection_cashticket.delete'',  title:''Delete Cash Ticket Collection'' ],  [ action:''collection_cashticket.inquire'', title:''Inquire Cash Ticket  Collection'' ],   [ action:''collection_cattleownership.create'',  title:''Create Large Cattle Ownership Collection'' ],  [ action:''collection_cattleownership.edit'',    title:''Edit Large Cattle Ownership Collection'' ],  [ action:''collection_cattleownership.print'',   title:''Print Large Cattle Ownership Collection'' ],  [ action:''collection_cattleownership.void'',    title:''Void Large Cattle Ownership Collection'' ],  [ action:''collection_cattleownership.inquiry'', title:''Inquire Large Cattle Ownership  Collection'' ],   [ action:''collection_cattletransfer.create'',  title:''Create Large Cattle Transfer Collection'' ],  [ action:''collection_cattletransfer.edit'',    title:''Edit Large Cattle Transfer Collection'' ],  [ action:''collection_cattletransfer.print'',   title:''Print Large Cattle Transfer Collection'' ],  [ action:''collection_cattletransfer.void'',    title:''Void Large Cattle Transfer Collection'' ],  [ action:''collection_cattletransfer.inquiry'', title:''Inquire Large Cattle Transfer  Collection'' ],   [ action:''collection_general.create'',  title:''Create General Collection'' ],  [ action:''collection_general.edit'',    title:''Edit General Collection'' ],  [ action:''collection_general.print'',   title:''Print General Collection'' ],  [ action:''collection_general.void'',    title:''Void General Collection'' ],  [ action:''collection_general.inquire'', title:''Inquire General Collection'' ],   [ action:''collection_marriage.create'',  title:''Create Marriage License Fee Collection'' ],  [ action:''collection_marriage.edit'',    title:''Edit Marriage License Fee Collection'' ],  [ action:''collection_marriage.print'',   title:''Print Marriage License Fee Collection'' ],  [ action:''collection_marriage.void'',    title:''Void Marriage License Fee Collection'' ],  [ action:''collection_marriage.inquiry'', title:''Inquire Marriage License Fee  Collection'' ],   [action:''postcapturereceipt.create'',   title:''Create Post Capture Receipt''],  [action:''postcapturereceipt.post'',     title:''Submit Post Capture Receipt''],    [action:''tcreport.abstractofcollection''	,title:''Generate Abstract of Collection Report''],  [action:''tcreport.abstractofcollectionbychart'' ,title:''Generate Abstract of Colleciton By Chart of Account'' ],  [action:''tcreport.incomeaccount'' 		,title:''Income Account Report''],  [action:''tcreport.craaf''		 	,title:''CRAAF Report''],  [action:''tcreport.statementofrevenue''		,title:''Generate Statement of Revenue''],   [action:''tcreport.reportofcollection''		,title:''Report of Collection'' ],  [action:''tcreport.reportofcollection2''		,title:''Report of Collection 2'' ],   [action:''collection_slaughterpermit.inquiry''		,title:''Inquire Slaughter Permit'' ],  [action:''collection_slaughterpermit.create''		,title:''Create Slaughter Permit''],  [action:''collection_slaughterpermit.print''		,title:''Print Slaughter Permit'' ],  [action:''collection_slaughterpermit.void''		,title:''Void Slaughter Permit'' ],  [action:''collection_slaughterpermit.edit''		,title:''Edit Slaughter Permit'' ],    [ action:''liquidation.create'', title:''Create Liquidation'' ],  [ action:''liquidation.submit'', title:''Submit Liquidation'' ],  [ action:''liquidation.viewlist'', title:''View Liquidation Listing'' ],  [ action:''liquidationmulti.create'', title:''Create Multi-Cashier Liquidation'' ],   [ action:''collection.create_capture''	,title:''Create Capture Collection''],  [ action:''receipt.viewissued''		,title:''View Issued Receipt Listing'' ],  [ action:''afcontrol.activate''		,title:''Activate AF Control'' ],  [ action:''postcapturereceipt.create''	,title:''Create Post Capture Receipt''],  [ action:''postcapturereceipt.post''	,title:''Submit Post Capture Receipt''],  [ action:''postcapturereceipt.viewlist'' ,title:''View Post Capture Listing'' ],    [action:''treasurymgmt.view'',                title:''View Treasury Management''],  [action:''treasurymgmt_abstract.view'',       title:''View Treasury Management (Abstract of Collection)''],  [action:''treasurymgmt_afmonitoring.view'',   title:''View Treasury Management (AF Monitoring)''],  [action:''treasurymgmt_collection.view'',     title:''View Treasury Management (Collection Summary)''],  [action:''treasurymgmt_fund.view'',           title:''View Treasury Management (Fund Summary)''],  [action:''treasurymgmt_liquidation.view'',    title:''View Treasury Management (Liquidation Detail)''],  [action:''treasurymgmt_remittance.view'',     title:''View Treasury Management (Remittance Monitoring)''],  [action:''treasurymgmt_liquidation.view'',    title:''View Undeposited Liquidation Summary'' ],    [ action:''iraf.viewlist'',  title:''View IRAF Listing'' ],  [ action:''iraf.create'',    title:''Create IRAF'' ],  [ action:''iraf.edit'',      title:''Edit IRAF'' ],  [ action:''iraf.delete'',    title:''Delete IRAF'' ],  [ action:''iraf.approve'',   title:''Approve IRAF'' ],   [ action:''riv_lgu.create'', title:''Create RIV (LGU) Information'' ],  [ action:''riv.create'',      title:''Create RIV'' ],  [ action:''riv.edit'',      title:''Edit RIV'' ],  [ action:''riv.delete'',    title:''Delete RIV'' ],  [ action:''riv.approve'',   title:''Approve RIV'' ],   [ action:''collectiongroup.view'',   title:''View Collection Groups'' ],  [ action:''collectiongroup.create'',   title:''Create Collection Group'' ],  [ action:''collectiongroup.edit'',   title:''Edit Collection Group'' ],  [ action:''collectiongroup.delete'',   title:''Delete Collection Group'' ], ]');


/*Data for the table "sys_roleclass" */

insert  into "sys_roleclass"("name","description","rolelevel","tags") values ('ACCOUNTING','ACCOUNTING',1,NULL);
insert  into "sys_roleclass"("name","description","rolelevel","tags") values ('ADMIN','ADMIN',1,NULL);
insert  into "sys_roleclass"("name","description","rolelevel","tags") values ('BP','BUSINESS LICENSING',1,NULL);
insert  into "sys_roleclass"("name","description","rolelevel","tags") values ('IT','IT',1,NULL);
insert  into "sys_roleclass"("name","description","rolelevel","tags") values ('RPT','RPT ASSESSMENT',1,'[''ASSESSOR'', ''APPROVER'', ''TAXMAPPER'', ''APPRAISER'', ''RECOMMENDER'']');
insert  into "sys_roleclass"("name","description","rolelevel","tags") values ('TREASURY','TREASURY',1,'[''AFO'', ''CASHIER'', ''COLLECTOR'', ''LIQUIDATING_OFFICER'']');


/*Data for the table "sys_roleclass_module" */

insert into "sys_roleclass_module" ("roleclass", "module") values('BP','bp-rule-mgmt');
insert into "sys_roleclass_module" ("roleclass", "module") values('TREASURY','bp-rule-mgmt');
insert into "sys_roleclass_module" ("roleclass", "module") values('BP','bp2');
insert into "sys_roleclass_module" ("roleclass", "module") values('TREASURY','bp2');
insert into "sys_roleclass_module" ("roleclass", "module") values('TREASURY','ctc-rule-mgmt');
insert into "sys_roleclass_module" ("roleclass", "module") values('TREASURY','ctc2');
insert into "sys_roleclass_module" ("roleclass", "module") values('ADMIN','etracs2-admin');
insert into "sys_roleclass_module" ("roleclass", "module") values('BP','etracs2-entity');
insert into "sys_roleclass_module" ("roleclass", "module") values('IT','etracs2-entity');
insert into "sys_roleclass_module" ("roleclass", "module") values('RPT','etracs2-entity');
insert into "sys_roleclass_module" ("roleclass", "module") values('TREASURY','etracs2-entity');
insert into "sys_roleclass_module" ("roleclass", "module") values('BP','etracs2common');
insert into "sys_roleclass_module" ("roleclass", "module") values('IT','etracs2common');
insert into "sys_roleclass_module" ("roleclass", "module") values('RPT','etracs2common');
insert into "sys_roleclass_module" ("roleclass", "module") values('TREASURY','etracs2common');
insert into "sys_roleclass_module" ("roleclass", "module") values('ADMIN','jobposition');
insert into "sys_roleclass_module" ("roleclass", "module") values('ADMIN','orgunit');
insert into "sys_roleclass_module" ("roleclass", "module") values('ADMIN','personnel');
insert into "sys_roleclass_module" ("roleclass", "module") values('ADMIN','role');
insert into "sys_roleclass_module" ("roleclass", "module") values('RPT','rpt-rule-mgmt');
insert into "sys_roleclass_module" ("roleclass", "module") values('TREASURY','rpt-rule-mgmt');
insert into "sys_roleclass_module" ("roleclass", "module") values('RPT','rpt2');
insert into "sys_roleclass_module" ("roleclass", "module") values('TREASURY','rpt2');
insert into "sys_roleclass_module" ("roleclass", "module") values('ACCOUNTING','tc2');
insert into "sys_roleclass_module" ("roleclass", "module") values('TREASURY','tc2');


/*Data for the table "sys_var" */

INSERT sys_var VALUES ('assessor_name', '', NULL, NULL, 'RPT');
INSERT sys_var VALUES ('assessor_officename', '', NULL, NULL, 'RPT');
INSERT sys_var VALUES ('assessor_title', '', NULL, NULL, 'RPT');
INSERT sys_var VALUES ('barcode_url', 'http://localhost:8080/barcode?data=$P{data}&width=1', 'barcode servlet path', NULL, 'SYSTEM');
INSERT sys_var VALUES ('collecting_agency', '', NULL, NULL, 'TREASURY');
INSERT sys_var VALUES ('deposit_print_date', '0', NULL, NULL, 'TREASURY');
INSERT sys_var VALUES ('faas_attachment_path', 'D:/temp/faasattachments', NULL, NULL, 'RPT');
INSERT sys_var VALUES ('invalid_login_access_date_interval', '1m', 'number of hours/days access date is moved when failed_login_max_retries is reached( d=days, h=hours)', NULL, NULL);
INSERT sys_var VALUES ('invalid_login_action', '1', '0 - suspend 1-move access to a later date', NULL, NULL);
INSERT sys_var VALUES ('invalid_login_max_retries', '5', 'No. of times a user can retry login before disabling account', NULL, NULL);
INSERT sys_var VALUES ('lgu_address', '', NULL, NULL, 'LGU');
INSERT sys_var VALUES ('lgu_formal_name', '', NULL, NULL, 'LGU');
INSERT sys_var VALUES ('lgu_index', '', NULL, NULL, 'LGU');
INSERT sys_var VALUES ('lgu_name', '', 'lgu name', NULL, 'LGU');
INSERT sys_var VALUES ('lgu_type', '', 'Type of LGU. Valid values are city, municipality and province', NULL, 'SYSTEM');
INSERT sys_var VALUES ('mayor_name', '', NULL, NULL, 'LGU');
INSERT sys_var VALUES ('mayor_office_name', '', NULL, NULL, 'LGU');
INSERT sys_var VALUES ('mayor_title', '', NULL, NULL, 'LGU');
INSERT sys_var VALUES ('parent_lgu_formal_name', '', NULL, NULL, 'LGU');
INSERT sys_var VALUES ('parent_lgu_name', '', 'Parent LGU Name', NULL, 'LGU');
INSERT sys_var VALUES ('pin_autonumber', '0', NULL, NULL, 'RPT');
INSERT sys_var VALUES ('pin_parcel_length', '', 'The number of digits in pin parcel.', NULL, 'RPT');
INSERT sys_var VALUES ('pin_section_length', '', 'The number of digits in pin section.', NULL, 'RPT');
INSERT sys_var VALUES ('pin_type', '', 'PIN Formatting Type valid values: old or new', NULL, 'RPT');
INSERT sys_var VALUES ('provincial_treasurer_name', NULL, NULL, NULL, 'TREASURY');
INSERT sys_var VALUES ('provincial_treasurer_title', NULL, NULL, NULL, 'TREASURY');
INSERT sys_var VALUES ('pwd_change_cycle', '3', 'No. of times the user cannot use a repeating password', NULL, NULL);
INSERT sys_var VALUES ('pwd_change_date_interval', '1M', 'No. of days/months before a user is required to change their password (d=days, M=months)', NULL, NULL);
INSERT sys_var VALUES ('pwd_change_login_count', '0', 'No. of times a user has successfully logged in before changing their password. (0=no limit) ', NULL, NULL);
INSERT sys_var VALUES ('receipt_item_printout_count', '10', NULL, NULL, 'SYSTEM');
INSERT sys_var VALUES ('remote_context', '', 'Application context of the remote server', NULL, 'SYSTEM');
INSERT sys_var VALUES ('remote_host', 'localhost:8080', 'IP Address of the remote server ', NULL, 'SYSTEM');
INSERT sys_var VALUES ('remote_lgu_index', '', NULL, NULL, 'SYSTEM');
INSERT sys_var VALUES ('remote_lgu_name', '', NULL, NULL, 'SYSTEM');
INSERT sys_var VALUES ('rptbilling_previousledger_quarterly', NULL, NULL, NULL, 'RPT');
INSERT sys_var VALUES ('rptc_barangay_basic_rate', '', NULL, NULL, 'RPT');
INSERT sys_var VALUES ('rptc_barangay_sef_rate', '', NULL, NULL, 'RPT');
INSERT sys_var VALUES ('rptc_city_basic_rate', '', NULL, NULL, 'RPT');
INSERT sys_var VALUES ('rptc_city_sef_rate', '', NULL, NULL, 'RPT');
INSERT sys_var VALUES ('rptc_municipality_basic_rate', '', NULL, NULL, 'RPT');
INSERT sys_var VALUES ('rptc_municipality_sef_rate', '', NULL, NULL, 'RPT');
INSERT sys_var VALUES ('rptc_province_basic_rate', '', NULL, NULL, 'RPT');
INSERT sys_var VALUES ('rptc_province_sef_rate', '', NULL, NULL, 'RPT');
INSERT sys_var VALUES ('sangguinan_name', '', 'sangguinian name', NULL, 'LGU');
INSERT sys_var VALUES ('server_address', '', NULL, NULL, 'SYSTEM');
INSERT sys_var VALUES ('server_timezone', 'Asia/Shanghai', 'this must be matched with default timezone of server', NULL, 'SYSTEM');
INSERT sys_var VALUES ('session_timeout_interval', '1d ', 'expiry dates of inactive session (d=days, h=hours)', NULL, NULL);
INSERT sys_var VALUES ('system_pwd', '!12345', 'system password', NULL, NULL);
INSERT sys_var VALUES ('td_autonumber', '0', NULL, NULL, 'RPT');
INSERT sys_var VALUES ('td_format', 'Y-M-B', 'Tax Declaration No. format. Options: Y- revision year, M-municipality index, C - city index, D-district index, B=-barangay index', NULL, 'RPT');
INSERT sys_var VALUES ('td_report_display_appraisedby', '1', NULL, NULL, 'RPT');
INSERT sys_var VALUES ('td_report_item_format', 'BLGF', NULL, NULL, 'RPT');
INSERT sys_var VALUES ('td_show_landinfo_on_improvements', '1', 'Show the land information such as boundary etc in the improvement tax declaration. Options: 1 - show; 0 - hide', NULL, 'RPT');
INSERT sys_var VALUES ('treasurer_name', '', NULL, NULL, 'TREASURY');
INSERT sys_var VALUES ('treasurer_title', '', NULL, NULL, 'TREASURY');
INSERT sys_var VALUES ('treasury_officename', '', NULL, NULL, 'TREASURY');
INSERT sys_var VALUES ('url_logo_lgu', '', 'logo path', 'image', 'LGU');




/*-- migrate rule facts ------- */

insert  into "rule_package"("ruleset","rulegroup","packagename","orderindex","type","content","lastmodified") 
values ('bpassessment','','bp.assessment.facts',NULL,'facts',
'	package bp.assessment.facts' + CHAR(13) + CHAR(10) +
'' + CHAR(13) + CHAR(10) +
'	declare ApplicationFact' + CHAR(13) + CHAR(10) +
'		appid             : String ' + CHAR(13) + CHAR(10) +
'		applicationtype   : String    ' + CHAR(13) + CHAR(10) +
'		organization      : String    ' + CHAR(13) + CHAR(10) +
'		officetype        : String    ' + CHAR(13) + CHAR(10) +
'		barangayid        : String' + CHAR(13) + CHAR(10) +
'	end ' + CHAR(13) + CHAR(10) +
'' + CHAR(13) + CHAR(10) +
'	declare LOBFact' + CHAR(13) + CHAR(10) +
'		appid            : String	' + CHAR(13) + CHAR(10) +
'		lobid            : String  	' + CHAR(13) + CHAR(10) +
'		name             : String ' + CHAR(13) + CHAR(10) +
'		assessmenttype   : String  ' + CHAR(13) + CHAR(10) +
'		classificationid : String ' + CHAR(13) + CHAR(10) +
'		attributes       : java.util.List ' + CHAR(13) + CHAR(10) +
'	end' + CHAR(13) + CHAR(10) +
'' + CHAR(13) + CHAR(10) +
'	declare InputVariableFact ' + CHAR(13) + CHAR(10) +
'		appid   : String ' + CHAR(13) + CHAR(10) +
'		lobid   : String ' + CHAR(13) + CHAR(10) +
'		varid   : String' + CHAR(13) + CHAR(10) +
'		varname : String ' + CHAR(13) + CHAR(10) +
'		vartype : String ' + CHAR(13) + CHAR(10) +
'		value   : Object' + CHAR(13) + CHAR(10) +
'		systype : String' + CHAR(13) + CHAR(10) +
'	end ' + CHAR(13) + CHAR(10) +
'' + CHAR(13) + CHAR(10) +
'	declare TaxFeeFact' + CHAR(13) + CHAR(10) +
'		appid : String ' + CHAR(13) + CHAR(10) +
'		lobid : String ' + CHAR(13) + CHAR(10) +
'		acctid  : String ' + CHAR(13) + CHAR(10) +
'		assessedvalue : Double' + CHAR(13) + CHAR(10) +
'		amountdue     : Double ' + CHAR(13) + CHAR(10) +
'	end ' + CHAR(13) + CHAR(10) +
'' + CHAR(13) + CHAR(10) +
'	declare TaxFeeSummaryFact' + CHAR(13) + CHAR(10) +
'		appid   : String' + CHAR(13) + CHAR(10) +
'		name    : String' + CHAR(13) + CHAR(10) +
'		acctid  : String' + CHAR(13) + CHAR(10) +
'		value   : Double' + CHAR(13) + CHAR(10) +
'	end ' + CHAR(13) + CHAR(10) +
'' + CHAR(13) + CHAR(10) +
'	declare HighestComputed' + CHAR(13) + CHAR(10) +
'		appid : String ' + CHAR(13) + CHAR(10) +
'		acctid : String' + CHAR(13) + CHAR(10) +
'	end ' + CHAR(13) + CHAR(10) +
'' + CHAR(13) + CHAR(10) +
'	declare NotHighestComputed' + CHAR(13) + CHAR(10) +
'		appid : String ' + CHAR(13) + CHAR(10) +
'		acctid : String' + CHAR(13) + CHAR(10) +
'	end ' + CHAR(13) + CHAR(10) +
'' + CHAR(13) + CHAR(10) +
'	declare LowestComputed' + CHAR(13) + CHAR(10) +
'		appid : String ' + CHAR(13) + CHAR(10) +
'		acctid : String' + CHAR(13) + CHAR(10) +
'	end ' + CHAR(13) + CHAR(10) +
'' + CHAR(13) + CHAR(10) +
'	declare NotLowestComputed' + CHAR(13) + CHAR(10) +
'		appid : String ' + CHAR(13) + CHAR(10) +
'		acctid : String' + CHAR(13) + CHAR(10) +
'	end ' + CHAR(13) + CHAR(10)
,NULL);

insert  into "rule_package"("ruleset","rulegroup","packagename","orderindex","type","content","lastmodified") 
values ('bpbilling','','bp.billing.facts',0,'facts',
'	package bp.billing.facts' + CHAR(13) + CHAR(10) +
'' + CHAR(13) + CHAR(10) +
'	declare CurrentYearFact' + CHAR(13) + CHAR(10) +
'		year  : Integer' + CHAR(13) + CHAR(10) +
'		qtr   : Integer' + CHAR(13) + CHAR(10) +
'		month : Integer' + CHAR(13) + CHAR(10) +
'		day   : Integer' + CHAR(13) + CHAR(10) +
'	end' + CHAR(13) + CHAR(10) +
'' + CHAR(13) + CHAR(10) +
'	declare BPLedgerFact' + CHAR(13) + CHAR(10) +
'		ledgerid      : String' + CHAR(13) + CHAR(10) +
'		yearstarted   : Integer' + CHAR(13) + CHAR(10) +
'		lastyearpaid  : Integer' + CHAR(13) + CHAR(10) +
'		lastqtrpaid   : Integer' + CHAR(13) + CHAR(10) +
'	end' + CHAR(13) + CHAR(10) +
'' + CHAR(13) + CHAR(10) +
'	declare TaxFeeFact' + CHAR(13) + CHAR(10) +
'		ledgerid  : String' + CHAR(13) + CHAR(10) +
'		appid     : String ' + CHAR(13) + CHAR(10) +
'		taxfeeid  : String ' + CHAR(13) + CHAR(10) +
'		lobid     : String' + CHAR(13) + CHAR(10) +
'		lobname   : String' + CHAR(13) + CHAR(10) +
'		rulename  : String' + CHAR(13) + CHAR(10) +
'		year      : Integer' + CHAR(13) + CHAR(10) +
'		qtr       : Integer' + CHAR(13) + CHAR(10) +
'		monthsfromjan : Integer' + CHAR(13) + CHAR(10) +
'		monthsfromqtr : Integer' + CHAR(13) + CHAR(10) +
'		daysfromjan : Integer' + CHAR(13) + CHAR(10) +
'		daysfromqtr : Integer' + CHAR(13) + CHAR(10) +
'		acctid    : String' + CHAR(13) + CHAR(10) +
'		accttitle : String' + CHAR(13) + CHAR(10) +
'		amount    : Double' + CHAR(13) + CHAR(10) +
'		surchargeacctid : String ' + CHAR(13) + CHAR(10) +
'		surchargeaccttitle : String ' + CHAR(13) + CHAR(10) +
'		surcharge   : Double ' + CHAR(13) + CHAR(10) +
'		interestacctid : String	' + CHAR(13) + CHAR(10) +
'		interestaccttitle : String ' + CHAR(13) + CHAR(10) +
'		interest  : Double' + CHAR(13) + CHAR(10) +
'		discount  : Double' + CHAR(13) + CHAR(10) +
'		expr      : String ' + CHAR(13) + CHAR(10) +
'		varlist   : java.util.Map' + CHAR(13) + CHAR(10) +
'		applysurcharge	: Boolean' + CHAR(13) + CHAR(10) +
'		applydiscount	: Boolean' + CHAR(13) + CHAR(10) +
'	end' + CHAR(13) + CHAR(10)
,NULL);

insert  into "rule_package"("ruleset","rulegroup","packagename","orderindex","type","content","lastmodified") 
values ('ctcassessment','','ctc.assessment.facts',0,'facts',
'	package ctc.assessment.facts' + CHAR(13) + CHAR(10) +
'	declare IndividualFact' + CHAR(13) + CHAR(10) +
'		profession:		String' + CHAR(13) + CHAR(10) +
'		citizenship:	String' + CHAR(13) + CHAR(10) +
'		gender:			String' + CHAR(13) + CHAR(10) +
'		civilstatus:	String' + CHAR(13) + CHAR(10) +
'		seniorcitizen:  Boolean' + CHAR(13) + CHAR(10) +
'		newbusiness:	Boolean' + CHAR(13) + CHAR(10) +
'		annualsalary:	Double' + CHAR(13) + CHAR(10) +
'		businessgross:	Double' + CHAR(13) + CHAR(10) +
'		propertyincome: Double' + CHAR(13) + CHAR(10) +
'	end' + CHAR(13) + CHAR(10) +
'	declare CorporateFact' + CHAR(13) + CHAR(10) +
'		orgtype:	String' + CHAR(13) + CHAR(10) +
'		realpropertyav:	Double' + CHAR(13) + CHAR(10) +
'		businessgross:	Double' + CHAR(13) + CHAR(10) +
'	end' + CHAR(13) + CHAR(10) +
'	declare CTCFact' + CHAR(13) + CHAR(10) +
'		barangayid:	String' + CHAR(13) + CHAR(10) +
'		year:       Integer' + CHAR(13) + CHAR(10) +
'		qtr:        Integer' + CHAR(13) + CHAR(10) +
'		month:      Integer' + CHAR(13) + CHAR(10) +
'		day:        Integer' + CHAR(13) + CHAR(10) +
'		additional: Boolean' + CHAR(13) + CHAR(10) +
'		basictax:   Double' + CHAR(13) + CHAR(10) +
'		salarytax:  Double' + CHAR(13) + CHAR(10) +
'		businessgrosstax:  Double' + CHAR(13) + CHAR(10) +
'		propertyincometax: Double' + CHAR(13) + CHAR(10) +
'		additionaltax:     Double' + CHAR(13) + CHAR(10) +
'		interest:	Double' + CHAR(13) + CHAR(10) +
'		amtdue:		Double' + CHAR(13) + CHAR(10) +
'	end' + CHAR(13) + CHAR(10)
,NULL);

insert  into "rule_package"("ruleset","rulegroup","packagename","orderindex","type","content","lastmodified") 
values ('rptbilling','','etracs2.rpt.billing.facts',NULL,'facts',
'	package etracs2.rpt.billing.facts;' + CHAR(13) + CHAR(10) +
'' + CHAR(13) + CHAR(10) +
'	declare AssessedValueFact' + CHAR(13) + CHAR(10) +
'	rptledgerid		: String' + CHAR(13) + CHAR(10) +
'		year			: Integer' + CHAR(13) + CHAR(10) +
'		assessedvalue	: Double' + CHAR(13) + CHAR(10) +
'	end' + CHAR(13) + CHAR(10) +
'' + CHAR(13) + CHAR(10) +
'	declare CurrentYearFact' + CHAR(13) + CHAR(10) +
'		factname  	: String' + CHAR(13) + CHAR(10) +
'		year  		: Integer' + CHAR(13) + CHAR(10) +
'		qtr   		: Integer' + CHAR(13) + CHAR(10) +
'		month 		: Integer' + CHAR(13) + CHAR(10) +
'		day   		: Integer' + CHAR(13) + CHAR(10) +
'	end' + CHAR(13) + CHAR(10) +
'' + CHAR(13) + CHAR(10) +
'	declare RPTLedgerFact' + CHAR(13) + CHAR(10) +
'		rptledgerid             : String' + CHAR(13) + CHAR(10) +
'		factname                : String' + CHAR(13) + CHAR(10) +
'		firstitem               : Boolean' + CHAR(13) + CHAR(10) +
'		ledgerid                : String' + CHAR(13) + CHAR(10) +
'		rulename                : String' + CHAR(13) + CHAR(10) +
'		tdno                    : String ' + CHAR(13) + CHAR(10) +
'		year                    : Integer' + CHAR(13) + CHAR(10) +
'		qtr                     : Integer ' + CHAR(13) + CHAR(10) +
'		assessedvalue           : Double' + CHAR(13) + CHAR(10) +
'		txntype                 : String ' + CHAR(13) + CHAR(10) +
'		rputype                 : String ' + CHAR(13) + CHAR(10) +
'		classid                 : String' + CHAR(13) + CHAR(10) +
'		actualuseid             : String' + CHAR(13) + CHAR(10) +
'		numberofmonthsfromqtr   : Integer' + CHAR(13) + CHAR(10) +
'		numberofmonthsfromjan   : Integer' + CHAR(13) + CHAR(10) +
'		firstqtrpaidontime      : Boolean' + CHAR(13) + CHAR(10) +
'		qtrlypaymentavailed     : Boolean' + CHAR(13) + CHAR(10) +
'		backtax                 : Boolean ' + CHAR(13) + CHAR(10) +
'		fullpayment             : Boolean ' + CHAR(13) + CHAR(10) +
'		advancepayment          : Boolean ' + CHAR(13) + CHAR(10) +
'		lastyearpaid            : Integer' + CHAR(13) + CHAR(10) +
'		lastqtrpaid             : Integer ' + CHAR(13) + CHAR(10) +
'' + CHAR(13) + CHAR(10) +
'		revtype                 : String' + CHAR(13) + CHAR(10) +
'		basic                   : Double' + CHAR(13) + CHAR(10) +
'		basicint 	            : Double' + CHAR(13) + CHAR(10) +
'		basicdisc   	    : Double' + CHAR(13) + CHAR(10) +
'		sef                     : Double' + CHAR(13) + CHAR(10) +
'		sefint                  : Double' + CHAR(13) + CHAR(10) +
'		sefdisc                 : Double' + CHAR(13) + CHAR(10) +
'	    ' + CHAR(13) + CHAR(10) +
'		basicacctid             : String ' + CHAR(13) + CHAR(10) +
'		basicintacctid          : String ' + CHAR(13) + CHAR(10) +
'		sefacctid               : String ' + CHAR(13) + CHAR(10) +
'		sefintacctid            : String ' + CHAR(13) + CHAR(10) +
'' + CHAR(13) + CHAR(10) +
'		partialbasic            : Double' + CHAR(13) + CHAR(10) +
'		partialsef              : Double	' + CHAR(13) + CHAR(10) +
'' + CHAR(13) + CHAR(10) +
'		varlist                 : java.util.Map' + CHAR(13) + CHAR(10) +
'		expr                    : String ' + CHAR(13) + CHAR(10) +
'	end' + CHAR(13) + CHAR(10)
,NULL);


