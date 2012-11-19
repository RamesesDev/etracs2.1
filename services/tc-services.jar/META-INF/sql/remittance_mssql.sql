[getList]
SELECT * FROM remittance 
ORDER BY txndate DESC, txnno DESC

[getRemittanceByTxnNo]
SELECT * 
FROM remittance 
WHERE txnno = $P{txnno} 
ORDER BY txndate DESC, txnno DESC 

[getRemittanceByCollector]
SELECT * FROM remittance 
WHERE collectorname LIKE $P{collectorname}
ORDER BY txndate DESC, txnno DESC

[getListByCollectorid]
SELECT * FROM remittance 
WHERE collectorid = $P{collectorid} 
ORDER BY txndate DESC, txnno DESC

[getRemittanceByTxnNoByCollectorid]
SELECT * 
FROM remittance 
WHERE txnno = $P{txnno} 
AND collectorid = $P{collectorid} 
ORDER BY txndate DESC, txnno DESC

[getLiquidatingOfficer]
SELECT lq.* FROM etracsuser lq WHERE lq.objid IN (	
	select c.lqofficerid from etracsuser c WHERE c.objid = $P{collectorid}
)

[getLiquidatingOfficerList]
SELECT objid, name, formalname, jobtitle  
FROM etracsuser  
WHERE isliquidating = 1 
ORDER BY name 


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
INNER JOIN receiptlist rl ON rl.objid = ri.receiptid    
INNER JOIN remittance rml ON rml.objid = rl.remittanceid     
INNER JOIN af af ON rl.afid = af.objid 
WHERE rml.objid = $P{remittanceid} 
  AND rl.voided = 0   
GROUP BY af.objid, CASE WHEN af.aftype = 'nonserial' THEN ri.fundname ELSE CASE WHEN ia.groupid IS NULL THEN ri.fundname ELSE ia.groupid END  END  
ORDER BY af.objid, min(ri.fundname), min(ia.groupid) 


[getReceiptsByRemittance]
SELECT * FROM receiptlist 
WHERE remittanceid = $P{remittanceid} 
ORDER BY afid, serialno

[getReceiptIdsByRemittance]
SELECT objid, afid FROM receiptlist   
WHERE remittanceid = $P{remittanceid} 

[getOtherPaymentsByRemittance]
SELECT pi.* FROM paymentitem pi, receiptlist rl 
WHERE rl.objid = pi.receiptid 
AND rl.voided = 0 
AND NOT pi.paytype = 'CASH' 
AND rl.remittanceid = $P{remittanceid} 

[getRemittedFormsByRemittance]
SELECT * FROM remittedform 
WHERE remittanceid = $P{remittanceid} 
ORDER BY afid, stubno

[getSerialRemittedFormsByRemittance]
SELECT * FROM remittedform 
WHERE remittanceid = $P{remittanceid} 
	AND aftype = 'serial' 
ORDER BY afid, stubno, beginfrom

[getNonSerialRemittedFormsByRemittance]
SELECT 
	CASE WHEN rf.receivedqty >= 0 THEN rf.receivedqty * af.denomination ELSE 0.0 END AS receivedamt, 
	CASE WHEN rf.beginqty >= 0 THEN rf.beginqty * af.denomination ELSE 0.0 END AS beginamt, 
	CASE WHEN rf.issuedqty >= 0 THEN rf.issuedqty * af.denomination ELSE 0.0 END AS issuedamt, 
	CASE WHEN rf.endingqty >= 0 THEN rf.endingqty * af.denomination ELSE 0.0 END AS endingamt, 
	rf.* 
FROM remittedform rf 
	INNER JOIN af af ON rf.afid = af.objid 
WHERE rf.remittanceid = $P{remittanceid} 
	AND rf.aftype = 'nonserial' 
ORDER BY rf.afid, rf.stubno

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
FROM remittedform rf  
	INNER JOIN af af ON rf.afid = af.objid  
WHERE rf.remittanceid = $P{remittanceid}  
  AND rf.aftype = 'nonserial' 
GROUP BY rf.afid 
ORDER BY rf.afid 

[getUnremittedReceipts]
SELECT * FROM receiptlist 
WHERE remittanceid IS NULL 
AND docstate = 'OPEN' 
AND collectorid = $P{collectorid} 
ORDER BY afid, serialno

[getUnremittedReceiptSummaryInfo]
SELECT COUNT(*) AS count, SUM(amount) AS totalamount 
FROM receiptlist 
WHERE remittanceid IS NULL 
AND docstate = 'OPEN' 
AND collectorid = $P{collectorid} 

[getUnpostedBatchCaptureCollections]
SELECT objid 
FROM batchcapture 
WHERE collectorid = $P{collectorid} AND docstate <> 'POSTED' 

[getUnpostedCaptureReceipts]
SELECT * FROM receiptlist 
WHERE remittanceid IS NULL 
AND docstate = 'CAPTURED' 
AND collectorid = $P{collectorid} 

[getRemittanceInfo]
SELECT 
	SUM( amount ) AS totalamount, 
	SUM( cash ) AS totalcash, 
	SUM( otherpayment ) AS totalotherpayment 
FROM receiptlist rl 
WHERE remittanceid IS NULL 
AND docstate = 'OPEN' 
AND voided = 0 
AND collectorid = $P{collectorid} 

[getAfControls]
SELECT * FROM afcontrol 
WHERE docstate = 'APPROVED' 
AND collectorid = $P{collectorid} 
ORDER BY afid, stubno

[getReceiptsByRemittanceAllCollectionType]
SELECT 
	afid, 
	serialno, 
	txndate, paidby, 
	CASE WHEN voided = 0 THEN collectiontype ELSE '***VOIDED***' END AS collectiontype, 
	CASE WHEN voided = 0 THEN amount ELSE 0.0 END AS amount 
FROM receiptlist 
WHERE remittanceid = $P{remittanceid} 
ORDER BY afid, serialno 

[getReceiptsByRemittanceCollectionType]
SELECT 
	afid, 
	serialno, 
	txndate, paidby, 
	CASE WHEN voided = 0 THEN collectiontype ELSE '***VOIDED***' END AS collectiontype, 
	CASE WHEN voided = 0 THEN amount ELSE 0.0 END AS amount 
FROM receiptlist 
WHERE remittanceid = $P{remittanceid} 
	AND collectiontypeid = $P{collectiontypeid} 
ORDER BY afid, serialno 

[getReceiptDetailsByAllFund]
SELECT 
	rl.afid AS afid, 
	rl.serialno AS serialno, 
	rl.txndate AS txndate, 
	ri.fundname AS fundname, 
	ri.remarks AS remarks, 
	CASE WHEN rl.voided = 0 THEN rl.paidby ELSE '***VOIDED***' END AS payer, 
	CASE WHEN rl.voided = 0 THEN ri.accttitle ELSE '***VOIDED***' END AS particulars, 
	CASE WHEN rl.voided = 0 THEN rl.paidbyaddress ELSE '' END AS payeraddress, 
	CASE WHEN rl.voided = 0 THEN ri.amount ELSE 0.0 END AS amount 
FROM receiptlist rl, receiptitem ri 
WHERE rl.objid = ri.receiptid 
	AND rl.remittanceid = $P{remittanceid} 
ORDER BY rl.afid, rl.serialno

[getReceiptDetailsByFund]
SELECT 
	rl.afid AS afid, 
	rl.serialno AS serialno, 
	rl.txndate AS txndate, 
	ri.fundname AS fundname, 
	ri.remarks AS remarks, 
	CASE WHEN rl.voided = 0 THEN rl.paidby ELSE '***VOIDED***' END AS payer, 
	CASE WHEN rl.voided = 0 THEN ri.accttitle ELSE '***VOIDED***' END AS particulars, 
	CASE WHEN rl.voided = 0 THEN rl.paidbyaddress ELSE '' END AS payeraddress, 
	CASE WHEN rl.voided = 0 THEN ri.amount ELSE 0.0 END AS amount 
FROM receiptlist rl, receiptitem ri 
WHERE rl.objid = ri.receiptid 
	AND rl.remittanceid = $P{remittanceid} 
	AND ri.fundid LIKE $P{fundid} 
ORDER BY  rl.afid, rl.serialno, rl.paidby, ri.accttitle 
	
[getIncomeAccuntSummaryByAllFund] 
SELECT 
	ri.fundname, 
	ri.acctid AS acctid, 
	ri.accttitle AS acctname, 
	SUM( ri.amount ) AS amount 
FROM receiptlist rl, receiptitem ri 
WHERE rl.objid = ri.receiptid 
	AND rl.remittanceid = $P{remittanceid} 
	AND rl.voided = 0 
GROUP BY ri.fundname, ri.acctid, ri.accttitle 
ORDER BY ri.fundname, ri.accttitle 

[getIncomeAccuntSummaryByFund]
SELECT 
	ri.fundname,
	ri.acctid AS acctid, 
	ri.accttitle AS acctname, 
	SUM( ri.amount ) AS amount 
FROM receiptlist rl, receiptitem ri 
WHERE rl.objid = ri.receiptid 
  AND rl.remittanceid = $P{remittanceid} 
  AND ri.fundid LIKE $P{fundid} 
  AND rl.voided = 0 
GROUP BY ri.fundname, ri.acctid, ri.accttitle 
ORDER BY ri.fundname, ri.accttitle

[getSerialReceiptDetailsByAllFund]
SELECT 
	rl.afid AS afid, 
	rl.serialno AS serialno, 
	rl.txndate AS txndate, 
	rl.paidby AS payer, 
	ri.fundname AS fundname, 
	ri.accttitle AS particulars, 
	CASE WHEN rl.voided = 0 THEN ri.amount ELSE 0.0 END AS amount 
FROM receiptlist rl, receiptitem ri, af af 
WHERE rl.objid = ri.receiptid 
	AND rl.remittanceid = $P{remittanceid} 
	AND rl.afid = af.objid 
	AND af.aftype = 'serial' 
ORDER BY rl.afid, ri.accttitle, rl.serialno 

[getSerialReceiptDetailsByFund]
SELECT 
	rl.afid AS afid, 
	rl.serialno AS serialno, 
	rl.txndate AS txndate, 
	rl.paidby AS payer, 
	ri.fundname AS fundname, 
	ri.accttitle AS particulars, 
	CASE WHEN rl.voided = 0 THEN ri.amount ELSE 0.0 END AS amount 
FROM receiptlist rl, receiptitem ri, af af 
WHERE rl.objid = ri.receiptid 
	AND rl.remittanceid = $P{remittanceid} 
	AND ri.fundid = $P{fundid} 
	AND rl.afid = af.objid 
	AND af.aftype = 'serial' 
ORDER BY rl.afid, ri.accttitle, rl.serialno 

[getNonSerialReceiptDetailsByAllFund]
SELECT 
	rl.afid AS afid, 
	rl.serialno AS serialno, 
	rl.txndate AS txndate, 
	rl.paidby AS payer, 
	ri.fundname AS fundname, 
	ri.accttitle AS particulars, 
	ri.amount AS amount 
FROM receiptlist rl, receiptitem ri, af af 
WHERE rl.objid = ri.receiptid 
	AND rl.remittanceid = $P{remittanceid} 
	AND rl.afid = af.objid 
	AND af.aftype = 'serial' 
ORDER BY rl.afid, ri.accttitle

[getNonSerialReceiptDetailsByFund]
SELECT 
	rl.afid AS afid, 
	rl.serialno AS serialno, 
	rl.txndate AS txndate, 
	rl.paidby AS payer, 
	ri.fundname AS fundname, 
	ri.accttitle AS particulars, 
	ri.amount AS amount 
FROM receiptlist rl, receiptitem ri, af af 
WHERE rl.objid = ri.receiptid 
	AND rl.remittanceid = $P{remittanceid} 
	AND ri.fundid = $P{fundid} 
	AND rl.afid = af.objid 
	AND af.aftype = 'serial' 
ORDER BY rl.afid, ri.accttitle 


[getCashTicketSummary]
SELECT  
	(MIN(u.lastname) + ', ' + MIN(u.firstname)) AS particulars,  
	SUM(ri.amount) AS amount  
FROM receiptlist rl, receiptitem ri, personnel u, af af 
WHERE rl.objid = ri.receiptid  
  AND rl.capturedbyid = u.objid  
  AND rl.afid = af.objid  
  AND rl.remittanceid = $P{remittanceid}  
  AND rl.mode = 'CAPTURE'  
  AND ri.fundid LIKE 'GENERAL'   
  AND rl.voided = 0 
  AND af.aftype = 'nonserial'  
GROUP BY u.objid  
ORDER BY u.objid 

 

[updateAfControlForRemittance]
UPDATE afcontrol SET 
	beginseries = currentseries, 
	beginqty = balance, 
	qtyissued = 0, 
	issuedfrom = 0, 
	issuedto = 0 
WHERE collectorid = $P{collectorid}

[updateAFInventoryCreditInfo]
UPDATE c SET 
    c.qtyissued = c.qtyissued + $P{qtyissued}, 
	c.balance = c.balance - $P{qtyissued},
	c.docstate = CASE WHEN c.balance - $P{qtyissued} = 0 THEN 'CLOSED' ELSE 'OPEN' end 
FROM afinventorycredit c, afcontrol af 
WHERE c.objid = af.afinventorycreditid 
  AND af.objid = $P{afcontrolid} 
 

[closeAfControl]
UPDATE afcontrol SET 
	docstate = 'CLOSED' 
WHERE balance = 0 
  AND docstate = 'APPROVED' 
  AND collectorid = $P{collectorid} 

[closeReceiptForRemittance]
UPDATE receipt SET 
	docstate = 'CLOSED', 
	remittanceid = $P{remittanceid}, 
	remittanceno = $P{remittanceno}, 
	remittancedate = $P{remittancedate} 
WHERE collectorid = $P{collectorid} 
  AND docstate = 'OPEN' 
  
[closeReceiptListForRemittance]
UPDATE receiptlist SET 
	docstate = 'CLOSED', 
	remittanceid = $P{remittanceid}, 
	remittanceno = $P{remittanceno}, 
	remittancedate = $P{remittancedate}
WHERE collectorid = $P{collectorid} 
  AND docstate = 'OPEN' 
 

[getCollectionType] 
SELECT 
	afid, stubno, 
	MIN(serialno) AS fromserialno, 
	MAX(serialno) AS toserialno, 
	SUM(CASE WHEN voided =0 THEN amount ELSE 0 END ) AS amount 
FROM receiptlist 
WHERE remittanceid = $P{remittanceid} 
GROUP BY afid, afcontrolid, stubno  
ORDER BY afid, fromserialno, stubno  

[getOpenCollectionSummaries] 
SELECT 
	afid, stubno, 
	MIN(serialno) AS fromserialno, 
	MAX(serialno) AS toserialno, 
	SUM(CASE WHEN voided =0 THEN amount ELSE 0 END ) AS amount 
FROM receiptlist 
WHERE docstate = 'OPEN' 
  AND collectorid = $P{collectorid}
GROUP BY afid, afcontrolid, stubno  
ORDER BY afid, fromserialno, stubno  


[getOpenNonCashPayments]
SELECT pi.* FROM paymentitem pi, receiptlist rl 
WHERE rl.objid = pi.receiptid 
AND NOT pi.paytype = 'CASH' 
AND rl.collectorid = $P{collectorid} 
AND rl.voided = 0 
AND rl.docstate = 'OPEN' 

[getRemittedNonCashPayments]
SELECT  
 i.*
FROM receiptlist rl 
INNER JOIN paymentitem i ON i.receiptid = rl.objid 
WHERE rl.remittanceid = $P{objid} 
 AND rl.voided = 0 
 AND paytype = 'CHECK' 
 
[getDistinctAccountSRE]
SELECT DISTINCT 
	a.objid,  
	a.acctcode, 
	a.accttitle  
FROM receiptlist rl  
	INNER JOIN receiptitem ri ON rl.objid = ri.receiptid 
	INNER JOIN incomeaccount ia ON ri.acctid = ia.objid  
	LEFT JOIN account a ON ia.sreid = a.objid 
WHERE rl.remittanceid = $P{remittanceid} 
ORDER BY a.acctcode 

[getSummaryOfCollectionSRE]
SELECT 
	rl.afid, 
	rl.serialno, 
	CASE WHEN rl.voided = 0 THEN rl.paidby ELSE '*** VOIDED ***' END AS paidby, 
	rl.txndate, 
	${columnsql} 
	rl.voided 
FROM receiptlist rl  
	INNER JOIN receiptitem ri ON rl.objid = ri.receiptid  
	INNER JOIN incomeaccount ia ON ri.acctid = ia.objid   
	LEFT JOIN account a ON ia.sreid = a.objid  
WHERE rl.remittanceid = $P{remittanceid} 
GROUP BY rl.afid, rl.serialno, rl.paidby, rl.txndate, rl.voided 
ORDER BY rl.afid, rl.serialno 	

[getDistinctAccountNGAS]
SELECT DISTINCT 
	a.objid,
	a.acctcode, 
	a.accttitle  
FROM receiptlist rl  
	INNER JOIN receiptitem ri ON rl.objid = ri.receiptid 
	INNER JOIN incomeaccount ia ON ri.acctid = ia.objid  
	LEFT JOIN account a ON ia.ngasid = a.objid 
WHERE rl.remittanceid = $P{remittanceid} 
ORDER BY a.acctcode 

[getSummaryOfCollectionNGAS]
SELECT 
	rl.afid, 
	rl.serialno, 
	CASE WHEN rl.voided = 0 THEN rl.paidby ELSE '*** VOIDED ***' END AS paidby, 
	rl.txndate, 
	${columnsql} 
	rl.voided 
FROM receiptlist rl  
	INNER JOIN receiptitem ri ON rl.objid = ri.receiptid  
	INNER JOIN incomeaccount ia ON ri.acctid = ia.objid   
	LEFT JOIN account a ON ia.ngasid = a.objid  
WHERE rl.remittanceid = $P{remittanceid} 
GROUP BY rl.afid, rl.serialno, rl.paidby, rl.txndate, rl.voided 
ORDER BY rl.afid, rl.serialno 	


 
[getDistinctFundAccount]
 SELECT DISTINCT 
	ri.fundid, 
	ri.fundname 
FROM receiptlist rl  
	INNER JOIN receiptitem ri ON rl.objid = ri.receiptid 
WHERE rl.remittanceid = $P{remittanceid} AND rl.voided = 0 
ORDER BY ri.fundname  

[getDistinctGLIncomeAccountNGAS]
SELECT DISTINCT 
	a.acctcode as glcode, 
	a.accttitle as gltitle,
	ri.acctid,
	ri.accttitle
FROM receiptlist rl  
	INNER JOIN receiptitem ri ON rl.objid = ri.receiptid 
	INNER JOIN incomeaccount ia ON ri.acctid = ia.objid 
	LEFT JOIN account a ON ia.ngasid = a.objid 
WHERE rl.remittanceid = $P{remittanceid}
  AND rl.voided = 0 
  AND ri.fundid = $P{fundid}
  AND ( a.charttype = 'NGAS' OR a.charttype IS NULL)
ORDER BY a.acctcode, ri.accttitle

[getDistinctGLIncomeAccountSRE]
SELECT DISTINCT 
	a.acctcode as glcode, 
	a.accttitle as gltitle,
	ri.acctid,
	ri.accttitle
FROM receiptlist rl  
	INNER JOIN receiptitem ri ON rl.objid = ri.receiptid 
	INNER JOIN incomeaccount ia ON ri.acctid = ia.objid 
	LEFT JOIN account a ON ia.sreid = a.objid 
WHERE rl.remittanceid = $P{remittanceid}
  AND rl.voided = 0 
  AND ri.fundid = $P{fundid}
  AND ( a.charttype = 'SRE' OR a.charttype IS NULL)
ORDER BY a.acctcode, ri.accttitle

[getReportByIncomeAccountCrosstabNGAS]
SELECT 
	rl.afid, 
	rl.serialno, 
	CASE WHEN rl.voided = 0 THEN rl.paidby ELSE '*** VOIDED ***' END AS paidby, 
	rl.txndate, 
	${columnsql}
	rl.voided
FROM receiptlist rl  
	INNER JOIN receiptitem ri ON rl.objid = ri.receiptid 
	INNER JOIN incomeaccount ia ON ri.acctid = ia.objid 
	LEFT JOIN account a ON ia.ngasid = a.objid 
WHERE rl.remittanceid = $P{remittanceid}
  AND ri.fundid = $P{fundid}
  AND ( a.charttype = 'NGAS' OR a.charttype IS NULL)
GROUP BY rl.afid, rl.serialno, rl.voided, rl.txndate, rl.paidby
ORDER BY rl.afid, rl.serialno 

[getReportByIncomeAccountCrosstabSRE]
SELECT 
	rl.afid, 
	rl.serialno, 
	CASE WHEN rl.voided = 0 THEN rl.paidby ELSE '*** VOIDED ***' END AS paidby, 
	rl.txndate, 
	${columnsql}
	rl.voided
FROM receiptlist rl  
	INNER JOIN receiptitem ri ON rl.objid = ri.receiptid 
	INNER JOIN incomeaccount ia ON ri.acctid = ia.objid 
	LEFT JOIN account a ON ia.sreid = a.objid 
WHERE rl.remittanceid = $P{remittanceid}
  AND ri.fundid = $P{fundid}
  AND ( a.charttype = 'SRE' OR a.charttype IS NULL)
GROUP BY rl.afid, rl.serialno, rl.voided, rl.txndate, rl.paidby
ORDER BY rl.afid, rl.serialno 


[getReportByFundDetailCrosstab]
SELECT 
	rl.afid, 
	MIN(rl.collectiontype), 
	rl.serialno, 
	CASE WHEN rl.voided = 0 THEN rl.paidby ELSE '*** VOIDED ***' END AS paidby, 
	rl.txndate, 
	${columnsql} 
	rl.voided 
FROM receiptlist rl  
	INNER JOIN receiptitem ri ON rl.objid = ri.receiptid  
	INNER JOIN incomeaccount ia ON ri.acctid = ia.objid   
WHERE rl.remittanceid = $P{remittanceid} 
GROUP BY rl.afid, rl.serialno, rl.paidby, rl.txndate, rl.voided 
ORDER BY rl.afid, rl.serialno 	


[getAbstractCollectionBASIC] 
SELECT  
	rp.period AS payperiod, 
	'BASIC' AS type, 
	r.txndate AS ordate, 
	rl.taxpayername, 
	rl.tdno, 
	r.serialno AS orno, 
	rl.barangay, 
	rl.classcode AS classification, 
	rl.municityname,
	ISNULL((SELECT SUM( basic ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid AND revtype IN ('current','advance') ), 0.0) AS currentyear, 
	ISNULL((SELECT SUM( basic ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid AND revtype IN ('previous','prior') ), 0.0) AS previousyear, 
	ISNULL((SELECT SUM( basicdisc ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid ), 0.0) AS discount, 
	ISNULL((SELECT SUM( basicint ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid AND revtype IN ('current','advance') ), 0.0) AS penaltycurrent, 
	ISNULL((SELECT SUM( basicint ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid AND revtype IN ('previous','prior') ), 0.0) AS penaltyprevious 
FROM remittance rem 
	INNER JOIN receiptlist r ON rem.objid = r.remittanceid  
	INNER JOIN rptpayment rp ON rp.receiptid = r.objid  
	INNER JOIN rptledger rl ON rp.rptledgerid = rl.objid  
WHERE rem.objid = $P{objid}
  AND r.doctype = 'RPT'  
  AND r.voided = 0  
ORDER BY r.serialno, rl.tdno    


[getAbstractCollectionSEF]
SELECT 
	rp.period AS payperiod, 
	'SEF' AS type, 
	r.txndate AS ordate, 
	rl.taxpayername, 
	rl.tdno, 
	r.serialno AS orno, 
	rl.barangay, 
	rl.classcode AS classification, 
	rl.municityname,
	ISNULL((SELECT SUM( sef ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid AND revtype IN ('current','advance') ),0.0) AS currentyear, 
	ISNULL((SELECT SUM( sef ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid AND revtype IN ('previous', 'prior') ),0.0) AS previousyear, 
	ISNULL((SELECT SUM( sefdisc ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid ),0.0) AS discount, 
	ISNULL((SELECT SUM( sefint ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid AND revtype IN ('current','advance') ),0.0) AS penaltycurrent, 
	ISNULL((SELECT SUM( sefint ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid AND revtype IN ('previous','prior' ) ),0.0) AS penaltyprevious 
FROM remittance rem 
	INNER JOIN receiptlist r ON rem.objid = r.remittanceid  
	INNER JOIN rptpayment rp ON rp.receiptid = r.objid  
	INNER JOIN rptledger rl ON rp.rptledgerid = rl.objid  
WHERE rem.objid = $P{objid}
  AND r.doctype = 'RPT'  
  AND r.voided = 0  
ORDER BY r.serialno, rl.tdno 


[getAbstractCollectionManualBASIC]
SELECT 
	rp.period AS payperiod,
	'BASIC' AS type,
	r.txndate AS ordate,
	rp.taxpayername,
	rp.tdno,
	r.serialno AS orno,
	rp.barangay,
	rp.classcode AS classification, 
	rp.municityname,
	rp.basic + rp.basicadv AS currentyear, 
	rp.basicprev + rp.basicprior AS previousyear, 
	rp.basicdisc + rp.basicadvdisc AS discount, 
	rp.basicint AS penaltycurrent, 
	rp.basicprevint + rp.basicpriorint AS penaltyprevious 
FROM remittance rem 
	INNER JOIN receiptlist r ON rem.objid = r.remittanceid 
	INNER JOIN rptpaymentmanual rp ON rp.receiptid = r.objid 
WHERE rem.objid = $P{objid} 
  AND r.doctype = 'RPT' 
  AND r.voided = 0 
ORDER BY r.serialno   
  
  


[getAbstractCollectionManualSEF]
SELECT 
	rp.period AS payperiod,
	'SEF' AS type,
	r.txndate AS ordate,
	rp.taxpayername,
	rp.tdno,
	r.serialno AS orno,
	rp.barangay,
	rp.classcode AS classification, 
	rp.municityname,
	rp.sef + rp.sefadv AS currentyear, 
	rp.sefprev + rp.sefprior AS previousyear, 
	rp.sefdisc + rp.sefadvdisc AS discount, 
	rp.sefint AS penaltycurrent, 
	rp.sefprevint + rp.sefpriorint AS penaltyprevious 
FROM remittance rem 
	INNER JOIN receiptlist r ON rem.objid = r.remittanceid 
	INNER JOIN rptpaymentmanual rp ON rp.receiptid = r.objid 
WHERE rem.objid = $P{objid} 
  AND r.doctype = 'RPT' 
  AND r.voided = 0  
ORDER BY r.serialno   

[getFundName]
SELECT objid, fundname FROM fund ORDER BY fundname 


 
[exportremittance]
select * from remittance where objid = $P{objid}

[exportRemittedForm]
select * from remittedform where remittanceid = $P{objid}

[exportRevenue]
select * from revenue where remittanceid = $P{objid}

[exportReceipt]
select * from receipt where remittanceid = $P{objid}

[exportReceiptList]
select * from receiptlist  where remittanceid = $P{objid}

[exportReceiptItem]
select * from receiptitem where receiptid in (
	select objid from receiptlist where remittanceid = $P{objid}
)

[exportPaymentItem]
select * from paymentitem where receiptid in (
	select objid from receiptlist where remittanceid = $P{objid}
)

[exportAFControls]
SELECT afc.* 
FROM afcontrol afc 
	INNER JOIN remittedform rf ON afc.objid = rf.afcontrolid 
WHERE rf.remittanceid = $P{objid} 

[exportCraafCredits]
SELECT cr.* 
FROM afcontrol afc 
	INNER JOIN remittedform rf ON afc.objid = rf.afcontrolid 
	INNER JOIN craaf cr ON afc.afinventorycreditid = cr.afinventorycreditid  
WHERE rf.remittanceid = $P{objid}



[getImportedRemittanceById]
SELECT * FROM remittanceimport WHERE objid = $P{objid} 

[getAFControlByRemittedForm]
SELECT * FROM afcontrol 
WHERE afid = $P{afid} 
  AND collectorid = $P{collectorid} 
  AND endseries = $P{endseries} 
  AND balance > 0 

[getCraafCreditByInvCreditId]
SELECT * FROM craaf WHERE afinventorycreditid = $P{afinventorycreditid} 

[getRemittanceById]
SELECT * FROM remittance WHERE objid = $P{objid} 