[getOpenCollectionSummaries] 
SELECT 
	afid, afcontrolid, stubno, 
	MIN(serialno) AS fromserialno, 
	MAX(serialno) AS toserialno, 
	SUM(CASE WHEN voided =0 THEN amount ELSE 0 END ) AS amount 
FROM receiptlist 
WHERE docstate = 'DELEGATED' 
  AND afcontrolid = $P{afcontrolid}
GROUP BY afid, afcontrolid, stubno  
ORDER BY afid, fromserialno, stubno  

[getRemittanceInfo]
SELECT 
	SUM( amount ) AS totalamount, 
	SUM( cash ) AS totalcash, 
	SUM( otherpayment ) AS totalotherpayment 
FROM receiptlist rl 
WHERE remittanceid IS NULL 
AND docstate = 'DELEGATED' 
AND voided = 0 
AND afcontrolid = $P{afcontrolid} 

[closeReceiptListForRemittance]
UPDATE receiptlist SET 
	docstate = 'OPEN', 
	sc_remittanceid = $P{remittanceid}
WHERE afcontrolid = $P{afcontrolid} 
  AND docstate = 'DELEGATED' 
  
[getUnremittedReceipts]
SELECT * FROM receiptlist 
WHERE remittanceid IS NULL 
AND docstate = 'DELEGATED' 
AND afcontrolid = $P{afcontrolid} 
ORDER BY serialno DESC, txndate DESC

[getParentCollector]
select distinct collectorid, collectorname, collectortitle from afcontrol 
where assignedtoid=$P{assignedtoid} 

[getAFControlId]
select objid from afcontrol where collectorid=$P{collectorid} and assignedtoid=$P{assignedtoid}

[getUnpostedCaptureReceipts]
SELECT * FROM receiptlist 
WHERE remittanceid IS NULL 
AND docstate = 'CAPTURED' 
AND afcontrolid = $P{afcontrolid} 
