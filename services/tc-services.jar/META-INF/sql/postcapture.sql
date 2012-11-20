[getList]
SELECT 
	objid, docstate, dtposted, collectorid, collectorname, collectortitle,  
	postedbyname, amount  
FROM postcapture  
WHERE collectorname LIKE $P{collectorname}  
ORDER BY dtposted DESC , collectorname

[getCapturedReceiptsSummaries]
SELECT 
	afid, afcontrolid, stubno, SUM( CASE WHEN voided = 0 THEN amount ELSE 0.0 END) AS amount, COUNT(*) AS icount  
FROM receiptlist 
WHERE collectorid = $P{collectorid} 
  AND mode = 'CAPTURE'  
  AND docstate = 'CAPTURED' 
GROUP BY afid, afcontrolid, stubno  
ORDER BY afid, stubno 

[getCapturedReceiptsSummariesBySubcollector]
SELECT 
	afid, afcontrolid, stubno, SUM( CASE WHEN voided = 0 THEN amount ELSE 0.0 END) AS amount, COUNT(*) AS icount  
FROM receiptlist 
WHERE collectorid = $P{collectorid} 
  AND capturedbyid = $P{capturedbyid} 
  AND mode = 'CAPTURE'  
  AND docstate = 'CAPTURED'   
GROUP BY afid, afcontrolid, stubno 
ORDER BY afid, stubno 

[getCapturedReceipts] 
SELECT 
	objid, afid, serialno, opener, stubno, collectiontype, payorname, payoraddress, 
	CASE WHEN voided = 0 THEN amount ELSE 0.0 END AS amount, 
	voided, voidreason, capturedbyname  
FROM receiptlist 
WHERE collectorid = $P{collectorid} 
  AND mode = 'CAPTURE' 
  AND docstate = 'CAPTURED'  
  AND afcontrolid = $P{afcontrolid} 
ORDER BY stubno, serialno  

[getCapturedReceiptsBySubcollector] 
SELECT 
	objid, afid, serialno, opener, stubno, collectiontype, payorname, payoraddress, 
	CASE WHEN voided = 0 THEN amount ELSE 0.0 END AS amount, 
	voided, voidreason, capturedbyname  
FROM receiptlist 
WHERE collectorid = $P{collectorid} 
  AND mode = 'CAPTURE' 
  AND capturedbyid = $P{capturedbyid} 
  AND docstate = 'CAPTURED'  
  AND afcontrolid = $P{afcontrolid} 
ORDER BY stubno, serialno  

[postCapturedReceiptList]
UPDATE receiptlist SET 
	docstate = 'OPEN',
	postcaptureid = $P{postcaptureid}
WHERE collectorid = $P{collectorid} AND docstate = 'CAPTURED' 

[postCapturedReceiptListBySubcollector]
UPDATE receiptlist SET 
	docstate = 'DELEGATED',
	postcaptureid = $P{postcaptureid}  
WHERE collectorid = $P{collectorid} 
  AND capturedbyid = $P{capturedbyid} 
  AND docstate = 'CAPTURED' 



[getCollectorIdByAssignedTo]
SELECT DISTINCT collectorid 
FROM batchcapture b 
WHERE encodedbyid = $P{assignedtoid}	
   OR collectorid = $P{assignedtoid}

UNION

SELECT DISTINCT collectorid 
FROM receiptlist 
WHERE mode = 'CAPTURE' 
  AND docstate = 'CAPTURE' 
  AND collectorid = $P{assignedtoid}
   
