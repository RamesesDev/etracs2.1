[getList]
SELECT * FROM rptcompromise_list WHERE ${whereclause} 

[getLookupList]
SELECT c.* , rl.tdno, rl.cadastrallotno 
FROM rptcompromise_list c 
	INNER JOIN rptledger rl ON c.ledgerid = rl.objid 
WHERE ${whereclause} 

[getRPTCompromiseById]
SELECT * 
FROM rptcompromise_list 
WHERE objid = $P{objid} 

[getRPTCompromiseItems]
SELECT 
	f.* , 
	f.basic + f.basicint + f.sef + f.sefint as total 
FROM rptcompromise_item f
WHERE f.rptcompromiseid  = $P{rptcompromiseid}
ORDER BY f.iyear, f.iqtr 

[getRPTCompromiseInstallments]
SELECT * 
FROM rptcompromise_installment  
WHERE rptcompromiseid = $P{rptcompromiseid} 
ORDER BY installmentno

[getUnpaidInstallments]
SELECT * 
FROM rptcompromise_installment  
WHERE rptcompromiseid = $P{rptcompromiseid} 
  AND fullypaid = 0
ORDER BY installmentno


[getRPTCompromiseCredits]
SELECT 
	cl.installmentno,
	cr.ordate,
	cr.orno,
	cr.amount,
	cr.collectorname,
	CASE WHEN rl.paidby IS NULL THEN cr.paidby ELSE rl.paidby END as paidby 
FROM rptcompromise_credit cr	
	INNER JOIN rptcompromise_installment cl ON cr.installmentid = cl.objid 
	LEFT JOIN receiptlist rl ON cr.receiptid = rl.objid 
WHERE cr.rptcompromiseid = $P{rptcompromiseid}	 
ORDER BY cl.installmentno 	

[getActiveCompromiseByLedgerId]
SELECT * 
FROM rptcompromise_list 
WHERE ledgerid = $P{ledgerid} 
  AND docstate NOT IN ('CLOSED')

  
[setLedgerUnderCompromised]
UPDATE rptledger SET 
	undercompromised = 1 
WHERE objid = $P{objid} 

[resetLedgerUnderCompromised]
UPDATE rptledger SET 
	undercompromised = 0 
WHERE objid = $P{objid} 

[updateLastYearQtrPaid]
UPDATE rptledger SET	
	lastyearpaid = $P{lastyearpaid},
	lastqtrpaid = $P{lastqtrpaid} 
WHERE objid = $P{objid}	


	
[deleteItems]	
DELETE FROM rptcompromise_item 
WHERE rptcompromiseid = $P{rptcompromiseid} 

[deleteInstallments]	
DELETE FROM rptcompromise_installment
WHERE rptcompromiseid = $P{rptcompromiseid} 

[getBasicSefPreviousAccounts]
SELECT objid, systype
FROM incomeaccount 
WHERE systype IN ('RPT_BASICPREV','RPT_BASICPREVINT','RPT_SEFPREV','RPT_SEFPREVINT') 
  AND accttitle like '%PREVIOUS%' 
  
[getOpenInstallments]
SELECT  * 
FROM rptcompromise_installment 
WHERE rptcompromiseid = $P{rptcompromiseid} 
  AND (fullypaid = 0 or amount - amtpaid > 0 )
ORDER BY installmentno 

[updateInstallmentPayment]
UPDATE rptcompromise_installment SET 
	fullypaid = CASE WHEN amount = amtpaid + $P{amtpaid} THEN 1 ELSE 0 END ,
	amtpaid = amtpaid + $P{amtpaid}
WHERE objid = $P{objid}	 

[updateCapturedInstallmentPayment]
UPDATE rptcompromise_installment SET 
	fullypaid = 1,
	amtpaid = amount 
WHERE objid = $P{objid}	 
	
	
[getFaasInfo]	
SELECT tdno, fullpin, cadastrallotno, barangay, totalmv, totalav 
FROM faaslist 
WHERE objid = $P{objid}
  

[getOpenLedgerById]
SELECT 
	objid, taxpayerid, fullpin AS pin, tdno , rputype, assessedvalue, 
    barangay, classcode, txntype, cadastrallotno, taxpayername, 
	CASE WHEN lastqtrpaid = 4 AND partialbasic = 0.0 THEN lastyearpaid +1 ELSE lastyearpaid END AS fromyear, 
	CASE WHEN lastqtrpaid = 4 THEN 1 ELSE lastqtrpaid + 1 END AS fromqtr, 
    lastyearpaid, lastqtrpaid, 
	0 AS toyear, 0 AS toqtr, partialbasic, partialbasicint, partialsef,  partialsefint, 
    0.0 AS basic, 0.0 AS basicint, 0.0 AS basicdisc, 
    0.0 AS sef, 0.0 AS sefint, 0.0 AS sefdisc, administratorname, administratoraddress 
FROM rptledger 
WHERE objid = $P{objid} AND docstate = 'APPROVED'


 
[getCredits]
SELECT *
FROM rptcompromise_credit 
WHERE receiptid = $P{receiptid} 

	
	