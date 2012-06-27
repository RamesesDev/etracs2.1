/*Table structure for table "account" */

CREATE TABLE "account" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(100) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "fromyear" int NOT NULL,
  "toyear" int default NULL,
  "acctcode" varchar(25) NOT NULL,
  "accttitle" varchar(150) NOT NULL,
  "charttype" varchar(25) NOT NULL,
  "accttype" varchar(25) NOT NULL,
  "target" decimal(10,2) default NULL,
  "acctlevel" int NOT NULL,
  "parentid" varchar(50) default NULL,
  "rootid" varchar(50) default NULL,
  "pathbyids" varchar(200) default NULL,
  "pathbytitle" varchar(200) default NULL,
  PRIMARY KEY  ("objid"),
  -- UNIQUE ("accttitle","parentid")
);

/*Table structure for table "active_session" */

CREATE TABLE "active_session" (
  "sessionid" varchar(50) NOT NULL,
  "timein" datetime default NULL,
  "uid" varchar(50) default NULL,
  "expirydate" datetime default NULL,
  PRIMARY KEY  ("sessionid")
);

/*Table structure for table "af" */

CREATE TABLE "af" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(10) NOT NULL,
  "docstate" varchar(10) NOT NULL,
  "description" varchar(150) default NULL,
  "aftype" varchar(20) NOT NULL,
  "unit" varchar(10) NOT NULL,
  "pcsperunit" int NOT NULL,
  "denomination" decimal(10,2) default NULL,
  "serieslength" int default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "afcontrol" */

CREATE TABLE "afcontrol" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "docstate" varchar(30) NOT NULL,
  "active" int NOT NULL,
  "mode" varchar(25) NOT NULL,
  "afinventorycreditid" varchar(50) NOT NULL,
  "dtissued" date NOT NULL,
  "collectorid" varchar(50) NOT NULL,
  "collectorname" varchar(75) NOT NULL,
  "collectortitle" varchar(50) NOT NULL,
  "stubno" varchar(20) NOT NULL,
  "aftype" varchar(25) NOT NULL,
  "afid" varchar(50) NOT NULL,
  "qtyreceived" int NOT NULL,
  "startseries" int default NULL,
  "endseries" int default NULL,
  "currentseries" int default NULL,
  "beginseries" int default NULL,
  "beginqty" int default NULL,
  "qtyissued" int default NULL,
  "issuedfrom" int default NULL,
  "issuedto" int default NULL,
  "balance" int default NULL,
  "prefix" varchar(10) default NULL,
  "suffix" varchar(10) default NULL,
  "serieslength" int default NULL,
  "receiptformat" varchar(50) default NULL,
  "cancelledseries" text,
  "txndate" date default NULL,
  PRIMARY KEY  ("objid")
  /*
  KEY ("collectorid"),
  KEY ("collectorname"),
  KEY ("afid"),
  KEY ("collectorid","afid"),
  KEY ("collectorid","afid","docstate","mode")
  */
);

/*Table structure for table "afcontroltransfer" */

CREATE TABLE "afcontroltransfer" (
  "objid" varchar(50) NOT NULL,
  "docstate" varchar(30) NOT NULL,
  "txndate" date NOT NULL,
  "afcontrolid" varchar(50) NOT NULL,
  "transferafcontrolid" varchar(50) NOT NULL,
  "collectorid" varchar(50) NOT NULL,
  "transfercollectorid" varchar(50) NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "afinventory" */

CREATE TABLE "afinventory" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(25) NOT NULL,
  "schemaversion" varchar(10) NOT NULL,
  "docstate" varchar(35) NOT NULL,
  "irafid" varchar(50) NOT NULL,
  "irafno" varchar(50) NOT NULL,
  "iraftype" varchar(25) NOT NULL,
  "afid" varchar(50) NOT NULL,
  "aftype" varchar(10) NOT NULL,
  "afunit" varchar(20) NOT NULL,
  "stubfrom" int NOT NULL,
  "stubto" int NOT NULL,
  "qtyonhand" int NOT NULL,
  "qtyissued" int NOT NULL,
  "prefix" varchar(10) default NULL,
  "suffix" varchar(10) default NULL,
  "startseries" int NOT NULL,
  "endseries" int NOT NULL,
  "issuedfrom" int default NULL,
  "issuedto" int default NULL,
  "dtposted" datetime NULL default NULL,
  "aflength" int default NULL,
  "currentstub" int default NULL,
  "stubprefix" varchar(50) default NULL,
  "startserialno" varchar(50) default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "afinventorycredit" */

CREATE TABLE "afinventorycredit" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(10) NOT NULL,
  "docstate" varchar(25) NOT NULL,
  "afinventoryid" varchar(50) NOT NULL,
  "irafid" varchar(50) NOT NULL,
  "iraftype" varchar(25) NOT NULL,
  "afid" varchar(50) NOT NULL,
  "aftype" varchar(15) NOT NULL,
  "afunit" varchar(15) NOT NULL,
  "prefix" varchar(20) default NULL,
  "suffix" varchar(20) default NULL,
  "startseries" int default NULL,
  "endseries" int default NULL,
  "stubfrom" int default NULL,
  "stubto" int default NULL,
  "qtyissued" int default NULL,
  "irafno" varchar(50) default NULL,
  "stubno" varchar(50) default NULL,
  "balance" int default NULL,
  "aflength" int default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "bank" */

CREATE TABLE "bank" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(50) NOT NULL,
  "bankcode" varchar(50) NOT NULL,
  "bankname" varchar(50) NOT NULL,
  "branchname" varchar(50) NOT NULL,
  "address" varchar(100) default NULL,
  "manager" varchar(50) default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "bankaccount" */

CREATE TABLE "bankaccount" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(50) NOT NULL,
  "docstate" varchar(50) NOT NULL,
  "accttype" varchar(50) NOT NULL,
  "acctno" varchar(50) NOT NULL,
  "fund" varchar(50) NOT NULL,
  "bankid" varchar(50) NOT NULL,
  "bankcode" varchar(50) NOT NULL,
  "bankname" varchar(50) NOT NULL,
  "branchname" varchar(50) NOT NULL,
  "fundid" varchar(50) NOT NULL,
  "bankacctname" varchar(50) NOT NULL,
  "currency" varchar(50) NOT NULL,
  "cashreport" varchar(50) default NULL,
  "cashbreakdownreport" varchar(50) default NULL,
  "checkreport" varchar(50) default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "batchcapture" */

CREATE TABLE "batchcapture" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(25) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "docstate" varchar(25) NOT NULL,
  "afid" varchar(5) NOT NULL,
  "startseries" int NOT NULL,
  "series" int NOT NULL,
  "collector" text NOT NULL,
  "afcontrol" text NOT NULL,
  "collectiontype" text NOT NULL,
  "defaulttxndate" date NOT NULL,
  "items" text NOT NULL,
  "extended" text,
  "encodedbyid" varchar(50) NOT NULL,
  "encodedby" varchar(100) NOT NULL,
  "amount" decimal(12,2) NOT NULL,
  "collectorid" varchar(50) NOT NULL,
  "collectorname" varchar(100) NOT NULL,
  "opener" varchar(50) default NULL,
  PRIMARY KEY  ("objid")
  /*
  KEY "ix_batchcapture_state" ("docstate"),
  KEY "ix_batchcapture_colname" ("collectorname"),
  KEY "ix_batchcapture_encodedby" ("encodedby")
  */
);
create index ix_batchcapture_state on batchcapture ("docstate");
create index ix_batchcapture_colname on batchcapture ("collectorname");
create index ix_encodedby on batchcapture ("encodedby");


/*Table structure for table "bldgadditionalitem" */

CREATE TABLE "bldgadditionalitem" (
  "objid" varchar(50) NOT NULL,
  "bldgrysettingid" varchar(50) NOT NULL,
  "code" varchar(10) NOT NULL,
  "name" varchar(100) NOT NULL,
  "unit" varchar(25) NOT NULL,
  "expr" varchar(100) NOT NULL,
  "previd" varchar(50) default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "bldgassesslevel" */

CREATE TABLE "bldgassesslevel" (
  "objid" varchar(50) NOT NULL,
  "bldgrysettingid" varchar(50) NOT NULL,
  "code" varchar(10) NOT NULL,
  "name" varchar(50) NOT NULL,
  "fixrate" int NOT NULL,
  "rate" decimal(10,2) NOT NULL,
  "previd" varchar(50) default NULL,
  "ranges" text,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "bldgkindbucc" */

CREATE TABLE "bldgkindbucc" (
  "objid" varchar(50) NOT NULL,
  "bldgrysettingid" varchar(50) NOT NULL,
  "bldgtypeid" varchar(50) NOT NULL,
  "bldgkindid" varchar(50) NOT NULL,
  "bldgkindcode" varchar(10) NOT NULL,
  "bldgkindname" varchar(100) NOT NULL,
  "basevaluetype" varchar(25) NOT NULL,
  "basevalue" decimal(10,2) NOT NULL,
  "minbasevalue" decimal(10,2) NOT NULL,
  "maxbasevalue" decimal(10,2) NOT NULL,
  "gapvalue" int NOT NULL,
  "minarea" decimal(10,2) NOT NULL,
  "maxarea" decimal(10,2) NOT NULL,
  "bldgclass" varchar(20) default NULL,
  "previd" varchar(50) default NULL,
  "extended" text,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "bldgrysetting" */

CREATE TABLE "bldgrysetting" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "ry" int NOT NULL,
  "predominant" int NOT NULL,
  "depreciatecoreanditemseparately" int NOT NULL,
  "computedepreciationbasedonschedule" int NOT NULL,
  "previd" varchar(50) default NULL,
  "straightdepreciation" int default NULL,
  "calcbldgagebasedondtoccupied" int NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "bldgtype" */

CREATE TABLE "bldgtype" (
  "objid" varchar(50) NOT NULL,
  "bldgrysettingid" varchar(50) NOT NULL,
  "code" varchar(10) NOT NULL,
  "name" varchar(50) NOT NULL,
  "basevaluetype" varchar(10) NOT NULL,
  "residualrate" decimal(10,2) NOT NULL,
  "multistoreyadjustments" text,
  "depreciations" text,
  "previd" varchar(50) default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "bpappinfolisting" */

CREATE TABLE "bpappinfolisting" (
  "objid" varchar(100) NOT NULL,
  "applicationid" varchar(50) default NULL,
  "lobid" varchar(50) default NULL,
  "lobname" varchar(100) default NULL,
  "varid" varchar(50) default NULL,
  "varname" varchar(100) default NULL,
  "vartype" varchar(100) default NULL,
  "value" varchar(100) default NULL,
  "arrayvalues" text,
  "requiredbeforeprint" tinyint default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "bpapplication" */

CREATE TABLE "bpapplication" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(50) NOT NULL,
  "docstate" varchar(15) NOT NULL,
  "businessid" varchar(50) default NULL,
  "info" text,
  "txnmode" varchar(15) NOT NULL,
  "txntype" varchar(15) NOT NULL,
  "taxpayerid" varchar(50) NOT NULL,
  "tradename" varchar(500) NOT NULL,
  "businessaddress" varchar(500) NOT NULL,
  "txndate" date NOT NULL,
  "txnno" varchar(200) NOT NULL,
  "iyear" int NOT NULL,
  "parentid" varchar(50) default NULL,
  "extended" text,
  "barcode" varchar(100) default NULL,
  "lobs" text,
  "appinfos" text,
  "taxfees" text,
  "receivables" text,
  "credits" text,
  "assessments" text,
  PRIMARY KEY  ("objid")
  /*
  KEY "ix_bpapplication_docstate" ("docstate"),
  KEY "ix_bpapplication_businesid" ("businessid"),
  KEY "ix_bpapplication_businesid_docstate" ("businessid","docstate"),
  KEY "ix_bpapplication_txnno" ("txnno"),
  KEY "ix_bpapplication_tradename" ("tradename"),
  KEY "ix_bpapplication_barcode" ("barcode")
  */
);

create index "ix_bpapplication_docstate" on "bpapplication" ("docstate");
create index "ix_bpapplication_businesid" on "bpapplication" ("businessid");
create index "ix_bpapplication_businesid_docstate" on "bpapplication" ("businessid","docstate");
create index "ix_bpapplication_txnno" on "bpapplication" ("txnno");
create index "ix_bpapplication_tradename" on "bpapplication" ("tradename");
create index "ix_bpapplication_barcode" on "bpapplication" ("barcode");


/*Table structure for table "bpapplication_list" */

CREATE TABLE "bpapplication_list" (
  "objid" varchar(50) NOT NULL,
  "txnno" varchar(100) NOT NULL,
  "tradename" varchar(500) NOT NULL,
  "businessaddress" varchar(500) NOT NULL,
  "taxpayername" varchar(500) NOT NULL,
  "taxpayeraddress" varchar(500) NOT NULL,
  "txntype" varchar(50) NOT NULL,
  "txnmode" varchar(50) NOT NULL,
  "txndate" date NOT NULL,
  "iyear" bigint NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "bpapplicationlisting" */

CREATE TABLE "bpapplicationlisting" (
  "objid" varchar(50) NOT NULL,
  "txnno" varchar(100) default NULL,
  "txntype" varchar(50) default NULL,
  "txnmode" varchar(50) default NULL,
  "barcode" varchar(100) default NULL,
  "docstate" varchar(100) default NULL,
  "taxpayerid" varchar(50) default NULL,
  "taxpayername" varchar(500) default NULL,
  "taxpayeraddress" varchar(500) default NULL,
  "tradename" varchar(500) default NULL,
  "businessaddress" varchar(500) default NULL,
  "tin" varchar(100) default NULL,
  "bin" varchar(100) default NULL,
  "pin" varchar(100) default NULL,
  "officetype" varchar(100) default NULL,
  "organization" varchar(100) default NULL,
  "ctcno" varchar(100) default NULL,
  "ctcplaceissued" varchar(100) default NULL,
  "ctcdateissued" varchar(100) default NULL,
  "administratorname" varchar(500) default NULL,
  "administratoraddress" varchar(500) default NULL,
  "iyear" int default NULL,
  "businessid" varchar(50) default NULL,
  "parentid" varchar(50) default NULL,
  "barangayid" varchar(50) default NULL,
  "barangayname" varchar(50) default NULL,
  "txndate" date default NULL,
  "fullypaid" int default '0',
  PRIMARY KEY  ("objid")
  /*
  KEY "ix_bpapplicationlisting_businessid" ("businessid"),
  KEY "ix_bpapplicationlisting_tradename" ("tradename"),
  KEY "ix_bpapplicationlisting_docstate" ("docstate"),
  KEY "ix_bpapplicationlisting_txnno" ("txnno"),
  KEY "ix_bpapplicationlisting_businesid_docstate" ("businessid","docstate"),
  KEY "ix_bpapplicationlisting_tradenamedocstate" ("tradename","docstate"),
  KEY "ix_bpapplicationlisting_taxpayernamedocstate" ("taxpayername","docstate"),
  KEY "ix_bpapplicationlisting_bindocstate" ("bin","docstate"),
  KEY "ix_bpapplicationlisting_txnnodocstate" ("txnno","docstate"),
  KEY "ix_bpapplicationlisting_barcode" ("barcode"),
  KEY "ix_bpapplicationlisting_sym" ("docstate","iyear","txnmode")
  */
);

create index "ix_bpapplicationlisting_businessid" on "bpapplicationlisting" ("businessid");
create index "ix_bpapplicationlisting_tradename" on "bpapplicationlisting" ("tradename");
create index "ix_bpapplicationlisting_docstate" on "bpapplicationlisting" ("docstate");
create index "ix_bpapplicationlisting_txnno" on "bpapplicationlisting" ("txnno");
create index "ix_bpapplicationlisting_businesid_docstate" on "bpapplicationlisting" ("businessid","docstate");
create index "ix_bpapplicationlisting_tradenamedocstate" on "bpapplicationlisting" ("tradename","docstate");
create index "ix_bpapplicationlisting_taxpayernamedocstate" on "bpapplicationlisting" ("taxpayername","docstate");
create index "ix_bpapplicationlisting_bindocstate" on "bpapplicationlisting" ("bin","docstate");
create index "ix_bpapplicationlisting_txnnodocstate" on "bpapplicationlisting" ("txnno","docstate");
create index "ix_bpapplicationlisting_barcode" on "bpapplicationlisting" ("barcode");
create index "ix_bpapplicationlisting_sym" on "bpapplicationlisting" ("docstate","iyear","txnmode");


/*Table structure for table "bploblisting" */

CREATE TABLE "bploblisting" (
  "objid" varchar(100) NOT NULL,
  "applicationid" varchar(50) default NULL,
  "lobid" varchar(50) default NULL,
  "classificationid" varchar(50) default NULL,
  "name" varchar(100) default NULL,
  "iyear" int default NULL,
  "assessmenttype" varchar(100) default NULL,
  PRIMARY KEY  ("objid")
  /*
  KEY "ix_bploblisting_appid" ("applicationid")
  */
);

create index "ix_bploblisting_appid" on "bploblisting" ("applicationid");


/*Table structure for table "bppayment" */

CREATE TABLE "bppayment" (
  "objid" varchar(50) default NULL,
  "applicationid" varchar(50) default NULL,
  "receiptid" varchar(50) default NULL,
  "afid" varchar(20) default NULL,
  "serialno" varchar(30) default NULL,
  "txndate" date default NULL,
  "iyear" int default NULL,
  "iqtr" int default NULL,
  "imonth" int default NULL,
  "iday" int default NULL,
  "paidyear" int default NULL,
  "paidqtr" int default NULL,
  "lobid" varchar(50) default NULL,
  "lobname" varchar(50) default NULL,
  "acctid" varchar(50) default NULL,
  "accttitle" varchar(150) default NULL,
  "amount" decimal(10,2) default NULL,
  "surcharge" decimal(10,2) default NULL,
  "interest" decimal(10,2) default NULL,
  "discount" decimal(10,2) default NULL,
  "total" decimal(10,2) default NULL,
  "voided" int default NULL,
  PRIMARY KEY ("objid")
  /*
  KEY "ix_bppayment_applicationid" ("applicationid"),
  KEY "ix_bppayment_txndate" ("txndate"),
  KEY "ix_bppayment_receiptid" ("receiptid")
  */
);

create index "ix_bppayment_applicationid" on "bppayment" ("applicationid");
create index "ix_bppayment_txndate" on "bppayment" ("txndate");
create index "ix_bppayment_receiptid" on "bppayment" ("receiptid");



/*Table structure for table "bppermit" */

CREATE TABLE "bppermit" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(255) default NULL,
  "schemaversion" varchar(10) default NULL,
  "txnno" varchar(100) default NULL,
  "txndate" date default NULL,
  "docstate" varchar(25) default NULL,
  "taxpayerid" varchar(50) default NULL,
  "taxpayername" varchar(500) default NULL,
  "taxpayeraddress" varchar(500) default NULL,
  "businessid" varchar(500) default NULL,
  "tradename" varchar(500) default NULL,
  "businessaddress" varchar(500) default NULL,
  "lobs" text,
  "applicationid" varchar(50) default NULL,
  "iyear" int default NULL,
  "plateno" varchar(50) default NULL,
  "info" text,
  PRIMARY KEY  ("objid")
  /*
  KEY "ix_bppermit_businessid" ("businessid"),
  KEY "ix_bppermit_appid" ("applicationid")
  */
);

create index "ix_bppermit_businessid" on "bppermit" ("businessid");
create index "ix_bppermit_appid" on "bppermit" ("applicationid");


/*Table structure for table "bpreceivable" */

CREATE TABLE "bpreceivable" (
  "objid" varchar(32) NOT NULL,
  "businessid" varchar(32) NOT NULL,
  "applicationid" varchar(32) NOT NULL,
  "applicationtype" varchar(10) NOT NULL,
  "appno" varchar(100) NOT NULL,
  "iyear" int NOT NULL,
  "lobid" varchar(32) default NULL,
  "lobname" varchar(200) default NULL,
  "acctid" varchar(32) NOT NULL,
  "accttitle" varchar(200) NOT NULL,
  "amount" decimal(9,2) NOT NULL,
  "amtpaid" decimal(9,2) NOT NULL,
  "iqtr" int default NULL,
  "acctno" varchar(32) default NULL,
  PRIMARY KEY  ("objid")
);



/*Table structure for table "bpreceivablecredit" */

CREATE TABLE "bpreceivablecredit" (
  "objid" varchar(50) NOT NULL default '',
  "bpreceivableid" varchar(50) NOT NULL default '',
  "refid" varchar(50) default '',
  "reftype" varchar(100) NOT NULL,
  "refno" varchar(100) NOT NULL,
  "amount" decimal(9,2) NOT NULL,
  "surcharge" decimal(9,2) NOT NULL,
  "interest" decimal(9,2) NOT NULL,
  "discount" decimal(9,2) NOT NULL,
  "refdate" date default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "bpsetting" */

CREATE TABLE "bpsetting" (
  "objid" varchar(50) NOT NULL,
  "applicationsignatories" text,
  "assessmentsignatories" text,
  "requirements" text,
  "collection" text,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "bptaxfeelisting" */

CREATE TABLE "bptaxfeelisting" (
  "objid" varchar(100) NOT NULL,
  "applicationid" varchar(50) default NULL,
  "lobid" varchar(50) default NULL,
  "lobname" varchar(500) default NULL,
  "acctid" varchar(50) default NULL,
  "acctno" varchar(100) default NULL,
  "accttitle" varchar(100) default NULL,
  "assessedvalue" decimal(9,2) default NULL,
  "amountdue" decimal(9,2) default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "bptxn" */

CREATE TABLE "bptxn" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(20) NOT NULL,
  "docstate" varchar(10) NOT NULL,
  "info" text NOT NULL,
  "txntype" varchar(20) NOT NULL,
  "business" text,
  "businessid" varchar(50) NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "business" */

CREATE TABLE "business" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(50) NOT NULL,
  "docstate" varchar(15) NOT NULL,
  "taxpayerid" varchar(32) NOT NULL,
  "taxpayername" varchar(2000) NOT NULL,
  "taxpayeraddress" varchar(2000) NOT NULL,
  "yearstarted" int NOT NULL,
  "dtregistered" date default NULL,
  "sec" varchar(100) default NULL,
  "dti" varchar(100) default NULL,
  "sss" varchar(100) default NULL,
  "pin" varchar(100) default NULL,
  "tin" varchar(100) default NULL,
  "applicationid" varchar(32) NOT NULL,
  "tradename" varchar(100) NOT NULL,
  "businessaddress" varchar(255) NOT NULL,
  "permitid" varchar(50) default NULL,
  "adminid" varchar(50) default NULL,
  "adminname" varchar(100) default NULL,
  "adminaddress" varchar(255) default NULL,
  "organization" varchar(255) default NULL,
  "officetype" varchar(255) default NULL,
  "bin" varchar(255) default NULL,
  "lastyrpaid" int default NULL,
  "lastqtrpaid" int default NULL,
  PRIMARY KEY  ("objid")
  /*
  KEY "ix_business_bin" ("bin"),
  KEY "ix_business_taxpayername" ("taxpayername"(767)),
  KEY "ix_business_adminname" ("adminname"),
  KEY "ix_business_businessaddress" ("businessaddress")
  */
);

create index "ix_business_bin" on "business" ("bin");
create index "ix_business_taxpayername" on "business" ("taxpayername");
create index "ix_business_adminname" on "business" ("adminname");
create index "ix_business_businessaddress" on "business" ("businessaddress");



/*Table structure for table "cancelannotation" */

CREATE TABLE "cancelannotation" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "docstate" varchar(25) NOT NULL,
  "docno" varchar(15) NOT NULL,
  "fileno" varchar(30) NOT NULL,
  "faasid" varchar(50) NOT NULL,
  "annotationid" varchar(50) NOT NULL,
  "annotationno" varchar(20) NOT NULL,
  "tdno" varchar(25) NOT NULL,
  "submittedby" varchar(50) default NULL,
  "submittedbytitle" varchar(50) default NULL,
  "dtsubmitted" date default NULL,
  "signedby" varchar(50) default NULL,
  "signedbytitle" varchar(50) default NULL,
  "dtsigned" date default NULL,
  "approvedby" varchar(50) default NULL,
  "approvedbytitle" varchar(50) default NULL,
  "dtapproved" date default NULL,
  "remarks" varchar(1000) default NULL,
  "orno" varchar(10) NOT NULL,
  "ordate" date NOT NULL,
  "oramount" decimal(12,2) NOT NULL,
  "extended" text NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "cancelfaas" */

CREATE TABLE "cancelfaas" (
  "objid" varchar(50) NOT NULL,
  "docstate" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "tdno" varchar(30) NOT NULL,
  "ownername" varchar(800) NOT NULL,
  "fullpin" varchar(35) NOT NULL,
  "classcode" varchar(10) NOT NULL,
  "faasid" varchar(50) NOT NULL,
  "rputype" varchar(20) NOT NULL,
  "remarks" varchar(200) NOT NULL,
  "dtapproved" date default NULL,
  "approvedby" varchar(100) default NULL,
  "cancelreasonid" varchar(50) NOT NULL,
  "cancelreason" varchar(25) NOT NULL,
  "extended" text,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "canceltdreason" */

CREATE TABLE "canceltdreason" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "cancelcode" varchar(10) NOT NULL,
  "canceltitle" varchar(100) NOT NULL,
  "canceldesc" varchar(150) NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "changeaddresslist" */

CREATE TABLE "changeaddresslist" (
  "objid" varchar(50) NOT NULL,
  "docstate" varchar(10) NOT NULL,
  "txnno" varchar(20) NOT NULL,
  "txntype" varchar(20) NOT NULL,
  "businessid" varchar(50) NOT NULL,
  "tradename" varchar(100) NOT NULL,
  "prevbusinessaddress" varchar(255) NOT NULL,
  "newbusinessaddress" varchar(255) NOT NULL,
  "taxpayername" varchar(100) NOT NULL,
  "taxpayeraddress" varchar(255) NOT NULL,
  PRIMARY KEY  ("objid"),  
  -- KEY "FK_changeaddresslist_business" ("businessid"),
  CONSTRAINT "FK_changeaddresslist" FOREIGN KEY ("objid") REFERENCES "bptxn" ("objid"),
  CONSTRAINT "FK_changeaddresslist_business" FOREIGN KEY ("businessid") REFERENCES "business" ("objid")
);

create index "FK_changeaddresslist_business" on "changeaddresslist" ("businessid");


/*Table structure for table "changeadminlist" */

CREATE TABLE "changeadminlist" (
  "objid" varchar(50) NOT NULL,
  "docstate" varchar(10) NOT NULL,
  "txnno" varchar(20) NOT NULL,
  "txntype" varchar(20) NOT NULL,
  "businessid" varchar(50) NOT NULL,
  "tradename" varchar(100) NOT NULL,
  "businessaddress" varchar(255) NOT NULL,
  "taxpayername" varchar(100) NOT NULL,
  "taxpayeraddress" varchar(255) NOT NULL,
  "prevadminid" varchar(50) default NULL,
  "prevadminname" varchar(100) default NULL,
  "prevadminaddress" varchar(255) default NULL,
  "newadminid" varchar(50) default NULL,
  "newadminname" varchar(100) default NULL,
  "newadminaddress" varchar(255) default NULL,
  PRIMARY KEY  ("objid"),
  /*
  KEY "FK_changeadminlist_newadmin" ("newadminid"),
  KEY "FK_changeadminlist_prevadmin" ("prevadminid"),
  KEY "FK_changeadminlist_business" ("businessid"),
  */
  /*
  CONSTRAINT "FK_changeadminlist" FOREIGN KEY ("objid") REFERENCES "bptxn" ("objid"),
  CONSTRAINT "FK_changeadminlist_business" FOREIGN KEY ("businessid") REFERENCES "business" ("objid"),
  CONSTRAINT "FK_changeadminlist_newadmin" FOREIGN KEY ("newadminid") REFERENCES "entity" ("objid"),
  CONSTRAINT "FK_changeadminlist_prevadmin" FOREIGN KEY ("prevadminid") REFERENCES "entity" ("objid")
  */
);

create index "ix_changeadminlist_newadmin" on "changeadminlist" ("newadminid");
create index "ix_changeadminlist_prevadmin" on "changeadminlist" ("prevadminid");
create index "ix_changeadminlist_business" on "changeadminlist" ("businessid");


/*Table structure for table "changepermitteelist" */

CREATE TABLE "changepermitteelist" (
  "objid" varchar(50) NOT NULL,
  "docstate" varchar(20) NOT NULL,
  "txnno" varchar(20) NOT NULL,
  "txntype" varchar(20) NOT NULL,
  "businessid" varchar(50) NOT NULL,
  "tradename" varchar(100) NOT NULL,
  "businessaddress" varchar(255) NOT NULL,
  "prevtaxpayerid" varchar(50) NOT NULL,
  "prevtaxpayername" varchar(100) NOT NULL,
  "prevtaxpayeraddress" varchar(255) NOT NULL,
  "newtaxpayerid" varchar(50) NOT NULL,
  "newtaxpayername" varchar(100) NOT NULL,
  "newtaxpayeraddress" varchar(255) NOT NULL,
  PRIMARY KEY  ("objid")
  /*
  KEY "FK_changepermitteelist_newtaxpayer" ("newtaxpayerid"),
  KEY "FK_changepermitteelist_prevtaxpayer" ("prevtaxpayerid"),
  KEY "FK_changepermitteelist_business" ("businessid"),
  CONSTRAINT "FK_changepermitteelist" FOREIGN KEY ("objid") REFERENCES "bptxn" ("objid"),
  CONSTRAINT "FK_changepermitteelist_business" FOREIGN KEY ("businessid") REFERENCES "business" ("objid"),
  CONSTRAINT "FK_changepermitteelist_newtaxpayer" FOREIGN KEY ("newtaxpayerid") REFERENCES "entity" ("objid"),
  CONSTRAINT "FK_changepermitteelist_prevtaxpayer" FOREIGN KEY ("prevtaxpayerid") REFERENCES "entity" ("objid")
  */
);

/*Table structure for table "changetradenamelist" */

CREATE TABLE "changetradenamelist" (
  "objid" varchar(50) NOT NULL,
  "docstate" varchar(10) NOT NULL,
  "txnno" varchar(20) NOT NULL,
  "businessid" varchar(50) NOT NULL,
  "newtradename" varchar(100) NOT NULL,
  "prevtradename" varchar(100) NOT NULL,
  "taxpayername" varchar(100) NOT NULL,
  "taxpayeraddress" varchar(255) NOT NULL,
  "txntype" varchar(20) NOT NULL,
  "businessaddress" varchar(255) NOT NULL,
  PRIMARY KEY  ("objid")
  /*
  KEY "FK_changetradenamelist_business" ("businessid"),
  CONSTRAINT "FK_changetradenamelist" FOREIGN KEY ("objid") REFERENCES "bptxn" ("objid"),
  CONSTRAINT "FK_changetradenamelist_business" FOREIGN KEY ("businessid") REFERENCES "business" ("objid")
  */
);

/*Table structure for table "citizenship" */

CREATE TABLE "citizenship" (
  "objid" varchar(100) NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "collectionsetting" */

CREATE TABLE "collectionsetting" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(10) NOT NULL,
  "info" text NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "collectiontype" */

CREATE TABLE "collectiontype" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "name" varchar(100) NOT NULL,
  "appcode" varchar(25) NOT NULL,
  "payorrequired" int NOT NULL,
  "afid" varchar(50) NOT NULL,
  PRIMARY KEY  ("objid"),
  UNIQUE ("name","afid")
  /*
  KEY "FK_collectiontype" ("afid"),
  KEY "ix_collectiontype_afid" ("afid")
  */
);

/*Table structure for table "consolidation" */

CREATE TABLE "consolidation" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "docstate" varchar(25) NOT NULL,
  "ry" int NOT NULL,
  "txntype" varchar(5) NOT NULL,
  "autonumber" int NOT NULL,
  "issuedate" date NOT NULL,
  "effectivityyear" int NOT NULL,
  "effectivityqtr" int NOT NULL,
  "memoranda" text,
  "consolidatedlandcount" int NOT NULL,
  "affectedrpucount" int NOT NULL,
  "appraisedby" varchar(50) default NULL,
  "appraisedbytitle" varchar(50) default NULL,
  "dtappraised" date default NULL,
  "recommendedby" varchar(50) default NULL,
  "recommendedbytitle" varchar(50) default NULL,
  "dtrecommended" date default NULL,
  "approvedby" varchar(50) default NULL,
  "approvedbytitle" varchar(50) default NULL,
  "dtapproved" date default NULL,
  "newtdno" varchar(25) default NULL,
  "newpin" varchar(25) default NULL,
  "newtitletype" varchar(10) default NULL,
  "newtitleno" varchar(50) default NULL,
  "newtitledate" date default NULL,
  "areasqm" decimal(16,6) default NULL,
  "areaha" decimal(16,6) default NULL,
  "newtaxpayerid" varchar(50) default NULL,
  "newtaxpayerno" varchar(25) default NULL,
  "newtaxpayername" varchar(500) default NULL,
  "newtaxpayeraddress" varchar(100) default NULL,
  "rp" text NOT NULL,
  "rpu" text NOT NULL,
  "newfaasid" varchar(50) default NULL,
  "extended" text,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "consolidationaffectedrpu" */

CREATE TABLE "consolidationaffectedrpu" (
  "objid" varchar(50) NOT NULL,
  "consolidationid" varchar(50) NOT NULL,
  "rputype" varchar(10) NOT NULL,
  "landfaasid" varchar(50) NOT NULL,
  "prevfaasid" varchar(50) NOT NULL,
  "prevtdno" varchar(25) NOT NULL,
  "prevfullpin" varchar(25) NOT NULL,
  "newtdno" varchar(25) default NULL,
  "newpin" varchar(25) default NULL,
  "newsuffix" int default NULL,
  "memoranda" text,
  "newfaasid" varchar(50) default NULL,
  "extended" text,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "consolidationland" */

CREATE TABLE "consolidationland" (
  "objid" varchar(50) NOT NULL,
  "consolidationid" varchar(50) NOT NULL,
  "tdno" varchar(25) NOT NULL,
  "pin" varchar(25) NOT NULL,
  "taxpayerid" varchar(50) NOT NULL,
  "taxpayername" text NOT NULL,
  "mv" decimal(12,2) NOT NULL,
  "av" decimal(12,2) NOT NULL,
  "areasqm" decimal(16,6) NOT NULL,
  "areaha" decimal(16,6) NOT NULL,
  "landfaasid" varchar(50) NOT NULL,
  "extended" text,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "country" */

CREATE TABLE "country" (
  "code" varchar(5) NOT NULL,
  "name" varchar(255) default NULL,
  PRIMARY KEY  ("code")
);

/*Table structure for table "craaf" */

CREATE TABLE "craaf" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(10) NOT NULL,
  "afinventoryid" varchar(50) default NULL,
  "afinventorycreditid" varchar(50) default NULL,
  "craafyear" int NOT NULL,
  "craafmonth" int NOT NULL,
  "collectorid" varchar(50) default NULL,
  "collectorname" varchar(150) default NULL,
  "collectortitle" varchar(50) default NULL,
  "afid" varchar(50) NOT NULL,
  "beginqty" int default NULL,
  "beginfrom" varchar(50) default NULL,
  "beginto" varchar(50) default NULL,
  "receivedqty" int default NULL,
  "receivedfrom" varchar(50) default NULL,
  "receivedto" varchar(50) default NULL,
  "issuedqty" int default NULL,
  "issuedfrom" varchar(50) default NULL,
  "issuedto" varchar(50) default NULL,
  "canceledqty" int default NULL,
  "canceledfrom" varchar(50) default NULL,
  "canceledto" varchar(50) default NULL,
  "cancelreason" varchar(150) default NULL,
  "endingqty" int default NULL,
  "endingfrom" varchar(50) default NULL,
  "endingto" varchar(50) default NULL,
  "stubno" varchar(30) default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "craafcredit" */

CREATE TABLE "craafcredit" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(10) NOT NULL,
  "craafid" varchar(50) NOT NULL,
  "reftype" varchar(50) NOT NULL,
  "refno" varchar(50) NOT NULL,
  "refdate" varchar(25) NOT NULL,
  "qty" int NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "deposit" */

CREATE TABLE "deposit" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(25) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "docstate" varchar(20) NOT NULL,
  "txnno" varchar(10) NOT NULL,
  "txndate" date NOT NULL,
  "dtposted" datetime NOT NULL,
  "depositedbyid" varchar(50) NOT NULL,
  "depositedbyname" varchar(50) NOT NULL,
  "depositedbytitle" varchar(25) NOT NULL,
  "cash" decimal(12,2) NOT NULL,
  "noncash" decimal(12,2) NOT NULL,
  "amount" decimal(12,2) NOT NULL,
  "fundsummaries" text NOT NULL,
  "liquidations" text NOT NULL,
  "fundtotals" text NOT NULL,
  PRIMARY KEY  ("objid")
  /*
  KEY "ix_deposit_txnno" ("txnno"),
  KEY "ix_deposit_docstate" ("docstate"),
  KEY "ix_deposit_depositedbyname" ("depositedbyname")
  */
);

/*Table structure for table "docno_generator" */

CREATE TABLE "docno_generator" (
  "name" varchar(50) NOT NULL,
  "prefix" varchar(50) NOT NULL,
  "lastnum" int default NULL,
  PRIMARY KEY  ("name","prefix")
);

/*Table structure for table "entity" */

CREATE TABLE "entity" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(100) NOT NULL,
  "schemaversion" varchar(10) NOT NULL,
  "entityno" varchar(10) NOT NULL,
  "entityname" varchar(500) NOT NULL,
  "entityaddress" varchar(100) NOT NULL,
  "mailingaddress" varchar(100) default NULL,
  "entitytype" varchar(25) NOT NULL,
  "info" text NOT NULL,
  "sys_lastupdate" varchar(25) default NULL,
  "sys_lastupdateby" varchar(50) default NULL,
  "remarks" varchar(100) default NULL,
  "contactno" varchar(20) default NULL,
  PRIMARY KEY  ("objid")
  /*
  KEY "ux_entity_no" ("entityno"),
  KEY "ix_entity_name" ("entityname"),
  KEY "ix_entity_entityname" ("entityname"),
  KEY "ix_entity_entityno" ("entityno"),
  KEY "ix_entity_entitytype" ("entitytype")
  */
);

/*Table structure for table "entitymember" */

CREATE TABLE "entitymember" (
  "objid" varchar(50) NOT NULL,
  "entityid" varchar(50) NOT NULL,
  "itemno" int NOT NULL,
  "prefix" varchar(25) default NULL,
  "taxpayerid" varchar(50) NOT NULL,
  "taxpayername" varchar(1000) NOT NULL,
  "taxpayeraddress" varchar(100) NOT NULL,
  "suffix" varchar(25) default NULL,
  "remarks" varchar(100) default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "examiner" */

CREATE TABLE "examiner" (
  "objid" varchar(50) NOT NULL,
  "schemaName" varchar(50) NOT NULL,
  "schemaVersion" varchar(10) NOT NULL,
  "uid" varchar(50) NOT NULL,
  "municipalities" varchar(1000) NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "exemptiontype" */

CREATE TABLE "exemptiontype" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "exemptcode" varchar(10) NOT NULL,
  "exemptdesc" varchar(100) NOT NULL,
  "orderno" int NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "faas" */

CREATE TABLE "faas" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(25) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "docstate" varchar(25) NOT NULL,
  "transmittalid" varchar(50) default NULL,
  "transmitted" int default NULL,
  "info" text NOT NULL,
  "rp" text NOT NULL,
  "rpu" text NOT NULL,
  "previousfaases" text NOT NULL,
  "extended" text,
  "message" text,
  "sys_dtapproved" datetime default NULL,
  "ledgerid" varchar(50) default NULL,
  "attachments" text,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "faasannotation" */

CREATE TABLE "faasannotation" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "docstate" varchar(25) NOT NULL,
  "doctype" varchar(50) NOT NULL,
  "opener" varchar(25) NOT NULL,
  "docno" varchar(15) NOT NULL,
  "fileno" varchar(30) NOT NULL,
  "faasid" varchar(50) NOT NULL,
  "tdno" varchar(25) NOT NULL,
  "fullpin" varchar(25) NOT NULL,
  "cadastrallotno" varchar(200) NOT NULL,
  "surveyno" varchar(50) default NULL,
  "blockno" varchar(50) default NULL,
  "ownername" varchar(1000) NOT NULL,
  "submittedby" varchar(50) default NULL,
  "submittedbytitle" varchar(50) default NULL,
  "dtsubmitted" date default NULL,
  "signedby" varchar(50) default NULL,
  "signedbytitle" varchar(50) default NULL,
  "dtsigned" date default NULL,
  "approvedby" varchar(50) default NULL,
  "approvedbytitle" varchar(50) default NULL,
  "dtapproved" date default NULL,
  "memoranda" varchar(1000) default NULL,
  "orno" varchar(10) NOT NULL,
  "ordate" date NOT NULL,
  "oramount" decimal(12,2) NOT NULL,
  "details" varchar(250) default NULL,
  "extended" text NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "faasannotationtype" */

CREATE TABLE "faasannotationtype" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "annotationtypecode" varchar(10) NOT NULL,
  "annotationtype" varchar(100) NOT NULL,
  PRIMARY KEY  ("objid")
  /*
  UNIQUE KEY "annotationtypecode" ("annotationtypecode"),
  UNIQUE KEY "annotationtype" ("annotationtype")
  */
);

/*Table structure for table "faasattachment" */

CREATE TABLE "faasattachment" (
  "objid" varchar(50) NOT NULL,
  "faasid" varchar(50) NOT NULL,
  "docstate" varchar(25) NOT NULL,
  "type" varchar(100) default NULL,
  "filename" varchar(250) default NULL,
  "directory" varchar(250) default NULL,
  "refno" varchar(50) default NULL,
  "refdate" date default NULL,
  "remarks" text,
  "message" varchar(250) default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "faaslist" */

CREATE TABLE "faaslist" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "docstate" varchar(25) NOT NULL,
  "datacapture" int NOT NULL,
  "autonumber" int NOT NULL,
  "claimno" varchar(25) default NULL,
  "backtaxyrs" int NOT NULL,
  "landfaasid" varchar(50) default NULL,
  "landfaastaxpayerid" varchar(50) default NULL,
  "txntype" varchar(5) NOT NULL,
  "tdno" varchar(25) default NULL,
  "prevtdno" varchar(200) default NULL,
  "issuedate" date NOT NULL,
  "effectivityyear" int NOT NULL,
  "effectivityqtr" int NOT NULL,
  "titleno" varchar(50) default NULL,
  "titletype" varchar(10) default NULL,
  "titledate" date default NULL,
  "prevtaxpayerid" varchar(50) default NULL,
  "taxpayerid" varchar(50) NOT NULL,
  "taxpayerno" varchar(25) NOT NULL,
  "taxpayername" varchar(500) NOT NULL,
  "taxpayeraddress" varchar(100) NOT NULL,
  "administratorid" varchar(50) default NULL,
  "administratorno" varchar(25) default NULL,
  "administratorname" varchar(100) default NULL,
  "administratoraddress" varchar(100) default NULL,
  "appraisedby" varchar(75) NOT NULL,
  "appraisedbytitle" varchar(30) NOT NULL,
  "recommendedby" varchar(75) default NULL,
  "recommendedbytitle" varchar(30) default NULL,
  "approvedby" varchar(75) NOT NULL,
  "approvedbytitle" varchar(30) NOT NULL,
  "rputype" varchar(10) NOT NULL,
  "ry" int NOT NULL,
  "fullpin" varchar(30) NOT NULL,
  "classid" varchar(50) NOT NULL,
  "classcode" varchar(5) NOT NULL,
  "taxable" int NOT NULL,
  "totalareasqm" decimal(18,6) NOT NULL,
  "totalareaha" decimal(18,6) NOT NULL,
  "totalmv" decimal(14,2) NOT NULL,
  "totalav" decimal(14,2) NOT NULL,
  "pintype" varchar(5) NOT NULL,
  "pin" varchar(30) NOT NULL,
  "provcityindex" varchar(5) NOT NULL,
  "munidistrictindex" varchar(5) NOT NULL,
  "barangayindex" varchar(5) NOT NULL,
  "provcity" varchar(50) NOT NULL,
  "munidistrict" varchar(50) NOT NULL,
  "barangay" varchar(50) NOT NULL,
  "cadastrallotno" varchar(200) NOT NULL,
  "blockno" varchar(25) default NULL,
  "surveyno" varchar(200) default NULL,
  "cancelreason" varchar(25) default NULL,
  "canceldate" date default NULL,
  "cancelledbytdnos" varchar(250) default NULL,
  "ledgerid" varchar(50) default NULL,
  "barangayid" varchar(50) default NULL,
  "ownername" varchar(500) NOT NULL,
  "owneraddress" varchar(100) NOT NULL,
  "txndatetime" varchar(25) NOT NULL,
  "section" varchar(3) NOT NULL,
  "parcel" varchar(3) NOT NULL,
  "memoranda" varchar(1000) NOT NULL,
  "exemptid" varchar(50) default NULL,
  "exemptcode" varchar(10) default NULL,
  "annotated" int NOT NULL,
  "restriction" varchar(30) default NULL,
  "message" text,
  PRIMARY KEY  ("objid")
  /*
  KEY "ix_brgy_state_section_taxable" ("barangayid","docstate","section","taxable"),
  KEY "ix_faaslist_barangayid_docstate" ("barangayid","docstate"),
  KEY "ix_txndatetime_docstate" ("txndatetime","docstate"),
  KEY "FK_faaslist" ("taxpayerid"),
  KEY "ix_faaslist_annotated" ("annotated"),
  KEY "ix_faaslist_prevtdno_ry" ("prevtdno","ry"),
  KEY "ix_faaslist_prevtdno" ("prevtdno"),
  KEY "ix_faaslist_rydocstate" ("ry","docstate"),
  KEY "ix_faaslist_datetime_docstate_taxable" ("txndatetime","docstate","taxable"),
  KEY "ix_faaslist_pin_rputype" ("rputype","pin"),
  CONSTRAINT "FK_faaslist" FOREIGN KEY ("taxpayerid") REFERENCES "entity" ("objid")
  */
);

/*Table structure for table "filter" */

CREATE TABLE "filter" (
  "objid" varchar(50) NOT NULL,
  "name" varchar(250) NOT NULL,
  "refname" varchar(100) NOT NULL,
  "info" text NOT NULL,
  PRIMARY KEY  ("objid"),
  -- KEY "name" ("name","refname")
);

/*Table structure for table "form60setup" */

CREATE TABLE "form60setup" (
  "objid" varchar(50) NOT NULL,
  "items" text NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "fund" */

CREATE TABLE "fund" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "docstate" varchar(10) NOT NULL,
  "fund" varchar(50) NOT NULL,
  "subfund" varchar(100) NOT NULL,
  "fundname" varchar(150) NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "incomeaccount" */

CREATE TABLE "incomeaccount" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "docstate" varchar(25) NOT NULL,
  "acctno" varchar(25) default NULL,
  "accttitle" varchar(150) NOT NULL,
  "acctcode" varchar(50) default NULL,
  "defaultvalue" decimal(12,2) NOT NULL,
  "systype" varchar(25) default NULL,
  "ngasid" varchar(50) default NULL,
  "ngastitle" varchar(150) default NULL,
  "ngassubacctid" varchar(50) default NULL,
  "ngassubaccttitle" varchar(100) default NULL,
  "sreid" varchar(50) default NULL,
  "sretitle" varchar(100) default NULL,
  "sresubacctid" varchar(50) default NULL,
  "sresubaccttitle" varchar(100) default NULL,
  "fundid" varchar(50) default NULL,
  "fundname" varchar(150) default NULL,
  "amounttype" varchar(25) default NULL,
  "groupid" varchar(100) default NULL,
  PRIMARY KEY  ("objid"),
  -- UNIQUE KEY "ix_incomeacct_title" ("accttitle")
);

/*Table structure for table "incomeaccountgroup" */

CREATE TABLE "incomeaccountgroup" (
  "objid" varchar(100) NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "iraf" */

CREATE TABLE "iraf" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(10) NOT NULL,
  "docstate" varchar(25) NOT NULL,
  "txnno" varchar(50) NOT NULL,
  "txndate" datetime NULL default NULL,
  "preparedby" varchar(100) default NULL,
  "preparedbytitle" varchar(100) default NULL,
  "info" text NOT NULL,
  "requesteditems" text NOT NULL,
  "rcvitems" text,
  "rivid" varchar(50) default NULL,
  "rivno" varchar(50) default NULL,
  "rivrequestedby" varchar(100) default NULL,
  "rivrequestedbytitle" varchar(100) default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "iraf_list" */

CREATE TABLE "iraf_list" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(10) NOT NULL,
  "state" varchar(25) NOT NULL,
  "docno" varchar(25) default NULL,
  "docdate" date default NULL,
  "preparedby" varchar(50) NOT NULL,
  "rivno" varchar(25) NOT NULL,
  "rivdate" date NOT NULL,
  "rivrequester" varchar(50) NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "jobposition" */

CREATE TABLE "jobposition" (
  "objid" varchar(50) NOT NULL,
  "code" varchar(20) default NULL,
  "title" varchar(50) default NULL,
  "jobgroup" varchar(10) default NULL,
  "roleclass" varchar(50) default NULL,
  "role" varchar(50) default NULL,
  "excluded" text,
  "orgunitid" varchar(50) default NULL,
  "assigneeid" varchar(50) default NULL,
  "jobstatus" char(1) default NULL,
  PRIMARY KEY  ("objid")
  /*
  KEY "FK_jobposition" ("orgunitid"),
  KEY "FK_jobposition_roleclass" ("roleclass"),
  KEY "FK_jobposition_role" ("role"),
  KEY "FK_jobposition_personnel" ("assigneeid"),
  CONSTRAINT "FK_jobposition" FOREIGN KEY ("orgunitid") REFERENCES "orgunit" ("objid"),
  CONSTRAINT "FK_jobposition_assignee" FOREIGN KEY ("assigneeid") REFERENCES "personnel" ("objid"),
  CONSTRAINT "FK_jobposition_role" FOREIGN KEY ("role") REFERENCES "role" ("name")
  */
);

/*Table structure for table "jobposition_tag" */

CREATE TABLE "jobposition_tag" (
  "jobid" varchar(50) NOT NULL,
  "tagid" varchar(50) NOT NULL,
  PRIMARY KEY  ("jobid","tagid")
);

/*Table structure for table "kindofbuilding" */

CREATE TABLE "kindofbuilding" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(10) NOT NULL,
  "bldgcode" varchar(10) NOT NULL,
  "bldgkind" varchar(100) NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "landactualuseadjustment" */

CREATE TABLE "landactualuseadjustment" (
  "objid" varchar(50) NOT NULL,
  "adjustmentcode" varchar(10) NOT NULL,
  "adjustmentname" varchar(100) NOT NULL,
  "unit" varchar(50) default NULL,
  "appliedto" varchar(100) default NULL,
  "classifications" text,
  "expression" varchar(500) NOT NULL,
  "landrysettingid" varchar(50) NOT NULL,
  "previd" varchar(50) default NULL,
  "classids" varchar(500) default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "landadjustment" */

CREATE TABLE "landadjustment" (
  "objid" varchar(50) NOT NULL,
  "adjustmentcode" varchar(10) NOT NULL,
  "adjustmentname" varchar(100) NOT NULL,
  "classids" text,
  "classifications" text,
  "expression" varchar(1000) NOT NULL,
  "landrysettingid" varchar(50) NOT NULL,
  "appliedto" varchar(150) NOT NULL,
  "previd" varchar(50) default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "landassesslevel" */

CREATE TABLE "landassesslevel" (
  "objid" varchar(50) NOT NULL,
  "classcode" varchar(10) NOT NULL,
  "classname" varchar(100) NOT NULL,
  "fixrate" tinyint NOT NULL,
  "rate" decimal(10,2) NOT NULL,
  "previd" varchar(50) default NULL,
  "landrysettingid" varchar(50) NOT NULL,
  "ranges" text,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "landrysetting" */

CREATE TABLE "landrysetting" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(10) NOT NULL,
  "ry" int NOT NULL,
  "previd" varchar(50) default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "lcuv" */

CREATE TABLE "lcuv" (
  "objid" varchar(50) NOT NULL,
  "classcode" varchar(10) NOT NULL,
  "classname" varchar(100) NOT NULL,
  "landrysettingid" varchar(50) NOT NULL,
  "previd" varchar(50) default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "lcuvspecificclass" */

CREATE TABLE "lcuvspecificclass" (
  "objid" varchar(50) NOT NULL,
  "classcode" varchar(10) NOT NULL,
  "classname" varchar(100) NOT NULL,
  "areatype" varchar(10) NOT NULL,
  "lcuvid" varchar(50) NOT NULL,
  "previd" varchar(50) default NULL,
  "landrysettingid" varchar(50) NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "lcuvstripping" */

CREATE TABLE "lcuvstripping" (
  "objid" varchar(50) NOT NULL,
  "striplevel" int NOT NULL,
  "rate" decimal(10,2) NOT NULL,
  "lcuvid" varchar(50) NOT NULL,
  "previd" varchar(50) default NULL,
  "landrysettingid" varchar(50) NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "lcuvsubclass" */

CREATE TABLE "lcuvsubclass" (
  "objid" varchar(50) NOT NULL,
  "subclasscode" varchar(50) NOT NULL,
  "subclassname" varchar(50) NOT NULL,
  "unitvalue" decimal(10,2) NOT NULL,
  "specificclassid" varchar(50) NOT NULL,
  "previd" varchar(50) default NULL,
  "landrysettingid" varchar(50) NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "lgu" */

CREATE TABLE "lgu" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "docstate" varchar(10) NOT NULL,
  "lgutype" varchar(25) NOT NULL,
  "indexno" varchar(4) NOT NULL,
  "pin" varchar(25) NOT NULL,
  "lguname" varchar(50) NOT NULL,
  "formalname" varchar(50) NOT NULL,
  "parentid" varchar(50) default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "liquidation" */

CREATE TABLE "liquidation" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(20) NOT NULL,
  "docstate" varchar(20) NOT NULL,
  "dtposted" date NOT NULL,
  "info" text NOT NULL,
  "depositid" varchar(50) default NULL,
  "dtdeposited" date default NULL,
  "rcds" text,
  "opener" varchar(50) NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "liquidationlist" */

CREATE TABLE "liquidationlist" (
  "objid" varchar(50) NOT NULL,
  "docstate" varchar(50) NOT NULL,
  "txnno" varchar(20) NOT NULL,
  "txndate" date NOT NULL,
  "iyear" int NOT NULL,
  "iqtr" int NOT NULL,
  "imonth" int NOT NULL,
  "iday" int NOT NULL,
  "txndatetime" varchar(15) NOT NULL,
  "liquidatingofficerid" varchar(50) NOT NULL,
  "liquidatingofficername" varchar(100) NOT NULL,
  "liquidatingofficertitle" varchar(100) NOT NULL,
  "amount" decimal(10,2) default NULL,
  "totalcash" decimal(10,2) default NULL,
  "totalotherpayment" decimal(10,2) default NULL,
  "depositid" varchar(50) default NULL,
  "dtdeposited" date default NULL,
  "depositedbyid" varchar(50) default NULL,
  "depositedbyname" varchar(100) default NULL,
  "depositedbytitle" varchar(50) default NULL,
  "opener" varchar(50) NOT NULL,
  PRIMARY KEY  ("objid")
  /*
  KEY "ix_liquidationlist_period" ("iyear","iqtr","imonth"),
  CONSTRAINT "FK_liquidation" FOREIGN KEY ("objid") REFERENCES "liquidation" ("objid")
  */
);

/*Table structure for table "liquidationrcd" */

CREATE TABLE "liquidationrcd" (
  "objid" varchar(50) NOT NULL,
  "docstate" varchar(20) NOT NULL,
  "schemaname" varchar(25) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "liquidationid" varchar(50) NOT NULL,
  "liquidationno" varchar(25) NOT NULL,
  "liquidationdate" date NOT NULL,
  "lqofficerid" varchar(50) NOT NULL,
  "lqofficername" varchar(100) NOT NULL,
  "lqofficertitle" varchar(50) NOT NULL,
  "fundid" varchar(50) NOT NULL,
  "fundname" varchar(100) NOT NULL,
  "cashierid" varchar(50) NOT NULL,
  "cashiername" varchar(100) NOT NULL,
  "cashiertitle" varchar(50) NOT NULL,
  "cash" decimal(14,2) NOT NULL,
  "noncash" decimal(14,2) NOT NULL,
  "amount" decimal(14,2) NOT NULL,
  "denominations" text NOT NULL,
  "noncashpayments" text NOT NULL,
  "depositid" varchar(50) default NULL,
  "dtdeposited" date default NULL,
  PRIMARY KEY  ("objid")
  /*
  KEY "FK_liquidationrcd" ("liquidationid"),
  KEY "FK_liquidationrcd_fund" ("fundid"),
  KEY "lqofficerid" ("lqofficerid"),
  KEY "ix_liquidationrcd_cashierid" ("cashierid"),
  CONSTRAINT "FK_liquidationrcd" FOREIGN KEY ("liquidationid") REFERENCES "liquidation" ("objid"),
  CONSTRAINT "FK_liquidationrcd_fund" FOREIGN KEY ("fundid") REFERENCES "fund" ("objid")
  */
);

/*Table structure for table "lob" */

CREATE TABLE "lob" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(25) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "docstate" varchar(10) NOT NULL,
  "name" varchar(100) NOT NULL,
  "classificationid" varchar(50) NOT NULL,
  "classification" varchar(50) NOT NULL,
  "attributes" text,
  PRIMARY KEY  ("objid")
  /*
  UNIQUE KEY "ux_lob_name" ("name"),
  KEY "FK_lob" ("classificationid"),
  CONSTRAINT "FK_lob" FOREIGN KEY ("classificationid") REFERENCES "lobclassification" ("objid")
  */
);

/*Table structure for table "lobattribute" */

CREATE TABLE "lobattribute" (
  "objid" varchar(50) NOT NULL,
  "name" varchar(50) NOT NULL,
  "description" varchar(100) default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "lobclassification" */

CREATE TABLE "lobclassification" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(25) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "name" varchar(100) NOT NULL,
  "remarks" varchar(100) default NULL,
  PRIMARY KEY  ("objid")
  /*
  UNIQUE KEY "ux_lobclassification_name" ("name")
  */
);

/*Table structure for table "machassesslevel" */

CREATE TABLE "machassesslevel" (
  "objid" varchar(50) NOT NULL,
  "machrysettingid" varchar(50) NOT NULL,
  "code" varchar(10) NOT NULL,
  "name" varchar(50) NOT NULL,
  "fixrate" int NOT NULL,
  "rate" decimal(10,2) NOT NULL,
  "previd" varchar(50) default NULL,
  "ranges" text,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "machforex" */

CREATE TABLE "machforex" (
  "objid" varchar(50) NOT NULL,
  "machrysettingid" varchar(50) NOT NULL,
  "iyear" int NOT NULL,
  "forex" decimal(10,6) NOT NULL,
  "previd" varchar(50) default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "machines" */

CREATE TABLE "machines" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(10) NOT NULL,
  "machinecode" varchar(10) NOT NULL,
  "machinedesc" varchar(100) NOT NULL,
  "economiclife" int NOT NULL,
  "residualrate" decimal(10,2) NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "machrysetting" */

CREATE TABLE "machrysetting" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "ry" int NOT NULL,
  "previd" varchar(50) default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "materials" */

CREATE TABLE "materials" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(10) NOT NULL,
  "materialcode" varchar(10) NOT NULL,
  "materialdesc" varchar(100) NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "miscassesslevel" */

CREATE TABLE "miscassesslevel" (
  "objid" varchar(50) NOT NULL,
  "miscrysettingid" varchar(50) NOT NULL,
  "code" varchar(10) NOT NULL,
  "name" varchar(50) NOT NULL,
  "fixrate" int NOT NULL,
  "rate" decimal(10,2) NOT NULL,
  "previd" varchar(50) default NULL,
  "ranges" text,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "miscitems" */

CREATE TABLE "miscitems" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(10) NOT NULL,
  "misccode" varchar(10) NOT NULL,
  "miscdesc" varchar(100) NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "miscitemvalue" */

CREATE TABLE "miscitemvalue" (
  "objid" varchar(50) NOT NULL,
  "miscrysettingid" varchar(50) NOT NULL,
  "miscitemid" varchar(50) NOT NULL,
  "miscitemcode" varchar(10) NOT NULL,
  "miscitemname" varchar(100) NOT NULL,
  "expr" varchar(100) NOT NULL,
  "previd" varchar(50) default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "miscrysetting" */

CREATE TABLE "miscrysetting" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "ry" int NOT NULL,
  "previd" varchar(50) default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "municipal_taxpayer" */

CREATE TABLE "municipal_taxpayer" (
  "objid" varchar(50) NOT NULL,
  "lgu" varchar(50) NOT NULL,
  "taxpayerNo" varchar(15) default NULL,
  "name" varchar(500) NOT NULL,
  "address" varchar(100) NOT NULL,
  "mailAddress" varchar(100) default NULL,
  "provTaxpayerId" varchar(50) default NULL,
  "provTaxpayerNo" varchar(25) default NULL,
  "provTaxpayerName" varchar(500) default NULL,
  "provTaxpayerAddress" varchar(100) default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "noticeofassessment" */

CREATE TABLE "noticeofassessment" (
  "objid" varchar(50) NOT NULL,
  "docstate" varchar(25) NOT NULL,
  "docno" varchar(25) NOT NULL,
  "issuedate" date NOT NULL,
  "preparedby" varchar(50) NOT NULL,
  "taxpayername" varchar(1000) NOT NULL,
  "taxpayeraddress" varchar(100) NOT NULL,
  "preparedbytitle" varchar(50) NOT NULL,
  "approvedby" varchar(50) NOT NULL,
  "approvedbytitle" varchar(50) NOT NULL,
  "lgutype" varchar(25) NOT NULL,
  "parentlguname" varchar(50) NOT NULL,
  "lguname" varchar(50) NOT NULL,
  "dtdelivered" date default NULL,
  "receivedby" varchar(50) default NULL,
  "remarks" varchar(200) default NULL,
  "items" text,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "orgtype" */

CREATE TABLE "orgtype" (
  "name" varchar(50) NOT NULL,
  PRIMARY KEY  ("name")
);

/*Table structure for table "orgunit" */

CREATE TABLE "orgunit" (
  "objid" varchar(50) NOT NULL,
  "code" varchar(50) default NULL,
  "title" varchar(255) default NULL,
  "orgtype" varchar(50) default NULL,
  "parentid" varchar(50) default NULL,
  "system" smallint default NULL,
  "reftype" varchar(50) default NULL,
  "refid" varchar(50) default NULL,
  PRIMARY KEY  ("objid")
  /*
  KEY "FK_orgunit" ("orgtype"),
  CONSTRAINT "FK_orgunit" FOREIGN KEY ("orgtype") REFERENCES "orgtype" ("name")
  */
);

/*Table structure for table "paymentitem" */

CREATE TABLE "paymentitem" (
  "objid" varchar(50) NOT NULL,
  "receiptid" varchar(50) NOT NULL,
  "paytype" varchar(25) NOT NULL,
  "particulars" varchar(200) NOT NULL,
  "amount" decimal(10,2) NOT NULL,
  "extended" text,
  "liquidationid" varchar(50) default NULL,
  "liquidationrcdid" varchar(50) default NULL,
  PRIMARY KEY  ("objid")
  /*
  KEY "ix_paymentitem_rctid" ("receiptid"),
  KEY "ix_paymentitem_rctid_paytype" ("receiptid","paytype"),
  KEY "ix_paymentitem_receiptid" ("receiptid"),
  KEY "ix_paymentitem_liquidationid" ("liquidationid"),
  KEY "ix_paymentitem_liquidationrcdid" ("liquidationrcdid")
  */
);

/*Table structure for table "personnel" */

CREATE TABLE "personnel" (
  "objid" varchar(50) NOT NULL,
  "staffno" varchar(50) NOT NULL,
  "firstname" varchar(50) default NULL,
  "lastname" varchar(50) default NULL,
  "middlename" varchar(50) default NULL,
  "gender" char(1) default NULL,
  "birthdate" date default NULL,
  "birthplace" varchar(100) default NULL,
  "civilstatus" varchar(20) default NULL,
  "religion" varchar(20) default NULL,
  "citizenship" varchar(20) default NULL,
  "email" varchar(255) default NULL,
  "contactinfo" text,
  "primaryaddress" text,
  "secondaryaddress" text,
  "spouseinfo" text,
  PRIMARY KEY  ("objid"),
  -- UNIQUE KEY "staffno" ("staffno")
);

/*Table structure for table "pin" */

CREATE TABLE "pin" (
  "pin" varchar(30) NOT NULL,
  "claimno" varchar(10) NOT NULL,
  "docstate" varchar(25) NOT NULL,
  PRIMARY KEY  ("pin","claimno"),
  UNIQUE ("pin","claimno")
);

/*Table structure for table "plantsandtrees" */

CREATE TABLE "plantsandtrees" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(10) NOT NULL,
  "planttreecode" varchar(20) NOT NULL,
  "planttreedesc" varchar(100) NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "planttreerysetting" */

CREATE TABLE "planttreerysetting" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "ry" int NOT NULL,
  "applyagriadjustment" int NOT NULL,
  "previd" varchar(50) default NULL,
  "assesslevels" text NOT NULL,
  "planttreeunits" text NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "planttreeunitvalue" */

CREATE TABLE "planttreeunitvalue" (
  "objid" varchar(50) NOT NULL,
  "planttreerysettingid" varchar(50) NOT NULL,
  "planttreeid" varchar(50) NOT NULL,
  "planttreecode" varchar(10) NOT NULL,
  "planttreename" varchar(50) NOT NULL,
  "code" varchar(10) NOT NULL,
  "name" varchar(25) NOT NULL,
  "unitvalue" decimal(10,2) NOT NULL,
  "previd" varchar(50) default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "postcapture" */

CREATE TABLE "postcapture" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "docstate" varchar(25) NOT NULL,
  "dtposted" date NOT NULL,
  "collectorid" varchar(50) NOT NULL,
  "collectorname" varchar(75) NOT NULL,
  "collectortitle" varchar(25) NOT NULL,
  "postedbyid" varchar(50) NOT NULL,
  "postedbyname" varchar(75) NOT NULL,
  "postedbytitle" varchar(25) NOT NULL,
  "amount" decimal(12,2) NOT NULL,
  "summaries" text NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "profession" */

CREATE TABLE "profession" (
  "objid" varchar(100) NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "propertyclassification" */

CREATE TABLE "propertyclassification" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "propertycode" varchar(10) NOT NULL,
  "propertydesc" varchar(100) NOT NULL,
  "special" tinyint NOT NULL,
  "orderno" int NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "propertypayer" */

CREATE TABLE "propertypayer" (
  "objid" varchar(50) NOT NULL,
  "taxpayerid" varchar(50) NOT NULL,
  "taxpayername" varchar(100) NOT NULL,
  "taxpayeraddress" varchar(150) NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "propertypayeritem" */

CREATE TABLE "propertypayeritem" (
  "objid" varchar(50) NOT NULL,
  "propertypayerid" varchar(50) NOT NULL,
  "ledgerid" varchar(50) NOT NULL,
  PRIMARY KEY  ("objid"),
  UNIQUE ("propertypayerid","ledgerid")
);

/*Table structure for table "province_taxpayer" */

CREATE TABLE "province_taxpayer" (
  "objid" varchar(50) NOT NULL,
  "lgu" varchar(50) NOT NULL,
  "taxpayerNo" varchar(15) default NULL,
  "name" varchar(500) NOT NULL,
  "address" varchar(100) NOT NULL,
  "mailAddress" varchar(100) default NULL,
  "mappings" text,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "reassignedlgu" */

CREATE TABLE "reassignedlgu" (
  "objid" varchar(50) NOT NULL,
  "schemaName" varchar(50) NOT NULL,
  "schemaVersion" varchar(5) NOT NULL,
  "state" varchar(25) NOT NULL,
  "assignedFromId" varchar(50) NOT NULL,
  "assignedFrom" varchar(100) NOT NULL,
  "assignedToId" varchar(50) NOT NULL,
  "assignedTo" varchar(100) NOT NULL,
  "validUntil" date NOT NULL,
  "reason" varchar(200) NOT NULL,
  "municipalities" varchar(2500) NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "receipt" */

CREATE TABLE "receipt" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(100) NOT NULL,
  "schemaversion" varchar(25) NOT NULL,
  "docstate" varchar(25) NOT NULL,
  "doctype" varchar(50) NOT NULL,
  "opener" varchar(50) NOT NULL,
  "collectorid" varchar(50) NOT NULL,
  "remittanceid" varchar(50) default NULL,
  "remittanceno" varchar(25) default NULL,
  "remittancedate" date default NULL,
  "info" text NOT NULL,
  "items" text NOT NULL,
  "payments" text NOT NULL,
  "extended" text,
  "voided" int NOT NULL,
  "voidreason" varchar(50) default NULL,
  "capturedbyid" varchar(50) default NULL,
  PRIMARY KEY  ("objid")
  /*
  KEY "ix_receipt_remid" ("remittanceid"),
  KEY "ix_receipt_remno" ("remittanceno")
  */
);

/*Table structure for table "receiptitem" */

CREATE TABLE "receiptitem" (
  "objid" varchar(50) NOT NULL,
  "receiptid" varchar(50) NOT NULL,
  "acctid" varchar(50) NOT NULL,
  "acctno" varchar(25) default NULL,
  "accttitle" varchar(150) NOT NULL,
  "fundid" varchar(50) NOT NULL,
  "fundname" varchar(75) NOT NULL,
  "amount" decimal(10,2) NOT NULL,
  "remarks" varchar(100) default NULL,
  "extended" text,
  "refid" varchar(50) default NULL,
  "liquidationrcdid" varchar(50) default NULL,
  PRIMARY KEY  ("objid")
  /*
  KEY "ix_receiptitem_rctid" ("receiptid"),
  KEY "ix_receiptitem_acctid" ("acctid"),
  KEY "ix_receiptitem_accttitle" ("accttitle"),
  KEY "ix_receiptitem_liquidationrcdid" ("liquidationrcdid"),
  CONSTRAINT "FK_receiptitem" FOREIGN KEY ("acctid") REFERENCES "incomeaccount" ("objid")
  */
);

/*Table structure for table "receiptlist" */

CREATE TABLE "receiptlist" (
  "objid" varchar(50) NOT NULL,
  "docstate" varchar(25) NOT NULL,
  "doctype" varchar(25) NOT NULL,
  "opener" varchar(50) NOT NULL,
  "remittanceid" varchar(50) default NULL,
  "remittanceno" varchar(25) default NULL,
  "remittancedate" date default NULL,
  "txndate" date NOT NULL,
  "dtposted" datetime NOT NULL,
  "iyear" int NOT NULL,
  "iqtr" int NOT NULL,
  "imonth" int NOT NULL,
  "iday" int NOT NULL,
  "mode" varchar(25) NOT NULL,
  "afid" varchar(50) NOT NULL,
  "afcontrolid" varchar(50) NOT NULL,
  "serialno" varchar(25) default NULL,
  "stubno" varchar(25) NOT NULL,
  "collectiontypeid" varchar(50) NOT NULL,
  "collectiontype" varchar(50) NOT NULL,
  "collectorid" varchar(50) NOT NULL,
  "collectorname" varchar(100) NOT NULL,
  "collectortitle" varchar(50) NOT NULL,
  "payorid" varchar(50) default NULL,
  "payorname" varchar(500) NOT NULL,
  "payoraddress" varchar(200) default NULL,
  "paidby" varchar(500) NOT NULL,
  "paidbyaddress" varchar(200) default NULL,
  "amount" decimal(10,2) NOT NULL,
  "cash" decimal(10,2) NOT NULL,
  "otherpayment" decimal(10,2) NOT NULL,
  "voided" int NOT NULL,
  "voidreason" varchar(100) default NULL,
  "postcaptureid" varchar(50) default NULL,
  "capturedbyid" varchar(50) default NULL,
  "capturedbyname" varchar(100) default NULL,
  "capturedbytitle" varchar(50) default NULL,
  PRIMARY KEY  ("objid")
  /*
  KEY "ix_receiptlist_docstatecolid" ("collectorid","docstate"),
  KEY "ix_receiptlist_remid" ("remittanceid"),
  KEY "ix_receiptlist_remno" ("remittanceno"),
  KEY "ix_receiptlist_iyear" ("iyear"),
  KEY "ix_receiptlist_iqtr" ("iyear","iqtr"),
  KEY "ix_receiptlist_imonth" ("iyear","imonth"),
  KEY "ix_receiptlist_iday" ("iyear","imonth","iday"),
  KEY "ix_receiptlist_serialno" ("serialno"),
  KEY "ix_receiptlist_stubno" ("stubno"),
  KEY "ix_receiptlist_collectorname" ("collectorname"),
  KEY "ix_receiptlist_payorname" ("payorname"),
  KEY "ix_receiptlist_colidvoided" ("collectorid","voided"),
  KEY "ix_receiptlist_doctype_voided" ("doctype","voided")
  */
);

/*Table structure for table "remittance" */

CREATE TABLE "remittance" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(20) NOT NULL,
  "info" text NOT NULL,
  "docstate" varchar(20) NOT NULL,
  "dtposted" date NOT NULL,
  "liquidationid" varchar(50) default NULL,
  "liquidationno" varchar(20) default NULL,
  "liquidationdate" date default NULL,
  "liquidatingofficerid" varchar(50) NOT NULL,
  "collectorid" varchar(50) NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "remittancelist" */

CREATE TABLE "remittancelist" (
  "objid" varchar(50) NOT NULL,
  "docstate" varchar(20) NOT NULL,
  "txnno" varchar(20) NOT NULL,
  "txndate" date NOT NULL,
  "collectorname" varchar(50) NOT NULL,
  "amount" decimal(10,2) default NULL,
  "collectorid" varchar(50) NOT NULL,
  "collectortitle" varchar(50) default NULL,
  "totalcash" decimal(10,2) default NULL,
  "totalotherpayment" decimal(10,2) default NULL,
  "liquidationid" varchar(50) default NULL,
  "txntimestamp" varchar(10) default NULL,
  "liquidationno" varchar(15) default NULL,
  "liquidationdate" date default NULL,
  "liquidatingofficerid" varchar(50) default NULL,
  "liquidatingofficername" varchar(50) default NULL,
  "liquidatingofficertitle" varchar(50) default NULL,
  PRIMARY KEY  ("objid")
  /*
  KEY "ix_remittancelist_liquidationid" ("liquidationid"),
  KEY "ix_liquidatingofficerid" ("liquidatingofficerid"),
  KEY "ix_liquidatingofficerid_txndate" ("liquidatingofficerid","txndate"),
  CONSTRAINT "FK_remittancelist" FOREIGN KEY ("objid") REFERENCES "remittance" ("objid")
  */
);

/*Table structure for table "remittedform" */

CREATE TABLE "remittedform" (
  "objid" varchar(50) NOT NULL,
  "afcontrolid" varchar(50) NOT NULL,
  "afid" varchar(50) NOT NULL,
  "receivedfrom" varchar(50) default NULL,
  "receivedto" varchar(50) default NULL,
  "receivedqty" int default NULL,
  "beginfrom" varchar(50) default NULL,
  "beginto" varchar(50) default NULL,
  "beginqty" int default NULL,
  "issuedfrom" varchar(50) default NULL,
  "issuedto" varchar(50) default NULL,
  "issuedqty" int default NULL,
  "endingfrom" varchar(50) default NULL,
  "endingto" varchar(50) default NULL,
  "endingqty" int default NULL,
  "remittanceid" varchar(50) NOT NULL,
  "stubno" varchar(20) NOT NULL,
  "aftype" varchar(10) default NULL,
  PRIMARY KEY  ("objid")
  /*
  KEY "FK_remittance" ("remittanceid"),
  KEY "FK_afcontrol" ("afcontrolid"),
  KEY "FK_af" ("afid"),
  CONSTRAINT "FK_af" FOREIGN KEY ("afid") REFERENCES "af" ("objid"),
  CONSTRAINT "FK_afcontrol" FOREIGN KEY ("afcontrolid") REFERENCES "afcontrol" ("objid"),
  CONSTRAINT "FK_remittance" FOREIGN KEY ("remittanceid") REFERENCES "remittance" ("objid")
  */
);

/*Table structure for table "requirements" */

CREATE TABLE "requirements" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(10) NOT NULL,
  "reqcode" varchar(20) NOT NULL,
  "reqname" varchar(100) NOT NULL,
  "reqdesc" varchar(1000) default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "revenue" */

CREATE TABLE "revenue" (
  "objid" varchar(50) NOT NULL,
  "docstate" varchar(25) NOT NULL,
  "remittanceid" varchar(50) NOT NULL,
  "remittanceno" varchar(20) NOT NULL,
  "remittancedate" datetime NOT NULL,
  "remittancetimestamp" varchar(12) NOT NULL,
  "liquidationid" varchar(50) default NULL,
  "liquidationno" varchar(20) default NULL,
  "liquidationdate" datetime default NULL,
  "liquidationtimestamp" varchar(12) default NULL,
  "depositid" varchar(50) default NULL,
  "depositno" varchar(20) default NULL,
  "depositdate" datetime default NULL,
  "deposittimestamp" varchar(12) default NULL,
  "collectorid" varchar(50) NOT NULL,
  "collectorname" varchar(70) NOT NULL,
  "collectortitle" varchar(50) NOT NULL,
  "receipttype" varchar(50) NOT NULL,
  "receiptid" varchar(50) NOT NULL,
  "receiptdate" datetime NOT NULL,
  "receiptamount" decimal(14,2) NOT NULL,
  "receiptitemid" varchar(50) NOT NULL,
  "afid" varchar(10) NOT NULL,
  "afcontrolid" varchar(50) NOT NULL,
  "stubno" varchar(15) default NULL,
  "serialno" varchar(50) default NULL,
  "payorname" varchar(500) default NULL,
  "payoraddress" varchar(150) default NULL,
  "acctid" varchar(50) NOT NULL,
  "acctno" varchar(50) default NULL,
  "accttitle" varchar(250) NOT NULL,
  "fundid" varchar(50) NOT NULL,
  "fundname" varchar(50) NOT NULL,
  "ngasid" varchar(50) default '',
  "sreid" varchar(50) default '',
  "amount" decimal(14,2) default NULL,
  "voided" int(11) NOT NULL,
  "liquidationrcdid" varchar(50) default NULL,
  PRIMARY KEY  ("objid")
  /*
  KEY "FK_revenue_liquidation" ("liquidationid"),
  KEY "FK_revenue_remittance" ("remittanceid"),
  KEY "FK_revenue_deposit" ("depositid"),
  KEY "FK_revenue_incomeaccount" ("acctid"),
  KEY "FK_revenue_ngas" ("ngasid"),
  KEY "FK_revenue_sre" ("sreid"),
  KEY "FK_revenue_receipt" ("receiptid"),
  KEY "FK_revenue_af" ("afid"),
  KEY "FK_revenue_afcontrol" ("afcontrolid"),
  KEY "ix_revenue_liquidationtimestamp_voided" ("liquidationtimestamp","voided"),
  KEY "ix_revenue_liquidationtimestamp" ("liquidationtimestamp"),
  KEY "ix_revenue_liquidationrcdid" ("liquidationrcdid"),
  CONSTRAINT "FK_revenue_af" FOREIGN KEY ("afid") REFERENCES "af" ("objid"),
  CONSTRAINT "FK_revenue_afcontrol" FOREIGN KEY ("afcontrolid") REFERENCES "afcontrol" ("objid"),
  CONSTRAINT "FK_revenue_deposit" FOREIGN KEY ("depositid") REFERENCES "deposit" ("objid"),
  CONSTRAINT "FK_revenue_incomeaccount" FOREIGN KEY ("acctid") REFERENCES "incomeaccount" ("objid"),
  CONSTRAINT "FK_revenue_liquidation" FOREIGN KEY ("liquidationid") REFERENCES "liquidation" ("objid"),
  CONSTRAINT "FK_revenue_ngas" FOREIGN KEY ("ngasid") REFERENCES "account" ("objid"),
  CONSTRAINT "FK_revenue_remittance" FOREIGN KEY ("remittanceid") REFERENCES "remittance" ("objid"),
  CONSTRAINT "FK_revenue_sre" FOREIGN KEY ("sreid") REFERENCES "account" ("objid")
  */
);


/*Table structure for table "riv" */

CREATE TABLE "riv" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "docstate" varchar(25) default NULL,
  "rivtype" varchar(255) default NULL,
  "txnno" varchar(25) default NULL,
  "txndate" date default NULL,
  "requestedby" varchar(75) NOT NULL,
  "requestedbytitle" varchar(50) NOT NULL,
  "info" text NOT NULL,
  "items" text NOT NULL,
  PRIMARY KEY ("objid")
);

/*Table structure for table "role" */

CREATE TABLE "role" (
  "name" varchar(50) NOT NULL,
  "description" varchar(50) default NULL,
  "roleclass" varchar(20) NOT NULL,
  "included" text,
  "system" smallint default '0',
  PRIMARY KEY  ("name","roleclass")
  /*
  KEY "FK_role" ("roleclass")
  */
);

/*Table structure for table "rptcertification" */

CREATE TABLE "rptcertification" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(30) default '',
  "schemaversion" varchar(30) default '',
  "taxpayerid" varchar(50) default NULL,
  "taxpayername" varchar(300) default NULL,
  "taxpayeraddress" varchar(100) default NULL,
  "requestedby" varchar(50) default NULL,
  "purpose" varchar(100) default NULL,
  "certifiedby" varchar(100) default NULL,
  "certifiedbytitle" varchar(100) default NULL,
  "byauthority" varchar(100) default NULL,
  "official" tinyint default NULL,
  "orno" varchar(30) default NULL,
  "ordate" date default NULL,
  "oramount" decimal(10,2) default NULL,
  "stampamount" decimal(10,2) default NULL,
  "items" text,
  "opener" varchar(20) default NULL,
  "extended" text,
  "docno" varchar(25) NOT NULL,
  "title" varchar(50) NOT NULL,
  "tdno" varchar(25) default NULL,
  "faasid" varchar(50) default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "rptledger" */

CREATE TABLE "rptledger" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(25) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "docstate" varchar(25) NOT NULL,
  "fullpin" varchar(30) NOT NULL,
  "claimno" varchar(25) NOT NULL,
  "faasid" varchar(50) NOT NULL,
  "rputype" varchar(15) NOT NULL,
  "classid" varchar(50) NOT NULL,
  "classcode" varchar(10) NOT NULL,
  "actualuseid" varchar(50) default NULL,
  "actualusecode" varchar(10) default NULL,
  "tdno" varchar(30) NOT NULL,
  "prevtdno" varchar(300) default NULL,
  "cadastrallotno" varchar(200) NOT NULL,
  "blockno" varchar(25) default NULL,
  "barangay" varchar(75) NOT NULL,
  "txntype" varchar(5) NOT NULL,
  "taxable" int NOT NULL,
  "assessedvalue" decimal(14,2) NOT NULL,
  "taxpayerid" varchar(50) NOT NULL,
  "taxpayerno" varchar(25) NOT NULL,
  "taxpayername" varchar(500) NOT NULL,
  "taxpayeraddress" varchar(100) NOT NULL,
  "administratorid" varchar(50) default NULL,
  "administratorno" varchar(25) default NULL,
  "administratorname" varchar(100) default NULL,
  "administratoraddress" varchar(100) default NULL,
  "lastyearpaid" int NOT NULL,
  "lastqtrpaid" int NOT NULL,
  "partialbasic" decimal(10,2) NOT NULL,
  "partialsef" decimal(10,2) NOT NULL,
  "firstqtrpaidontime" int NOT NULL,
  "partialbasicint" decimal(12,2) NOT NULL,
  "partialsefint" decimal(12,2) NOT NULL,
  PRIMARY KEY  ("objid"),
  UNIQUE ("fullpin","claimno")
  /*
  KEY "ix_rptledger_docstate" ("docstate"),
  KEY "ix_rptledger_tdnostate" ("tdno","docstate"),
  KEY "ix_rptledger_prevtdnostate" ("prevtdno","docstate"),
  KEY "ix_rptledger_lotstate" ("cadastrallotno","docstate"),
  KEY "ix_rptledger_brgystate" ("barangay","docstate"),
  KEY "ix_rptledger_tpaynostate" ("taxpayerno","docstate"),
  KEY "ix_rptledger_namestate" ("taxpayername","docstate"),
  KEY "ix_rptledger_faasid" ("faasid")
  */
);

/*Table structure for table "rptledgeritem" */

CREATE TABLE "rptledgeritem" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "docstate" varchar(25) NOT NULL,
  "parentid" varchar(50) NOT NULL,
  "faasid" varchar(50) default NULL,
  "tdno" varchar(30) NOT NULL,
  "txntype" varchar(5) NOT NULL,
  "classid" varchar(50) NOT NULL,
  "classcode" varchar(5) NOT NULL,
  "actualuseid" varchar(50) default NULL,
  "actualusecode" varchar(5) default NULL,
  "taxable" int NOT NULL,
  "backtax" int NOT NULL,
  "fromyear" int NOT NULL,
  "toyear" int NOT NULL,
  "assessedvalue" decimal(14,2) NOT NULL,
  "systemcreated" int NOT NULL,
  PRIMARY KEY  ("objid")
  /*
  KEY "ix_rptledger_parentid" ("parentid"),
  KEY "ix_rptledger_tdno" ("tdno")
  */
);

/*Table structure for table "rptparameters" */

CREATE TABLE "rptparameters" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(10) NOT NULL,
  "paramname" varchar(100) NOT NULL,
  "paramcaption" varchar(100) NOT NULL,
  "paramdesc" varchar(1000) default NULL,
  "paramtype" varchar(20) NOT NULL,
  "parammin" decimal(10,2) default NULL,
  "parammax" decimal(10,2) default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "rptpayment" */

CREATE TABLE "rptpayment" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "rptledgerid" varchar(50) NOT NULL,
  "opener" varchar(50) NOT NULL,
  "mode" varchar(10) NOT NULL,
  "dtposted" datetime NOT NULL,
  "receiptid" varchar(50) default NULL,
  "receiptdate" date default NULL,
  "receiptno" varchar(25) NOT NULL,
  "collectorid" varchar(50) default NULL,
  "collectorname" varchar(50) default NULL,
  "collectortitle" varchar(50) default NULL,
  "capturedby" varchar(30) default NULL,
  "particulars" varchar(50) default NULL,
  "voided" int NOT NULL,
  "period" varchar(50) default NULL,
  "revtype" varchar(15) default NULL,
  "fromyear" int NOT NULL,
  "fromqtr" int NOT NULL,
  "toyear" int NOT NULL,
  "toqtr" int NOT NULL,
  "basic" decimal(14,2) NOT NULL,
  "basicint" decimal(14,2) NOT NULL,
  "basicdisc" decimal(14,2) NOT NULL,
  "basicpartial" decimal(14,2) NOT NULL,
  "sef" decimal(14,2) NOT NULL,
  "sefint" decimal(14,2) NOT NULL,
  "sefdisc" decimal(14,2) NOT NULL,
  "sefpartial" decimal(14,2) NOT NULL,
  "collectingagency" varchar(100) default NULL,
  "collectingagencyid" varchar(50) default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "rptpaymentdetail" */

CREATE TABLE "rptpaymentdetail" (
  "objid" varchar(50) NOT NULL,
  "receiptid" varchar(50) NOT NULL,
  "rptledgerid" varchar(50) NOT NULL,
  "year" int NOT NULL,
  "qtr" int NOT NULL,
  "basic" decimal(14,2) NOT NULL,
  "basicint" decimal(14,2) NOT NULL,
  "basicdisc" decimal(14,2) NOT NULL,
  "basicpartial" decimal(14,2) NOT NULL,
  "sef" decimal(14,2) NOT NULL,
  "sefint" decimal(14,2) NOT NULL,
  "sefdisc" decimal(14,2) NOT NULL,
  "sefpartial" decimal(14,2) NOT NULL,
  "revtype" varchar(15) default NULL,
  "rptledgeritemid" varchar(50) default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "rptpaymentmanual" */

CREATE TABLE "rptpaymentmanual" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "receiptid" varchar(50) NOT NULL,
  "taxpayername" varchar(1000) NOT NULL,
  "taxpayeraddress" varchar(100) NOT NULL,
  "tdno" varchar(30) NOT NULL,
  "fullpin" varchar(25) default NULL,
  "cadastrallotno" varchar(100) NOT NULL,
  "barangay" varchar(50) default NULL,
  "classcode" varchar(10) default NULL,
  "rputype" varchar(15) default NULL,
  "assessedvalue" decimal(16,2) NOT NULL,
  "period" varchar(30) default NULL,
  "fromyear" int NOT NULL,
  "fromqtr" int NOT NULL,
  "toyear" int NOT NULL,
  "toqtr" int NOT NULL,
  "basic" decimal(14,2) NOT NULL,
  "basicdisc" decimal(14,2) NOT NULL,
  "basicint" decimal(14,2) NOT NULL,
  "basicprev" decimal(14,2) NOT NULL,
  "basicprevint" decimal(14,2) NOT NULL,
  "basicprior" decimal(14,2) NOT NULL,
  "basicpriorint" decimal(14,2) NOT NULL,
  "sef" decimal(14,2) NOT NULL,
  "sefdisc" decimal(14,2) NOT NULL,
  "sefint" decimal(14,2) NOT NULL,
  "sefprev" decimal(14,2) NOT NULL,
  "sefprevint" decimal(14,2) NOT NULL,
  "sefprior" decimal(14,2) NOT NULL,
  "sefpriorint" decimal(14,2) NOT NULL,
  "basicgross" decimal(16,2) NOT NULL,
  "basicnet" decimal(16,2) NOT NULL,
  "basicdp" decimal(16,2) NOT NULL,
  "sefgross" decimal(16,2) NOT NULL,
  "sefnet" decimal(16,2) NOT NULL,
  "sefdp" decimal(16,2) NOT NULL,
  "amount" decimal(16,2) NOT NULL,
  "municity" varchar(200) NOT NULL,
  "municityid" varchar(50) NOT NULL,
  "municityname" varchar(100) NOT NULL,
  PRIMARY KEY  ("objid")
  /*
  KEY "ix_rptpaymentmanual_receiptid" ("receiptid")
  */
);

/*Table structure for table "rptsetting" */

CREATE TABLE "rptsetting" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "ry" int NOT NULL,
  "ordinanceno" varchar(30) default NULL,
  "ordinancedate" varchar(20) default NULL,
  "roundadjmarketvalue" smallint NOT NULL,
  "allowlandcancellation" smallint NOT NULL,
  "usenewtdprintout" smallint NOT NULL,
  "landreportbasedonactualuse" smallint NOT NULL,
  "allowtransferwithbalance" smallint NOT NULL,
  "allowcorrectionwithbalance" smallint NOT NULL,
  "allowdepreciationwithbalance" smallint NOT NULL,
  "allowchangetaxabilitywithbalance" smallint NOT NULL,
  "allowsubdivisionwithbalance" smallint NOT NULL,
  "allowconsolidationwithbalance" smallint NOT NULL,
  "allowreclasswithbalance" smallint NOT NULL,
  "approvedmvbelow" decimal(10,2) default NULL,
  "agriculturalid" varchar(50) default NULL,
  "agriculturaltitle" varchar(100) default NULL,
  "adjustplanttree" smallint NOT NULL,
  "propertyclassifications" text,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "session_history" */

CREATE TABLE "session_history" (
  "sessionid" varchar(50) NOT NULL,
  "timein" datetime default NULL,
  "uid" varchar(50) default NULL,
  "timeout" datetime default NULL,
  "status" varchar(255) default NULL,
  PRIMARY KEY  ("sessionid")
);

/*Table structure for table "structures" */

CREATE TABLE "structures" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(10) NOT NULL,
  "structurecode" varchar(10) NOT NULL,
  "structuredesc" varchar(100) NOT NULL,
  "materials" text,
  "indexno" int default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "structuretemplate" */

CREATE TABLE "structuretemplate" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(10) NOT NULL,
  "templatecode" varchar(10) NOT NULL,
  "structures" text,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "subdivision" */

CREATE TABLE "subdivision" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "docstate" varchar(25) NOT NULL,
  "ry" int NOT NULL,
  "txntype" varchar(5) NOT NULL,
  "autonumber" int NOT NULL,
  "issuedate" date NOT NULL,
  "effectivityyear" int NOT NULL,
  "effectivityqtr" int NOT NULL,
  "memoranda" text NOT NULL,
  "motherfaasid" varchar(50) NOT NULL,
  "mothertdno" varchar(25) NOT NULL,
  "motherpin" varchar(25) NOT NULL,
  "motherclasscode" varchar(10) NOT NULL,
  "mothertaxpayername" varchar(500) NOT NULL,
  "mothercadastrallotno" varchar(100) NOT NULL,
  "mothersurveyno" varchar(50) default NULL,
  "mothermv" decimal(14,2) NOT NULL,
  "motherav" decimal(14,2) NOT NULL,
  "motherareasqm" decimal(16,6) NOT NULL,
  "motherareaha" decimal(16,6) NOT NULL,
  "subdivisioncount" int NOT NULL,
  "affectedrpucount" int NOT NULL,
  "appraisedby" varchar(50) default NULL,
  "appraisedbytitle" varchar(50) default NULL,
  "dtappraised" date default NULL,
  "recommendedby" varchar(50) default NULL,
  "recommendedbytitle" varchar(50) default NULL,
  "dtrecommended" date default NULL,
  "approvedby" varchar(50) default NULL,
  "approvedbytitle" varchar(50) default NULL,
  "dtapproved" date default NULL,
  "extended" text,
  "docno" varchar(10) default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "subdivisionaffectedrpu" */

CREATE TABLE "subdivisionaffectedrpu" (
  "objid" varchar(50) NOT NULL,
  "subdivisionid" varchar(50) NOT NULL,
  "itemno" varchar(5) default NULL,
  "rputype" varchar(10) NOT NULL,
  "prevfaasid" varchar(50) NOT NULL,
  "prevtdno" varchar(25) NOT NULL,
  "prevfullpin" varchar(25) NOT NULL,
  "newtdno" varchar(25) default NULL,
  "subdivisionlandid" varchar(50) default NULL,
  "newpin" varchar(25) default NULL,
  "newsuffix" int default NULL,
  "memoranda" text,
  "newfaasid" varchar(50) default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "subdivisionland" */

CREATE TABLE "subdivisionland" (
  "objid" varchar(50) NOT NULL,
  "subdivisionid" varchar(50) NOT NULL,
  "newtdno" varchar(25) default NULL,
  "newpin" varchar(25) NOT NULL,
  "newtitletype" varchar(25) default NULL,
  "newtitleno" varchar(50) default NULL,
  "newtitledate" date default NULL,
  "areasqm" decimal(16,6) NOT NULL,
  "areaha" decimal(16,6) NOT NULL,
  "memoranda" text NOT NULL,
  "taxpayerid" varchar(50) default NULL,
  "taxpayerno" varchar(25) default NULL,
  "taxpayername" varchar(500) default NULL,
  "taxpayeraddress" varchar(100) default NULL,
  "rp" text NOT NULL,
  "rpu" text NOT NULL,
  "newfaasid" varchar(50) default NULL,
  "extended" text,
  "itemno" int default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "sys_inbox" */

CREATE TABLE "sys_inbox" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "fromlguindex" varchar(10) NOT NULL,
  "fromlguname" varchar(50) NOT NULL,
  "tolguindex" varchar(20) NOT NULL,
  "tolguname" varchar(50) NOT NULL,
  "dtsent" datetime NOT NULL,
  "sentby" varchar(50) NOT NULL,
  "sentbytitle" varchar(50) NOT NULL,
  "action" varchar(50) NOT NULL,
  "data" text NOT NULL,
  "message" text,
  "refid" varchar(50) NOT NULL,
  "stacktrace" text,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "sys_outbox" */

CREATE TABLE "sys_outbox" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "fromlguindex" varchar(20) NOT NULL,
  "fromlguname" varchar(50) NOT NULL,
  "tolguindex" varchar(20) NOT NULL,
  "tolguname" varchar(50) NOT NULL,
  "dtsent" datetime NOT NULL,
  "sentby" varchar(50) NOT NULL,
  "sentbytitle" varchar(50) NOT NULL,
  "action" varchar(50) NOT NULL,
  "data" text NOT NULL,
  "message" text,
  "refid" varchar(50) NOT NULL,
  "stacktrace" text,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "sys_processedinbox" */

CREATE TABLE "sys_processedinbox" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "fromlguindex" varchar(10) NOT NULL,
  "fromlguname" varchar(50) NOT NULL,
  "tolguindex" varchar(20) NOT NULL,
  "tolguname" varchar(50) NOT NULL,
  "dtsent" datetime NOT NULL,
  "sentby" varchar(50) NOT NULL,
  "sentbytitle" varchar(50) NOT NULL,
  "action" varchar(50) NOT NULL,
  "data" text NOT NULL,
  "message" text,
  "refid" varchar(50) NOT NULL,
  "stacktrace" text,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "sys_processedoutbox" */

CREATE TABLE "sys_processedoutbox" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "fromlguindex" varchar(20) NOT NULL,
  "fromlguname" varchar(50) NOT NULL,
  "tolguindex" varchar(20) NOT NULL,
  "tolguname" varchar(50) NOT NULL,
  "dtsent" datetime NOT NULL,
  "sentby" varchar(50) NOT NULL,
  "sentbytitle" varchar(50) NOT NULL,
  "action" varchar(50) NOT NULL,
  "data" text NOT NULL,
  "message" text,
  "refid" varchar(50) NOT NULL,
  "stacktrace" text,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "terminal" */

CREATE TABLE "terminal" (
  "terminalid" varchar(50) NOT NULL,
  "macaddress" varchar(50) default NULL,
  "dtregistered" datetime default NULL,
  "registeredby" varchar(50) default NULL,
  "info" text,
  "state" int default NULL,
  PRIMARY KEY  ("terminalid")
  -- UNIQUE ("macaddress")
);

/*Table structure for table "test" */

CREATE TABLE "test" (
  "objid" varchar(10) NOT NULL,
  "val1" varchar(10) NOT NULL,
  "val2" varchar(10) NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "timezone" */

CREATE TABLE "timezone" (
  "timezone" varchar(50) NOT NULL default '',
  "country" varchar(5) default NULL,
  PRIMARY KEY  ("timezone")
);

/*Table structure for table "truecopy" */

CREATE TABLE "truecopy" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(10) NOT NULL,
  "txnno" varchar(50) default NULL,
  "issuedate" varchar(20) NOT NULL,
  "requestedby" varchar(100) NOT NULL,
  "requestedbyaddress" varchar(150) NOT NULL,
  "orno" varchar(50) NOT NULL,
  "ordate" varchar(50) NOT NULL,
  "oramount" decimal(10,2) NOT NULL,
  "purpose" varchar(500) NOT NULL,
  "issuedby" varchar(100) default NULL,
  "issuedtitle" varchar(50) default NULL,
  "certifiedby" varchar(100) NOT NULL,
  "certifiedbytitle" varchar(50) NOT NULL,
  "authority" varchar(100) NOT NULL,
  "faasid" varchar(50) NOT NULL,
  "tdno" varchar(50) NOT NULL,
  "faasinfo" text NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "txninfo" */

CREATE TABLE "txninfo" (
  "objid" varchar(50) NOT NULL,
  "lastupdate" datetime NOT NULL default GETDATE(),
  "lastupdateby" varchar(50) default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "txnlog" */

CREATE TABLE "txnlog" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "versionno" varchar(5) NOT NULL,
  "ref" varchar(100) NOT NULL,
  "refid" varchar(500) NOT NULL,
  "txndate" datetime NOT NULL,
  "action" varchar(50) NOT NULL,
  "userid" varchar(50) NOT NULL,
  "remarks" varchar(500) default NULL,
  "diff" text,
  PRIMARY KEY  ("objid")
  -- KEY "ix_txnlog_refid" ("refid")
);

/*Table structure for table "txnreference" */

CREATE TABLE "txnreference" (
  "objid" varchar(50) NOT NULL,
  "refid" varchar(50) NOT NULL,
  "refname" varchar(255) NOT NULL,
  "message" text NOT NULL,
  "txndate" date default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "txnrequirements" */

CREATE TABLE "txnrequirements" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(10) NOT NULL,
  "txntypeid" varchar(50) NOT NULL,
  "txntype" varchar(100) NOT NULL,
  "requirements" text,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "txntypes" */

CREATE TABLE "txntypes" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(10) NOT NULL,
  "txntype" varchar(100) NOT NULL,
  "used" smallint NOT NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "useraccount" */

CREATE TABLE "useraccount" (
  "objid" varchar(50) NOT NULL,
  "uid" varchar(50) NOT NULL,
  "pwd" varchar(50) NOT NULL default '',
  "usertype" varchar(50) default NULL,
  "firstname" varchar(50) default NULL,
  "lastname" varchar(50) default NULL,
  "middlename" varchar(50) default NULL,
  "email" varchar(100) default NULL,
  PRIMARY KEY  ("objid"),
  UNIQUE ("uid")
);

/*Table structure for table "variable" */

CREATE TABLE "variable" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(20) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "name" varchar(50) NOT NULL,
  "datatype" varchar(20) NOT NULL,
  "caption" varchar(50) NOT NULL,
  "description" varchar(100) default NULL,
  "arrayvalues" text,
  "printtopermit" int default NULL,
  PRIMARY KEY  ("objid"),
  UNIQUE ("name")
);

/*Table structure for table "webdraft" */

CREATE TABLE "webdraft" (
  "objid" varchar(50) NOT NULL,
  "description" varchar(100) default NULL,
  "owner" varchar(50) default NULL,
  "refid" varchar(50) default NULL,
  "info" text,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "wf_task" */

CREATE TABLE "wf_task" (
  "objid" varchar(50) NOT NULL,
  "dtposted" datetime default NULL,
  "requesterid" varchar(50) default NULL,
  "info" text,
  "msgtype" varchar(50) default NULL,
  "handler" varchar(50) default NULL,
  PRIMARY KEY  ("objid")
);

/*Table structure for table "wf_task_actor" */

CREATE TABLE "wf_task_actor" (
  "objid" varchar(50) NOT NULL,
  "taskid" varchar(50) default NULL,
  "actorid" varchar(50) default NULL,
  PRIMARY KEY  ("objid"),
  -- KEY "FK_wf_task_actor" ("taskid"),
  -- CONSTRAINT "FK_wf_task_actor" FOREIGN KEY ("taskid") REFERENCES "wf_task" ("objid")
);

/*Table structure for table "individualentity" */

/*!50001 DROP VIEW IF EXISTS "individualentity" */;
/*!50001 DROP TABLE IF EXISTS "individualentity" */;

/*!50001 CREATE TABLE "individualentity" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(100) NOT NULL,
  "schemaversion" varchar(10) NOT NULL,
  "entityno" varchar(10) NOT NULL,
  "entityname" varchar(500) NOT NULL,
  "entityaddress" varchar(100) NOT NULL,
  "mailingaddress" varchar(100) default NULL,
  "entitytype" varchar(25) NOT NULL,
  "info" text NOT NULL,
  "sys_lastupdate" varchar(25) default NULL,
  "sys_lastupdateby" varchar(50) default NULL,
  "remarks" varchar(100) default NULL,
  "contactno" varchar(20) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

