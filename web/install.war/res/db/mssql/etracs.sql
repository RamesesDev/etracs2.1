/*Table structure for table "account" */

CREATE DATABASE @dbname;

USE @dbname;

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
  PRIMARY KEY  ("objid")
  -- UNIQUE KEY "ux_title_parentid" ("accttitle","parentid")
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
  "description" varchar(100) default NULL,
  "aftype" varchar(10) NOT NULL,
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
  -- KEY "ix_afcontrol_collectorid" ("collectorid"),
  -- KEY "ix_afcontrol_collectorname" ("collectorname"),
  -- KEY "ix_afcontrol_afid" ("afid"),
  -- KEY "ix_afcontrol_colid_afid" ("collectorid","afid"),
  -- KEY "ix_afcontrol_colafstatemode" ("collectorid","afid","docstate","mode")
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
) ;

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
) ;

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
) ;

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
) ;

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
  -- KEY "ix_batchcapture_state" ("docstate"),
  -- KEY "ix_batchcapture_colname" ("collectorname"),
  -- KEY "ix_batchcapture_encodedby" ("encodedby")
);

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
) ;

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
) ;

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
) ;

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
) ;

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
) ;

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
  -- KEY "ix_bpapplication_docstate" ("docstate"),
  -- KEY "ix_bpapplication_businesid" ("businessid"),
  -- KEY "ix_bpapplication_businesid_docstate" ("businessid","docstate"),
  -- KEY "ix_bpapplication_txnno" ("txnno"),
  -- KEY "ix_bpapplication_tradename" ("tradename"),
  -- KEY "ix_bpapplication_barcode" ("barcode")
);

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
  -- KEY "ix_bpapplicationlisting_businessid" ("businessid"),
  -- KEY "ix_bpapplicationlisting_tradename" ("tradename"),
  -- KEY "ix_bpapplicationlisting_docstate" ("docstate"),
  -- KEY "ix_bpapplicationlisting_txnno" ("txnno"),
  -- KEY "ix_bpapplicationlisting_businesid_docstate" ("businessid","docstate"),
  -- KEY "ix_bpapplicationlisting_tradenamedocstate" ("tradename","docstate"),
  -- KEY "ix_bpapplicationlisting_taxpayernamedocstate" ("taxpayername","docstate"),
  -- KEY "ix_bpapplicationlisting_bindocstate" ("bin","docstate"),
  -- KEY "ix_bpapplicationlisting_txnnodocstate" ("txnno","docstate"),
  -- KEY "ix_bpapplicationlisting_barcode" ("barcode"),
  -- KEY "ix_bpapplicationlisting_sym" ("docstate","iyear","txnmode")
);

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
  -- KEY "ix_bploblisting_appid" ("applicationid")
);

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
  -- KEY "ix_bppayment_applicationid" ("applicationid"),
  -- KEY "ix_bppayment_txndate" ("txndate"),
  -- KEY "ix_bppayment_receiptid" ("receiptid")
);

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
  -- KEY "ix_bppermit_businessid" ("businessid"),
  -- KEY "ix_bppermit_appid" ("applicationid")
);

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
) ;

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
) ;

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
  "objid" varchar(32) NOT NULL,
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
  -- KEY "ix_business_bin" ("bin"),
  -- KEY "ix_business_taxpayername" ("taxpayername"(767)),
  -- KEY "ix_business_adminname" ("adminname"),
  -- KEY "ix_business_businessaddress" ("businessaddress")
);

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
) ;

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
  PRIMARY KEY  ("objid")
  -- KEY "FK_changeaddresslist_business" ("businessid"),
  -- CONSTRAINT "FK_changeaddresslist" FOREIGN KEY ("objid") REFERENCES "bptxn" ("objid"),
  -- CONSTRAINT "FK_changeaddresslist_business" FOREIGN KEY ("businessid") REFERENCES "business" ("objid")
);

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
  PRIMARY KEY  ("objid")
  -- KEY "FK_changeadminlist_newadmin" ("newadminid"),
  -- KEY "FK_changeadminlist_prevadmin" ("prevadminid"),
  -- KEY "FK_changeadminlist_business" ("businessid"),
  -- CONSTRAINT "FK_changeadminlist" FOREIGN KEY ("objid") REFERENCES "bptxn" ("objid"),
  -- CONSTRAINT "FK_changeadminlist_business" FOREIGN KEY ("businessid") REFERENCES "business" ("objid"),
  -- CONSTRAINT "FK_changeadminlist_newadmin" FOREIGN KEY ("newadminid") REFERENCES "entity" ("objid"),
  -- CONSTRAINT "FK_changeadminlist_prevadmin" FOREIGN KEY ("prevadminid") REFERENCES "entity" ("objid")
);

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
  -- KEY "FK_changepermitteelist_newtaxpayer" ("newtaxpayerid"),
  -- KEY "FK_changepermitteelist_prevtaxpayer" ("prevtaxpayerid"),
  -- KEY "FK_changepermitteelist_business" ("businessid"),
  -- CONSTRAINT "FK_changepermitteelist" FOREIGN KEY ("objid") REFERENCES "bptxn" ("objid"),
  -- CONSTRAINT "FK_changepermitteelist_business" FOREIGN KEY ("businessid") REFERENCES "business" ("objid"),
  -- CONSTRAINT "FK_changepermitteelist_newtaxpayer" FOREIGN KEY ("newtaxpayerid") REFERENCES "entity" ("objid"),
  -- CONSTRAINT "FK_changepermitteelist_prevtaxpayer" FOREIGN KEY ("prevtaxpayerid") REFERENCES "entity" ("objid")
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
  -- KEY "FK_changetradenamelist_business" ("businessid"),
  -- CONSTRAINT "FK_changetradenamelist" FOREIGN KEY ("objid") REFERENCES "bptxn" ("objid"),
  -- CONSTRAINT "FK_changetradenamelist_business" FOREIGN KEY ("businessid") REFERENCES "business" ("objid")
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
  PRIMARY KEY  ("objid")
  -- UNIQUE KEY "afid" ("name","afid"),
  -- KEY "FK_collectiontype" ("afid"),
  -- KEY "ix_collectiontype_afid" ("afid")
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
) ;

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
) ;

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
) ;

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
  "depositedbytitle" varchar(100) NOT NULL,
  "cash" decimal(12,2) NOT NULL,
  "noncash" decimal(12,2) NOT NULL,
  "amount" decimal(12,2) NOT NULL,
  "fundsummaries" text NOT NULL,
  "liquidations" text NOT NULL,
  "fundtotals" text NOT NULL,
  PRIMARY KEY  ("objid")
  -- KEY "ix_deposit_txnno" ("txnno"),
  -- KEY "ix_deposit_docstate" ("docstate"),
  -- KEY "ix_deposit_depositedbyname" ("depositedbyname")
);

/*Table structure for table "docno_generator" */



CREATE TABLE "docno_generator" (
  "name" varchar(50) NOT NULL,
  "prefix" varchar(50) NOT NULL,
  "lastnum" int default NULL,
  PRIMARY KEY  ("name", "prefix")
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
  "lguname" varchar(50) default NULL,
  PRIMARY KEY  ("objid")
  -- KEY "ux_entity_no" ("entityno"),
  -- KEY "ix_entity_name" ("entityname"),
  -- KEY "ix_entity_entityname" ("entityname"),
  -- KEY "ix_entity_entityno" ("entityno"),
  -- KEY "ix_entity_entitytype" ("entitytype")
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
) ;

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
  -- UNIQUE KEY "annotationtypecode" ("annotationtypecode"),
  -- UNIQUE KEY "annotationtype" ("annotationtype")
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
  "txntimestamp" varchar(25) NOT NULL,
  "section" varchar(3) NOT NULL,
  "parcel" varchar(3) NOT NULL,
  "memoranda" varchar(1000) NOT NULL,
  "exemptid" varchar(50) default NULL,
  "exemptcode" varchar(10) default NULL,
  "annotated" int NOT NULL,
  "restriction" varchar(30) default NULL,
  "message" text,
  PRIMARY KEY  ("objid")
  -- KEY "ix_brgy_state_section_taxable" ("barangayid","docstate","section","taxable"),
  -- KEY "ix_faaslist_barangayid_docstate" ("barangayid","docstate"),
  -- KEY "ix_txntimestamp_docstate" ("txntimestamp","docstate"),
  -- KEY "FK_faaslist" ("taxpayerid"),
  -- KEY "ix_faaslist_annotated" ("annotated"),
  -- KEY "ix_faaslist_prevtdno_ry" ("prevtdno","ry"),
  -- KEY "ix_faaslist_prevtdno" ("prevtdno"),
  -- KEY "ix_faaslist_rydocstate" ("ry","docstate"),
  -- KEY "ix_faaslist_timestamp_docstate_taxable" ("txntimestamp","docstate","taxable"),
  -- KEY "ix_faaslist_pin_rputype" ("rputype","pin"),
  -- CONSTRAINT "FK_faaslist" FOREIGN KEY ("taxpayerid") REFERENCES "entity" ("objid")
);

/*Table structure for table "filter" */



CREATE TABLE "filter" (
  "objid" varchar(50) NOT NULL,
  "name" varchar(250) NOT NULL,
  "refname" varchar(100) NOT NULL,
  "info" text NOT NULL,
  PRIMARY KEY  ("objid")
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
) ;

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
  "ngastitle" varchar(100) default NULL,
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
  PRIMARY KEY  ("objid")
  -- UNIQUE -- KEY "ix_incomeacct_title" ("accttitle")
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
  -- KEY "FK_jobposition" ("orgunitid"),
  -- KEY "FK_jobposition_roleclass" ("roleclass"),
  -- KEY "FK_jobposition_role" ("role"),
  -- KEY "FK_jobposition_personnel" ("assigneeid"),
  -- CONSTRAINT "FK_jobposition" FOREIGN KEY ("orgunitid") REFERENCES "orgunit" ("objid"),
  -- CONSTRAINT "FK_jobposition_assignee" FOREIGN KEY ("assigneeid") REFERENCES "personnel" ("objid"),
  -- CONSTRAINT "FK_jobposition_role" FOREIGN KEY ("role") REFERENCES "role" ("name")
);

/*Table structure for table "jobposition_tag" */



CREATE TABLE "jobposition_tag" (
  "jobid" varchar(50) NOT NULL,
  "tagid" varchar(50) NOT NULL,
  PRIMARY KEY  ("jobid", "tagid")
);

/*Table structure for table "kindofbuilding" */



CREATE TABLE "kindofbuilding" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(10) NOT NULL,
  "bldgcode" varchar(10) NOT NULL,
  "bldgkind" varchar(100) NOT NULL,
  PRIMARY KEY  ("objid")
) ;

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
  "parentid" varchar(50),
  "parentcode" varchar(10),
  PRIMARY KEY  ("objid")
) ;

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
) ;

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
  "txntimestamp" varchar(15) NOT NULL,
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
  -- KEY "ix_liquidationlist_period" ("iyear","iqtr","imonth"),
  -- CONSTRAINT "FK_liquidation" FOREIGN KEY ("objid") REFERENCES "liquidation" ("objid")
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
  -- KEY "FK_liquidationrcd" ("liquidationid"),
  -- KEY "FK_liquidationrcd_fund" ("fundid"),
  -- KEY "lqofficerid" ("lqofficerid"),
  -- KEY "ix_liquidationrcd_cashierid" ("cashierid"),
  -- CONSTRAINT "FK_liquidationrcd" FOREIGN KEY ("liquidationid") REFERENCES "liquidation" ("objid"),
  -- CONSTRAINT "FK_liquidationrcd_fund" FOREIGN KEY ("fundid") REFERENCES "fund" ("objid")
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
  -- UNIQUE KEY "ux_lob_name" ("name"),
  -- KEY "FK_lob" ("classificationid"),
  -- CONSTRAINT "FK_lob" FOREIGN KEY ("classificationid") REFERENCES "lobclassification" ("objid")
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
  -- UNIQUE KEY "ux_lobclassification_name" ("name")
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
) ;

/*Table structure for table "machforex" */



CREATE TABLE "machforex" (
  "objid" varchar(50) NOT NULL,
  "machrysettingid" varchar(50) NOT NULL,
  "iyear" int NOT NULL,
  "forex" decimal(10,6) NOT NULL,
  "previd" varchar(50) default NULL,
  PRIMARY KEY  ("objid")
) ;

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
) ;

/*Table structure for table "machrysetting" */



CREATE TABLE "machrysetting" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "ry" int NOT NULL,
  "previd" varchar(50) default NULL,
  PRIMARY KEY  ("objid")
) ;

/*Table structure for table "materials" */



CREATE TABLE "materials" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(10) NOT NULL,
  "materialcode" varchar(10) NOT NULL,
  "materialdesc" varchar(100) NOT NULL,
  PRIMARY KEY  ("objid")
) ;

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
) ;

/*Table structure for table "miscitems" */



CREATE TABLE "miscitems" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(10) NOT NULL,
  "misccode" varchar(10) NOT NULL,
  "miscdesc" varchar(100) NOT NULL,
  PRIMARY KEY  ("objid")
) ;

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
) ;

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
  -- KEY "FK_orgunit" ("orgtype"),
  -- CONSTRAINT "FK_orgunit" FOREIGN KEY ("orgtype") REFERENCES "orgtype" ("name")
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
  -- KEY "ix_paymentitem_rctid" ("receiptid"),
  -- KEY "ix_paymentitem_rctid_paytype" ("receiptid","paytype"),
  -- KEY "ix_paymentitem_receiptid" ("receiptid"),
  -- KEY "ix_paymentitem_liquidationid" ("liquidationid"),
  -- KEY "ix_paymentitem_liquidationrcdid" ("liquidationrcdid")
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
  PRIMARY KEY  ("objid")
  -- UNIQUE KEY "staffno" ("staffno")
);

/*Table structure for table "pin" */



CREATE TABLE "pin" (
  "pin" varchar(30) NOT NULL,
  "claimno" varchar(10) NOT NULL,
  "docstate" varchar(25) NOT NULL,
  PRIMARY KEY  ("pin","claimno")
  -- UNIQUE KEY "ux_pin_pinclaimno" ("pin","claimno")
);

/*Table structure for table "plantsandtrees" */



CREATE TABLE "plantsandtrees" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(10) NOT NULL,
  "planttreecode" varchar(20) NOT NULL,
  "planttreedesc" varchar(100) NOT NULL,
  PRIMARY KEY  ("objid")
) ;

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
) ;

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
) ;

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
  PRIMARY KEY  ("objid")
  -- UNIQUE KEY "ux_propertypayerid_ledgerid" ("propertypayerid","ledgerid")
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
  -- KEY "ix_receipt_remid" ("remittanceid"),
  -- KEY "ix_receipt_remno" ("remittanceno")
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
  -- KEY "ix_receiptitem_rctid" ("receiptid"),
  -- KEY "ix_receiptitem_acctid" ("acctid"),
  -- KEY "ix_receiptitem_accttitle" ("accttitle"),
  -- KEY "ix_receiptitem_liquidationrcdid" ("liquidationrcdid"),
  -- CONSTRAINT "FK_receiptitem" FOREIGN KEY ("acctid") REFERENCES "incomeaccount" ("objid")
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
  -- KEY "ix_receiptlist_docstatecolid" ("collectorid","docstate"),
  -- KEY "ix_receiptlist_remid" ("remittanceid"),
  -- KEY "ix_receiptlist_remno" ("remittanceno"),
  -- KEY "ix_receiptlist_iyear" ("iyear"),
  -- KEY "ix_receiptlist_iqtr" ("iyear","iqtr"),
  -- KEY "ix_receiptlist_imonth" ("iyear","imonth"),
  -- KEY "ix_receiptlist_iday" ("iyear","imonth","iday"),
  -- KEY "ix_receiptlist_serialno" ("serialno"),
  -- KEY "ix_receiptlist_stubno" ("stubno"),
  -- KEY "ix_receiptlist_collectorname" ("collectorname"),
  -- KEY "ix_receiptlist_payorname" ("payorname"),
  -- KEY "ix_receiptlist_colidvoided" ("collectorid","voided"),
  -- KEY "ix_receiptlist_doctype_voided" ("doctype","voided")
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
  -- KEY "ix_remittancelist_liquidationid" ("liquidationid"),
  -- KEY "ix_liquidatingofficerid" ("liquidatingofficerid"),
  -- KEY "ix_liquidatingofficerid_txndate" ("liquidatingofficerid","txndate"),
  -- CONSTRAINT "FK_remittancelist" FOREIGN KEY ("objid") REFERENCES "remittance" ("objid")
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
  -- KEY "FK_remittance" ("remittanceid"),
  -- KEY "FK_afcontrol" ("afcontrolid"),
  -- KEY "FK_af" ("afid"),
  -- CONSTRAINT "FK_af" FOREIGN KEY ("afid") REFERENCES "af" ("objid"),
  -- CONSTRAINT "FK_afcontrol" FOREIGN KEY ("afcontrolid") REFERENCES "afcontrol" ("objid"),
  -- CONSTRAINT "FK_remittance" FOREIGN KEY ("remittanceid") REFERENCES "remittance" ("objid")
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
) ;

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
  "voided" int NOT NULL,
  "liquidationrcdid" varchar(50) default NULL,
  PRIMARY KEY  ("objid")
  -- KEY "FK_revenue_liquidation" ("liquidationid"),
  -- KEY "FK_revenue_remittance" ("remittanceid"),
  -- KEY "FK_revenue_deposit" ("depositid"),
  -- KEY "FK_revenue_incomeaccount" ("acctid"),
  -- KEY "FK_revenue_ngas" ("ngasid"),
  -- KEY "FK_revenue_sre" ("sreid"),
  -- KEY "FK_revenue_receipt" ("receiptid"),
  -- KEY "FK_revenue_af" ("afid"),
  -- KEY "FK_revenue_afcontrol" ("afcontrolid"),
  -- KEY "ix_revenue_liquidationtimestamp_voided" ("liquidationtimestamp","voided"),
  -- KEY "ix_revenue_liquidationtimestamp" ("liquidationtimestamp"),
  -- KEY "ix_revenue_liquidationrcdid" ("liquidationrcdid"),
  -- CONSTRAINT "FK_revenue_af" FOREIGN KEY ("afid") REFERENCES "af" ("objid"),
  -- CONSTRAINT "FK_revenue_afcontrol" FOREIGN KEY ("afcontrolid") REFERENCES "afcontrol" ("objid"),
  -- CONSTRAINT "FK_revenue_deposit" FOREIGN KEY ("depositid") REFERENCES "deposit" ("objid"),
  -- CONSTRAINT "FK_revenue_incomeaccount" FOREIGN KEY ("acctid") REFERENCES "incomeaccount" ("objid"),
  -- CONSTRAINT "FK_revenue_liquidation" FOREIGN KEY ("liquidationid") REFERENCES "liquidation" ("objid"),
  -- CONSTRAINT "FK_revenue_ngas" FOREIGN KEY ("ngasid") REFERENCES "account" ("objid"),
  -- CONSTRAINT "FK_revenue_remittance" FOREIGN KEY ("remittanceid") REFERENCES "remittance" ("objid"),
  -- CONSTRAINT "FK_revenue_sre" FOREIGN KEY ("sreid") REFERENCES "account" ("objid")
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
  "items" text NOT NULL
);

/*Table structure for table "role" */



CREATE TABLE "role" (
  "name" varchar(50) NOT NULL,
  "description" varchar(50) default NULL,
  "roleclass" varchar(20) NOT NULL,
  "included" text,
  "system" smallint default '0',
  PRIMARY KEY  ("name","roleclass")
  -- KEY "FK_role" ("roleclass")
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
  PRIMARY KEY  ("objid")
  -- UNIQUE KEY "ux_rptledger_fullpin" ("fullpin","claimno"),
  -- KEY "ix_rptledger_docstate" ("docstate"),
  -- KEY "ix_rptledger_tdnostate" ("tdno","docstate"),
  -- KEY "ix_rptledger_prevtdnostate" ("prevtdno","docstate"),
  -- KEY "ix_rptledger_lotstate" ("cadastrallotno","docstate"),
  -- KEY "ix_rptledger_brgystate" ("barangay","docstate"),
  -- KEY "ix_rptledger_tpaynostate" ("taxpayerno","docstate"),
  -- KEY "ix_rptledger_namestate" ("taxpayername","docstate"),
  -- KEY "ix_rptledger_faasid" ("faasid")
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
  -- KEY "ix_rptledger_parentid" ("parentid"),
  -- KEY "ix_rptledger_tdno" ("tdno")
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
) ;

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
  -- KEY "ix_rptpaymentmanual_receiptid" ("receiptid")
);

/*Table structure for table "rptsetting" */



CREATE TABLE "rptsetting" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(5) NOT NULL,
  "ry" int NOT NULL,
  "ordinanceno" varchar(30) default NULL,
  "ordinancedate" varchar(20) default NULL,
  "roundadjmarketvalue" int NOT NULL,
  "allowlandcancellation" int NOT NULL,
  "usenewtdprintout" int NOT NULL,
  "landreportbasedonactualuse" int NOT NULL,
  "allowtransferwithbalance" int NOT NULL,
  "allowcorrectionwithbalance" int NOT NULL,
  "allowdepreciationwithbalance" int NOT NULL,
  "allowchangetaxabilitywithbalance" int NOT NULL,
  "allowsubdivisionwithbalance" int NOT NULL,
  "allowconsolidationwithbalance" int NOT NULL,
  "allowreclasswithbalance" int NOT NULL,
  "approvedmvbelow" decimal(10,2) default NULL,
  "agriculturalid" varchar(50) default NULL,
  "agriculturaltitle" varchar(100) default NULL,
  "adjustplanttree" int NOT NULL,
  "propertyclassifications" text,
  PRIMARY KEY  ("objid")
) ;

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
) ;

/*Table structure for table "structuretemplate" */



CREATE TABLE "structuretemplate" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(10) NOT NULL,
  "templatecode" varchar(10) NOT NULL,
  "structures" text,
  PRIMARY KEY  ("objid")
) ;

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
  -- UNIQUE KEY "macaddress_unique" ("macaddress")
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
) ;

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
) ;

/*Table structure for table "txninfo" */



CREATE TABLE "txninfo" (
  "objid" varchar(50) NOT NULL,
  "lastupdate" datetime NOT NULL default CURRENT_TIMESTAMP,
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
) ;

/*Table structure for table "txntypes" */



CREATE TABLE "txntypes" (
  "objid" varchar(50) NOT NULL,
  "schemaname" varchar(50) NOT NULL,
  "schemaversion" varchar(10) NOT NULL,
  "txntype" varchar(100) NOT NULL,
  "used" smallint NOT NULL,
  PRIMARY KEY  ("objid")
) ;

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
  PRIMARY KEY  ("objid")
  -- UNIQUE KEY "username" ("uid")
) ;

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
  PRIMARY KEY  ("objid")
  -- UNIQUE KEY "ux_variable_name" ("name")
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
  PRIMARY KEY  ("objid")
  -- KEY "FK_wf_task_actor" ("taskid"),
  -- CONSTRAINT "FK_wf_task_actor" FOREIGN KEY ("taskid") REFERENCES "wf_task" ("objid")
);



CREATE TABLE "collectiongroup" (
  "objid" varchar(50) NOT NULL,
  "name" varchar(100) default NULL,
  PRIMARY KEY  ("objid")
);


CREATE TABLE "collectiongroup_incomeaccount" (
  "groupid" varchar(50) NOT NULL,
  "incomeaccountid" varchar(50) NOT NULL,
  PRIMARY KEY  ("groupid","incomeaccountid"),
  CONSTRAINT "FK_collectiongroup_incomeaccount" FOREIGN KEY ("groupid") REFERENCES "collectiongroup" ("objid")
);


CREATE TABLE "realpropertyupdate" (
  "objid" varchar(50) NOT NULL,
  "state" varchar(20) default NULL,
  "txnno" varchar(15) NOT NULL,
  "pin" varchar(50) default NULL,
  "realpropertyid" varchar(50),
  "arpno" varchar(25) default NULL,
  "cadastrallotno" varchar(255) default NULL,
  "surveyno" varchar(30) default NULL,
  "houseno" varchar(25) default NULL,
  "street" varchar(100) default NULL,
  "purok" varchar(25) default NULL,
  "north" varchar(255) NOT NULL,
  "south" varchar(255) NOT NULL,
  "east" varchar(255) NOT NULL,
  "west" varchar(255) NOT NULL,
  "blockno" varchar(255) default NULL,
  "prevarpno" varchar(25) default NULL,
  "prevcadastrallotno" varchar(255) default NULL,
  "prevsurveyno" varchar(30) default NULL,
  "prevhouseno" varchar(25) default NULL,
  "prevstreet" varchar(100) default NULL,
  "prevpurok" varchar(25) default NULL,
  "prevnorth" varchar(255) NOT NULL,
  "prevsouth" varchar(255) NOT NULL,
  "preveast" varchar(255) NOT NULL,
  "prevwest" varchar(255) NOT NULL,
  "prevblockno" varchar(255) default NULL,
  "lastmodifiedby" varchar(255) default NULL,
  "dtlastmodified" datetime default NULL,
  "approvedby" varchar(255) default NULL,
  "dtapproved" datetime default NULL,
  PRIMARY KEY  ("objid")
);


CREATE TABLE "faastitleupdate" (
  "objid" varchar(50) NOT NULL,
  "txnno" varchar(50) NOT NULL,
  "state" varchar(255) default NULL,
  "tdno" varchar(50) NOT NULL,
  "titleno" varchar(50) NOT NULL,
  "titledate" date NOT NULL,
  "remarks" varchar(150) NOT NULL,
  "lastmodifiedby" varchar(50) NOT NULL,
  "dtlastmodified" datetime NOT NULL,
  "approvedby" varchar(50) default NULL,
  "dtapproved" datetime default NULL,
  "faasid" varchar(50) NOT NULL,
  "faas" text,
  PRIMARY KEY  ("objid")
);

create index "ix_faasid" on faastitleupdate ("faasid");




/*=== insert admin data =====*/

/*Data for the table "orgtype" */

insert  into "orgtype"("name") values ('ADMIN_UNIT'),('BARANGAY');

/*Data for the table "orgunit" */

insert  into "orgunit"("objid","code","title","orgtype","parentid","system","reftype","refid") values ('AC','AC','ACCOUNTING DEPARTMENT','ADMIN_UNIT',NULL,1,NULL,NULL),('AO','AO','ASSESSOR''S OFFICE','ADMIN_UNIT',NULL,1,NULL,NULL),('BPLO','BPLO','BUSINESS PERMIT LICENSING OFFICE','ADMIN_UNIT',NULL,1,NULL,NULL),('HR','HR','HR DEPARTMENT','ADMIN_UNIT',NULL,1,NULL,NULL),('IT','IT','IT DEPARTMENT','ADMIN_UNIT',NULL,1,NULL,NULL),('TR','TR','TREASURY DEPARTMENT','ADMIN_UNIT',NULL,1,NULL,NULL);

/*Data for the table "role" */

insert  into "role"("name","description","roleclass","included","system") values ('ACCOUNTING_DEFAULT','ACCOUNTING_DEFAULT','ACCOUNTING','["tc2:account\\..*","tc2:bank\\..*","tc2:bankacct\\..*","tc2:collectionsetting\\..*","tc2:collectiontype\\..*","tc2:fund\\..*","tc2:incomeacct\\..*","tc2:incomeacctgroup\\..*","tc2:tcmanagement.open","tc2:tcreport.incomeaccount"]',1),('ADMIN_DEFAULT','ADMIN_DEFAULT','ADMIN','[".*"]',1),('AFO','AFO','TREASURY','["tc2:af\\..*","tc2:afcontrol\\..*","tc2:afinventory\\..*","tc2:iraf\\..*","tc2:riv_lgu\\..*","tc2:riv\\..*"]',0),('ASSESSOR','ASSESSOR','RPT','["etracs2-entity:.*","rpt2:rpttransaction\\..*","rpt2:consolidationmgt\\..*","rpt2:datacapture\\..*","rpt2:transfer\\..*","rpt2:reassessment\\..*","rpt2:correction\\..*","rpt2:newdiscovery\\..*","rpt2:multipleclaim\\..*","rpt2:cancelfaasmgt\\..*","rpt2:cancelfaas\\..*","rpt2:faasmgt\\..*","rpt2:faas\\..*","rpt2:subdivision\\..*","rpt2:subdivisionmgt\\..*","rpt2:truecopy\\..*","rpt2:rptcertification_list\\..*","rpt2:rptcertifications\\..*","rpt2:noproperty\\..*","rpt2:landholding\\..*","rpt2:multipleproperty\\..*","rpt2:noimprovement\\..*","rpt2:noimprovementbytdno\\..*","rpt2:latestexistproperty\\..*","rpt2:withimproveland\\..*","rpt2:wimprovebytdno\\..*","rpt2:rptreport\\..*","rpt2:rptreportmgmt\\..*","rpt2:rptmanagement\\..*","rpt2:rysetting\\..*","rpt2:propertyclassification\\..*","rpt2:exemptiontypes\\..*","rpt2:kindofbldg\\..*","rpt2:materials\\..*","rpt2:structures\\..*","rpt2:structuretemplates\\..*","rpt2:machines\\..*","rpt2:plantstrees\\..*","rpt2:miscitems\\..*","rpt2:rptofficers\\..*","rpt2:canceltdreasons\\..*","rpt2:txnrequirements\\..*","rpt2:rptparameters\\..*","rpt2:rptsetting\\..*","rpt2:annotationmgmt\\..*","rpt2:annotation\\..*","rpt2:cancelannotationmgmt\\..*","rpt2:cancelannotation\\..*","rpt2:mortgage\\..*","rpt2:bailbond\\..*","rpt2:other\\..*"]',0),('ASSESSOR_CERTIFICATION','ASSESSOR_CERTIFICATION','RPT','["rpt2:truecopy\\..*","rpt2:rptcertification_list\\..*","rpt2:rptcertifications\\..*","rpt2:noproperty\\..*","rpt2:landholding\\..*","rpt2:multipleproperty\\..*","rpt2:noimprovement\\..*","rpt2:noimprovementbytdno\\..*","rpt2:latestexistproperty\\..*","rpt2:withimproveland\\..*","rpt2:wimprovebytdno\\..*"]',NULL),('ASSESSOR_REPORTS','ASSESSOR_REPORTS','RPT','["rpt2:rptreport\\..*","rpt2:rptreportmgmt\\..*"]',NULL),('BP_ADMIN','BP_ADMIN','BP','["bp2:bpadmin\\..*","bp2:bpbillingrules\\..*","bp2:bpassessmentrule\\..*","bp2:bpbilling\\..*","bp2:bpmanagement\\..*","bp2:bplicensing\\..*","bp2:bptransaction\\..*","bp2:bpreportmgmt\\..*","bp2:bpreport\\..*","bp2:bppermit\\..*","etracs2common:rule\\..*"]',NULL),('BP_COLLECTION_ASSESSMENT','bp collection/assessment','TREASURY','["bp-rule-mgmt:.*","bp2:.*","ctc-rule-mgmt:.*","ctc2:.*","etracs2-entity:.*","tc2:af\\..*","tc2:afcontrol\\..*","tc2:bank\\..*","tc2:bankacct\\..*","tc2:batchcapture\\..*","tc2:batchcapturemgmt\\..*","tc2:collection\\..*","tc2:collection_burial\\..*","tc2:collection_cashticket\\..*","tc2:collection_cattleownership\\..*","tc2:collection_cattletransfer\\..*","tc2:collection_general\\..*","tc2:collection_marriage\\..*","tc2:collection_slaughterpermit\\..*","tc2:collectionsetting\\..*","tc2:collectiontype\\..*","tc2:fund\\..*","tc2:incomeacct\\..*","tc2:incomeacctgroup\\..*","tc2:postcapturereceipt\\..*","tc2:receipt\\..*","tc2:remittance\\..*","tc2:riv\\..*","tc2:riv_lgu\\..*","tc2:tcmanagement\\..*","tc2:tcreport\\..*","tc2:treasurymgmt\\..*","tc2:treasurymgmt_abstract\\..*","tc2:treasurymgmt_afmonitoring\\..*","tc2:treasurymgmt_collection\\..*","tc2:treasurymgmt_fund\\..*","tc2:treasurymgmt_liquidation\\..*","tc2:treasurymgmt_remittance\\..*"]',NULL),('BP_DEFAULT','default bp role','BP',NULL,NULL),('BP_LICENSING','BP_LICENSING','BP','["bp2:bpbillingrules\\..*","bp2:bpbilling\\..*","bp2:bpmanagement\\..*","bp2:bplicensing\\..*","bp2:bptransaction\\..*","bp2:bpreportmgmt\\..*","bp2:bpreport\\..*","bp2:bppermit\\..*","etracs2-entity:.*"]',NULL),('BP_PERMIT','BP_PERMIT','BP','["bp2:bpmanagement\\..*","bp2:bplicensing\\..*","bp2:bptransaction\\..*","bp2:bpreportmgmt\\..*","bp2:bpreport\\..*","bp2:bppermit\\..*","etracs2-entity:.*"]',NULL),('CASHIER','CASHIER','TREASURY','["tc2:bank\\..*","tc2:bankacct\\..*","tc2:fund\\..*","tc2:deposit\\..*","tc2:treasurymgmt_fund\\..*"]',NULL),('CITY_TREASURER','CITY TREASURER','TREASURY','["bp2:bpbilling\\..*","bp2:bplicensing\\.(applicationlist|viewapplication|viewassessment)","bp2:bppermit\\..*","bp2:bpreport\\..*","bp2:bpreportmgmt\\..*","bp2:bptransaction\\..*","rpt2:landtax\\..*","rpt2:rptbilling\\..*","rpt2:rptcertification_list\\..*","rpt2:rptcertifications\\..*","rpt2:rptledger\\.(previewbill|printbill|view)","rpt2:rptofficers\\.(view)","rpt2:rptparameters\\.(view)","tc2:account\\.(view)","tc2:af\\.(viewlist)","tc2:bank\\.(view)","tc2:bankacct\\.(view)","tc2:fund\\.(viewlist)","tc2:incomeacct\\.(viewlist)","tc2:incomeacctgroup\\.(viewlist)","tc2:liquidation\\.(viewlist)","tc2:receipt\\.(viewissued|viewissued)","tc2:remittance\\.(viewlist)","tc2:tcreport\\..*","tc2:treasurymgmt\\..*","tc2:treasurymgmt_abstract\\..*","tc2:treasurymgmt_afmonitoring\\..*","tc2:treasurymgmt_collection\\..*","tc2:treasurymgmt_fund\\..*","tc2:treasurymgmt_liquidation\\..*","tc2:treasurymgmt_remittance\\..*"]',NULL),('COLLECTION_LIQUIDATION_DEPOSIT','COLLECTION_LIQUIDATION_DEPOSIT','TREASURY','["tc2:afcontrol\\..*","tc2:bank\\..*","tc2:bankacct\\..*","tc2:batchcapture\\..*","tc2:batchcapturemgmt\\..*","tc2:collection\\..*","tc2:collection_burial\\..*","tc2:collection_cashticket\\..*","tc2:collection_cattleownership\\..*","tc2:collection_cattletransfer\\..*","tc2:collection_general\\..*","tc2:collection_marriage\\..*","tc2:collection_slaughterpermit\\..*","tc2:collectionsetting\\..*","tc2:collectiontype\\..*","tc2:deposit\\..*","tc2:fund\\..*","tc2:incomeacct\\..*","tc2:incomeacctgroup\\..*","tc2:liquidation\\..*","tc2:postcapturereceipt\\..*","tc2:receipt\\..*","tc2:remittance\\..*","tc2:tcmanagement\\..*","tc2:tcreport\\..*","tc2:treasurymgmt\\..*","tc2:treasurymgmt_abstract\\..*","tc2:treasurymgmt_collection\\..*","tc2:treasurymgmt_fund\\..*","tc2:treasurymgmt_liquidation\\..*","tc2:treasurymgmt_remittance\\..*"]',NULL),('COLLECTOR','COLLECTOR','TREASURY','["bp2:collection_bp\\..*","ctc2:.*","etracs2common:entity\\..*","etracs2common:individual\\..*","etracs2common:juridical\\..*","etracs2common:multiple\\..*","rpt2:landtax\\..*","tc2:collectionsetting\\..*","tc2:collectiontype\\..*","tc2:fund\\..*","tc2:incomeacct\\..*","tc2:incomeacctgroup\\..*","tc2:tcmanagement\\..*","tc2:afcontrol\\..*","tc2:collection\\..*","tc2:remittance\\..*","tc2:receipt\\..*","tc2:batchcapturemgmt\\..*","tc2:batchcapture\\..*","tc2:collection_burial\\..*","tc2:collection_cashticket\\..*","tc2:collection_cattleownership\\..*","tc2:collection_cattletransfer\\..*","tc2:collection_general\\..*","tc2:collection_marriage\\..*","tc2:postcapturereceipt\\..*","tc2:tcreport\\..*","tc2:collection_slaughterpermit\\..*","tc2:treasurymgmt_abstract\\..*","tc2:treasurymgmt_afmonitoring\\..*","tc2:treasurymgmt_collection\\..*","tc2:treasurymgmt_fund\\..*","tc2:treasurymgmt_liquidation\\..*","tc2:treasurymgmt_remittance\\..*","tc2:riv_lgu\\..*","tc2:riv\\..*"]',NULL),('CTC_ADMIN','ctc admin','TREASURY','["ctc-rule-mgmt:.*"]',NULL),('FACULTY_DEFAULT','FACULTY_DEFAULT','FACULTY','[ ''.*'' ]',1),('IT_DEFAULT','IT_DEFAULT','IT','[ ''.*'' ]',1),('LANDTAX','LANDTAX','RPT','["etracs2-entity:.*","etracs2common:rule\\..*","rpt2:truecopy\\..*","rpt2:rptcertification_list\\..*","rpt2:rptcertifications\\..*","rpt2:noproperty\\..*","rpt2:landholding\\..*","rpt2:multipleproperty\\..*","rpt2:noimprovement\\..*","rpt2:noimprovementbytdno\\..*","rpt2:latestexistproperty\\..*","rpt2:withimproveland\\..*","rpt2:wimprovebytdno\\..*","rpt2:rptreport\\..*","rpt2:rptreportmgmt\\..*","rpt2:rptbilling\\..*","rpt2:rptledger\\..*","rpt2:propertypayer\\..*","rpt2:rptbillingrule\\..*","rpt2:landtax\\..*","rpt2:rptmanagement\\..*","rpt2:rptparameters\\..*","rpt2:rptsetting\\..*"]',NULL),('LIQUIDATING_OFFICER','Liquidating officer role.','TREASURY','["tc2:fund\\..*","tc2:tcmanagement\\..*","tc2:tcreport\\..*","tc2:liquidation\\..*","tc2:treasurymgmt_liquidation\\..*"]',NULL),('RPT_ADMIN','RPT_ADMIN','RPT','["etracs2-entity:.*","rpt2:.*"]',NULL),('RPT_APPRAISER','RPT_APPRAISER','RPT','["etracs2-entity:.*","rpt2:rpttransaction\\..*","rpt2:consolidation\\..*","rpt2:consolidationmgt\\..*","rpt2:datacapture\\.(create)","rpt2:transfer\\..*","rpt2:reassessment\\..*","rpt2:correction\\..*","rpt2:newdiscovery\\..*","rpt2:multipleclaim\\..*","rpt2:cancelfaasmgt\\..*","rpt2:cancelfaas\\..*","rpt2:faasmgt\\..*","rpt2:faas\\..*","rpt2:subdivision\\..*","rpt2:subdivisionmgt\\..*","rpt2:truecopy\\..*"]',0),('RPT_DEFAULT','default  rpt role','RPT',NULL,NULL),('RULE_AUTHOR','RULE_AUTHOR','BP','["bp-rule-mgmt:.*","bp2:bpadmin\\..*","bp2:bpassessmentrule\\..*","bp2:bpbilling\\..*","bp2:bpbillingrules\\..*","bp2:bplicensing\\..*","bp2:bpmanagement\\..*","bp2:bpreportmgmt\\..*"]',NULL),('SUBCOLLECTOR','SUBCOLLECTOR','TREASURY','["bp2:collection_bp\\..*","etracs2common:entity\\..*","etracs2common:individual\\..*","etracs2common:juridical\\..*","etracs2common:multiple\\..*","rpt2:landtax\\..*","tc2:collection\\.(create_capture)","tc2:receipt\\..*","tc2:batchcapturemgmt\\..*","tc2:batchcapture\\..*","tc2:collection_burial\\..*","tc2:collection_cashticket\\..*","tc2:collection_cattleownership\\..*","tc2:collection_cattletransfer\\..*","tc2:collection_general\\..*","tc2:collection_marriage\\..*","tc2:postcapturereceipt\\..*","tc2:collection_slaughterpermit\\..*"]',NULL),('TEST','test','TREASURY','["bp2:.*"]',NULL),('TREASURY_DEFAULT','TREASURY_DEFAULT','TREASURY','[".*"]',1);




/*=== insert admin account =====*/
insert into personnel ("objid",staffno,firstname,lastname)
select 'admin', '00000000', 'admin', 'admin';

insert into useraccount ("objid", "uid", pwd, usertype, firstname, lastname)
select 'admin', 'admin', '02290d335d44fac6a4d6b3766f0bed51', 'personnel', 'admin', 'admin';

insert into jobposition
select 'ADMIN', 'ADMIN', 'ADMIN', null, 'ADMIN', 'ADMIN_DEFAULT', null, 'HR', 'ADMIN', 'R';



/*==== default tc settings ======*/



insert into "collectiontype" ("objid", "schemaname", "schemaversion", "name", "appcode", "payorrequired", "afid") values('COLLTYPE-704ed00f:1278d8a67f7:-7e77','collectiontype:collectiontype','1.0','COMMUNITY TAX - CORPORATE','ctc_corporate','0','907');
insert into "collectiontype" ("objid", "schemaname", "schemaversion", "name", "appcode", "payorrequired", "afid") values('COLLTYPE-704ed00f:1278d8a67f7:-7ea7','collectiontype:collectiontype','1.0','COMMUNITY TAX - IDIVIDUAL','ctc_individual','0','0016');
insert into "collectiontype" ("objid", "schemaname", "schemaversion", "name", "appcode", "payorrequired", "afid") values('CT_BP','collectiontype:collectiontype','1.0','BUSINESS TAX','business_tax','0','51');
insert into "collectiontype" ("objid", "schemaname", "schemaversion", "name", "appcode", "payorrequired", "afid") values('CT_BPFR','collectiontype:collectiontype','1.0','BURIAL PERMIT FEE','burial_permit','0','58');
insert into "collectiontype" ("objid", "schemaname", "schemaversion", "name", "appcode", "payorrequired", "afid") values('CT_CT10','collectiontype:collectiontype','1.0','CASH TICKET','general_collection','0','CT10');
insert into "collectiontype" ("objid", "schemaname", "schemaversion", "name", "appcode", "payorrequired", "afid") values('CT_CT2','collectiontype:collectiontype','1.0','CASH TICKET','general_collection','0','CT2');
insert into "collectiontype" ("objid", "schemaname", "schemaversion", "name", "appcode", "payorrequired", "afid") values('CT_CT5','collectiontype:collectiontype','1.0','CASH TICKET','general_collection','0','CT5');
insert into "collectiontype" ("objid", "schemaname", "schemaversion", "name", "appcode", "payorrequired", "afid") values('CT_GEN','collectiontype:collectiontype','1.0','GENERAL COLLECTION','general_collection','0','51');
insert into "collectiontype" ("objid", "schemaname", "schemaversion", "name", "appcode", "payorrequired", "afid") values('CT_LCO','collectiontype:collectiontype','1.0','LARGE CATTLE OWNERSHIP','cattle_ownership','0','53');
insert into "collectiontype" ("objid", "schemaname", "schemaversion", "name", "appcode", "payorrequired", "afid") values('CT_LCT','collectiontype:collectiontype','1.0','LARGE CATTLE TRANSFER','cattle_transfer','0','52');
insert into "collectiontype" ("objid", "schemaname", "schemaversion", "name", "appcode", "payorrequired", "afid") values('CT_MLFR','collectiontype:collectiontype','1.0','MARRIAGE LICENSE FEE','marriage_license','0','54');
insert into "collectiontype" ("objid", "schemaname", "schemaversion", "name", "appcode", "payorrequired", "afid") values('CT_RPT','collectiontype:collectiontype','1.0','REAL PROPERTY TAX','real_property','0','56');



insert into "af" ("objid", "schemaname", "schemaversion", "docstate", "description", "aftype", "unit", "pcsperunit", "denomination", "serieslength") values('0016','af:af','1.0','APPROVED','COMMUNITY TAX CERTIFICATE (INDIVIDUAL)','serial','STUB','50','0.00','7');
insert into "af" ("objid", "schemaname", "schemaversion", "docstate", "description", "aftype", "unit", "pcsperunit", "denomination", "serieslength") values('51','af:af','1.0','APPROVED','ACCOUNTABLE FORM #51','serial','STUB','50','0.00','7');
insert into "af" ("objid", "schemaname", "schemaversion", "docstate", "description", "aftype", "unit", "pcsperunit", "denomination", "serieslength") values('52','af:af','1.0','APPROVED','LARGE CATTLE TRANSFER','serial','STUB','50','0.00','7');
insert into "af" ("objid", "schemaname", "schemaversion", "docstate", "description", "aftype", "unit", "pcsperunit", "denomination", "serieslength") values('53','af:af','1.0','APPROVED','LARGE CATTLE OWNERSHIP','serial','STUB','50','0.00','7');
insert into "af" ("objid", "schemaname", "schemaversion", "docstate", "description", "aftype", "unit", "pcsperunit", "denomination", "serieslength") values('54','af:af','1.0','APPROVED','MARRIAGE LICENSE RECEIPT','serial','STUB','50','0.00','7');
insert into "af" ("objid", "schemaname", "schemaversion", "docstate", "description", "aftype", "unit", "pcsperunit", "denomination", "serieslength") values('56','af:af','1.0','APPROVED','ACCOUNTABLE FORM #56','serial','STUB','50','0.00','7');
insert into "af" ("objid", "schemaname", "schemaversion", "docstate", "description", "aftype", "unit", "pcsperunit", "denomination", "serieslength") values('58','af:af','1.0','APPROVED','BURIAL PERMIT FEE','serial','STUB','50','0.00','7');
insert into "af" ("objid", "schemaname", "schemaversion", "docstate", "description", "aftype", "unit", "pcsperunit", "denomination", "serieslength") values('907','af:af','1.0','APPROVED','COMMUNITY TAX - CORPORATE','serial','STUB','50','0.00','7');
insert into "af" ("objid", "schemaname", "schemaversion", "docstate", "description", "aftype", "unit", "pcsperunit", "denomination", "serieslength") values('CT10','af:af','1.0','APPROVED','CASH TICKET P10.00','money_valu','STUB','50','0.00','7');
insert into "af" ("objid", "schemaname", "schemaversion", "docstate", "description", "aftype", "unit", "pcsperunit", "denomination", "serieslength") values('CT2','af:af','1.0','APPROVED','CASH TICKET P2.00','money_valu','STUB','50','0.00','7');
insert into "af" ("objid", "schemaname", "schemaversion", "docstate", "description", "aftype", "unit", "pcsperunit", "denomination", "serieslength") values('CT5','af:af','1.0','APPROVED','CASH TICKET P5.00','money_valu','STUB','50','0.00','7');


insert into "fund" ("objid", "schemaname", "schemaversion", "docstate", "fund", "subfund", "fundname") values('GENERAL','fund','1.0','APPROVED','GENERAL','GENERAL','GENERAL');
insert into "fund" ("objid", "schemaname", "schemaversion", "docstate", "fund", "subfund", "fundname") values('SEF','fund','1.0','APPROVED','SEF','SEF','SEF');
insert into "fund" ("objid", "schemaname", "schemaversion", "docstate", "fund", "subfund", "fundname") values('TRUST','fund','1.0','APPROVED','TRUST','TRUST','TRUST');



insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-193b6f15:1334c6786b8:-7fec','account:account','1.0','1992',NULL,'01','RETURN OF EXCESS FROM CASH ADVANCE','SRE','GLACCOUNT','0.00','2','A-193b6f15:1334c6786b8:-7fee','SRE','SRE/A-193b6f15:1334c6786b8:-7fee','SRE-SRE/Z-NON INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-193b6f15:1334c6786b8:-7fee','account:account','1.0','1992',NULL,'M','NON INCOME','SRE','CATEGORY','0.00','1','SRE','SRE','SRE','SRE-SRE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-1f4969c2:1341bb441bb:-7fd2','account:account','1.0','1992',NULL,'652-09-02','CLEARANCE FEES','SRE','SUBACCOUNT','0.00','3','A52380147:131d8fe3efb:-7fd0','SRE','SRE/A52380147:131d8fe3efb:-7ffc/A52380147:131d8fe3efb:-7fd0','SRE-SRE/C-REGULATORY FEES (PERMIT AND LICENSES)/652-09-OTHER PERMIT AND LICENSES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-1f4969c2:1341bb441bb:-7fd3','account:account','1.0','1992',NULL,'652-09-01','CERTIFICATION FEES','SRE','SUBACCOUNT','0.00','3','A52380147:131d8fe3efb:-7fd0','SRE','SRE/A52380147:131d8fe3efb:-7ffc/A52380147:131d8fe3efb:-7fd0','SRE-SRE/C-REGULATORY FEES (PERMIT AND LICENSES)/652-09-OTHER PERMIT AND LICENSES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-1f4969c2:1341bb441bb:-7fdf','account:account','1.0','1992','0','613-2','CERTIFICATION FEES','NGAS','SUBACCOUNT','0.00','4','A-34e92527:131d514840c:-7fd2','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff5/A-34e92527:131d514840c:-7fd2','NGAS-NGAS/B-GENERAL INCOME/B2-SERVICE INCOME/613-CLEARANCE AND CERTIFICATION FEES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-1f4969c2:1341bb441bb:-7fe0','account:account','1.0','1992','0','613-1','CLEARANCE FEES','NGAS','SUBACCOUNT','0.00','4','A-34e92527:131d514840c:-7fd2','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff5/A-34e92527:131d514840c:-7fd2','NGAS-NGAS/B-GENERAL INCOME/B2-SERVICE INCOME/613-CLEARANCE AND CERTIFICATION FEES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-31ff65b7:133a957de13:-7ffc','account:account','1.0','1992',NULL,'624-1','COMMUNITY TAX CORPORATION','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffd','SRE','SRE/A52380147:131d8fe3efb:-7ffd','SRE-SRE/B-OTHER TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7f9f','account:account','1.0','1992','0','679','OTHER FINES AND PENALTIES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff2','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff2','NGAS-NGAS/B-GENERAL INCOME/B5-OTHER INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fa0','account:account','1.0','1992','0','678','MISCELLANEOUS INCOME','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff2','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff2','NGAS-NGAS/B-GENERAL INCOME/B5-OTHER INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fa1','account:account','1.0','1992','0','671','SHARE FROM TOBACCO EXCISE TAX','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff2','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff2','NGAS-NGAS/B-GENERAL INCOME/B5-OTHER INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fa2','account:account','1.0','1992','0','670','SHARE FROM PAGCOR/PCSO','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff2','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff2','NGAS-NGAS/B-GENERAL INCOME/B5-OTHER INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fa3','account:account','1.0','1992','0','669','SHARE FROM NATIONAL WEALTH','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff2','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff2','NGAS-NGAS/B-GENERAL INCOME/B5-OTHER INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fa4','account:account','1.0','1992','0','668','SHARE FROM EXPANDED VALUE ADDED TAX (EVAT)','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff2','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff2','NGAS-NGAS/B-GENERAL INCOME/B5-OTHER INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fa5','account:account','1.0','1992','0','667','SHARE FROM ECONOMIC ZONE','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff2','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff2','NGAS-NGAS/B-GENERAL INCOME/B5-OTHER INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fa6','account:account','1.0','1992','0','666','SALE OF CONFISCATE/ABANDONED/SEIZED GOODS AND PROPERTIES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff2','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff2','NGAS-NGAS/B-GENERAL INCOME/B5-OTHER INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fa7','account:account','1.0','1992','0','665','INTERNAL REVENUE ALLOTMENT','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff2','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff2','NGAS-NGAS/B-GENERAL INCOME/B5-OTHER INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fa8','account:account','1.0','1992','0','664','INTEREST INCOME','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff2','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff2','NGAS-NGAS/B-GENERAL INCOME/B5-OTHER INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fa9','account:account','1.0','1992','0','663','INSURANCE INCOME','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff2','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff2','NGAS-NGAS/B-GENERAL INCOME/B5-OTHER INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7faa','account:account','1.0','1992','0','662','INCOME FROM GRANTS AND DONATIONS','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff2','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff2','NGAS-NGAS/B-GENERAL INCOME/B5-OTHER INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fab','account:account','1.0','1992','0','661','DIVIDEND INCOME','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff2','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff2','NGAS-NGAS/B-GENERAL INCOME/B5-OTHER INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fad','account:account','1.0','1992','0','657','SUBSIDY FROM OTHER FUNDS','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff3','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff3','NGAS-NGAS/B-GENERAL INCOME/B4-SUBSIDY INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fae','account:account','1.0','1992','0','656','SUBSIDY FROM OTHER LGU''S','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff3','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff3','NGAS-NGAS/B-GENERAL INCOME/B4-SUBSIDY INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7faf','account:account','1.0','1992','0','655','SUBSIDY FROM OPERATING UNIT','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff3','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff3','NGAS-NGAS/B-GENERAL INCOME/B4-SUBSIDY INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fb0','account:account','1.0','1992','0','654','SUBSIDY FROM REGIONAL OFFICE/STAFF BUREAU','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff3','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff3','NGAS-NGAS/B-GENERAL INCOME/B4-SUBSIDY INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fb1','account:account','1.0','1992','0','653','SUBSIDY FROM CENTRAL OFFICE','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff3','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff3','NGAS-NGAS/B-GENERAL INCOME/B4-SUBSIDY INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fb2','account:account','1.0','1992','0','652','SUBSIDY FROM OTHER NATIONAL GOVERNMENT AGENCIES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff3','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff3','NGAS-NGAS/B-GENERAL INCOME/B4-SUBSIDY INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fb3','account:account','1.0','1992','0','651','SUBSIDY INCOME FROM NATIONAL GOVERNMENT','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff3','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff3','NGAS-NGAS/B-GENERAL INCOME/B4-SUBSIDY INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fb4','account:account','1.0','1992','0','649','FINES AND PENALTIES - BUSINESS INCOME','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff4','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff4','NGAS-NGAS/B-GENERAL INCOME/B3-BUSINESS INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fb5','account:account','1.0','1992','0','648','OTHER BUSINESS INCOME','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff4','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff4','NGAS-NGAS/B-GENERAL INCOME/B3-BUSINESS INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fb6','account:account','1.0','1992','0','644','TUITION FEES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff4','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff4','NGAS-NGAS/B-GENERAL INCOME/B3-BUSINESS INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fb7','account:account','1.0','1992','0','643','SALES REVENUE','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff4','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff4','NGAS-NGAS/B-GENERAL INCOME/B3-BUSINESS INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fb8','account:account','1.0','1992','0','642','RENT INCOME','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff4','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff4','NGAS-NGAS/B-GENERAL INCOME/B3-BUSINESS INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fb9','account:account','1.0','1992','0','641','PRINTING AND PUBLICATION INCOME','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff4','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff4','NGAS-NGAS/B-GENERAL INCOME/B3-BUSINESS INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fba','account:account','1.0','1992','0','640','LANDING AND PARKING FEES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff4','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff4','NGAS-NGAS/B-GENERAL INCOME/B3-BUSINESS INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fbb','account:account','1.0','1992','0','639','INCOME FROM WATERWORKS SYSTEMS','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff4','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff4','NGAS-NGAS/B-GENERAL INCOME/B3-BUSINESS INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fbc','account:account','1.0','1992','0','638','INCOME FROM TRANSPORTATION SYSTEMS','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff4','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff4','NGAS-NGAS/B-GENERAL INCOME/B3-BUSINESS INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fbd','account:account','1.0','1992','0','637','INCOME FROM SLAUGHTERHOUSES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff4','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff4','NGAS-NGAS/B-GENERAL INCOME/B3-BUSINESS INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fbe','account:account','1.0','1992','0','636','INCOME FROM MARKETS','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff4','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff4','NGAS-NGAS/B-GENERAL INCOME/B3-BUSINESS INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fbf','account:account','1.0','1992','0','635','INCOME FROM DORMITORY OPERATIONS','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff4','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff4','NGAS-NGAS/B-GENERAL INCOME/B3-BUSINESS INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fc0','account:account','1.0','1992','0','634','INCOME FROM COMMUNICATION FACILITIES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff4','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff4','NGAS-NGAS/B-GENERAL INCOME/B3-BUSINESS INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fc1','account:account','1.0','1992','0','633','INCOME FROM CEMETERY OPERATIONS','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff4','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff4','NGAS-NGAS/B-GENERAL INCOME/B3-BUSINESS INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fc2','account:account','1.0','1992','0','632','INCOME FROM CANTEEN OPERATIONS','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff4','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff4','NGAS-NGAS/B-GENERAL INCOME/B3-BUSINESS INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fc3','account:account','1.0','1992','0','631','HOSPITAL FEES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff4','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff4','NGAS-NGAS/B-GENERAL INCOME/B3-BUSINESS INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fc5','account:account','1.0','1992','0','629','FINES AND PENALTIES - SERVICE INCOME','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff5','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff5','NGAS-NGAS/B-GENERAL INCOME/B2-SERVICE INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fc6','account:account','1.0','1992','0','628','OTHER SERVICE INCOME','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff5','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff5','NGAS-NGAS/B-GENERAL INCOME/B2-SERVICE INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fc7','account:account','1.0','1992','0','624','TRANSCRIPT OF RECORDS FEES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff5','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff5','NGAS-NGAS/B-GENERAL INCOME/B2-SERVICE INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fc8','account:account','1.0','1992','0','623','TOLL AND TERMINAL FEES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff5','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff5','NGAS-NGAS/B-GENERAL INCOME/B2-SERVICE INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fc9','account:account','1.0','1992','0','622','SEMINAR FEES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff5','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff5','NGAS-NGAS/B-GENERAL INCOME/B2-SERVICE INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fca','account:account','1.0','1992','0','621','PROCESSING FEES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff5','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff5','NGAS-NGAS/B-GENERAL INCOME/B2-SERVICE INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fcb','account:account','1.0','1992','0','620','PASSPORT AND VISA FEES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff5','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff5','NGAS-NGAS/B-GENERAL INCOME/B2-SERVICE INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fcc','account:account','1.0','1992','0','619','MEDICAL, DENTAL AND LABORATORY FEES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff5','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff5','NGAS-NGAS/B-GENERAL INCOME/B2-SERVICE INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fcd','account:account','1.0','1992','0','618','LIBRARY FEES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff5','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff5','NGAS-NGAS/B-GENERAL INCOME/B2-SERVICE INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fce','account:account','1.0','1992','0','617','INSPECTION FEES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff5','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff5','NGAS-NGAS/B-GENERAL INCOME/B2-SERVICE INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fcf','account:account','1.0','1992','0','616','GARBAGE FEES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff5','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff5','NGAS-NGAS/B-GENERAL INCOME/B2-SERVICE INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fd0','account:account','1.0','1992','0','615','DIPLOMA AND GRADUATION FEES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff5','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff5','NGAS-NGAS/B-GENERAL INCOME/B2-SERVICE INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fd1','account:account','1.0','1992','0','614','COMPREHENSIVE EXAMINATION FEES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff5','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff5','NGAS-NGAS/B-GENERAL INCOME/B2-SERVICE INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fd2','account:account','1.0','1992','0','613','CLEARANCE AND CERTIFICATION FEES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff5','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff5','NGAS-NGAS/B-GENERAL INCOME/B2-SERVICE INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fd3','account:account','1.0','1992','0','612','ATHLETIC AND CULTURAL FEES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff5','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff5','NGAS-NGAS/B-GENERAL INCOME/B2-SERVICE INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fd4','account:account','1.0','1992','0','611','AFFILLIATION FEES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff5','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff5','NGAS-NGAS/B-GENERAL INCOME/B2-SERVICE INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fd6','account:account','1.0','1992','0','609','FINES AND PENLATIES - PERMITS AND LICENSES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff6','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff6','NGAS-NGAS/B-GENERAL INCOME/B1-PERMITS AND LICENSES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fd7','account:account','1.0','1992','0','608','OTHER PERMITS AND LICENSES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff6','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff6','NGAS-NGAS/B-GENERAL INCOME/B1-PERMITS AND LICENSES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fd8','account:account','1.0','1992','0','606','REGISTRATION FEES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff6','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff6','NGAS-NGAS/B-GENERAL INCOME/B1-PERMITS AND LICENSES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fd9','account:account','1.0','1992','0','605','PERMIT FEES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff6','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff6','NGAS-NGAS/B-GENERAL INCOME/B1-PERMITS AND LICENSES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fda','account:account','1.0','1992','0','604','MOTOR VEHICLES USERS CHARGE','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff6','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff6','NGAS-NGAS/B-GENERAL INCOME/B1-PERMITS AND LICENSES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fdb','account:account','1.0','1992','0','603','FRANCHISING AND LICENSING FEES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff6','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff6','NGAS-NGAS/B-GENERAL INCOME/B1-PERMITS AND LICENSES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fdc','account:account','1.0','1992','0','602','FISHERY RENTAL FEES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff6','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff6','NGAS-NGAS/B-GENERAL INCOME/B1-PERMITS AND LICENSES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fdd','account:account','1.0','1992','0','601','FEES ON WEIGHTS AND MEASURES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff6','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb/A2c261ff3:131d4ec0b93:-7ff6','NGAS-NGAS/B-GENERAL INCOME/B1-PERMITS AND LICENSES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fdf','account:account','1.0','1992','0','599','FINES AND PENALTIES - LOCAL TAXES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff8','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff8','NGAS-NGAS/A-TAX REVENUE/A2-LOCAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fe0','account:account','1.0','1992','0','598','OTHER LOCAL TAXES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff8','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff8','NGAS-NGAS/A-TAX REVENUE/A2-LOCAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fe1','account:account','1.0','1992','0','593','TAX ON SAND, GRAVEL AND OTHER QUARRY PRODUCTS','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff8','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff8','NGAS-NGAS/A-TAX REVENUE/A2-LOCAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fe2','account:account','1.0','1992','0','592','TAX ON DELIVERY TRUCKS AND VANS','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff8','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff8','NGAS-NGAS/A-TAX REVENUE/A2-LOCAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fe3','account:account','1.0','1992','0','591','SPECIAL EDUCATION TAX','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff8','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff8','NGAS-NGAS/A-TAX REVENUE/A2-LOCAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fe4','account:account','1.0','1992','0','590','SPECIAL ASSESSMENT TAX','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff8','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff8','NGAS-NGAS/A-TAX REVENUE/A2-LOCAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fe5','account:account','1.0','1992','0','589','REAL PROPERTY TAX ON IDLE LANDS','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff8','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff8','NGAS-NGAS/A-TAX REVENUE/A2-LOCAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fe6','account:account','1.0','1992','0','588','REAL PROPERTY TAX','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff8','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff8','NGAS-NGAS/A-TAX REVENUE/A2-LOCAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fe8','account:account','1.0','1992','0','587','PROPERTY TRANSFER TAX','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff8','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff8','NGAS-NGAS/A-TAX REVENUE/A2-LOCAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fe9','account:account','1.0','1992','0','586','PRINTING AND PUBLICATION TAX','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff8','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff8','NGAS-NGAS/A-TAX REVENUE/A2-LOCAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fea','account:account','1.0','1992','0','585','OCCUPATION TAX','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff8','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff8','NGAS-NGAS/A-TAX REVENUE/A2-LOCAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7feb','account:account','1.0','1992','0','584','FRANCHISE TAX','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff8','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff8','NGAS-NGAS/A-TAX REVENUE/A2-LOCAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fec','account:account','1.0','1992','0','583','COMMUNITY TAX','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff8','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff8','NGAS-NGAS/A-TAX REVENUE/A2-LOCAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fed','account:account','1.0','1992','0','582','BUSINESS TAX (LOCAL)','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff8','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff8','NGAS-NGAS/A-TAX REVENUE/A2-LOCAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7fee','account:account','1.0','1992','0','581','AMUSEMENT TAX','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff8','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff8','NGAS-NGAS/A-TAX REVENUE/A2-LOCAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7ff0','account:account','1.0','1992','0','579','FINES AND PENALTIES - NATIONAL TAXES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff9','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff9','NGAS-NGAS/A-TAX REVENUE/A1-NATIONAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7ff1','account:account','1.0','1992','0','578','OTHER NATIONAL TAXES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff9','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff9','NGAS-NGAS/A-TAX REVENUE/A1-NATIONAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7ff2','account:account','1.0','1992','0','568','VALUE ADDED TAX - EXPANDED','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff9','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff9','NGAS-NGAS/A-TAX REVENUE/A1-NATIONAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7ff3','account:account','1.0','1992','0','567','VALUE ADDED TAX','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff9','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff9','NGAS-NGAS/A-TAX REVENUE/A1-NATIONAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7ff4','account:account','1.0','1992','0','566','TAX ON FOREST PRODUCT','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff9','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff9','NGAS-NGAS/A-TAX REVENUE/A1-NATIONAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7ff5','account:account','1.0','1992','0','565','STOCK TRANSFER TAX','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff9','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff9','NGAS-NGAS/A-TAX REVENUE/A1-NATIONAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7ff6','account:account','1.0','1992','0','564','PROFESSIONAL TAX','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff9','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff9','NGAS-NGAS/A-TAX REVENUE/A1-NATIONAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7ff7','account:account','1.0','1992','0','563','INCOME TAX CORPORATION','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff9','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff9','NGAS-NGAS/A-TAX REVENUE/A1-NATIONAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7ff8','account:account','1.0','1992','0','562','INCOME TAX PARTNERSHIPS','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff9','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff9','NGAS-NGAS/A-TAX REVENUE/A1-NATIONAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7ff9','account:account','1.0','1992','0','561','INCOME TAX INDIVIDUALS','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff9','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff9','NGAS-NGAS/A-TAX REVENUE/A1-NATIONAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7ffa','account:account','1.0','1992','0','560','IMPORT DUTIES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff9','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff9','NGAS-NGAS/A-TAX REVENUE/A1-NATIONAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7ffb','account:account','1.0','1992','0','559','IMMIGRATION TAX','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff9','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff9','NGAS-NGAS/A-TAX REVENUE/A1-NATIONAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-34e92527:131d514840c:-7ffc','account:account','1.0','1992','0','558','FRANCHISE TAX','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff9','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff9','NGAS-NGAS/A-TAX REVENUE/A1-NATIONAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-384c5e2e:131f28590ba:-7ff3','account:account','1.0','1992',NULL,'08','SEF PREVIOUS PENALTY','SRE','GLACCOUNT','0.00','2','A-384c5e2e:131f28590ba:-7ffc','SRE','SRE/A-384c5e2e:131f28590ba:-7ffc','SRE-SRE/L-REAL PROPERTY TAX');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-384c5e2e:131f28590ba:-7ff4','account:account','1.0','1992',NULL,'07','SEF PREVIOUS','SRE','GLACCOUNT','0.00','2','A-384c5e2e:131f28590ba:-7ffc','SRE','SRE/A-384c5e2e:131f28590ba:-7ffc','SRE-SRE/L-REAL PROPERTY TAX');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-384c5e2e:131f28590ba:-7ff5','account:account','1.0','1992',NULL,'06','SEF CURRENT PENALTY','SRE','GLACCOUNT','0.00','2','A-384c5e2e:131f28590ba:-7ffc','SRE','SRE/A-384c5e2e:131f28590ba:-7ffc','SRE-SRE/L-REAL PROPERTY TAX');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-384c5e2e:131f28590ba:-7ff6','account:account','1.0','1992',NULL,'05','SEF CURRENT','SRE','GLACCOUNT','0.00','2','A-384c5e2e:131f28590ba:-7ffc','SRE','SRE/A-384c5e2e:131f28590ba:-7ffc','SRE-SRE/L-REAL PROPERTY TAX');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-384c5e2e:131f28590ba:-7ff7','account:account','1.0','1992',NULL,'04','BASIC PREVIOUS PENALTY','SRE','GLACCOUNT','0.00','2','A-384c5e2e:131f28590ba:-7ffc','SRE','SRE/A-384c5e2e:131f28590ba:-7ffc','SRE-SRE/L-REAL PROPERTY TAX');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-384c5e2e:131f28590ba:-7ff8','account:account','1.0','1992',NULL,'03','BASIC PREVIOUS','SRE','GLACCOUNT','0.00','2','A-384c5e2e:131f28590ba:-7ffc','SRE','SRE/A-384c5e2e:131f28590ba:-7ffc','SRE-SRE/L-REAL PROPERTY TAX');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-384c5e2e:131f28590ba:-7ff9','account:account','1.0','1992',NULL,'02','BASIC CURRENT PENALTY','SRE','GLACCOUNT','0.00','2','A-384c5e2e:131f28590ba:-7ffc','SRE','SRE/A-384c5e2e:131f28590ba:-7ffc','SRE-SRE/L-REAL PROPERTY TAX');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-384c5e2e:131f28590ba:-7ffa','account:account','1.0','1992',NULL,'01','BASIC - CURRENT','SRE','GLACCOUNT','0.00','2','A-384c5e2e:131f28590ba:-7ffc','SRE','SRE/A-384c5e2e:131f28590ba:-7ffc','SRE-SRE/L-REAL PROPERTY TAX');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-384c5e2e:131f28590ba:-7ffc','account:account','1.0','1992',NULL,'L','REAL PROPERTY TAX','SRE','CATEGORY','0.00','1','SRE','SRE','SRE','SRE-SRE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-97b8ccd:13342dc387f:-7fdc','account:account','1.0','1992',NULL,'651-10','MAYOR''S PERMIT','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffc','SRE','SRE/A52380147:131d8fe3efb:-7ffc','SRE-SRE/C-REGULATORY FEES (PERMIT AND LICENSES)');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-97b8ccd:13342dc387f:-7fe5','account:account','1.0','1992',NULL,'653-2-02','MARRIAGE LICENSE','SRE','SUBACCOUNT','0.00','3','A52380147:131d8fe3efb:-7fce','SRE','SRE/A52380147:131d8fe3efb:-7ffc/A52380147:131d8fe3efb:-7fce','SRE-SRE/C-REGULATORY FEES (PERMIT AND LICENSES)/653-2-CIVIL REGISTRATION FEES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-97b8ccd:13342dc387f:-7fe7','account:account','1.0','1992',NULL,'653-2-01','MARRIAGE CERTIFICATE','SRE','SUBACCOUNT','0.00','3','A52380147:131d8fe3efb:-7fce','SRE','SRE/A52380147:131d8fe3efb:-7ffc/A52380147:131d8fe3efb:-7fce','SRE-SRE/C-REGULATORY FEES (PERMIT AND LICENSES)/653-2-CIVIL REGISTRATION FEES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-97b8ccd:13342dc387f:-7feb','account:account','1.0','1992',NULL,'695-01-02','INCOME FROM GAPAN CITY TECHNICAL SCHOOL','SRE','SUBACCOUNT','0.00','3','A52380147:131d8fe3efb:-7fbb','SRE','SRE/A52380147:131d8fe3efb:-7ffa/A52380147:131d8fe3efb:-7fbb','SRE-SRE/E-ECONOMIC ENTERPRISE/695-01-INCOME FROM SCHOOL OPERATIONS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-97b8ccd:13342dc387f:-7fec','account:account','1.0','1992',NULL,'695-01-01','INCOME FROM NEUST TUITION FEE','SRE','SUBACCOUNT','0.00','3','A52380147:131d8fe3efb:-7fbb','SRE','SRE/A52380147:131d8fe3efb:-7ffa/A52380147:131d8fe3efb:-7fbb','SRE-SRE/E-ECONOMIC ENTERPRISE/695-01-INCOME FROM SCHOOL OPERATIONS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-97b8ccd:13342dc387f:-7fee','account:account','1.0','1992',NULL,'695-13-02','LOT RENTAL','SRE','SUBACCOUNT','0.00','3','A52380147:131d8fe3efb:-7faf','SRE','SRE/A52380147:131d8fe3efb:-7ffa/A52380147:131d8fe3efb:-7faf','SRE-SRE/E-ECONOMIC ENTERPRISE/695-13-LEASE/RENTALS OF FACILITIES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-97b8ccd:13342dc387f:-7fef','account:account','1.0','1992',NULL,'695-13-01','GYM RENTAL','SRE','SUBACCOUNT','0.00','3','A52380147:131d8fe3efb:-7faf','SRE','SRE/A52380147:131d8fe3efb:-7ffa/A52380147:131d8fe3efb:-7faf','SRE-SRE/E-ECONOMIC ENTERPRISE/695-13-LEASE/RENTALS OF FACILITIES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A-97b8ccd:13342dc387f:-7ff1','account:account','1.0','1992',NULL,'651-09','BURIAL PERMIT','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffc','SRE','SRE/A52380147:131d8fe3efb:-7ffc','SRE-SRE/C-REGULATORY FEES (PERMIT AND LICENSES)');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A1d9a4e75:131f3e2061c:-7ff4','account:account','1.0','1992',NULL,'09','LGU LAND TAX SHARE','SRE','GLACCOUNT','0.00','2','A-384c5e2e:131f28590ba:-7ffc','SRE','SRE/A-384c5e2e:131f28590ba:-7ffc','SRE-SRE/L-REAL PROPERTY TAX');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A21ca2e01:1334672af87:-7fd8','account:account','1.0','1992',NULL,'651-09-03','DISINTERMENT','SRE','SUBACCOUNT','0.00','3','A-97b8ccd:13342dc387f:-7ff1','SRE','SRE/A52380147:131d8fe3efb:-7ffc/A-97b8ccd:13342dc387f:-7ff1','SRE-SRE/C-REGULATORY FEES (PERMIT AND LICENSES)/651-09-BURIAL PERMIT');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A21ca2e01:1334672af87:-7fd9','account:account','1.0','1992',NULL,'651-09-02','TRANSFER PERMIT','SRE','SUBACCOUNT','0.00','3','A-97b8ccd:13342dc387f:-7ff1','SRE','SRE/A52380147:131d8fe3efb:-7ffc/A-97b8ccd:13342dc387f:-7ff1','SRE-SRE/C-REGULATORY FEES (PERMIT AND LICENSES)/651-09-BURIAL PERMIT');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A21ca2e01:1334672af87:-7fda','account:account','1.0','1992',NULL,'651-09-01','BURIAL PERMIT','SRE','SUBACCOUNT','0.00','3','A-97b8ccd:13342dc387f:-7ff1','SRE','SRE/A52380147:131d8fe3efb:-7ffc/A-97b8ccd:13342dc387f:-7ff1','SRE-SRE/C-REGULATORY FEES (PERMIT AND LICENSES)/651-09-BURIAL PERMIT');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A21ca2e01:1334672af87:-7fdd','account:account','1.0','1992',NULL,'670-1','INCOME FROM STL SHARE','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ff9','SRE','SRE/A52380147:131d8fe3efb:-7ff9','SRE-SRE/F-OTHER RECEIPTS/INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A21ca2e01:1334672af87:-7fe0','account:account','1.0','1992',NULL,'654-3-05','SANITARY PERMIT','SRE','SUBACCOUNT','0.00','3','A52380147:131d8fe3efb:-7fc8','SRE','SRE/A52380147:131d8fe3efb:-7ffb/A52380147:131d8fe3efb:-7fc8','SRE-SRE/D-SERVICE/USER CHARGES/654-3-HEALTH CERTIFICATE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A21ca2e01:1334672af87:-7fe3','account:account','1.0','1992',NULL,'654-3-04','MEDICAL CERTIFICATE FEE','SRE','SUBACCOUNT','0.00','3','A52380147:131d8fe3efb:-7fc8','SRE','SRE/A52380147:131d8fe3efb:-7ffb/A52380147:131d8fe3efb:-7fc8','SRE-SRE/D-SERVICE/USER CHARGES/654-3-HEALTH CERTIFICATE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A21ca2e01:1334672af87:-7fe5','account:account','1.0','1992',NULL,'653-1-03','BRANDING','SRE','SUBACCOUNT','0.00','3','A52380147:131d8fe3efb:-7fcf','SRE','SRE/A52380147:131d8fe3efb:-7ffc/A52380147:131d8fe3efb:-7fcf','SRE-SRE/C-REGULATORY FEES (PERMIT AND LICENSES)/653-1-CATTLE ANIMAL REGISTRATION FEES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A21ca2e01:1334672af87:-7fe7','account:account','1.0','1992',NULL,'653-1-02','LARGE CATTLE REGISTRATION','SRE','SUBACCOUNT','0.00','3','A52380147:131d8fe3efb:-7fcf','SRE','SRE/A52380147:131d8fe3efb:-7ffc/A52380147:131d8fe3efb:-7fcf','SRE-SRE/C-REGULATORY FEES (PERMIT AND LICENSES)/653-1-CATTLE ANIMAL REGISTRATION FEES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A21ca2e01:1334672af87:-7fe9','account:account','1.0','1992',NULL,'653-1-01','LARGE CATTLE TRANSFER','SRE','SUBACCOUNT','0.00','3','A52380147:131d8fe3efb:-7fcf','SRE','SRE/A52380147:131d8fe3efb:-7ffc/A52380147:131d8fe3efb:-7fcf','SRE-SRE/C-REGULATORY FEES (PERMIT AND LICENSES)/653-1-CATTLE ANIMAL REGISTRATION FEES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A21ca2e01:1334672af87:-7fed','account:account','1.0','1992',NULL,'686-02','INSPECTION FEE','SRE','SUBACCOUNT','0.00','3','A52380147:131d8fe3efb:-7fbd','SRE','SRE/A52380147:131d8fe3efb:-7ffb/A52380147:131d8fe3efb:-7fbd','SRE-SRE/D-SERVICE/USER CHARGES/686-INSPECTION FEES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A21ca2e01:1334672af87:-7fee','account:account','1.0','1992',NULL,'686-01','FIRE INSPECTION FEE','SRE','SUBACCOUNT','0.00','3','A52380147:131d8fe3efb:-7fbd','SRE','SRE/A52380147:131d8fe3efb:-7ffb/A52380147:131d8fe3efb:-7fbd','SRE-SRE/D-SERVICE/USER CHARGES/686-INSPECTION FEES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A21ca2e01:1334672af87:-7ff0','account:account','1.0','1992',NULL,'653-3-03','HEALTH AND SANITARY','SRE','SUBACCOUNT','0.00','3','A52380147:131d8fe3efb:-7fc8','SRE','SRE/A52380147:131d8fe3efb:-7ffb/A52380147:131d8fe3efb:-7fc8','SRE-SRE/D-SERVICE/USER CHARGES/654-3-HEALTH CERTIFICATE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A21ca2e01:1334672af87:-7ff3','account:account','1.0','1992',NULL,'653-3-02','INDIVIDUAL HEALTH CERTIFICATE','SRE','SUBACCOUNT','0.00','3','A52380147:131d8fe3efb:-7fc8','SRE','SRE/A52380147:131d8fe3efb:-7ffb/A52380147:131d8fe3efb:-7fc8','SRE-SRE/D-SERVICE/USER CHARGES/654-3-HEALTH CERTIFICATE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A21ca2e01:1334672af87:-7ff5','account:account','1.0','1992',NULL,'653-3-01','HEALTH CARD','SRE','SUBACCOUNT','0.00','3','A52380147:131d8fe3efb:-7fc8','SRE','SRE/A52380147:131d8fe3efb:-7ffb/A52380147:131d8fe3efb:-7fc8','SRE-SRE/D-SERVICE/USER CHARGES/654-3-HEALTH CERTIFICATE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A2c261ff3:131d4ec0b93:-7feb','account:account','1.0','1992','0','557','FINAL TAX','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff9','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff9','NGAS-NGAS/A-TAX REVENUE/A1-NATIONAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A2c261ff3:131d4ec0b93:-7fec','account:account','1.0','1992','0','556','EXCISE TAX ON ARTICLES','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff9','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff9','NGAS-NGAS/A-TAX REVENUE/A1-NATIONAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A2c261ff3:131d4ec0b93:-7fed','account:account','1.0','1992','0','555','ESTATE TAX','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff9','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff9','NGAS-NGAS/A-TAX REVENUE/A1-NATIONAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A2c261ff3:131d4ec0b93:-7fee','account:account','1.0','1992','0','554','DONORS TAX','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff9','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff9','NGAS-NGAS/A-TAX REVENUE/A1-NATIONAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A2c261ff3:131d4ec0b93:-7fef','account:account','1.0','1992','0','553','DOCUMENTARY STAMP TAX','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff9','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff9','NGAS-NGAS/A-TAX REVENUE/A1-NATIONAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A2c261ff3:131d4ec0b93:-7ff0','account:account','1.0','1992','0','552','CAPITAL GAIN TAX','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff9','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff9','NGAS-NGAS/A-TAX REVENUE/A1-NATIONAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A2c261ff3:131d4ec0b93:-7ff1','account:account','1.0','1992','0','551','BUSINESS TAX (NATIONAL)','NGAS','GLACCOUNT','0.00','3','A2c261ff3:131d4ec0b93:-7ff9','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc/A2c261ff3:131d4ec0b93:-7ff9','NGAS-NGAS/A-TAX REVENUE/A1-NATIONAL TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A2c261ff3:131d4ec0b93:-7ff2','account:account','1.0','1992','0','B5','OTHER INCOME','NGAS','CATEGORY','0.00','2','A2c261ff3:131d4ec0b93:-7ffb','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb','NGAS-NGAS/B-GENERAL INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A2c261ff3:131d4ec0b93:-7ff3','account:account','1.0','1992','0','B4','SUBSIDY INCOME','NGAS','CATEGORY','0.00','2','A2c261ff3:131d4ec0b93:-7ffb','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb','NGAS-NGAS/B-GENERAL INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A2c261ff3:131d4ec0b93:-7ff4','account:account','1.0','1992','0','B3','BUSINESS INCOME','NGAS','CATEGORY','0.00','2','A2c261ff3:131d4ec0b93:-7ffb','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb','NGAS-NGAS/B-GENERAL INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A2c261ff3:131d4ec0b93:-7ff5','account:account','1.0','1992','0','B2','SERVICE INCOME','NGAS','CATEGORY','0.00','2','A2c261ff3:131d4ec0b93:-7ffb','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb','NGAS-NGAS/B-GENERAL INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A2c261ff3:131d4ec0b93:-7ff6','account:account','1.0','1992','0','B1','PERMITS AND LICENSES','NGAS','CATEGORY','0.00','2','A2c261ff3:131d4ec0b93:-7ffb','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffb','NGAS-NGAS/B-GENERAL INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A2c261ff3:131d4ec0b93:-7ff8','account:account','1.0','1992','0','A2','LOCAL TAXES','NGAS','CATEGORY','0.00','2','A2c261ff3:131d4ec0b93:-7ffc','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc','NGAS-NGAS/A-TAX REVENUE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A2c261ff3:131d4ec0b93:-7ff9','account:account','1.0','1992','0','A1','NATIONAL TAXES','NGAS','CATEGORY','0.00','2','A2c261ff3:131d4ec0b93:-7ffc','NGAS','NGAS/A2c261ff3:131d4ec0b93:-7ffc','NGAS-NGAS/A-TAX REVENUE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A2c261ff3:131d4ec0b93:-7ffb','account:account','1.0','1992','0','B','GENERAL INCOME','NGAS','CATEGORY','0.00','1','NGAS','NGAS','NGAS','NGAS-NGAS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A2c261ff3:131d4ec0b93:-7ffc','account:account','1.0','1992','0','A','TAX REVENUE','NGAS','CATEGORY','0.00','1','NGAS','NGAS','NGAS','NGAS-NGAS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7f8b','account:account','1.0','1992',NULL,'006','BONDS FLOTATION','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ff4','SRE','SRE/A52380147:131d8fe3efb:-7ff4','SRE-SRE/K-LOANS AND BORROWINGS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7f8c','account:account','1.0','1992',NULL,'005','LOANS - DOMESTIC','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ff4','SRE','SRE/A52380147:131d8fe3efb:-7ff4','SRE-SRE/K-LOANS AND BORROWINGS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7f8d','account:account','1.0','1992',NULL,'004','LOANS -FOREIGN','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ff4','SRE','SRE/A52380147:131d8fe3efb:-7ff4','SRE-SRE/K-LOANS AND BORROWINGS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7f8f','account:account','1.0','1992',NULL,'003','COLLECTION OF RECEIVABLES','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ff5','SRE','SRE/A52380147:131d8fe3efb:-7ff5','SRE-SRE/J-CAPITAL INVESTMENT RECEIPTS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7f90','account:account','1.0','1992',NULL,'002','PROCEEDS FROM SALE OF DEBT SECURITIES','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ff5','SRE','SRE/A52380147:131d8fe3efb:-7ff5','SRE-SRE/J-CAPITAL INVESTMENT RECEIPTS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7f91','account:account','1.0','1992',NULL,'001','PROCEEDS FROM SALE OF ASSETS','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ff5','SRE','SRE/A52380147:131d8fe3efb:-7ff5','SRE-SRE/J-CAPITAL INVESTMENT RECEIPTS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7f93','account:account','1.0','1992',NULL,'748','SUBSIDY FROM OTHER FUNDS','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ff6','SRE','SRE/A52380147:131d8fe3efb:-7ff6','SRE-SRE/I-INTER LOCAL TRANSFER');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7f94','account:account','1.0','1992',NULL,'746','SUBSIDY FROM LGU''S','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ff6','SRE','SRE/A52380147:131d8fe3efb:-7ff6','SRE-SRE/I-INTER LOCAL TRANSFER');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7f96','account:account','1.0','1992',NULL,'735','PREMIUM ON BOND PAYABLES','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ff7','SRE','SRE/A52380147:131d8fe3efb:-7ff7','SRE-SRE/H-EXTRAORDINARY RECEIPTS/GRANTS/DONATIONS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7f97','account:account','1.0','1992',NULL,'734','GAIN ON SALE OF INVESTMENT','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ff7','SRE','SRE/A52380147:131d8fe3efb:-7ff7','SRE-SRE/H-EXTRAORDINARY RECEIPTS/GRANTS/DONATIONS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7f98','account:account','1.0','1992',NULL,'733','GAIN ON SALE OF ASSETS','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ff7','SRE','SRE/A52380147:131d8fe3efb:-7ff7','SRE-SRE/H-EXTRAORDINARY RECEIPTS/GRANTS/DONATIONS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7f99','account:account','1.0','1992',NULL,'731','GAIN ON FOREX','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ff7','SRE','SRE/A52380147:131d8fe3efb:-7ff7','SRE-SRE/H-EXTRAORDINARY RECEIPTS/GRANTS/DONATIONS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7f9a','account:account','1.0','1992',NULL,'747','SUBSIDY FROM GOCC''S','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ff7','SRE','SRE/A52380147:131d8fe3efb:-7ff7','SRE-SRE/H-EXTRAORDINARY RECEIPTS/GRANTS/DONATIONS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7f9b','account:account','1.0','1992',NULL,'749','OTHER SUBSIDY INCOME','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ff7','SRE','SRE/A52380147:131d8fe3efb:-7ff7','SRE-SRE/H-EXTRAORDINARY RECEIPTS/GRANTS/DONATIONS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7f9c','account:account','1.0','1992',NULL,'751-2','GRANTS AND DONATION DOMESTIC','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ff7','SRE','SRE/A52380147:131d8fe3efb:-7ff7','SRE-SRE/H-EXTRAORDINARY RECEIPTS/GRANTS/DONATIONS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7f9d','account:account','1.0','1992',NULL,'751-1','GRANTS AND DONATION FOREIGN','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ff7','SRE','SRE/A52380147:131d8fe3efb:-7ff7','SRE-SRE/H-EXTRAORDINARY RECEIPTS/GRANTS/DONATIONS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7f9f','account:account','1.0','1992',NULL,'756','SHARES FROM TOBACCO EXCISE TAX','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ff8','SRE','SRE/A52380147:131d8fe3efb:-7ff8','SRE-SRE/G-SHARES FROM NATIONAL TAX COLLECTION');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fa0','account:account','1.0','1992',NULL,'755','SHARES FROM PAGCOR/PCSO/LOTTO','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ff8','SRE','SRE/A52380147:131d8fe3efb:-7ff8','SRE-SRE/G-SHARES FROM NATIONAL TAX COLLECTION');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fa1','account:account','1.0','1992',NULL,'754','SHARES FROM NATIONAL WEALTH','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ff8','SRE','SRE/A52380147:131d8fe3efb:-7ff8','SRE-SRE/G-SHARES FROM NATIONAL TAX COLLECTION');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fa2','account:account','1.0','1992',NULL,'753','SHARES FROM EVAT','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ff8','SRE','SRE/A52380147:131d8fe3efb:-7ff8','SRE-SRE/G-SHARES FROM NATIONAL TAX COLLECTION');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fa3','account:account','1.0','1992',NULL,'752','SHARES FROM ECONOMIC ZONE','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ff8','SRE','SRE/A52380147:131d8fe3efb:-7ff8','SRE-SRE/G-SHARES FROM NATIONAL TAX COLLECTION');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fa4','account:account','1.0','1992',NULL,'641-2','IRA - PRIOR YEAR','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ff8','SRE','SRE/A52380147:131d8fe3efb:-7ff8','SRE-SRE/G-SHARES FROM NATIONAL TAX COLLECTION');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fa5','account:account','1.0','1992',NULL,'641-1','IRA-CURRENT YEAR','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ff8','SRE','SRE/A52380147:131d8fe3efb:-7ff8','SRE-SRE/G-SHARES FROM NATIONAL TAX COLLECTION');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fa7','account:account','1.0','1992',NULL,'728-3','MISC. OTHERS','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ff9','SRE','SRE/A52380147:131d8fe3efb:-7ff9','SRE-SRE/F-OTHER RECEIPTS/INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fa8','account:account','1.0','1992',NULL,'728-2','MISC. SALE OF CONFISCATED/ABANDONED/SEIZED GOODS ASSETS','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ff9','SRE','SRE/A52380147:131d8fe3efb:-7ff9','SRE-SRE/F-OTHER RECEIPTS/INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fa9','account:account','1.0','1992',NULL,'728-1','MISC. REBATES ON MMDA (METRO MANILA ONLU)','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ff9','SRE','SRE/A52380147:131d8fe3efb:-7ff9','SRE-SRE/F-OTHER RECEIPTS/INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7faa','account:account','1.0','1992',NULL,'698','DIVIDEND INCOME','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ff9','SRE','SRE/A52380147:131d8fe3efb:-7ff9','SRE-SRE/F-OTHER RECEIPTS/INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fab','account:account','1.0','1992',NULL,'697','INTEREST INCOME','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ff9','SRE','SRE/A52380147:131d8fe3efb:-7ff9','SRE-SRE/F-OTHER RECEIPTS/INCOME');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fac','account:account','1.0','1992',NULL,'695-16','FINES AND PENALTIES ECONOMIC ENNTERPRISE','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffa','SRE','SRE/A52380147:131d8fe3efb:-7ffa','SRE-SRE/E-ECONOMIC ENTERPRISE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fad','account:account','1.0','1992',NULL,'695-15','OTHER ECONOMIC ENTERPRISE','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffa','SRE','SRE/A52380147:131d8fe3efb:-7ffa','SRE-SRE/E-ECONOMIC ENTERPRISE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fae','account:account','1.0','1992',NULL,'695-14','INCOME FROM TRADING BUSINESS','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffa','SRE','SRE/A52380147:131d8fe3efb:-7ffa','SRE-SRE/E-ECONOMIC ENTERPRISE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7faf','account:account','1.0','1992',NULL,'695-13','LEASE/RENTALS OF FACILITIES','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffa','SRE','SRE/A52380147:131d8fe3efb:-7ffa','SRE-SRE/E-ECONOMIC ENTERPRISE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fb0','account:account','1.0','1992',NULL,'695-12','PRINTING AND PUBLICATION OPERATIONS','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffa','SRE','SRE/A52380147:131d8fe3efb:-7ffa','SRE-SRE/E-ECONOMIC ENTERPRISE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fb1','account:account','1.0','1992',NULL,'695-11','INCOME FROM WATERWORKS OPERATIONS','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffa','SRE','SRE/A52380147:131d8fe3efb:-7ffa','SRE-SRE/E-ECONOMIC ENTERPRISE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fb2','account:account','1.0','1992',NULL,'695-10','INCOME FROM TRANSPORTATION OPERATIONS','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffa','SRE','SRE/A52380147:131d8fe3efb:-7ffa','SRE-SRE/E-ECONOMIC ENTERPRISE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fb3','account:account','1.0','1992',NULL,'695-09','INCOME FROM SLAUGHTERHOUSE OPERATIONS','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffa','SRE','SRE/A52380147:131d8fe3efb:-7ffa','SRE-SRE/E-ECONOMIC ENTERPRISE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fb4','account:account','1.0','1992',NULL,'695-08','INCOME FROM MARKET OPERATIONS','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffa','SRE','SRE/A52380147:131d8fe3efb:-7ffa','SRE-SRE/E-ECONOMIC ENTERPRISE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fb5','account:account','1.0','1992',NULL,'695-07','INCOME FROM DORMITORY OPERATIONS','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffa','SRE','SRE/A52380147:131d8fe3efb:-7ffa','SRE-SRE/E-ECONOMIC ENTERPRISE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fb6','account:account','1.0','1992',NULL,'695-06','INCOME FROM COMMUNICATION OPERATIONS','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffa','SRE','SRE/A52380147:131d8fe3efb:-7ffa','SRE-SRE/E-ECONOMIC ENTERPRISE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fb7','account:account','1.0','1992',NULL,'695-05','INCOME FROM CEMETERY OPERATIONS','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffa','SRE','SRE/A52380147:131d8fe3efb:-7ffa','SRE-SRE/E-ECONOMIC ENTERPRISE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fb8','account:account','1.0','1992',NULL,'695-04','INCOME FROM CANTEEN RESTAURANT OPERATION','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffa','SRE','SRE/A52380147:131d8fe3efb:-7ffa','SRE-SRE/E-ECONOMIC ENTERPRISE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fb9','account:account','1.0','1992',NULL,'695-03','INCOME FROM HOSPITAL OPERATION','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffa','SRE','SRE/A52380147:131d8fe3efb:-7ffa','SRE-SRE/E-ECONOMIC ENTERPRISE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fba','account:account','1.0','1992',NULL,'695-02','INCOME FROM POWER GENERATION, DISTRIBUTION','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffa','SRE','SRE/A52380147:131d8fe3efb:-7ffa','SRE-SRE/E-ECONOMIC ENTERPRISE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fbb','account:account','1.0','1992',NULL,'695-01','INCOME FROM SCHOOL OPERATIONS','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffa','SRE','SRE/A52380147:131d8fe3efb:-7ffa','SRE-SRE/E-ECONOMIC ENTERPRISE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fbc','account:account','1.0','1992',NULL,'689','PRINTING AND PUBLICATION FEES','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffb','SRE','SRE/A52380147:131d8fe3efb:-7ffb','SRE-SRE/D-SERVICE/USER CHARGES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fbd','account:account','1.0','1992',NULL,'686','INSPECTION FEES','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffb','SRE','SRE/A52380147:131d8fe3efb:-7ffb','SRE-SRE/D-SERVICE/USER CHARGES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fbe','account:account','1.0','1992',NULL,'684','MEDICAL, DENTAL & LABORATORY FEES','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffb','SRE','SRE/A52380147:131d8fe3efb:-7ffb','SRE-SRE/D-SERVICE/USER CHARGES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fbf','account:account','1.0','1992',NULL,'683','HOSPITAL FEES','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffb','SRE','SRE/A52380147:131d8fe3efb:-7ffb','SRE-SRE/D-SERVICE/USER CHARGES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fc0','account:account','1.0','1992',NULL,'679','PARKING AND TERMINAL FEES','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffb','SRE','SRE/A52380147:131d8fe3efb:-7ffb','SRE-SRE/D-SERVICE/USER CHARGES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fc1','account:account','1.0','1992',NULL,'678','LANDING AND AERONAUTICAL FEES','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffb','SRE','SRE/A52380147:131d8fe3efb:-7ffb','SRE-SRE/D-SERVICE/USER CHARGES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fc2','account:account','1.0','1992',NULL,'729','FINES AND PENALTIES SERVICE INCOME (BUSINESS INCOME)','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffb','SRE','SRE/A52380147:131d8fe3efb:-7ffb','SRE-SRE/D-SERVICE/USER CHARGES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fc3','account:account','1.0','1992',NULL,'658-4','OTHER SERVICE/USER CHARGES','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffb','SRE','SRE/A52380147:131d8fe3efb:-7ffb','SRE-SRE/D-SERVICE/USER CHARGES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fc4','account:account','1.0','1992',NULL,'658-3','TOLL FEES (BID FORMS)','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffb','SRE','SRE/A52380147:131d8fe3efb:-7ffb','SRE-SRE/D-SERVICE/USER CHARGES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fc5','account:account','1.0','1992',NULL,'658-2','PAYMENT OF TULI, MEDICAL SERVICES)','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffb','SRE','SRE/A52380147:131d8fe3efb:-7ffb','SRE-SRE/D-SERVICE/USER CHARGES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fc6','account:account','1.0','1992',NULL,'658-1','GARBAGE FEES','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffb','SRE','SRE/A52380147:131d8fe3efb:-7ffb','SRE-SRE/D-SERVICE/USER CHARGES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fc7','account:account','1.0','1992',NULL,'654-4','OTHER CLEARANCE AND CERTIFICATIONS','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffb','SRE','SRE/A52380147:131d8fe3efb:-7ffb','SRE-SRE/D-SERVICE/USER CHARGES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fc8','account:account','1.0','1992',NULL,'654-3','HEALTH CERTIFICATE','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffb','SRE','SRE/A52380147:131d8fe3efb:-7ffb','SRE-SRE/D-SERVICE/USER CHARGES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fc9','account:account','1.0','1992',NULL,'654-2','SECRETARY''S FEES','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffb','SRE','SRE/A52380147:131d8fe3efb:-7ffb','SRE-SRE/D-SERVICE/USER CHARGES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fca','account:account','1.0','1992',NULL,'654-1','POLICE CLEARANCE FEES','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffb','SRE','SRE/A52380147:131d8fe3efb:-7ffb','SRE-SRE/D-SERVICE/USER CHARGES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fcc','account:account','1.0','1992',NULL,'659','FINES AND PENALTIES - PERMIT AND LICENSES','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffc','SRE','SRE/A52380147:131d8fe3efb:-7ffc','SRE-SRE/C-REGULATORY FEES (PERMIT AND LICENSES)');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fcd','account:account','1.0','1992',NULL,'685','MARKET AND SLAUGHTERHOUSE FEES','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffc','SRE','SRE/A52380147:131d8fe3efb:-7ffc','SRE-SRE/C-REGULATORY FEES (PERMIT AND LICENSES)');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fce','account:account','1.0','1992',NULL,'653-2','CIVIL REGISTRATION FEES','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffc','SRE','SRE/A52380147:131d8fe3efb:-7ffc','SRE-SRE/C-REGULATORY FEES (PERMIT AND LICENSES)');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fcf','account:account','1.0','1992',NULL,'653-1','CATTLE ANIMAL REGISTRATION FEES','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffc','SRE','SRE/A52380147:131d8fe3efb:-7ffc','SRE-SRE/C-REGULATORY FEES (PERMIT AND LICENSES)');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fd0','account:account','1.0','1992',NULL,'652-09','OTHER PERMIT AND LICENSES','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffc','SRE','SRE/A52380147:131d8fe3efb:-7ffc','SRE-SRE/C-REGULATORY FEES (PERMIT AND LICENSES)');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fd1','account:account','1.0','1992',NULL,'651-08','OCCUPATIONAL FEES','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffc','SRE','SRE/A52380147:131d8fe3efb:-7ffc','SRE-SRE/C-REGULATORY FEES (PERMIT AND LICENSES)');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fd2','account:account','1.0','1992',NULL,'651-07','TRICYCLE OPERATORS PERMIT FEES','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffc','SRE','SRE/A52380147:131d8fe3efb:-7ffc','SRE-SRE/C-REGULATORY FEES (PERMIT AND LICENSES)');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fd3','account:account','1.0','1992',NULL,'651-06','ZONAL/LOCATIONAL PERMIT FEES','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffc','SRE','SRE/A52380147:131d8fe3efb:-7ffc','SRE-SRE/C-REGULATORY FEES (PERMIT AND LICENSES)');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fd4','account:account','1.0','1992',NULL,'651-05','BUILDING PERMIT FEES','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffc','SRE','SRE/A52380147:131d8fe3efb:-7ffc','SRE-SRE/C-REGULATORY FEES (PERMIT AND LICENSES)');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fd5','account:account','1.0','1992',NULL,'651-04','BUSINESS PERMIT FEES','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffc','SRE','SRE/A52380147:131d8fe3efb:-7ffc','SRE-SRE/C-REGULATORY FEES (PERMIT AND LICENSES)');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fd6','account:account','1.0','1992',NULL,'651-03','FRANCHISING AND LICENSING FEES','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffc','SRE','SRE/A52380147:131d8fe3efb:-7ffc','SRE-SRE/C-REGULATORY FEES (PERMIT AND LICENSES)');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fd7','account:account','1.0','1992',NULL,'651-02','FISHERY RENTAL AND PRIVILEDGE FEES','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffc','SRE','SRE/A52380147:131d8fe3efb:-7ffc','SRE-SRE/C-REGULATORY FEES (PERMIT AND LICENSES)');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fd9','account:account','1.0','1992',NULL,'651-01','FEES ON WEIGHTS AND MEASURES','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffc','SRE','SRE/A52380147:131d8fe3efb:-7ffc','SRE-SRE/C-REGULATORY FEES (PERMIT AND LICENSES)');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fdb','account:account','1.0','1992',NULL,'639-8','FINES AND PENALTIES - OTHER TAXES','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffd','SRE','SRE/A52380147:131d8fe3efb:-7ffd','SRE-SRE/B-OTHER TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fdc','account:account','1.0','1992',NULL,'638','OTHER TAXES','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffd','SRE','SRE/A52380147:131d8fe3efb:-7ffd','SRE-SRE/B-OTHER TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fdd','account:account','1.0','1992',NULL,'606','PROPERTY TRANSFER TAX','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffd','SRE','SRE/A52380147:131d8fe3efb:-7ffd','SRE-SRE/B-OTHER TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fde','account:account','1.0','1992',NULL,'623','PROFESSIONAL TAX','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffd','SRE','SRE/A52380147:131d8fe3efb:-7ffd','SRE-SRE/B-OTHER TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fdf','account:account','1.0','1992',NULL,'624-2','COMMUNITY TAX INDIVIDUAL','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffd','SRE','SRE/A52380147:131d8fe3efb:-7ffd','SRE-SRE/B-OTHER TAXES');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fe2','account:account','1.0','1992',NULL,'639-7','FINES AND PENALTIES - BUSINESS TAX','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffe','SRE','SRE/A52380147:131d8fe3efb:-7ffe','SRE-SRE/A-TAX ON BUSINESS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fe3','account:account','1.0','1992',NULL,'619-1','TAX ON GRAVEL AND SAND AND OTHER QUARRY RESOURCES (NET SHARE OF THE PROVINCE AND BARANGAY)','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffe','SRE','SRE/A52380147:131d8fe3efb:-7ffe','SRE-SRE/A-TAX ON BUSINESS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fe4','account:account','1.0','1992',NULL,'619','TAX ON GRAVEL AND SAND AND OTHER QUARRY RESOURCES (NET SHARE OF THE MUNICIPALITY)','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffe','SRE','SRE/A52380147:131d8fe3efb:-7ffe','SRE-SRE/A-TAX ON BUSINESS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fe5','account:account','1.0','1992',NULL,'652','MOTOR VEHICLE USERS TAX (DELIVERY TRUCKS AND VANS)','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffe','SRE','SRE/A52380147:131d8fe3efb:-7ffe','SRE-SRE/A-TAX ON BUSINESS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fe6','account:account','1.0','1992',NULL,'614','FRANCHISE TAX','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffe','SRE','SRE/A52380147:131d8fe3efb:-7ffe','SRE-SRE/A-TAX ON BUSINESS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fe7','account:account','1.0','1992',NULL,'610-10','OTHER BUSINESS','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffe','SRE','SRE/A52380147:131d8fe3efb:-7ffe','SRE-SRE/A-TAX ON BUSINESS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fe8','account:account','1.0','1992',NULL,'610-09','PRINTING AND PUBLICATION TAX','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffe','SRE','SRE/A52380147:131d8fe3efb:-7ffe','SRE-SRE/A-TAX ON BUSINESS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fe9','account:account','1.0','1992',NULL,'610-08','AMUSEMENT PLACE','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffe','SRE','SRE/A52380147:131d8fe3efb:-7ffe','SRE-SRE/A-TAX ON BUSINESS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fea','account:account','1.0','1992',NULL,'610-07','PEDDLERS','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffe','SRE','SRE/A52380147:131d8fe3efb:-7ffe','SRE-SRE/A-TAX ON BUSINESS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7feb','account:account','1.0','1992',NULL,'610-06','BANK AND OTHER FINANCIAL INSTITUTIONS','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffe','SRE','SRE/A52380147:131d8fe3efb:-7ffe','SRE-SRE/A-TAX ON BUSINESS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fec','account:account','1.0','1992',NULL,'610-05','CONTRACTORS AND OTHER INDEPENDENT CONTRACTORS','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffe','SRE','SRE/A52380147:131d8fe3efb:-7ffe','SRE-SRE/A-TAX ON BUSINESS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fed','account:account','1.0','1992',NULL,'610-04','RETAILERS','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffe','SRE','SRE/A52380147:131d8fe3efb:-7ffe','SRE-SRE/A-TAX ON BUSINESS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fee','account:account','1.0','1992',NULL,'610-03','EXPORTER OR MANUFACTURERS, DEALERS OR RETAILERS OF ESSENTIAL COMMODITIES','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffe','SRE','SRE/A52380147:131d8fe3efb:-7ffe','SRE-SRE/A-TAX ON BUSINESS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7fef','account:account','1.0','1992',NULL,'610-02','WHOLESALERS, DISTRIBUTORS ETC.','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffe','SRE','SRE/A52380147:131d8fe3efb:-7ffe','SRE-SRE/A-TAX ON BUSINESS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7ff0','account:account','1.0','1992',NULL,'610-01','MANUFACTURERS, ASSEMBLERS ETC.','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffe','SRE','SRE/A52380147:131d8fe3efb:-7ffe','SRE-SRE/A-TAX ON BUSINESS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7ff1','account:account','1.0','1992',NULL,'617-1','AMUSEMENT TAX (NET SHARE OF THE PROVINCE)','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffe','SRE','SRE/A52380147:131d8fe3efb:-7ffe','SRE-SRE/A-TAX ON BUSINESS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7ff2','account:account','1.0','1992',NULL,'617','AMUSEMENT TAX (NET SHARE OF THE MUNICIPALITY','SRE','GLACCOUNT','0.00','2','A52380147:131d8fe3efb:-7ffe','SRE','SRE/A52380147:131d8fe3efb:-7ffe','SRE-SRE/A-TAX ON BUSINESS');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7ff4','account:account','1.0','1992',NULL,'K','LOANS AND BORROWINGS','SRE','CATEGORY','0.00','1','SRE','SRE','SRE','SRE-SRE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7ff5','account:account','1.0','1992',NULL,'J','CAPITAL INVESTMENT RECEIPTS','SRE','CATEGORY','0.00','1','SRE','SRE','SRE','SRE-SRE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7ff6','account:account','1.0','1992',NULL,'I','INTER LOCAL TRANSFER','SRE','CATEGORY','0.00','1','SRE','SRE','SRE','SRE-SRE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7ff7','account:account','1.0','1992',NULL,'H','EXTRAORDINARY RECEIPTS/GRANTS/DONATIONS','SRE','CATEGORY','0.00','1','SRE','SRE','SRE','SRE-SRE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7ff8','account:account','1.0','1992',NULL,'G','SHARES FROM NATIONAL TAX COLLECTION','SRE','CATEGORY','0.00','1','SRE','SRE','SRE','SRE-SRE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7ff9','account:account','1.0','1992',NULL,'F','OTHER RECEIPTS/INCOME','SRE','CATEGORY','0.00','1','SRE','SRE','SRE','SRE-SRE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7ffa','account:account','1.0','1992',NULL,'E','ECONOMIC ENTERPRISE','SRE','CATEGORY','0.00','1','SRE','SRE','SRE','SRE-SRE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7ffb','account:account','1.0','1992',NULL,'D','SERVICE/USER CHARGES','SRE','CATEGORY','0.00','1','SRE','SRE','SRE','SRE-SRE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7ffc','account:account','1.0','1992',NULL,'C','REGULATORY FEES (PERMIT AND LICENSES)','SRE','CATEGORY','0.00','1','SRE','SRE','SRE','SRE-SRE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7ffd','account:account','1.0','1992',NULL,'B','OTHER TAXES','SRE','CATEGORY','0.00','1','SRE','SRE','SRE','SRE-SRE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('A52380147:131d8fe3efb:-7ffe','account:account','1.0','1992',NULL,'A','TAX ON BUSINESS','SRE','CATEGORY','0.00','1','SRE','SRE','SRE','SRE-SRE');
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('NGAS','account:account','1.0','1992','0','NGAS','NGAS','NGAS','CHART',NULL,'0',NULL,NULL,NULL,NULL);
insert into "account" ("objid", "schemaname", "schemaversion", "fromyear", "toyear", "acctcode", "accttitle", "charttype", "accttype", "target", "acctlevel", "parentid", "rootid", "pathbyids", "pathbytitle") values('SRE','account:account','1.0','1992',NULL,'SRE','SRE','SRE','CHART',NULL,'0',NULL,NULL,NULL,NULL);





/*=== create the table index =====*/

create index "ux_title_parentid" on account ("accttitle","parentid");

create index "ix_afcontrol_collectorid" on afcontrol ("collectorid");
create index "ix_afcontrol_collectorname" on afcontrol ("collectorname");
create index "ix_afcontrol_afid" on afcontrol ("afid");
create index "ix_afcontrol_colid_afid" on afcontrol ("collectorid","afid");
create index "ix_afcontrol_colafstatemode" on afcontrol ("collectorid","afid","docstate","mode");

create index "ix_batchcapture_state" on batchcapture ("docstate");
create index "ix_batchcapture_colname" on batchcapture ("collectorname");
create index "ix_batchcapture_encodedby" on batchcapture ("encodedby");

create index "ix_bpapplication_docstate" on bpapplication ("docstate");
create index "ix_bpapplication_businesid" on bpapplication ("businessid");
create index "ix_bpapplication_businesid_docstate" on bpapplication ("businessid","docstate");
create index "ix_bpapplication_txnno" on bpapplication ("txnno");
create index "ix_bpapplication_tradename" on bpapplication ("tradename");
create index "ix_bpapplication_barcode" on bpapplication ("barcode");

create index "ix_bpapplicationlisting_businessid" on bpapplicationlisting ("businessid");
create index "ix_bpapplicationlisting_tradename" on bpapplicationlisting ("tradename");
create index "ix_bpapplicationlisting_docstate" on bpapplicationlisting ("docstate");
create index "ix_bpapplicationlisting_txnno" on bpapplicationlisting ("txnno");
create index "ix_bpapplicationlisting_businesid_docstate" on bpapplicationlisting ("businessid","docstate");
create index "ix_bpapplicationlisting_tradenamedocstate" on bpapplicationlisting ("tradename","docstate");
create index "ix_bpapplicationlisting_taxpayernamedocstate" on bpapplicationlisting ("taxpayername","docstate");
create index "ix_bpapplicationlisting_bindocstate" on bpapplicationlisting ("bin","docstate");
create index "ix_bpapplicationlisting_txnnodocstate" on bpapplicationlisting ("txnno","docstate");
create index "ix_bpapplicationlisting_barcode" on bpapplicationlisting ("barcode");
create index "ix_bpapplicationlisting_sym" on bpapplicationlisting ("docstate","iyear","txnmode");

create index "ix_bploblisting_appid" on bploblisting ("applicationid");

create index "ix_bppayment_applicationid" on bppayment ("applicationid");
create index "ix_bppayment_txndate" on bppayment ("txndate");
create index "ix_bppayment_receiptid" on bppayment ("receiptid");

create index "ix_bppermit_businessid" on bppermit ("businessid");
create index "ix_bppermit_appid" on bppermit ("applicationid");

create index "ix_business_bin" on business ("bin");
-- create index "ix_business_taxpayername" on business ("taxpayername"(767));
create index "ix_business_taxpayerid" on business (taxpayerid);
create index "ix_business_adminname" on business ("adminname");
create index "ix_business_businessaddress" on business ("businessaddress");

create index "FK_changeaddresslist_business" on changeaddresslist ("businessid");
-- CONSTRAINT "FK_changeaddresslist" FOREIGN KEY ("objid") REFERENCES "bptxn" ("objid"),
-- CONSTRAINT "FK_changeaddresslist_business" FOREIGN KEY ("businessid") REFERENCES "business" ("objid")

create index "FK_changeadminlist_newadmin" on changeadminlist ("newadminid");
create index "FK_changeadminlist_prevadmin" on changeadminlist ("prevadminid");
create index "FK_changeadminlist_business" on changeadminlist ("businessid");
-- CONSTRAINT "FK_changeadminlist" FOREIGN KEY ("objid") REFERENCES "bptxn" ("objid"),
-- CONSTRAINT "FK_changeadminlist_business" FOREIGN KEY ("businessid") REFERENCES "business" ("objid"),
-- CONSTRAINT "FK_changeadminlist_newadmin" FOREIGN KEY ("newadminid") REFERENCES "entity" ("objid"),
-- CONSTRAINT "FK_changeadminlist_prevadmin" FOREIGN KEY ("prevadminid") REFERENCES "entity" ("objid")

create index "FK_changepermitteelist_newtaxpayer" on changepermitteelist ("newtaxpayerid");
create index "FK_changepermitteelist_prevtaxpayer" on changepermitteelist ("prevtaxpayerid");
create index "FK_changepermitteelist_business" on changepermitteelist ("businessid");
-- CONSTRAINT "FK_changepermitteelist" FOREIGN KEY ("objid") REFERENCES "bptxn" ("objid"),
-- CONSTRAINT "FK_changepermitteelist_business" FOREIGN KEY ("businessid") REFERENCES "business" ("objid"),
-- CONSTRAINT "FK_changepermitteelist_newtaxpayer" FOREIGN KEY ("newtaxpayerid") REFERENCES "entity" ("objid"),
-- CONSTRAINT "FK_changepermitteelist_prevtaxpayer" FOREIGN KEY ("prevtaxpayerid") REFERENCES "entity" ("objid")

create index "FK_changetradenamelist_business" on changetradenamelist ("businessid");
-- CONSTRAINT "FK_changetradenamelist" FOREIGN KEY ("objid") REFERENCES "bptxn" ("objid"),
-- CONSTRAINT "FK_changetradenamelist_business" FOREIGN KEY ("businessid") REFERENCES "business" ("objid")

-- create unique index "uix_afid" on collectiontype ("name","afid");
create index "FK_collectiontype" on collectiontype ("afid");
create index "ix_collectiontype_afid" on collectiontype ("afid");

create index "ix_deposit_txnno" on deposit ("txnno");
create index "ix_deposit_docstate" on deposit ("docstate");
create index "ix_deposit_depositedbyname" on deposit ("depositedbyname");

create index "ix_entity_no" on entity ("entityno");
-- create index "ix_entity_name" on entity ("entityname");
-- create index "ix_entity_entityname" on entity ("entityname");
create index "ix_entity_entityno" on entity ("entityno");
create index "ix_entity_entitytype" on entity ("entitytype");

create index "ix_brgy_state_section_taxable" on faaslist ("barangayid","docstate","section","taxable");
create index "ix_faaslist_barangayid_docstate" on faaslist ("barangayid","docstate");
create index "ix_txntimestamp_docstate" on faaslist ("txntimestamp","docstate");
create index "FK_faaslist" on faaslist ("taxpayerid");
create index "ix_faaslist_annotated" on faaslist ("annotated");
create index "ix_faaslist_prevtdno_ry" on faaslist ("prevtdno","ry");
create index "ix_faaslist_prevtdno" on faaslist ("prevtdno");
create index "ix_faaslist_rydocstate" on faaslist ("ry","docstate");
create index "ix_faaslist_timestamp_docstate_taxable" on faaslist ("txntimestamp","docstate","taxable");
create index "ix_faaslist_pin_rputype" on faaslist ("rputype","pin");
-- CONSTRAINT "FK_faaslist" FOREIGN KEY ("taxpayerid") REFERENCES "entity" ("objid")

create index "name" on filter ("name","refname");

create unique index "ix_incomeacct_title" on incomeaccount ("accttitle");

create index "ix_jobposition" on jobposition ("orgunitid");
create index "ix_jobposition_roleclass" on jobposition ("roleclass");
create index "ix_jobposition_role" on jobposition ("role");
create index "ix_jobposition_personnel" on jobposition ("assigneeid");
  -- CONSTRAINT "FK_jobposition" FOREIGN KEY ("orgunitid") REFERENCES "orgunit" ("objid"),
  -- CONSTRAINT "FK_jobposition_assignee" FOREIGN KEY ("assigneeid") REFERENCES "personnel" ("objid"),
  -- CONSTRAINT "FK_jobposition_role" FOREIGN KEY ("role") REFERENCES "role" ("name")
  
create index "ix_liquidationlist_period" on liquidationlist ("iyear","iqtr","imonth");
-- CONSTRAINT "FK_liquidation" FOREIGN KEY ("objid") REFERENCES "liquidation" ("objid")

create index "FK_liquidationrcd" on liquidationrcd ("liquidationid");
create index "FK_liquidationrcd_fund" on liquidationrcd ("fundid");
create index "lqofficerid" on liquidationrcd ("lqofficerid");
create index "ix_liquidationrcd_cashierid" on liquidationrcd ("cashierid");
-- CONSTRAINT "FK_liquidationrcd" FOREIGN KEY ("liquidationid") REFERENCES "liquidation" ("objid"),
-- CONSTRAINT "FK_liquidationrcd_fund" FOREIGN KEY ("fundid") REFERENCES "fund" ("objid")

-- create unique index "ux_lob_name" on lob ("name");
create index "ux_lob_name" on lob ("name");
create index "ix_lob" on lob ("classificationid");
-- CONSTRAINT "FK_lob" FOREIGN KEY ("classificationid") REFERENCES "lobclassification" ("objid")

create index "ux_lobclassification_name" on lobclassification ("name");

create index "ix_orgunit" on orgunit ("orgtype");
-- CONSTRAINT "FK_orgunit" FOREIGN KEY ("orgtype") REFERENCES "orgtype" ("name")

create index "ix_paymentitem_rctid" on paymentitem ("receiptid");
create index "ix_paymentitem_rctid_paytype" on paymentitem ("receiptid","paytype");
create index "ix_paymentitem_receiptid" on paymentitem ("receiptid");
create index "ix_paymentitem_liquidationid" on paymentitem ("liquidationid");
create index "ix_paymentitem_liquidationrcdid" on paymentitem ("liquidationrcdid");

create unique index "staffno" on personnel ("staffno");

create unique index "ux_pin_pinclaimno" on pin ("pin","claimno");

create unique index "ux_propertypayerid_ledgerid" on propertypayeritem ("propertypayerid","ledgerid");

create index "ix_receipt_remid" on receipt ("remittanceid");
create index "ix_receipt_remno" on receipt ("remittanceno");

create index "ix_receiptitem_rctid" on receiptitem ("receiptid");
create index "ix_receiptitem_acctid" on receiptitem ("acctid");
create index "ix_receiptitem_accttitle" on receiptitem ("accttitle");
create index "ix_receiptitem_liquidationrcdid" on receiptitem ("liquidationrcdid");
-- CONSTRAINT "FK_receiptitem" FOREIGN KEY ("acctid") REFERENCES "incomeaccount" ("objid")

create index "ix_receiptlist_docstatecolid" on receiptlist ("collectorid","docstate");
create index "ix_receiptlist_remid" on receiptlist ("remittanceid");
create index "ix_receiptlist_remno" on receiptlist ("remittanceno");
create index "ix_receiptlist_iyear" on receiptlist ("iyear");
create index "ix_receiptlist_iqtr" on receiptlist ("iyear","iqtr");
create index "ix_receiptlist_imonth" on receiptlist ("iyear","imonth");
create index "ix_receiptlist_iday" on receiptlist ("iyear","imonth","iday");
create index "ix_receiptlist_serialno" on receiptlist ("serialno");
create index "ix_receiptlist_stubno" on receiptlist ("stubno");
create index "ix_receiptlist_collectorname" on receiptlist ("collectorname");
create index "ix_receiptlist_payorname" on receiptlist ("payorname");
create index "ix_receiptlist_colidvoided" on receiptlist ("collectorid","voided");
create index "ix_receiptlist_doctype_voided" on receiptlist ("doctype","voided");

create index "ix_remittancelist_liquidationid" on remittancelist ("liquidationid");
create index "ix_liquidatingofficerid" on remittancelist ("liquidatingofficerid");
create index "ix_liquidatingofficerid_txndate" on remittancelist ("liquidatingofficerid","txndate");
-- CONSTRAINT "FK_remittancelist" FOREIGN KEY ("objid") REFERENCES "remittance" ("objid")

create index "ix_remittance" on remittedform ("remittanceid");
create index "ix_afcontrol" on remittedform ("afcontrolid");
create index "ix_af" on remittedform ("afid");
-- CONSTRAINT "FK_af" FOREIGN KEY ("afid") REFERENCES "af" ("objid"),
-- CONSTRAINT "FK_afcontrol" FOREIGN KEY ("afcontrolid") REFERENCES "afcontrol" ("objid"),
-- CONSTRAINT "FK_remittance" FOREIGN KEY ("remittanceid") REFERENCES "remittance" ("objid")

create index "ix_revenue_liquidation" on revenue ("liquidationid");
create index "ix_revenue_remittance" on revenue ("remittanceid");
create index "ix_revenue_deposit" on revenue ("depositid");
create index "ix_revenue_incomeaccount" on revenue ("acctid");
create index "ix_revenue_ngas" on revenue ("ngasid");
create index "ix_revenue_sre" on revenue ("sreid");
create index "ix_revenue_receipt" on revenue ("receiptid");
create index "ix_revenue_af" on revenue ("afid");
create index "ix_revenue_afcontrol" on revenue ("afcontrolid");
create index "ix_revenue_liquidationtimestamp_voided" on revenue ("liquidationtimestamp","voided");
create index "ix_revenue_liquidationtimestamp" on revenue ("liquidationtimestamp");
create index "ix_revenue_liquidationrcdid" on revenue ("liquidationrcdid");
-- CONSTRAINT "FK_revenue_af" FOREIGN KEY ("afid") REFERENCES "af" ("objid"),
-- CONSTRAINT "FK_revenue_afcontrol" FOREIGN KEY ("afcontrolid") REFERENCES "afcontrol" ("objid"),
-- CONSTRAINT "FK_revenue_deposit" FOREIGN KEY ("depositid") REFERENCES "deposit" ("objid"),
-- CONSTRAINT "FK_revenue_incomeaccount" FOREIGN KEY ("acctid") REFERENCES "incomeaccount" ("objid"),
-- CONSTRAINT "FK_revenue_liquidation" FOREIGN KEY ("liquidationid") REFERENCES "liquidation" ("objid"),
-- CONSTRAINT "FK_revenue_ngas" FOREIGN KEY ("ngasid") REFERENCES "account" ("objid"),
-- CONSTRAINT "FK_revenue_remittance" FOREIGN KEY ("remittanceid") REFERENCES "remittance" ("objid"),
-- CONSTRAINT "FK_revenue_sre" FOREIGN KEY ("sreid") REFERENCES "account" ("objid")


create index "ix_role" on "role" ("roleclass");

create unique index "ux_rptledger_fullpin" on rptledger ("fullpin","claimno");
create index "ix_rptledger_docstate" on rptledger ("docstate");
create index "ix_rptledger_tdnostate" on rptledger ("tdno","docstate");
create index "ix_rptledger_prevtdnostate" on rptledger ("prevtdno","docstate");
create index "ix_rptledger_lotstate" on rptledger ("cadastrallotno","docstate");
create index "ix_rptledger_brgystate" on rptledger ("barangay","docstate");
create index "ix_rptledger_tpaynostate" on rptledger ("taxpayerno","docstate");
create index "ix_rptledger_namestate" on rptledger ("taxpayername","docstate");
create index "ix_rptledger_faasid" on rptledger ("faasid");

create index "ix_rptledger_parentid" on rptledgeritem ("parentid");
create index "ix_rptledger_tdno" on rptledgeritem ("tdno");

create index "ix_rptpaymentmanual_receiptid" on rptpaymentmanual ("receiptid");

-- create unique index "macaddress_unique" on terminal ("macaddress");

create index "ix_txnlog_refid" on txnlog ("refid");

create unique index "username" on useraccount ("uid");

create unique index "ux_variable_name" on variable ("name");




