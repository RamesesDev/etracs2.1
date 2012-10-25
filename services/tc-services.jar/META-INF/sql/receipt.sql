[getReceipt]
SELECT 
	objid, docstate, doctype, opener, collectorid,
	capturedbyid, remittanceid, remittanceno, remittancedate,
	voided, voidreason, extended
FROM receiptlist 
WHERE objid = $P{objid}	 

[getReceiptInfo]
SELECT 
	mode, txndate, dtposted, afid, afcontrolid, series,
	serialno, stubno, collectiontypeid, collectiontype,
	payorid, payorname, payoraddress, paidby, paidbyaddress, collectorid,
	collectorname, collectortitle, capturedbyid, capturedbyname, capturedbytitle,
	totalpayment, cash, otherpayment, amount, remarks
FROM receiptlist 
WHERE objid = $P{objid}	 	
	
[getReceiptItems]	
SELECT * FROM receiptitem WHERE receiptid = $P{receiptid} 
	
[getReceiptItems]	
SELECT * FROM receiptitem WHERE receiptid = $P{receiptid} 

[getPaymentItems]
SELECT * FROM paymentitem WHERE receiptid = $P{receiptid} 




	
[getList]
SELECT * FROM receiptlist 
WHERE collectorid LIKE $P{collectorid}  
   AND IFNULL(capturedbyid,'') LIKE $P{capturedbyid}
   AND docstate LIKE $P{docstate} 
ORDER BY afid, serialno 

[getList2]
SELECT * FROM receiptlist 

[getListBySerialNo]
SELECT * FROM receiptlist 
WHERE collectorid LIKE $P{collectorid}  
  AND IFNULL(capturedbyid,'') LIKE $P{capturedbyid}
  AND docstate LIKE $P{docstate} 
  AND serialno = $P{serialno} 
  
[getListByStubNo]
SELECT * FROM receiptlist 
WHERE collectorid LIKE $P{collectorid}  
  AND IFNULL(capturedbyid,'') LIKE $P{capturedbyid}
  AND docstate LIKE $P{docstate} 
  AND stubno = $P{stubno} 
ORDER BY afid, serialno 

[getListByTxnDate]
SELECT * FROM receiptlist 
WHERE collectorid LIKE $P{collectorid}  
  AND IFNULL(capturedbyid,'') LIKE $P{capturedbyid}
  AND docstate LIKE $P{docstate} 
  AND txndate = $P{txndate} 
ORDER BY afid, serialno 

[getListByPayor]
SELECT * FROM receiptlist 
WHERE collectorid LIKE $P{collectorid}  
  AND IFNULL(capturedbyid,'') LIKE $P{capturedbyid}
  AND payorname LIKE $P{payorname} 
  AND docstate LIKE $P{docstate} 
ORDER BY afid, serialno 

[getListByPaidBy]
SELECT * FROM receiptlist 
WHERE collectorid LIKE $P{collectorid}  
  AND IFNULL(capturedbyid,'') LIKE $P{capturedbyid}
  AND paidby LIKE $P{paidby} 
  AND docstate LIKE $P{docstate} 
ORDER BY afid, serialno 

[getSubcollectorOpenIssuances]
SELECT * FROM receiptlist 
WHERE capturedbyid = $P{subcollectorid}
   AND docstate LIKE 'DELEGATED' 
ORDER BY afid, serialno 


[getState]
SELECT docstate FROM receiptlist WHERE objid = $P{objid}

[getVoidedStatus]
SELECT voided FROM receiptlist WHERE objid = $P{objid}

[getSerialNo]
SELECT serialno FROM receiptlist WHERE objid = $P{objid} 

[getFundName]
SELECT fundname FROM fund WHERE objid = $P{objid} 


[checkDuplicateSerialNo]
SELECT objid, serialno FROM receiptlist WHERE serialno = $P{serialno} AND afid = $P{afid} 



[voidReceipt]
UPDATE receiptlist SET voided = 1, voidreason = $P{voidreason} WHERE objid = $P{objid} 

[voidReceiptList]
UPDATE receiptlist SET voided = 1, voidreason = $P{voidreason} WHERE objid = $P{objid} 


[deleteReceipt]
DELETE FROM receiptlist WHERE objid = $P{objid}

[deleteReceiptList]
DELETE FROM receiptlist WHERE objid = $P{objid}

[deleteReceiptItem]
DELETE FROM receiptitem WHERE receiptid = $P{receiptid}

[deletePaymentItem]
DELETE FROM paymentitem WHERE receiptid = $P{receiptid}

[getIssuedTotal]
SELECT SUM(amount) as amount FROM receiptlist 
WHERE collectorid LIKE $P{collectorid}  
   AND IFNULL(capturedbyid,'') LIKE $P{capturedbyid}
   AND docstate = $P{docstate} 
   AND voided = 0 


[getTotalSubcollectorIssuances]
SELECT SUM(amount) as total FROM receiptlist 
WHERE capturedbyid LIKE $P{subcollectorid}  
   AND docstate = 'DELEGATED'
   AND voided = 0 