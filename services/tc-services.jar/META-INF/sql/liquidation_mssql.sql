[getList]
SELECT * FROM liquidation 
ORDER BY txndate DESC, txnno DESC

[getListByTxnno]
SELECT * FROM liquidation WHERE txnno = $P{txnno}
ORDER BY txndate DESC, txnno DESC


[getUnliquidatedRemittanceByLiquidatingOfficer]
SELECT * FROM remittance 
WHERE docstate = 'OPEN' 
AND liquidatingofficerid = $P{liquidatingofficerid}  
AND txndate <= $P{txndate} 
ORDER BY txndate, txnno 


[getUnliquidatedRemittanceOtherPaymentsByLiquidatingOfficer]
SELECT pay.* 
FROM paymentitem pay, receiptlist rl, remittance rml 
WHERE rml.liquidatingofficerid = $P{liquidatingofficerid} 
AND rml.txndate <= $P{txndate} 
AND rml.docstate = 'OPEN' 
AND rml.objid = rl.remittanceid 
AND rl.objid = pay.receiptid 
AND NOT pay.paytype = 'CASH'

[updateReceiptItemRcdId]
UPDATE ri SET  
	ri.liquidationrcdid = $P{liquidationrcdid}  
FROM receiptitem ri, receiptlist r, remittance rem, incomeaccount ia 
WHERE ri.receiptid = r.objid  
  AND ri.acctid = ia.objid  
  AND r.remittanceid = rem.objid  
  AND rem.liquidationid = $P{liquidationid}   
  AND ia.fundid = $P{fundid} 

[updateRevenueReceiptItemRcdId]
UPDATE rev SET  
	rev.liquidationrcdid = $P{liquidationrcdid}  
FROM revenue rev, receiptitem ri, receiptlist r, remittance rem, incomeaccount ia
WHERE rev.receiptitemid = ri.objid 
  AND ri.receiptid = r.objid  
  AND ri.acctid = ia.objid  
  AND r.remittanceid = rem.objid  
  AND rem.liquidationid = $P{liquidationid}   
  AND ia.fundid = $P{fundid} 

  
[updateNonCashPaymentLiquidationId]
UPDATE paymentitem SET 
	liquidationid = $P{liquidationid}, 
	liquidationrcdid = $P{liquidationrcdid} 
WHERE objid = $P{objid}	 
	


[getUnliquidatedRemittanceInfoByLiquidatingOfficer]
SELECT 
	SUM( amount ) AS totalamount, 
	SUM( totalcash ) AS totalcash, 
	SUM( totalotherpayment ) AS totalotherpayment 
FROM remittance 
WHERE docstate = 'OPEN' 
AND liquidatingofficerid = $P{liquidatingofficerid} 
AND txndate <= $P{txndate}


[getOpenFundSummaries]
SELECT 
	ia.fundid, 
	ia.fundname, 
	null AS cashierid, 
	null AS cashiername, 
	null AS cashiertitle, 
	SUM(ri.amount) AS cash, 
	0.0 AS noncash, 
	SUM( ri.amount) AS amount 
FROM receiptlist rct  
	INNER JOIN receiptitem ri ON rct.objid = ri.receiptid 
	INNER JOIN incomeaccount ia ON ri.acctid = ia.objid 
	INNER JOIN remittance rem ON rct.remittanceid = rem.objid  
WHERE rem.liquidatingofficerid = $P{lqofficerid}  
  AND rem.txndate <= $P{txndate} 
  AND rem.docstate = 'OPEN' 
  AND rct.voided = 0 
GROUP BY ia.fundid, ia.fundname 
ORDER BY ia.fundname  





[getUnliquidatedRemittanceByCollector]
SELECT * FROM remittance 
WHERE docstate = 'OPEN' 
AND collectorid = $P{collectorid} 
ORDER BY txndate DESC, txnno DESC

[getUnliquidatedRemittanceOtherPaymentsByCollector]
SELECT pay.* 
FROM paymentitem pay, receiptlist rl, remittance rml 
WHERE rml.collectorid = $P{collectorid} 
AND rml.docstate = 'OPEN' 
AND rml.objid = rl.remittanceid 
AND rl.objid = pay.receiptid 
AND NOT pay.paytype = 'CASH'

[getRemittancesByLiquidation]
SELECT * 
FROM remittance 
WHERE liquidationid = $P{liquidationid} 
ORDER BY txnno DESC, txndate DESC 

[getRemittancesByLiquidationByFund]
SELECT rl.collectorname, rl.collectortitle, 
	rl.txnno, rl.txndate,  SUM( ri.amount ) AS amount 
FROM remittance rl 
	INNER JOIN receiptlist r ON rl.objid = r.remittanceid 
	INNER JOIN receiptitem ri ON r.objid = ri.receiptid 
	INNER JOIN incomeaccount ia ON ri.acctid = ia.objid 
WHERE rl.liquidationid = $P{liquidationid}  
  AND ia.fundid = $P{fundid} 
  AND r.voided = 0 
GROUP BY rl.collectorname, rl.collectortitle, rl.txnno, rl.txndate 
ORDER BY rl.txnno  


[getCollectionSummaryByAFByFund]
SELECT 
	CASE  
	WHEN af.objid = '51' AND min(af.aftype) = 'serial' AND min(ia.groupid) IS NULL THEN ( 'AF#' + af.objid + ': ' + min(ri.fundname) ) 
	WHEN af.objid = '51' AND min(af.aftype) = 'serial' AND min(ia.groupid) IS NOT NULL THEN ( 'AF#' + af.objid + ': ' + min(ia.groupid) ) 
	
	WHEN af.objid = '56' AND min(af.aftype) = 'serial' AND min(ia.groupid) IS NULL THEN ( 'AF#' + af.objid + ': ' + min(ri.fundname) ) 
	WHEN af.objid = '56' AND min(af.aftype) = 'serial' AND min(ia.groupid) IS NOT NULL THEN ( 'AF#' + af.objid + ': ' + min(ri.fundname) + ' - ' + min(ia.groupid) ) 
	
	WHEN min(af.aftype) = 'nonserial' AND min(ia.groupid) IS NOT NULL THEN ( af.objid + ': ' + min(ia.groupid) ) 
	ELSE ( 'AF#' + af.objid + ': ' + min(af.description) + ' - ' + min(ri.fundname) ) 
	END AS particulars, 
	SUM( ri.amount ) AS  amount   
FROM receiptitem ri   
INNER JOIN incomeaccount ia ON ri.acctid = ia.objid  
INNER JOIN receiptlist rl on rl.objid = ri.receiptid    
INNER JOIN remittance rml on rml.objid = rl.remittanceid     
INNER JOIN liquidation ll on ll.objid = rml.liquidationid     
INNER JOIN af af ON rl.afid = af.objid 
WHERE ll.objid = $P{liquidationid} 
  AND rl.voided = 0   
  AND ia.fundid = $P{fundid} 
GROUP BY af.objid, CASE WHEN af.aftype = 'nonserial' THEN ri.fundname ELSE CASE WHEN ia.groupid IS NULL THEN ri.fundname ELSE ia.groupid END  END  
ORDER BY af.objid, MIN(ri.fundname), MIN(ia.groupid) 


[getOtherPaymentsByLiquidation]
SELECT pay.* 
FROM paymentitem pay, receiptlist r, remittance rm 
WHERE rm.liquidationid = $P{liquidationid} 
AND rm.txndate <= $P{txndate} 
AND NOT pay.paytype = 'CASH' 
AND rm.objid = r.remittanceid 
AND r.voided = 0 
AND r.objid = pay.receiptid 


[getFundSummaries] 
SELECT fundid, fundname, SUM( amount ) FROM revenue 
WHERE liquidationid = $P{liquidationid} AND voided = 0 
GROUP BY fundid, fundname 





[closeRemittances]
UPDATE remittance SET 
	docstate = 'CLOSED', 
	liquidationid = $P{liquidationid}, 
	liquidationno = $P{liquidationno}, 
	liquidationdate = $P{liquidationdate} 
WHERE docstate = 'OPEN' 
AND collectorid = $P{collectorid}


[closeRemittanceByLiquidatingOfficer]
UPDATE r SET 
	r.docstate = 'CLOSED', 
	r.liquidationid = $P{liquidationid}, 
	r.liquidationno = $P{liquidationno}, 
	r.liquidationdate = $P{liquidationdate} 
FROM remittance r 
WHERE r.docstate = 'OPEN' 
AND r.liquidatingofficerid = $P{liquidatingofficerid} 
AND r.txndate <= $P{liquidationdate} 


[getOtherPaymentNoLiq]
SELECT  
 rl.objid, rl.remittanceid, r.objid, r.liquidationid,
 i.receiptid, i.paytype, i.particulars, i.amount 
FROM remittance r 
INNER JOIN receiptlist rl ON rl.remittanceid = r.objid 
INNER JOIN paymentitem i ON i.receiptid = rl.objid  
WHERE rl.voided = 0  
 AND r.liquidationid IS NULL 
 AND r.txndate <= $P{txndate} 
 AND paytype = 'CHECK' 
 
[getLiquidatedNonCashPayments]
SELECT  
 i.receiptid, i.paytype, i.particulars, i.amount 
FROM remittance rml 
INNER JOIN receiptlist rl ON rml.objid = rl.remittanceid 
INNER JOIN paymentitem i ON i.receiptid = rl.objid  
WHERE rl.voided = 0  
 AND rml.liquidationid = $P{liquidationid} 
 AND i.paytype = 'CHECK' 
 
[getCashierlist]
SELECT u.objid, u.name as name, u.formalname, u.jobtitle   
FROM etracsuser u 
INNER JOIN user_role r ON r.userid = u.objid 
WHERE role = 'CASHIER' 
ORDER BY NAME  



[getPaymentItem]
SELECT  
 p.objid 
FROM paymentitem p  
INNER JOIN receiptlist r ON p.receiptid = r.objid  
WHERE r.remittanceid = $P{remittanceid} 
 AND paytype = 'CHECK'

[getLiquidationRcdByFund]
SELECT * 
FROM liquidationrcd 
WHERE liquidationid = $P{liquidationid}
  AND fundid = $P{fundid} 

[getRcdList]  
SELECT * 
FROM liquidationrcd 
WHERE liquidationid = $P{liquidationid}