[getClassificationList] 
SELECT objid AS classid, propertydesc AS classname, special, propertycode AS classcode    
FROM propertyclassification  ORDER BY orderno  

[getExemptionList]
SELECT objid AS classid, exemptdesc AS classname, 0 AS special, exemptcode AS classcode  
FROM exemptiontype ORDER BY orderno  

[getBarangayList]
SELECT objid AS barangayid, lguname AS barangay FROM lgu WHERE lgutype = 'BARANGAY' ORDER BY lguname 

[getBrgyCount]
SELECT COUNT(*) AS brgycount FROM lgu WHERE lgutype = 'BARANGAY' 

[getCollectorList]
SELECT objid AS collectorid, name AS collectorname, jobtitle AS collectortitle  from etracsuser WHERE iscollector = 1 ORDER BY name 


[getRPTClearancePaymentInfo]
SELECT 
	rct.serialno as orno, 
	rct.txndate as ordate, 
	CONCAT('Q', MIN(pd.qtr), '-Q', MAX(pd.qtr)) AS period, 
	SUM( basic ) AS basic, 
	SUM( basicdisc ) AS basicdisc, 
	SUM( basicint ) AS basicint, 
	SUM( basic + basicint - basicdisc ) AS basicnet,  
	SUM( sef ) AS sef, 
	SUM( sefdisc ) AS sefdisc, 
	SUM( sefint ) AS sefint, 
	SUM(sef + sefint - sefdisc) AS sefnet  
FROM receiptlist rct  
	INNER JOIN rptpaymentdetail pd ON rct.objid = pd.receiptid  
WHERE pd.year = $P{year}  
  AND pd.rptledgerid = $P{ledgerid}   
  AND rct.voided = 0   
GROUP BY rct.objid  
ORDER BY serialno 




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
	IFNULL((SELECT SUM( basic ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid AND revtype IN ('current','advance') ), 0.0) AS currentyear, 
	IFNULL((SELECT SUM( basic ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid AND revtype IN ('previous','prior') ), 0.0) AS previousyear, 
	IFNULL((SELECT SUM( basicdisc ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid ), 0.0) AS discount, 
	IFNULL((SELECT SUM( basicint ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid AND revtype IN ('current','advance') ), 0.0) AS penaltycurrent, 
	IFNULL((SELECT SUM( basicint ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid AND revtype IN ('previous','prior') ), 0.0) AS penaltyprevious 
FROM liquidationlist lq 
	INNER JOIN remittancelist rem ON lq.objid = rem.liquidationid  
	INNER JOIN receiptlist r ON rem.objid = r.remittanceid  
	INNER JOIN rptpayment rp ON rp.receiptid = r.objid  
	INNER JOIN rptledger rl ON rp.rptledgerid = rl.objid  
WHERE lq.txntimestamp LIKE $P{txntimestamp} 
  AND r.doctype = 'RPT'  
  AND r.voided = 0  
  AND r.collectorid LIKE $P{collectorid} 
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
	IFNULL((SELECT SUM( sef ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid AND revtype IN ('current','advance') ),0.0) AS currentyear, 
	IFNULL((SELECT SUM( sef ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid AND revtype IN ('previous', 'prior') ),0.0) AS previousyear, 
	IFNULL((SELECT SUM( sefdisc ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid ),0.0) AS discount, 
	IFNULL((SELECT SUM( sefint ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid AND revtype IN ('current','advance') ),0.0) AS penaltycurrent, 
	IFNULL((SELECT SUM( sefint ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid AND revtype IN ('previous','prior' ) ),0.0) AS penaltyprevious 
FROM liquidationlist lq 
	INNER JOIN remittancelist rem ON lq.objid = rem.liquidationid  
	INNER JOIN receiptlist r ON rem.objid = r.remittanceid  
	INNER JOIN rptpayment rp ON rp.receiptid = r.objid  
	INNER JOIN rptledger rl ON rp.rptledgerid = rl.objid  
WHERE lq.txntimestamp LIKE $P{txntimestamp}  
  AND r.doctype = 'RPT'  
  AND r.voided = 0  
  AND r.collectorid LIKE $P{collectorid} 
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
	rp.basic AS currentyear, 
	rp.basicprev + rp.basicprior AS previousyear, 
	rp.basicdisc AS discount, 
	rp.basicint AS penaltycurrent, 
	rp.basicprevint + rp.basicpriorint AS penaltyprevious 
FROM liquidationlist lq
	INNER JOIN remittancelist rem ON lq.objid = rem.liquidationid 
	INNER JOIN receiptlist r ON rem.objid = r.remittanceid 
	INNER JOIN rptpaymentmanual rp ON rp.receiptid = r.objid 
WHERE lq.txntimestamp LIKE $P{txntimestamp}  
  AND r.doctype = 'RPT' 
  AND r.voided = 0 
  AND r.collectorid LIKE $P{collectorid}



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
	rp.sef AS currentyear, 
	rp.sefprev + rp.sefprior AS previousyear, 
	rp.sefdisc AS discount, 
	rp.sefint AS penaltycurrent, 
	rp.sefprevint + rp.sefpriorint AS penaltyprevious 
FROM liquidationlist lq
	INNER JOIN remittancelist rem ON lq.objid = rem.liquidationid 
	INNER JOIN receiptlist r ON rem.objid = r.remittanceid 
	INNER JOIN rptpaymentmanual rp ON rp.receiptid = r.objid 
WHERE lq.txntimestamp LIKE $P{txntimestamp}  
  AND r.doctype = 'RPT' 
  AND r.voided = 0 
  AND r.collectorid LIKE $P{collectorid}

  
[getBasicSummaryByMonth]
SELECT 
	rl.barangay, 
	SUM( CASE WHEN rpd.revtype IN ('current', 'advance' ) THEN rpd.basic - rpd.basicdisc + rpd.basicint ELSE 0 END ) AS basiccurrent, 
	SUM( CASE WHEN rpd.revtype IN ('previous', 'prior' ) THEN rpd.basic + rpd.basicint ELSE 0 END ) AS basicprevious, 
	SUM( rpd.basic - rpd.basicdisc + rpd.basicint ) AS basictotal ,
	0.0 AS basiccurrentshare, 
	0.0 AS basicpreviousshare, 
	0.0 AS totalshare 
FROM liquidationlist l  
	INNER JOIN remittance rem ON l.objid = rem.liquidationid  
	INNER JOIN receiptlist r ON rem.objid = r.remittanceid  
	INNER JOIN rptpayment rp ON r.objid = rp.receiptid 
	INNER JOIN rptpaymentdetail rpd ON r.objid = rpd.receiptid  AND rp.rptledgerid = rpd.rptledgerid 
	INNER JOIN rptledger rl ON rp.rptledgerid = rl.objid  
WHERE l.iyear = $P{iyear} 
  AND l.imonth = $P{imonth} 
  AND r.voided = 0  
GROUP BY rl.barangay 
ORDER BY rl.barangay  

[getManualBasicSummaryByMonth]
SELECT 
	rp.barangay, 
	SUM(rp.basic + rp.basicint - rp.basicdisc) AS basiccurrent, 
	SUM(rp.basicprev + rp.basicprevint + rp.basicprior + rp.basicpriorint) AS basicprevious, 
	SUM(rp.basic + rp.basicint - rp.basicdisc + rp.basicprev + rp.basicprevint + rp.basicprior + rp.basicpriorint) AS basictotal, 
	0.0 AS basiccurrentshare,  
	0.0 AS basicpreviousshare,  
	0.0 AS totalshare  
FROM liquidationlist l   
	INNER JOIN remittance rem ON l.objid = rem.liquidationid   
	INNER JOIN receiptlist r ON rem.objid = r.remittanceid   
	INNER JOIN rptpaymentmanual rp ON r.objid = rp.receiptid   
WHERE l.iyear = $P{iyear}  
  AND l.imonth = $P{imonth}  
  AND r.voided = 0  
GROUP BY rp.barangay  
ORDER BY rp.barangay   




[getOnlineRPTC]
SELECT  
	rl.classcode,
	SUM( CASE WHEN rd.revtype IN ('current', 'advance') THEN rd.basic ELSE 0.0 END) AS  basiccurrent,
	SUM(rd.basicdisc) AS basicdisc,
	SUM( CASE WHEN rd.revtype IN ('previous', 'prior') THEN rd.basic ELSE 0.0 END) AS  basicprev,
	SUM( CASE WHEN rd.revtype IN ('current', 'advance') THEN rd.basicint ELSE 0.0 END) AS  basiccurrentint,
	SUM( CASE WHEN rd.revtype IN ('previous', 'prior') THEN rd.basicint ELSE 0.0 END) AS  basicprevint,
	SUM( rd.basic + rd.basicint) AS basicgross,
	SUM( rd.basic + rd.basicint - rd.basicdisc ) AS basicnet,

	SUM( CASE WHEN rd.revtype IN ('current', 'advance') THEN rd.sef ELSE 0.0 END) AS  sefcurrent,
	SUM(rd.sefdisc) AS sefdisc,
	SUM( CASE WHEN rd.revtype IN ('previous', 'prior') THEN rd.sef ELSE 0.0 END) AS  sefprev,
	SUM( CASE WHEN rd.revtype IN ('current', 'advance') THEN rd.sefint ELSE 0.0 END) AS  sefcurrentint,
	SUM( CASE WHEN rd.revtype IN ('previous', 'prior') THEN rd.sefint ELSE 0.0 END) AS  sefprevint,
	SUM( rd.sef + rd.sefint) AS sefgross,
	SUM( rd.sef + rd.sefint - rd.sefdisc ) AS sefnet,
	
	SUM( rd.basic + rd.basicint + rd.sef + rd.sefint) AS grandtotal,
	SUM( rd.basic + rd.basicint - rd.basicdisc + rd.sef + rd.sefint - rd.sefdisc) AS netgrandtotal 	
FROM liquidationlist lq  
	INNER JOIN remittancelist rem ON lq.objid = rem.liquidationid  
	INNER JOIN receiptlist r ON rem.objid = r.remittanceid  
	INNER JOIN rptpaymentdetail rd ON rd.receiptid = r.objid  
	INNER JOIN rptledger rl ON rd.rptledgerid = rl.objid  
WHERE lq.txntimestamp LIKE $P{txntimestamp} 
  AND r.doctype = 'RPT'  
  AND r.voided = 0  
GROUP BY rl.classcode  


[getManualRPTC]
SELECT 
	pc.propertycode AS classcode, 
	SUM(rp.basic) AS basiccurrent, 
	SUM(rp.basicdisc) AS basicdisc, 
	SUM(rp.basicprev + rp.basicprior) AS basicprev, 
	SUM(rp.basicint) AS basiccurrentint, 
	SUM(rp.basicprevint + rp.basicpriorint) AS basicprevint,
	SUM(rp.basic + rp.basicprev + rp.basicprior + rp.basicint + rp.basicprevint + rp.basicpriorint) AS basicgross,
	SUM(rp.basic + rp.basicprev + rp.basicprior + rp.basicint + rp.basicprevint + rp.basicpriorint - rp.basicdisc) AS basicnet,

	SUM(rp.sef) AS sefcurrent, 
	SUM(rp.sefdisc) AS sefdisc, 
	SUM(rp.sefprev + rp.sefprior) AS sefprev, 
	SUM(rp.sefint) AS sefcurrentint,  
	SUM(rp.sefprevint + rp.sefpriorint) AS sefprevint, 
	SUM(rp.sef + rp.sefprev + rp.sefprior + rp.sefint + rp.sefprevint + rp.sefpriorint) AS sefgross, 
	SUM(rp.sef + rp.sefprev + rp.sefprior + rp.sefint + rp.sefprevint + rp.sefpriorint - rp.sefdisc) AS sefnet ,
	
	SUM(rp.basic + rp.basicprev + rp.basicprior + rp.basicint + rp.basicprevint + rp.basicpriorint +
	    rp.sef + rp.sefprev + rp.sefprior + rp.sefint + rp.sefprevint + rp.sefpriorint ) AS grandtotal,
		
	SUM(rp.basic + rp.basicprev + rp.basicprior + rp.basicint + rp.basicprevint + rp.basicpriorint - rp.basicdisc +  
		rp.sef + rp.sefprev + rp.sefprior + rp.sefint + rp.sefprevint + rp.sefpriorint - rp.sefdisc ) AS netgrandtotal  
	
FROM liquidationlist lq 
	INNER JOIN remittancelist rem ON lq.objid = rem.liquidationid 
	INNER JOIN receiptlist r ON rem.objid = r.remittanceid 
	INNER JOIN rptpaymentmanual rp ON rp.receiptid = r.objid 
	LEFT JOIN propertyclassification pc ON rp.classcode = pc.propertycode   
WHERE lq.txntimestamp LIKE $P{txntimestamp} 
  AND r.doctype = 'RPT' 
  AND r.voided = 0 
GROUP BY pc.propertycode    