[getList]
SELECT * FROM rptcompromise_list ${where} 

[getLookupList]
SELECT c.* , rl.tdno, rl.cadastrallotno 
FROM rptcompromise_list c 
	INNER JOIN rptledger rl ON c.ledgerid = rl.objid 
${where} 

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

[getRPTCompromiseInstallments]
SELECT * 
FROM rptcompromise_installment  
WHERE rptcompromiseid = $P{rptcompromiseid} 
ORDER BY installmentno

[getRPTCompromiseCredits]
SELECT * 
FROM rptcompromise_credit  
WHERE rptcompromiseid = $P{rptcompromiseid}

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