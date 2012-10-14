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


ALTER TABLE dev_etracs.afcontrol 
	ADD COLUMN assignedtoid VARCHAR(50) NULL,
	ADD COLUMN assignedtoname VARCHAR(100) NULL,
	ADD COLUMN assignedtotitle VARCHAR(50) NULL;
	
UPDATE dev_etracs.afcontrol SET 
	assignedtoid = collectorid,
	assignedtoname = collectorname,
	assignedtotitle = collectortitle;
	
	
ALTER TABLE dev_etracs.batchcapture 
	ADD COLUMN collectortitle VARCHAR(50),
	ADD COLUMN encodedbytitle VARCHAR(50);

UPDATE dev_etracs.batchcapture b, dev_etracs.jobposition j SET
	b.encodedbytitle = j.title 
WHERE b.encodedbyid = j.assigneeid;


UPDATE dev_etracs.batchcapture b, dev_etracs.jobposition j SET
	b.collectortitle = j.title 
WHERE b.collectorid = j.assigneeid;	

UPDATE dev_system.sys_roleclass SET 
	tags='[''AFO'', ''COLLECTOR'', ''SUBCOLLECTOR'', ''LIQUIDATING_OFFICER'', ''CASHIER'', ]'
WHERE `name` = 'TREASURY';	

	
	
SET FOREIGN_KEY_CHECKS=1;	