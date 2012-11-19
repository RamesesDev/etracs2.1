[getList]
SELECT objid, docstate, txnno, txndate, depositedbyname, depositedbytitle, cash, noncash, amount 
FROM deposit 
ORDER BY txnno  

[getListByTxnno]
SELECT objid, docstate, txnno, txndate, depositedbyname, depositedbytitle, cash, noncash, amount 
FROM deposit 
WHERE txnno LIKE $P{txnno} 
ORDER BY txnno  

[getListByDepositor]
SELECT objid, docstate, txnno, txndate, depositedbyname, depositedbytitle, cash, noncash, amount 
FROM deposit 
WHERE depositedbyname LIKE $P{depositedbyname}  
ORDER BY txnno  

[getState]
SELECT docstate FROM deposit WHERE objid = $P{objid} 

[getOpenLiquidations] 
SELECT 
	objid, txnno, txndate, amount, 
	liquidatingofficerid, liquidatingofficername, liquidatingofficertitle 
FROM liquidation 
WHERE docstate = 'OPEN'  

[getOpenLiquidationsByCashier] 
SELECT 
	lr.objid, lr.fundid, lr.fundname, lr.liquidationid, l.txnno, l.txndate, SUM(lr.amount) AS amount, 
	l.liquidatingofficerid, l.liquidatingofficername, l.liquidatingofficertitle 
FROM liquidationrcd lr 
	INNER JOIN liquidation l ON lr.liquidationid = l.objid 
WHERE lr.docstate = 'OPEN'  
  AND lr.cashierid = $P{cashierid} 
GROUP BY 
	lr.objid, lr.fundid, lr.fundname, lr.liquidationid, 
	l.txnno, l.txndate, l.liquidatingofficerid, l.liquidatingofficername, l.liquidatingofficertitle 




[getOpenFundSummaries]
SELECT 
	ri.fundid, ri.fundname, 
	ba.objid AS bankacctid, 
	ba.acctno AS bankacctno,
	ba.bankcode, bankacctname, 
	ba.bankname, 
	ba.branchname, 
	ba.accttype,
	SUM( ri.amount ) AS cash,  
	0.0 AS noncash, 
	SUM( ri.amount ) AS amount 
FROM liquidation lq, remittance rem, receiptlist r, receiptitem ri, bankaccount ba, fund f 
WHERE lq.objid = rem.liquidationid 
  AND rem.objid = r.remittanceid  
  AND r.objid = ri.receiptid  
  AND ri.fundid = ba.fundid  
  AND ri.fundid = f.objid  
  AND lq.docstate = 'OPEN' 
  AND r.voided = 0 
GROUP BY ri.fundid, ba.objid, ba.bankcode, ba.bankname, ba.branchname 

[getOpenFundTotals]
SELECT 
	ri.fundid, 
	ri.fundname, 
	SUM( ri.amount ) AS amount,  
	0.0 AS amtdeposited 
FROM liquidation lq, remittance rem, receiptlist r, receiptitem ri 
WHERE lq.objid = rem.liquidationid 
  AND rem.objid = r.remittanceid  
  AND r.objid = ri.receiptid  
  AND lq.docstate = 'OPEN' 
  AND r.voided = 0 
GROUP BY ri.fundid, ri.fundname 


[getOpenFundTotalsByCashier]
SELECT 
	CASE WHEN f.bankacctrequired = 1 THEN lr.fundid ELSE f.fund END AS fundid, 
	CASE WHEN f.bankacctrequired = 1 THEN lr.fundname ELSE f.fund END AS fundname, 
	SUM( lr.amount ) AS amount,  
	0.0 AS amtdeposited 
FROM liquidationrcd lr 
	INNER JOIN fund f ON lr.fundid = f.objid 
	INNER JOIN liquidation l ON lr.liquidationid = l.objid 
WHERE lr.docstate = 'OPEN'  
  AND lr.cashierid = $P{cashierid} 
GROUP BY CASE WHEN f.bankacctrequired = 1 THEN lr.fundid ELSE f.fund END,
	     CASE WHEN f.bankacctrequired = 1 THEN lr.fundname ELSE f.fund END


[getOpenNonCashPayments]
SELECT 
	p.objid AS paymentitemid, 
	p.paytype, 
	p.particulars, 
	p.amount, 
	'SYSTEM' AS source, 
	p.extended 
FROM liquidation l, remittance rem, receipt r, paymentitem p 
WHERE l.objid = rem.liquidationid 
  AND rem.objid = r.remittanceid  
  AND r.objid = p.receiptid  
  AND l.docstate = 'OPEN'  
  AND p.paytype <> 'CASH'  
  AND r.voided = 0 
ORDER BY paytype, particulars  

[getOpenNonCashPaymentsCashier]
SELECT 	DISTINCT p.objid AS paymentitemid, 
	p.paytype, 
	convert(varchar(500), p.particulars) as particulars, 
	p.amount, 
	'SYSTEM' AS source,  
	convert( varchar(400),p.extended ) as extended 
FROM liquidation l 
	INNER JOIN liquidationrcd lr ON l.objid = lr.liquidationid 
	INNER JOIN remittance rem ON rem.liquidationid = l.objid 
	INNER JOIN receiptlist rl ON rem.objid = rl.remittanceid 
	INNER JOIN paymentitem p ON rl.objid = p.receiptid 
WHERE l.docstate = 'OPEN'  
  AND lr.cashierid = $P{cashierid} 
  AND rl.voided = 0 
  AND p.paytype <> 'CASH' 


[getOpenNonCashPaymentsCashierMulti]
SELECT 
	p.objid AS paymentitemid, 
 	p.paytype, 
 	p.particulars, 
 	p.amount, 
 	'SYSTEM' AS source, 
 	p.extended 
FROM liquidationrcd lr 
	INNER JOIN liquidation l ON lr.liquidationid = l.objid 
	INNER JOIN paymentitem p ON lr.objid = p.liquidationrcdid 
	INNER JOIN receiptlist rl ON p.receiptid = rl.objid 
WHERE lr.docstate = 'OPEN'  
   AND lr.cashierid = $P{cashierid} 
   AND rl.voided = 0 

   
   
[depositOpenLiquidationRcdByCashier]
UPDATE liquidationrcd SET	  
	docstate = 'CLOSED', 
	depositid = $P{depositid}, 
	dtdeposited = $P{dtdeposited} 
WHERE docstate = 'OPEN'  
  AND cashierid = $P{cashierid}	 
 
[depositOpenLiquidation]
UPDATE liquidation SET 
	docstate  = 'CLOSED', 
	depositid = $P{depositid},
	dtdeposited = $P{dtdeposited}  
WHERE docstate = 'OPEN'	 

[depositOpenliquidation]
UPDATE liquidation SET 
	docstate  = 'CLOSED', 
	depositid = $P{depositid}, 
	dtdeposited = $P{dtdeposited} 
WHERE docstate = 'OPEN'	 



[closeliquidationByDeposit]
UPDATE ll SET 
	ll.docstate = 'CLOSED' 
FROM liquidation ll 
WHERE ll.objid IN ( 
	SELECT a.liquidationid FROM 
	( SELECT lr.liquidationid,  
		 COUNT(*) AS itemcount,  
		 SUM( CASE WHEN lr.docstate = 'CLOSED' THEN 1 ELSE 0 END ) AS closeditemcount 
	  FROM liquidationrcd lr, liquidation ll 
	  WHERE lr.liquidationid = ll.objid  
	    AND ll.docstate = 'OPEN' 
	    AND lr.depositid = $P{depositid} 
	  GROUP BY lr.liquidationid
	) a
	WHERE a.itemcount = a.closeditemcount 
)



[closeLiquidationByDeposit]
UPDATE l SET 
	l.docstate = ll.docstate 
FROM liquidation l, liquidation  ll, liquidationrcd lr 
WHERE l.objid = ll.objid 
  AND l.objid = lr.liquidationid 
  AND lr.depositid = $P{depositid} 
  

[getBankAccountList]
SELECT * FROM bankaccount WHERE fundid = $P{fundid} ORDER BY fund, acctno 

[getCollectionSummaryByAFAndFund]
SELECT 
	CASE 
	WHEN min(af.objid) = '51' AND min(af.aftype) = 'serial' AND min(ia.groupid) IS NULL THEN ( 'AF#'+ min(rct.afid)+ ': '+ min(ri.fundname) ) 
	WHEN min(af.objid) = '51' AND min(af.aftype) = 'serial' AND min(ia.groupid) IS NOT NULL THEN ( 'AF#'+ min(rct.afid)+ ': '+ min(ia.groupid) ) 
	WHEN min(af.aftype) = 'nonserial' AND min(ia.groupid) IS NOT NULL THEN ( min(rct.afid)+ ': '+ min(ia.groupid) ) 
	ELSE ( 'AF#'+min(rct.afid)+ ': '+ min(af.description)+' - '+ min(ri.fundname) ) 
	END AS particulars, 
	SUM( ri.amount ) AS  amount   
FROM deposit d  
	INNER JOIN liquidation lq on d.objid = lq.depositid  
	INNER JOIN remittance rem on lq.objid = rem.liquidationid   
	INNER JOIN receiptlist rct on rem.objid = rct.remittanceid   
	INNER JOIN af af ON rct.afid = af.objid  	 
	INNER JOIN receiptitem ri  on rct.objid = ri.receiptid   
	INNER JOIN incomeaccount ia ON ri.acctid = ia.objid 
	INNER JOIN fund f on ri.fundid = f.objid  
WHERE d.objid = $P{depositid} 
  AND rct.voided = 0    
  AND f.fundname LIKE $P{fundname}  
GROUP BY rct.afid, CASE WHEN af.aftype = 'nonserial' THEN ri.fundname ELSE ia.groupid END   
ORDER BY rct.afid, min(ri.fundname) , min(ia.groupid)  


[getCollectionSummaryByAFAndFund2]
SELECT 
	CASE 
	WHEN min(af.objid) = '51' AND min(af.aftype) = 'serial' AND min(ia.groupid) IS NULL THEN ( 'AF#' + min(rct.afid) + ': ' + min(ri.fundname) ) 
	WHEN min(af.objid) = '51' AND min(af.aftype) = 'serial' AND min(ia.groupid) IS NOT NULL THEN ( 'AF#'+ min(rct.afid)+ ': '+ min(ia.groupid) ) 
	WHEN min(af.aftype) = 'nonserial' AND min(ia.groupid) IS NOT NULL THEN ( min(rct.afid)+ ': '+ min(ia.groupid) ) 
	ELSE ( 'AF#' + min(rct.afid) + ': ' + min(af.description) + ' - ' + min(ri.fundname) ) 
	END AS particulars, 
	SUM( ri.amount ) AS  amount   
FROM deposit d  
	INNER JOIN liquidationrcd lq on d.objid = lq.depositid  
	INNER JOIN remittance rem on lq.liquidationid = rem.liquidationid   
	INNER JOIN receiptlist rct on rem.objid = rct.remittanceid   
	INNER JOIN af af ON rct.afid = af.objid  	 
	INNER JOIN receiptitem ri  on rct.objid = ri.receiptid and ri.liquidationrcdid = lq.objid 
	INNER JOIN incomeaccount ia ON ri.acctid = ia.objid 
	INNER JOIN fund f on ri.fundid = f.objid  
WHERE d.objid = $P{depositid} 
  AND rct.voided = 0    
  AND CASE WHEN f.bankacctrequired = 1 THEN  f.fundname ELSE f.fund END LIKE $P{fundname} 
GROUP BY rct.afid, CASE WHEN af.aftype = 'nonserial' THEN ri.fundname ELSE ia.groupid END   
ORDER BY rct.afid, min(ri.fundname) , min(ia.groupid)  






[getFundList] 
SELECT distinct fundname FROM fund o   WHERE bankacctrequired = 1

[getFundIdList]
SELECT objid AS fundid, fundname  FROM fund  WHERE bankacctrequired = 1

[getBankAccountByFund]
SELECT objid FROM bankaccount WHERE fundid = $P{fundid}  

[getRemittedFormsByAF]
SELECT 
	rf.afid, rf.beginqty, rf.beginfrom, rf.beginto, 
	rf.receivedqty, rf.receivedfrom, rf.receivedto,  
	rf.issuedqty, rf.issuedfrom, rf.issuedto,  
	rf.endingqty, rf.endingfrom, rf.endingto  
FROM liquidation lq 
	INNER JOIN remittance rem ON lq.objid = rem.liquidationid 
	INNER JOIN remittedform rf ON rem.objid = rf.remittanceid 
WHERE lq.objid = $P{liquidationid} 
  AND rf.afid = $P{afid}  
ORDER BY afid, rf.beginfrom  