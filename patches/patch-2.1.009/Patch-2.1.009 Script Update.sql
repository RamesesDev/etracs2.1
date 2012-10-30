/* FAAS Attachment */
ALTER TABLE lguname_etracs.faasattachment ADD COLUMN absolutefilename varchar(300) NULL;


/* SubFund with Required Bank Account fund support */
ALTER TABLE lguname_etracs.fund ADD COLUMN bankacctrequired INT NULL;

UPDATE lguname_etracs.fund SET bankacctrequired = 1;




ALTER TABLE lguname_etracs.receiptlist 
	ADD COLUMN totalpayment DECIMAL(16,2),
	ADD COLUMN remarks VARCHAR(200),
	ADD COLUMN `series` INT NOT NULL,
	ADD COLUMN `extended` TEXT;
	
UPDATE lguname_etracs.`receiptlist` rl, lguname_etracs.`receipt` r SET
		rl.`extended` = r.`extended`,
		rl.totalpayment = rl.amount 
WHERE rl.`objid` = r.`objid`;
		
ALTER TABLE lguname_etracs.paymentitem 
	ADD COLUMN `extended` TEXT;	
	
	
SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE lguname_etracs.receiptlist DROP FOREIGN KEY FK_receiptlist_receipt;

ALTER TABLE lguname_etracs.receiptitem
	DROP FOREIGN KEY FK_receiptitem_receipt,
	ADD CONSTRAINT FK_receiptitem_receiptlist FOREIGN KEY (receiptid) REFERENCES lguname_etracs.`receiptlist`(objid);

ALTER TABLE lguname_etracs.paymentitem 
	DROP FOREIGN KEY FK_paymentitem_receipt,
	ADD CONSTRAINT FK_paymentitem_receiptlist FOREIGN KEY(receiptid) REFERENCES lguname_etracs.`receiptlist`(objid);


ALTER TABLE lguname_etracs.afcontrol 
	ADD COLUMN assignedtoid VARCHAR(50) NULL,
	ADD COLUMN assignedtoname VARCHAR(100) NULL,
	ADD COLUMN assignedtotitle VARCHAR(50) NULL;
	
UPDATE lguname_etracs.afcontrol SET 
	assignedtoid = collectorid,
	assignedtoname = collectorname,
	assignedtotitle = collectortitle;
	
	
ALTER TABLE lguname_etracs.batchcapture 
	ADD COLUMN collectortitle VARCHAR(50),
	ADD COLUMN encodedbytitle VARCHAR(50);

UPDATE lguname_etracs.batchcapture b, lguname_etracs.jobposition j SET
	b.encodedbytitle = j.title 
WHERE b.encodedbyid = j.assigneeid;


UPDATE lguname_etracs.batchcapture b, lguname_etracs.jobposition j SET
	b.collectortitle = j.title 
WHERE b.collectorid = j.assigneeid;	

UPDATE lguname_system.sys_roleclass SET 
	tags='[''AFO'', ''COLLECTOR'', ''SUBCOLLECTOR'', ''LIQUIDATING_OFFICER'', ''CASHIER'', ]'
WHERE `name` = 'TREASURY';	

	
	
update lguname_system..sys_module set
   permissions = '[ [ action:''account.view'',           title:''View Chart of Account'' ], [ action:''account.addcategory'',    title:''Add Account Category'' ], [ action:''account.addglacct'',      title:''Add GL Account'' ], [ action:''account.addsubacct'',     title:''Add Sub-Account'' ], [ action:''account.edit'',     title:''Edit Account Information'' ], [ action:''account.delete'',   title:''Delete Account Information'' ], [ action:''bank.view'',     title:''View Bank Information'' ], [ action:''bank.create'',   title:''Create Bank'' ], [ action:''bank.edit'',     title:''Edit Bank'' ], [ action:''bank.delete'',   title:''Delete Bank'' ], [ action:''bankacct.view'',     title:''View Bank Account Information'' ], [ action:''bankacct.create'',   title:''Create Bank Account'' ], [ action:''bankacct.edit'',     title:''Edit Bank Account'' ], [ action:''bankacct.delete'',   title:''Delete Bank Account'' ], [ action:''bankacct.approve'',  title:''Approve Bank Account'' ], [ action:''collectionsetting.manage'', title:''Manage Collection Setting'' ], [ action:''collectiontype.viewlist'',  title:''View Collection Type Listing'' ], [ action:''collectiontype.create'',    title:''Create Collection Type'' ], [ action:''collectiontype.edit'',      title:''Edit Collection Type'' ], [ action:''collectiontype.delete'',    title:''Delete Collection Type'' ], [ action:''fund.viewlist'',  title:''View Fund Listing'' ], [ action:''fund.create'',    title:''Create Fund'' ], [ action:''fund.edit'',      title:''Edit Fund'' ], [ action:''fund.delete'',    title:''Delete Fund'' ], [ action:''fund.approve'',   title:''Approve Fund'' ], [ action:''incomeacct.viewlist'',  title:''View Income Account Listing'' ], [ action:''incomeacct.create'',    title:''Create Income Account'' ], [ action:''incomeacct.edit'',      title:''Edit Income Account'' ], [ action:''incomeacct.delete'',    title:''Delete Income Account'' ], [ action:''incomeacct.approve'',   title:''Approve Income Account'' ], [ action:''incomeacctgroup.viewlist'',  title:''View Income Account Group Listing'' ], [ action:''incomeacctgroup.create'',    title:''Create Income Account Group'' ], [ action:''incomeacctgroup.delete'',    title:''Delete Income Account Group'' ],  [ action:''tcmanagement.open'' ,title:''Manage TC Master Files'' ],  [ action:''af.viewlist'',  title:''View Accountable Form Listing'' ], [ action:''af.create'',    title:''Create Accountable Form'' ], [ action:''af.edit'',      title:''Edit Accountable Form'' ], [ action:''af.delete'',    title:''Delete Accountable Form'' ], [ action:''af.approve'',   title:''Approve Accountable Form'' ], [ action:''afcontrol.changemode'',  title:''AF Control Change Mode'' ], [ action:''afcontrol.activate'',    title:''Activate AF Control'' ], [ action:''afcontrol.transfer'' ,title:''Transfer AF Control'' ], [ action:''afcontrol.adjustqty'' ,title:''Adjust AF Control Quantity (NonSerial)'' ],   [ action:''riv_lgu.create'', title:''Create LGU RIV'' ], [ action:''riv.create'',    title:''Create RIV'' ], [ action:''riv.salecreate'',title:''Create RIV (SALE)'' ], [action:''riv.collector'', title:''Create RIV (Collector)''], [ action:''riv.edit'',      title:''Edit RIV'' ], [ action:''riv.delete'',    title:''Delete RIV'' ], [ action:''riv.approve'',   title:''Approve RIV'' ], [ action:''riv.preview'',   title:''Preview RIV'' ],  [ action:''iraf.viewlist'',  title:''View IRAF Listing'' ], [ action:''iraf.create'',    title:''Create IRAF'' ], [ action:''iraf.edit'',      title:''Edit IRAF'' ], [ action:''iraf.delete'',    title:''Delete IRAF'' ], [ action:''iraf.approve'',   title:''Approve IRAF'' ], [ action:''afinventory.view'', title:''View AF Inventory Information'' ], [ action:''deposit.viewlist'',   title:''View Deposit Listing'' ], [ action:''deposit.view'',       title:''View Deposit Information'' ], [ action:''deposit.create'',     title:''Create Deposit Information'' ], [ action:''deposit.close'',      title:''Close Deposit Information'' ], [ action:''deposit.addnoncash'', title:''Add Non-Cash Payments for Deposit'' ], [ action:''deposit.addexternalnoncash'',     title:''Add External Non-Cash for Deposit'' ], [ action:''collection.create_online'',   title:''Create Online Collection''], [ action:''collection.create_offline'',  title:''Create Offline Collection''],  [ action:''remittance.create'',          title:''Create Remittance'' ], [ action:''remittance.submit'',          title:''Submit Remittance'' ], [ action:''remittance.viewlist'',        title:''View Remittance Listing'' ], [action:''remittance.import'',  title:''Import Remittance''], [ action:''receipt.viewissued'',    title:''View Issued Receipt Listing'' ], [ action:''receipt.inquire'',       title:''Inquire Receipt Information'' ], [ action:''afcontrol.activate'',  title:''Activate AF Control'' ] [action:''batchcapturemgmt.view'' ,title:''View Batch Capture Management''],  [action:''batchcapture.create''  ,title:''Create Batch Capture'' ], [action:''batchcapture.open''  ,title:''Open Batch Capture'' ],  [action:''batchcapture.view''  ,title:''View Batch Capture'' ], [action:''batchcapture.delete''  ,title:''Delete Batch Capture'' ], [action:''batchcapture.post''  ,title:''Post Batch Capture'' ], [ action:''collection_burial.create'',  title:''Create Burial Permit Fee Collection'' ], [ action:''collection_burial.edit'',    title:''Edit Burial Permit Fee Collection'' ], [ action:''collection_burial.print'',   title:''Print Burial Permit Fee Collection'' ], [ action:''collection_burial.void'',    title:''Void Burial Permit Fee Collection'' ], [ action:''collection_burial.inquire'', title:''Inquire Burial Permit Fee Collection'' ], [ action:''collection_cashticket.create'',  title:''Create Cash Ticket Collection'' ], [ action:''collection_cashticket.delete'',  title:''Delete Cash Ticket Collection'' ], [ action:''collection_cashticket.inquire'', title:''Inquire Cash Ticket  Collection'' ], [ action:''collection_cattleownership.create'',  title:''Create Large Cattle Ownership Collection'' ], [ action:''collection_cattleownership.edit'',    title:''Edit Large Cattle Ownership Collection'' ], [ action:''collection_cattleownership.print'',   title:''Print Large Cattle Ownership Collection'' ], [ action:''collection_cattleownership.void'',    title:''Void Large Cattle Ownership Collection'' ], [ action:''collection_cattleownership.inquiry'', title:''Inquire Large Cattle Ownership  Collection'' ], [ action:''collection_cattletransfer.create'',  title:''Create Large Cattle Transfer Collection'' ], [ action:''collection_cattletransfer.edit'',    title:''Edit Large Cattle Transfer Collection'' ], [ action:''collection_cattletransfer.print'',   title:''Print Large Cattle Transfer Collection'' ], [ action:''collection_cattletransfer.void'',    title:''Void Large Cattle Transfer Collection'' ], [ action:''collection_cattletransfer.inquiry'', title:''Inquire Large Cattle Transfer  Collection'' ], [ action:''collection_general.create'',  title:''Create General Collection'' ], [ action:''collection_general.edit'',    title:''Edit General Collection'' ], [ action:''collection_general.print'',   title:''Print General Collection'' ], [ action:''collection_general.void'',    title:''Void General Collection'' ], [ action:''collection_general.inquire'', title:''Inquire General Collection'' ], [ action:''collection_marriage.create'',  title:''Create Marriage License Fee Collection'' ], [ action:''collection_marriage.edit'',    title:''Edit Marriage License Fee Collection'' ], [ action:''collection_marriage.print'',   title:''Print Marriage License Fee Collection'' ], [ action:''collection_marriage.void'',    title:''Void Marriage License Fee Collection'' ], [ action:''collection_marriage.inquiry'', title:''Inquire Marriage License Fee  Collection'' ], [action:''postcapturereceipt.create'',   title:''Create Post Capture Receipt''], [action:''postcapturereceipt.post'',     title:''Submit Post Capture Receipt''], [action:''tcreport.abstractofcollection'' ,title:''Generate Abstract of Collection Report''], [action:''tcreport.abstractofcollectionbychart'' ,title:''Generate Abstract of Colleciton By Chart of Account'' ], [action:''tcreport.incomeaccount''   ,title:''Income Account Report''], [action:''tcreport.craaf''    ,title:''CRAAF Report''], [action:''tcreport.statementofrevenue''  ,title:''Generate Statement of Revenue''],  [action:''tcreport.reportofcollection''  ,title:''Report of Collection'' ], [action:''tcreport.reportofcollection2''  ,title:''Report of Collection 2'' ], [action:''collection_slaughterpermit.inquiry''  ,title:''Inquire Slaughter Permit'' ], [action:''collection_slaughterpermit.create''  ,title:''Create Slaughter Permit''], [action:''collection_slaughterpermit.print''  ,title:''Print Slaughter Permit'' ], [action:''collection_slaughterpermit.void''  ,title:''Void Slaughter Permit'' ], [action:''collection_slaughterpermit.edit''  ,title:''Edit Slaughter Permit'' ], [ action:''liquidation.create'', title:''Create Liquidation'' ], [ action:''liquidationmulti.create'', title:''Create Multi-Cashier Liquidation''], [ action:''liquidation.submit'', title:''Submit Liquidation'' ], [ action:''liquidation.viewlist'', title:''View Liquidation Listing'' ] [ action:''collection.create_capture'' ,title:''Create Capture Collection''], [ action:''receipt.viewissued''  ,title:''View Issued Receipt Listing'' ], [ action:''afcontrol.activate''  ,title:''Activate AF Control'' ], [ action:''postcapturereceipt.create'' ,title:''Create Post Capture Receipt''], [ action:''postcapturereceipt.post'' ,title:''Submit Post Capture Receipt''], [ action:''postcapturereceipt.viewlist'' ,title:''View Post Capture Listing'' ], [ action:''bpadmin.setting''  ,title:''Manage BP Setting'' ], [action:''treasurymgmt.view'',                title:''View Treasury Management''], [action:''treasurymgmt_abstract.view'',       title:''View Treasury Management (Abstract of Collection)''], [action:''treasurymgmt_afmonitoring.view'',   title:''View Treasury Management (AF Monitoring)''], [action:''treasurymgmt_collection.view'',     title:''View Treasury Management (Collection Summary)''], [action:''treasurymgmt_fund.view'',           title:''View Treasury Management (Fund Summary)''], [action:''treasurymgmt_liquidation.view'',    title:''View Treasury Management (Liquidation Detail)''], [action:''treasurymgmt_remittance.view'',     title:''View Treasury Management (Remittance Monitoring)''], [action:''treasurymgmt_liquidation.view'',    title:''View Undeposited Liquidation Summary'' ],  [action:''form60.setup''  ,title:''Setup Form 60 Report''],  [action:''collectiongroup.view''  ,title:''View Collection Groups'' ], [action:''collectiongroup.create'' ,title:''Create Collection Group'' ], [action:''collectiongroup.edit''  ,title:''Edit Collection Group'' ], [action:''collectiongroup.delete'' ,title:''Delete Collection Group'' ],]'
where name ='tc2';

UPDATE lguname_etracs..receiptlist SET 
	capturedbyid = collectorid,
	capturedbyname = collectorname,
	capturedbytitle = collectorname
WHERE capturedbyid IS NULL or capturedbyname is null;	
	
SET FOREIGN_KEY_CHECKS=1;	