ALTER TABLE lguname_etracs..receiptlist ADD totalpayment DECIMAL(16,2)
go
ALTER TABLE lguname_etracs..receiptlist ADD remarks VARCHAR(200)
go
ALTER TABLE lguname_etracs..receiptlist ADD series INT
go
ALTER TABLE lguname_etracs..receiptlist ADD extended TEXT
go
	
UPDATE rl SET
		rl.extended = r.extended,
		rl.totalpayment = rl.amount 
FROM lguname_etracs..receiptlist rl, lguname_etracs..receipt r
WHERE rl.objid = r.objid
go
		
ALTER TABLE lguname_etracs..paymentitem ADD extended TEXT
go
	
	
ALTER TABLE lguname_etracs..receiptlist DROP FK_receiptlist_receipt
go

ALTER TABLE lguname_etracs..receiptitem DROP FK_receiptitem_receipt
go

ALTER TABLE lguname_etracs..receiptitem  
	ADD CONSTRAINT FK_receiptitem_receiptlist FOREIGN KEY (receiptid) REFERENCES lguname_etracs..receiptlist(objid)
go	

ALTER TABLE lguname_etracs..paymentitem DROP CONSTRAINT FK_paymentitem_receipt
go
ALTER TABLE lguname_etracs..paymentitem 
	ADD CONSTRAINT FK_paymentitem_receiptlist FOREIGN KEY(receiptid) REFERENCES lguname_etracs..receiptlist(objid)
go	

