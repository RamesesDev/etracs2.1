[getOtherPaymentsByLiquidation] 
SELECT pm.amount as amount, pm.paytype as paytype, pm.particulars as particulars  FROM paymentitem pm 
INNER JOIN receiptlist rl on rl.objid = pm.receiptid 
INNER JOIN remittance rml on rml.objid = rl.remittanceid 
INNER JOIN liquidation ll on ll.objid = rml.liquidationid 
WHERE ll.objid = $P{liquidationid} 
AND   pm.paytype != 'CASH' 
AND rl.voided = 0 

[getRemittancesByLiquidation] 
SELECT 
		rml.collectorname as collectorname, 
		rml.amount as amount, 
		rml.txnno as txnno, 
		rml.txndate as txndate 
FROM remittance rml 
INNER JOIN liquidation ll on ll.objid = rml.liquidationid 
WHERE ll.objid = $P{liquidationid} 
ORDER BY rml.txnno 

[getRemittedForms]
SELECT 
	rf.afid, rf.beginqty, rf.beginfrom, rf.beginto, 
	rf.receivedqty, rf.receivedfrom, rf.receivedto,  
	rf.issuedqty, rf.issuedfrom, rf.issuedto,  
	rf.endingqty, rf.endingfrom, rf.endingto  
FROM liquidation lq 
	INNER JOIN remittance rem ON lq.objid = rem.liquidationid 
	INNER JOIN remittedform rf ON rem.objid = rf.remittanceid 
WHERE lq.objid = $P{liquidationid} 
  AND rf.aftype = 'serial'  
ORDER BY afid, rf.beginfrom  

[getNonSerialRemittedForms]
SELECT 
	CASE WHEN rf.receivedqty >= 0 THEN rf.receivedqty * af.denomination ELSE 0.0 END AS receivedamt, 
	CASE WHEN rf.beginqty >= 0 THEN rf.beginqty * af.denomination ELSE 0.0 END AS beginamt, 
	CASE WHEN rf.issuedqty >= 0 THEN rf.issuedqty * af.denomination ELSE 0.0 END AS issuedamt, 
	CASE WHEN rf.endingqty >= 0 THEN rf.endingqty * af.denomination ELSE 0.0 END AS endingamt, 
	rf.afid, rf.beginqty, rf.receivedqty, rf.issuedqty, rf.endingqty , rf.stubno 
FROM liquidation lq 
	INNER JOIN remittance rem ON lq.objid = rem.liquidationid 
	INNER JOIN remittedform rf ON rem.objid = rf.remittanceid 
	INNER JOIN af af ON rf.afid = af.objid 
WHERE lq.objid = $P{liquidationid} 
  AND rf.aftype = 'nonserial'  
ORDER BY rf.afid, rf.beginfrom  

[getNonSerialRemittedFormsSummary]
SELECT 
	rf.afid, 
	SUM( CASE WHEN rf.beginqty IS NULL THEN 0 ELSE rf.beginqty END ) AS beginqty,  
	SUM( CASE WHEN rf.beginqty >= 0 THEN rf.beginqty * af.denomination ELSE 0.0 END ) AS beginamt,  
	SUM( CASE WHEN rf.receivedqty IS NULL THEN 0 ELSE rf.receivedqty END ) AS receivedqty,  
	SUM( CASE WHEN rf.receivedqty >= 0 THEN rf.receivedqty * af.denomination ELSE 0.0 END ) AS receivedamt,  
	SUM( CASE WHEN rf.issuedqty IS NULL THEN 0 ELSE rf.issuedqty END ) AS issuedqty,  
	SUM( CASE WHEN rf.issuedqty >= 0 THEN rf.issuedqty * af.denomination ELSE 0.0 END ) AS issuedamt, 
	SUM( CASE WHEN rf.endingqty IS NULL THEN 0 ELSE rf.endingqty END ) AS endingqty,   
	SUM( CASE WHEN rf.endingqty >= 0 THEN rf.endingqty * af.denomination ELSE 0.0 END ) AS endingamt  
FROM liquidation lq 
	INNER JOIN remittance rem ON lq.objid = rem.liquidationid 
	INNER JOIN remittedform rf ON rem.objid = rf.remittanceid 
	INNER JOIN af af ON rf.afid = af.objid 
WHERE lq.objid = $P{liquidationid} 
  AND rf.aftype = 'nonserial'  
GROUP BY rf.afid 
ORDER BY rf.afid 

[getCollectionSummaryByAF]
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
GROUP BY af.objid, CASE WHEN af.aftype = 'nonserial' THEN ri.fundname ELSE CASE WHEN ia.groupid IS NULL THEN ri.fundname ELSE ia.groupid END  END  
ORDER BY af.objid, MIN(ri.fundname), MIN(ia.groupid) 



[getRemittanceFundTotalByLiquidationAndFund] 
SELECT SUM( o.amount ) as amount, o.remittanceno, o.collectorname 
FROM revenue o 
WHERE o.liquidationid = $P{liquidationid} 
AND   o.fundid = $P{fundid} 
AND o.voided = 0  
GROUP BY o.remittanceno, o.collectorname   

[getFundList] 
SELECT o.objid, o.fundname FROM fund o ORDER BY fundname 

[getRevenueByGLAccountSRE]  
SELECT  
	a.pathbytitle AS pathtitle,  
	a.acctcode AS acctcode,  
	a.accttitle AS accttitle, 
	p.acctcode as parentcode, 
	p.accttitle as parenttitle, 
	SUM(r.amount) AS amount 
FROM revenue r 
INNER JOIN incomeaccount ia ON r.acctid = ia.objid 
LEFT JOIN account a ON ia.sreid = a.objid 
LEFT JOIN account p on p.objid = a.parentid  
WHERE r.fundid = $P{fundid} 
AND   r.liquidationid = $P{liquidationid} 
AND r.voided = 0  
GROUP BY a.pathbytitle, a.acctcode, a.accttitle, p.acctcode, p.accttitle 
ORDER BY a.pathbytitle 

[getRevenueByGLAccountNGAS]  
SELECT  
	a.pathbytitle AS pathtitle,   
	a.acctcode AS acctcode,   
	a.accttitle AS accttitle, 
	p.acctcode as parentcode, 
	p.accttitle as parenttitle,
	SUM(r.amount) AS amount 
FROM revenue r 
INNER JOIN incomeaccount ia ON r.acctid = ia.objid 
LEFT JOIN account a ON ia.ngasid = a.objid 
LEFT JOIN account p on p.objid = a.parentid 
WHERE r.fundid = $P{fundid} 
AND   r.liquidationid = $P{liquidationid} 
AND r.voided = 0   
GROUP BY a.pathbytitle, a.acctcode, a.accttitle, p.acctcode, p.accttitle 
ORDER BY a.pathbytitle 

[getRevenueByIncomeAccountSRE]  
SELECT  
	a.pathbytitle AS pathtitle,   
	a.acctcode AS parentcode,   
	a.accttitle AS parenttitle, 
	ia.acctcode AS acctcode, 
	r.accttitle AS accttitle, 
	SUM(r.amount) AS amount 
FROM revenue r  
INNER JOIN incomeaccount ia ON r.acctid = ia.objid 
LEFT JOIN account a ON ia.sreid = a.objid 
WHERE r.fundid = $P{fundid}   
AND   r.liquidationid = $P{liquidationid}  
AND r.voided = 0  
GROUP BY a.pathbytitle, a.acctcode, a.accttitle, ia.acctcode, r.accttitle  
ORDER BY a.pathbytitle

[getRevenueByIncomeAccountNGAS]  
SELECT  
	a.pathbytitle AS pathtitle,  
	a.acctcode AS parentcode,
	a.accttitle AS parenttitle,
	ia.acctcode AS acctcode,  
	r.accttitle AS accttitle,
	SUM(r.amount) AS amount 
FROM revenue r 
INNER JOIN incomeaccount ia ON r.acctid = ia.objid 
LEFT JOIN account a ON ia.ngasid =  a.objid 
WHERE r.fundid = $P{fundid} 
AND   r.liquidationid = $P{liquidationid} 
AND r.voided = 0  
GROUP BY a.pathbytitle, a.acctcode, a.accttitle, ia.acctcode, r.accttitle 
ORDER BY a.pathbytitle 

[getRevenueByLiquidationId]
SELECT 
	lq.amount as liquidationamount, 
	rl.objid as remittanceid,
	rl.amount as remittanceamount, 
	r.collectorname as collectorname,  
	r.receiptdate as receiptdate,  
	r.serialno as serialno, 
	r.payorname as payorname,  
	r.accttitle as accttitle,  
	r.amount as amount, 
	ia.acctcode  as acctno,
	r.voided as voided,
	r.afid as afid 
FROM revenue r 
	inner join liquidation lq on r.liquidationid = lq.objid  
	inner join remittance rl on r.remittanceid = rl.objid 
	inner join incomeaccount ia on r.acctid = ia.objid  
WHERE r.liquidationid = $P{liquidationid} 
ORDER BY r.collectorname, rl.objid, r.afid, r.serialno, r.receiptdate 

[getLiquidatedFundList]
SELECT DISTINCT r.fundid, f.fundname FROM revenue r 
INNER JOIN fund f ON f.objid=r.fundid 
WHERE liquidationid = $P{liquidationid} 
ORDER BY f.fundname 

[getLiquidatedAfList]
SELECT DISTINCT afid FROM revenue 
WHERE liquidationid = $P{liquidationid} 
ORDER BY afid 

[getReportByFundAndAFNo]
SELECT 
	SUM( r.amount ) as amount, r.remittanceid, r.remittanceno, r.collectorname 
FROM revenue r 
WHERE r.liquidationid = $P{liquidationid} 
AND   r.fundid = $P{fundid} 
AND	  r.afid = $P{afid} 
AND r.voided = 0  
GROUP BY r.remittanceid, r.remittanceno, r.collectorname  


[getLiquidationSummaryBySRE]
SELECT 
	ll.txnno, ll.txndate, ll.liquidatingofficername, ll.liquidatingofficertitle, ri.fundname, 
	ISNULL(p2.acctcode, '') + ' - ' + p2.accttitle AS p2account, 
	ISNULL(p1.acctcode,'') + ' - ' + p1.accttitle AS p1account, 
	ISNULL(p.acctcode,'') + ' - ' + p.accttitle AS paccount,
	SUM(ri.amount) AS amount 
FROM liquidation ll  
	INNER JOIN remittance rem ON ll.objid = rem.liquidationid 
	INNER JOIN receiptlist rl ON rem.objid = rl.remittanceid 
	INNER JOIN receiptitem ri on rl.objid = ri.receiptid 
	INNER JOIN incomeaccount ia on ri.acctid = ia.objid 
	LEFT JOIN account p on ia.sreid = p.objid 
	LEFT JOIN account p1 on p.parentid = p1.objid 
	LEFT JOIN account p2 on p1.parentid = p2.objid 
WHERE ll.objid = $P{objid}
  AND ri.fundid = $P{fundid}
  AND rl.voided = 0 
GROUP BY ll.txnno, ll.txndate, ll.liquidatingofficername, ll.liquidatingofficertitle, ri.fundname, 
		 p2.acctcode, p2.accttitle, p1.acctcode, p1.accttitle, p.acctcode, p.accttitle
ORDER BY p2.acctcode, p2.accttitle, p1.acctcode, p1.accttitle, p.acctcode, p.accttitle
	
[getLiquidationSummaryByNGAS]
SELECT 
	ll.txnno, ll.txndate, ll.liquidatingofficername, ll.liquidatingofficertitle, ri.fundname, 
	ISNULL(p2.acctcode, '') + ' - ' + p2.accttitle AS p2account, 
	ISNULL(p1.acctcode,'') + ' - ' + p1.accttitle AS p1account, 
	ISNULL(p.acctcode,'') + ' - ' + p.accttitle AS paccount,
	SUM(ri.amount) AS amount 
FROM liquidation ll  
	INNER JOIN remittance rem ON ll.objid = rem.liquidationid 
	INNER JOIN receiptlist rl ON rem.objid = rl.remittanceid 
	INNER JOIN receiptitem ri on rl.objid = ri.receiptid 
	INNER JOIN incomeaccount ia on ri.acctid = ia.objid 
	LEFT JOIN account p on ia.ngasid = p.objid 
	LEFT JOIN account p1 on p.parentid = p1.objid 
	LEFT JOIN account p2 on p1.parentid = p2.objid 
WHERE ll.objid = $P{objid}
  AND ri.fundid = $P{fundid}
  AND rl.voided = 0 
GROUP BY ll.txnno, ll.txndate, ll.liquidatingofficername, ll.liquidatingofficertitle, ri.fundname, 
		 p2.acctcode, p2.accttitle, p1.acctcode, p1.accttitle, p.acctcode, p.accttitle
ORDER BY p2.acctcode, p2.accttitle, p1.acctcode, p1.accttitle, p.acctcode, p.accttitle	
	