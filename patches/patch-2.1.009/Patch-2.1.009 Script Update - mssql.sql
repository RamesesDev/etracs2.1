/* FAAS Attachment */
ALTER TABLE lguname_etracs..faasattachment ADD absolutefilename varchar(300) NULL
go



/* SubFund with Required Bank Account fund support */
ALTER TABLE lguname_etracs..fund ADD bankacctrequired INT NULL
go

UPDATE lguname_etracs..fund SET bankacctrequired = 1 
go 


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


ALTER TABLE lguname_etracs..afcontrol ADD assignedtoid VARCHAR(50) NULL
go
ALTER TABLE lguname_etracs..afcontrol ADD assignedtoname VARCHAR(100) NULL
go
ALTER TABLE lguname_etracs..afcontrol ADD assignedtotitle VARCHAR(50) NULL
go
	
UPDATE lguname_etracs..afcontrol SET 
	assignedtoid = collectorid,
	assignedtoname = collectorname,
	assignedtotitle = collectortitle
go	
	
	
ALTER TABLE lguname_etracs..batchcapture ADD collectortitle VARCHAR(50)
go
ALTER TABLE lguname_etracs..batchcapture ADD encodedbytitle VARCHAR(50)
go

UPDATE b SET
	b.encodedbytitle = j.title 
FROM lguname_etracs..batchcapture b, lguname_etracs..jobposition j	
WHERE b.encodedbyid = j.assigneeid
go


UPDATE b SET
	b.collectortitle = j.title 
FROM lguname_etracs..batchcapture b, lguname_etracs..jobposition j 	
WHERE b.collectorid = j.assigneeid
GO

UPDATE lguname_etracs..receiptlist SET 
	capturedbyid = collectorid,
	capturedbyname = collectorname,
	capturedbytitle = collectorname
WHERE capturedbyid IS NULL or capturedbyname is null
go

UPDATE lguname_system..sys_roleclass SET 
	tags='[''AFO'', ''COLLECTOR'', ''SUBCOLLECTOR'', ''LIQUIDATING_OFFICER'', ''CASHIER'', ]'
WHERE name = 'TREASURY'
go 


