-- add permission: changedepreciation.create to rpt2


ALTER TABLE lguname_etracs.rptsetting ADD COLUMN allowreassessmentwithbalance INT NULL;

UPDATE lguname_etracs.rptsetting SET allowreassessmentwithbalance = 0 WHERE allowreassessmentwithbalance IS NULL ;


ALTER TABLE lguname_etracs.rptsetting ADD COLUMN allowchangedepreciationwithbalance INT NULL;

UPDATE lguname_etracs.rptsetting SET allowchangedepreciationwithbalance = 0;

update lguname_system.sys_module set permissions = '[   [ action:''account.view'',           title:''View Chart of Account'' ],   [ action:''account.addcategory'',    title:''Add Account Category'' ],   [ action:''account.addglacct'',      title:''Add GL Account'' ],   [ action:''account.addsubacct'',     title:''Add Sub-Account'' ],   [ action:''account.edit'',     title:''Edit Account Information'' ],   [ action:''account.delete'',   title:''Delete Account Information'' ],     [ action:''bank.view'',     title:''View Bank Information'' ],   [ action:''bank.create'',   title:''Create Bank'' ],   [ action:''bank.edit'',     title:''Edit Bank'' ],   [ action:''bank.delete'',   title:''Delete Bank'' ],     [ action:''bankacct.view'',     title:''View Bank Account Information'' ],   [ action:''bankacct.create'',   title:''Create Bank Account'' ],   [ action:''bankacct.edit'',     title:''Edit Bank Account'' ],   [ action:''bankacct.delete'',   title:''Delete Bank Account'' ],   [ action:''bankacct.approve'',  title:''Approve Bank Account'' ],     [ action:''collectionsetting.manage'', title:''Manage Collection Setting'' ],   [ action:''collectiontype.viewlist'',  title:''View Collection Type Listing'' ],   [ action:''collectiontype.create'',    title:''Create Collection Type'' ],   [ action:''collectiontype.edit'',      title:''Edit Collection Type'' ],   [ action:''collectiontype.delete'',    title:''Delete Collection Type'' ],     [ action:''fund.viewlist'',  title:''View Fund Listing'' ],   [ action:''fund.create'',    title:''Create Fund'' ],   [ action:''fund.edit'',      title:''Edit Fund'' ],   [ action:''fund.delete'',    title:''Delete Fund'' ],   [ action:''fund.approve'',   title:''Approve Fund'' ],     [ action:''incomeacct.viewlist'',  title:''View Income Account Listing'' ],   [ action:''incomeacct.create'',    title:''Create Income Account'' ],   [ action:''incomeacct.edit'',      title:''Edit Income Account'' ],   [ action:''incomeacct.delete'',    title:''Delete Income Account'' ],   [ action:''incomeacct.approve'',   title:''Approve Income Account'' ],     [ action:''incomeacctgroup.viewlist'',  title:''View Income Account Group Listing'' ],   [ action:''incomeacctgroup.create'',    title:''Create Income Account Group'' ],   [ action:''incomeacctgroup.delete'',    title:''Delete Income Account Group'' ],      [ action:''tcmanagement.open'' ,title:''Manage TC Master Files'' ],        [ action:''af.viewlist'',  title:''View Accountable Form Listing'' ],   [ action:''af.create'',    title:''Create Accountable Form'' ],   [ action:''af.edit'',      title:''Edit Accountable Form'' ],   [ action:''af.delete'',    title:''Delete Accountable Form'' ],   [ action:''af.approve'',   title:''Approve Accountable Form'' ],     [ action:''afcontrol.changemode'',  title:''AF Control Change Mode'' ],   [ action:''afcontrol.activate'',    title:''Activate AF Control'' ],   [ action:''afcontrol.transfer'' ,title:''Transfer AF Control'' ],   [ action:''afcontrol.adjustqty'' ,title:''Adjust AF Control Quantity (NonSerial)'' ],       [ action:''riv_lgu.create'', title:''Create LGU RIV'' ],   [ action:''riv.create'',    title:''Create RIV'' ],   [ action:''riv.salecreate'',title:''Create RIV (SALE)'' ],   [action:''riv.collector'', title:''Create RIV (Collector)''],   [ action:''riv.edit'',      title:''Edit RIV'' ],   [ action:''riv.delete'',    title:''Delete RIV'' ],   [ action:''riv.approve'',   title:''Approve RIV'' ],   [ action:''riv.preview'',   title:''Preview RIV'' ],      [ action:''iraf.viewlist'',  title:''View IRAF Listing'' ],   [ action:''iraf.create'',    title:''Create IRAF'' ],   [ action:''iraf.edit'',      title:''Edit IRAF'' ],   [ action:''iraf.delete'',    title:''Delete IRAF'' ],   [ action:''iraf.approve'',   title:''Approve IRAF'' ],     [ action:''afinventory.view'', title:''View AF Inventory Information'' ],       [ action:''deposit.viewlist'',   title:''View Deposit Listing'' ],   [ action:''deposit.view'',       title:''View Deposit Information'' ],   [ action:''deposit.create'',     title:''Create Deposit Information'' ],   [ action:''deposit.close'',      title:''Close Deposit Information'' ],   [ action:''deposit.addnoncash'', title:''Add Non-Cash Payments for Deposit'' ],   [ action:''deposit.addexternalnoncash'',     title:''Add External Non-Cash for Deposit'' ],     [ action:''collection.create_online'',   title:''Create Online Collection''],   [ action:''collection.create_offline'',  title:''Create Offline Collection''],      [ action:''remittance.create'',          title:''Create Remittance'' ],   [ action:''remittance.submit'',          title:''Submit Remittance'' ],   [ action:''remittance.viewlist'',        title:''View Remittance Listing'' ],   [action:''remittance.import'',  title:''Import Remittance''],     [ action:''receipt.viewissued'',    title:''View Issued Receipt Listing'' ],   [ action:''receipt.inquire'',       title:''Inquire Receipt Information'' ],     [ action:''afcontrol.activate'',  title:''Activate AF Control'' ],   [ action:''afcontrol.assignto'',  title:''Assign AF Control'' ],       [action:''batchcapturemgmt.view'' ,title:''View Batch Capture Management''],    [action:''batchcapture.create''  ,title:''Create Batch Capture'' ],   [action:''batchcapture.open''  ,title:''Open Batch Capture'' ],    [action:''batchcapture.view''  ,title:''View Batch Capture'' ],   [action:''batchcapture.delete''  ,title:''Delete Batch Capture'' ],   [action:''batchcapture.post''  ,title:''Post Batch Capture'' ],     [ action:''collection_burial.create'',  title:''Create Burial Permit Fee Collection'' ],   [ action:''collection_burial.edit'',    title:''Edit Burial Permit Fee Collection'' ],   [ action:''collection_burial.print'',   title:''Print Burial Permit Fee Collection'' ],   [ action:''collection_burial.void'',    title:''Void Burial Permit Fee Collection'' ],   [ action:''collection_burial.inquire'', title:''Inquire Burial Permit Fee Collection'' ],     [ action:''collection_cashticket.create'',  title:''Create Cash Ticket Collection'' ],   [ action:''collection_cashticket.delete'',  title:''Delete Cash Ticket Collection'' ],   [ action:''collection_cashticket.inquire'', title:''Inquire Cash Ticket  Collection'' ],     [ action:''collection_cattleownership.create'',  title:''Create Large Cattle Ownership Collection'' ],   [ action:''collection_cattleownership.edit'',    title:''Edit Large Cattle Ownership Collection'' ],   [ action:''collection_cattleownership.print'',   title:''Print Large Cattle Ownership Collection'' ],   [ action:''collection_cattleownership.void'',    title:''Void Large Cattle Ownership Collection'' ],   [ action:''collection_cattleownership.inquiry'', title:''Inquire Large Cattle Ownership  Collection'' ],     [ action:''collection_cattletransfer.create'',  title:''Create Large Cattle Transfer Collection'' ],   [ action:''collection_cattletransfer.edit'',    title:''Edit Large Cattle Transfer Collection'' ],   [ action:''collection_cattletransfer.print'',   title:''Print Large Cattle Transfer Collection'' ],   [ action:''collection_cattletransfer.void'',    title:''Void Large Cattle Transfer Collection'' ],   [ action:''collection_cattletransfer.inquiry'', title:''Inquire Large Cattle Transfer  Collection'' ],     [ action:''collection_general.create'',  title:''Create General Collection'' ],   [ action:''collection_general.edit'',    title:''Edit General Collection'' ],   [ action:''collection_general.print'',   title:''Print General Collection'' ],   [ action:''collection_general.void'',    title:''Void General Collection'' ],   [ action:''collection_general.inquire'', title:''Inquire General Collection'' ],     [ action:''collection_marriage.create'',  title:''Create Marriage License Fee Collection'' ],   [ action:''collection_marriage.edit'',    title:''Edit Marriage License Fee Collection'' ],   [ action:''collection_marriage.print'',   title:''Print Marriage License Fee Collection'' ],   [ action:''collection_marriage.void'',    title:''Void Marriage License Fee Collection'' ],   [ action:''collection_marriage.inquiry'', title:''Inquire Marriage License Fee  Collection'' ],     [action:''postcapturereceipt.create'',   title:''Create Post Capture Receipt''],   [action:''postcapturereceipt.post'',     title:''Submit Post Capture Receipt''],       [action:''tcreport.abstractofcollection'' ,title:''Generate Abstract of Collection Report''],   [action:''tcreport.abstractofcollectionbychart'' ,title:''Generate Abstract of Colleciton By Chart of Account'' ],   [action:''tcreport.incomeaccount''   ,title:''Income Account Report''],   [action:''tcreport.craaf''    ,title:''CRAAF Report''],   [action:''tcreport.statementofrevenue''  ,title:''Generate Statement of Revenue''],    [action:''tcreport.reportofcollection''  ,title:''Report of Collection'' ],   [action:''tcreport.reportofcollection2''  ,title:''Report of Collection 2'' ],     [action:''collection_slaughterpermit.inquiry''  ,title:''Inquire Slaughter Permit'' ],   [action:''collection_slaughterpermit.create''  ,title:''Create Slaughter Permit''],   [action:''collection_slaughterpermit.print''  ,title:''Print Slaughter Permit'' ],   [action:''collection_slaughterpermit.void''  ,title:''Void Slaughter Permit'' ],   [action:''collection_slaughterpermit.edit''  ,title:''Edit Slaughter Permit'' ],       [ action:''liquidation.create'', title:''Create Liquidation'' ],   [ action:''liquidationmulti.create'', title:''Create Multi-Cashier Liquidation''],   [ action:''liquidation.submit'', title:''Submit Liquidation'' ],   [ action:''liquidation.viewlist'', title:''View Liquidation Listing'' ]     [ action:''collection.create_capture'' ,title:''Create Capture Collection''],   [ action:''receipt.viewissued''  ,title:''View Issued Receipt Listing'' ],   [ action:''afcontrol.activate''  ,title:''Activate AF Control'' ],   [ action:''postcapturereceipt.create'' ,title:''Create Post Capture Receipt''],   [ action:''postcapturereceipt.post'' ,title:''Submit Post Capture Receipt''],   [ action:''postcapturereceipt.viewlist'' ,title:''View Post Capture Listing'' ],     [ action:''bpadmin.setting''  ,title:''Manage BP Setting'' ],     [action:''treasurymgmt.view'',                title:''View Treasury Management''],   [action:''treasurymgmt_abstract.view'',       title:''View Treasury Management (Abstract of Collection)''],   [action:''treasurymgmt_afmonitoring.view'',   title:''View Treasury Management (AF Monitoring)''],   [action:''treasurymgmt_collection.view'',     title:''View Treasury Management (Collection Summary)''],   [action:''treasurymgmt_fund.view'',           title:''View Treasury Management (Fund Summary)''],   [action:''treasurymgmt_liquidation.view'',    title:''View Treasury Management (Liquidation Detail)''],   [action:''treasurymgmt_remittance.view'',     title:''View Treasury Management (Remittance Monitoring)''],   [action:''treasurymgmt_liquidation.view'',    title:''View Undeposited Liquidation Summary'' ],      [action:''form60.setup''  ,title:''Setup Form 60 Report''],      [action:''collectiongroup.view''  ,title:''View Collection Groups'' ],   [action:''collectiongroup.create'' ,title:''Create Collection Group'' ],   [action:''collectiongroup.edit''  ,title:''Edit Collection Group'' ],   [action:''collectiongroup.delete'' ,title:''Delete Collection Group'' ],  [ action:''remittance_subcollector.create'',          title:''Create Subcollector Remittance'' ],   [ action:''remittance_subcollector.submit'',          title:''Submit Subcollector Remittance'' ],   [ action:''remittance_subcollector.viewlist'',        title:''View Subcollector Remittance Listing'' ],  ]' where name ='tc2' 

create table lguname_etracs.remittance_subcollector (
	objid varchar(50) NOT NULL,
	schemaname varchar(50) NOT NULL,
	schemaversion varchar(5) NOT NULL,
	docstate varchar(20) NOT NULL,
	txnno varchar(20) NOT NULL,
	txndate date NOT NULL,
	collectorname varchar(50) NOT NULL,
	amount decimal(10, 2) NULL,
	collectorid varchar(50) NOT NULL,
	collectortitle varchar(50) NULL,
	totalcash decimal(10, 2) NULL,
	totalotherpayment decimal(10, 2) NULL,
	remittanceid varchar(50) NULL,
	remittanceno varchar(15) NULL,
	remittancedate date NULL,
	remittanceofficerid varchar(50) NULL,
	remittanceofficername varchar(50) NULL,
	remittanceofficertitle varchar(50) NULL,
	info text NULL,
	PRIMARY KEY  (objid)
);

alter table lguname_etracs.receiptlist add sc_remittanceid varchar(50) null;




/* ============================================================
**  DENORMALIZE REMITTANCE SUPPORT 
============================================================ */

ALTER TABLE lguname_etracs.remittancelist ADD COLUMN dtposted DATE NULL;

UPDATE lguname_etracs.remittancelist SET dtposted = txndate;

ALTER TABLE lguname_etracs.remittancelist CHANGE COLUMN dtposted dtposted DATE NOT NULL;

ALTER TABLE lguname_etracs.remittancelist ADD COLUMN denominations VARCHAR(600) NULL;

ALTER TABLE lguname_etracs.remittancelist DROP FOREIGN KEY FK_remittancelist_remittance;


ALTER TABLE lguname_etracs.receiptlist DROP FOREIGN KEY FK_receiptlist_remittance;

ALTER TABLE lguname_etracs.remittedform DROP FOREIGN KEY FK_remittedform_remittance;



RENAME TABLE lguname_etracs.remittance TO dev_etracs.xremittance; 

RENAME TABLE lguname_etracs.remittancelist TO dev_etracs.remittance; 


ALTER TABLE lguname_etracs.receiptlist
	ADD CONSTRAINT FK_receiptlist_remittance FOREIGN KEY (remittanceid) REFERENCES lguname_etracs.remittance(objid);

ALTER TABLE lguname_etracs.remittedform
	ADD CONSTRAINT FK_remittedform_remittance FOREIGN KEY (remittanceid) REFERENCES lguname_etracs.remittance(objid);

RENAME TABLE lguname_etracs.`remittancelist` TO lguname_etracs.remittance;



/* =================================================================== 
** Normalize Liquidation  
=================================================================== */
ALTER TABLE lguname_etracs.liquidationlist ADD COLUMN dtposted DATE;

UPDATE lguname_etracs.liquidationlist SET dtposted = txndate;

ALTER TABLE lguname_etracs.liquidationlist CHANGE COLUMN dtposted dtposted DATE NOT NULL ;


ALTER TABLE lguname_etracs.liquidationlist ADD COLUMN denominations VARCHAR(600);

UPDATE lguname_etracs.liquidationlist SET denominations = '[]' ;


ALTER TABLE lguname_etracs.liquidationlist DROP FOREIGN KEY FK_liquidationlist_deposit;

ALTER TABLE lguname_etracs.liquidationlist DROP FOREIGN KEY  FK_liquidationlist_liquidation;

ALTER TABLE lguname_etracs.liquidationlist DROP FOREIGN KEY  FK_liquidationlist_personnel;

ALTER TABLE lguname_etracs.liquidationlist DROP FOREIGN KEY  FK_liquidationlist_personnel_depositedbyid;


-- Rename related tables 
USE lguname_etracs;

RENAME TABLE liquidation TO xliquidation;

RENAME TABLE liquidationlist TO liquidation ;



ALTER TABLE lguname_etracs.liquidation
	ADD CONSTRAINT FK_liquidation_deposit FOREIGN KEY(depositid) REFERENCES lguname_etracs.deposit(objid);

ALTER TABLE lguname_etracs.liquidation
	ADD CONSTRAINT FK_liquidation_personnel FOREIGN KEY(liquidatingofficerid) REFERENCES lguname_etracs.personnel(objid);

ALTER TABLE lguname_etracs.liquidation 
	ADD CONSTRAINT FK_liquidation_personnel_depositedbyid FOREIGN KEY(depositedbyid) REFERENCES lguname_etracs.personnel(objid);
	
ALTER TABLE lguname_etracs.remittance DROP FOREIGN KEY FK_remittancelist_liquidation;

ALTER TABLE lguname_etracs.remittance DROP FOREIGN KEY  FK_remittancelist_personnel;

ALTER TABLE lguname_etracs.remittance DROP FOREIGN KEY  FK_remittancelist_personnel_lqid;



ALTER TABLE lguname_etracs.remittance 
	ADD CONSTRAINT FK_remittance_liquidation FOREIGN KEY(liquidationid) 
	REFERENCES lguname_etracs.liquidation( objid );

ALTER TABLE lguname_etracs.remittance 
	ADD CONSTRAINT FK_remittance_personnel FOREIGN KEY(collectorid) 
	REFERENCES lguname_etracs.personnel( objid );

ALTER TABLE lguname_etracs.remittance 
	ADD CONSTRAINT FK_remittance_personnel_lqid FOREIGN KEY(liquidatingofficerid) 
	REFERENCES lguname_etracs.personnel( objid );




insert into lguname_system.sys_module(name, title, permissions)
values('rpt2-reports', 'RPT Reports', '[[action:"rptreport.pdaprpta100", title:"Generate PDAP-RPTA 100 Report",]]');

insert into lguname_system.sys_roleclass_module
values('RPT', 'rpt2-reports');

alter table lguname_etracs..rptpaymentmanual add column basicadv decimal(16,2);
alter table lguname_etracs..rptpaymentmanual add column basicadvdisc decimal(16,2);
alter table lguname_etracs..rptpaymentmanual add column sefadv decimal(16,2);
alter table lguname_etracs..rptpaymentmanual add column sefadvdisc decimal(16,2);


update lguname_etracs.rptpaymentmanual set 
	basicadv = 0.0, basicadvdisc = 0.0, 
	sefadv = 0.0, sefadvdisc = 0.0;
	
	
	
CREATE TABLE lguname_system.`sys_role` (
  `name` VARCHAR(50) NOT NULL,
  `domain` VARCHAR(50) NOT NULL,
  PRIMARY KEY  (`name`,`domain`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;


CREATE TABLE lguname_system.`sys_role_permission` (
  `sysrole` VARCHAR(50) NOT NULL,
  `domain` VARCHAR(50) NOT NULL,
  `key` VARCHAR(50) NOT NULL,
  `title` VARCHAR(50) DEFAULT NULL,
  `module` VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY  (`sysrole`,`domain`,`key`),
  CONSTRAINT `FK_sys_role_permission` FOREIGN KEY (`sysrole`, `domain`) REFERENCES `sys_role` (`name`, `domain`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

