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


	
SET FOREIGN_KEY_CHECKS=1;	