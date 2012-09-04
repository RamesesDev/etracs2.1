[getList]
SELECT 
	objid, docstate, tdno, fullpin, barangay, prevtdno, 
	taxpayerid, taxpayername, taxpayeraddress, rputype, cadastrallotno, 
	lastyearpaid, lastqtrpaid, assessedvalue , classcode, undercompromised, faasid 
FROM rptledger  
WHERE docstate LIKE $P{docstate} 

[getListByTdno]
SELECT 
	objid, docstate, tdno, fullpin, barangay,  prevtdno, 
	taxpayerid, taxpayername, taxpayeraddress, rputype, cadastrallotno, 
	lastyearpaid, lastqtrpaid, assessedvalue  , classcode , undercompromised , faasid 
FROM rptledger 
WHERE docstate LIKE $P{docstate} AND tdno LIKE $P{tdno} 

[getListByPin]
SELECT 
	objid, docstate, tdno, fullpin, barangay,  prevtdno, 
	taxpayerid, taxpayername, taxpayeraddress, rputype, cadastrallotno, 
	lastyearpaid, lastqtrpaid , assessedvalue , classcode , undercompromised , faasid 
FROM rptledger 
WHERE docstate LIKE $P{docstate} AND fullpin LIKE $P{fullpin} 

[getListByTaxpayer]
SELECT 
	objid, docstate, tdno, fullpin, barangay,  prevtdno, 
	taxpayerid, taxpayername, taxpayeraddress, rputype, cadastrallotno, 
	lastyearpaid, lastqtrpaid , assessedvalue , classcode , undercompromised , faasid 
FROM rptledger 
WHERE docstate LIKE $P{docstate} AND taxpayername LIKE  $P{taxpayername} 


[getListByCadastral]
SELECT 
	objid, docstate, tdno, fullpin, barangay,  prevtdno, 
	taxpayerid, taxpayername, taxpayeraddress, rputype, cadastrallotno, 
	lastyearpaid, lastqtrpaid , assessedvalue , classcode , undercompromised , faasid 
FROM rptledger 
WHERE docstate LIKE $P{docstate} AND cadastrallotno = $P{cadastrallotno} 

[getListByBlock]
SELECT 
	objid, docstate, tdno, fullpin, barangay,  prevtdno, 
	taxpayerid, taxpayername, taxpayeraddress, rputype, cadastrallotno, 
	lastyearpaid, lastqtrpaid , assessedvalue , classcode , undercompromised , faasid 
FROM rptledger 
WHERE docstate LIKE $P{docstate} AND blockno = $P{blockno} 

[getBarangay]
SELECT 
	objid, docstate, tdno, fullpin, barangay,  prevtdno, 
	taxpayerid, taxpayername, taxpayeraddress, rputype, cadastrallotno, 
	lastyearpaid, lastqtrpaid , assessedvalue , classcode 
FROM rptledger 
WHERE docstate LIKE $P{docstate} AND barangay LIKE $P{barangay} 



[getLatestItem]
SELECT * FROM rptledgeritem WHERE toyear = 0 AND parentid = $P{parentid} 

[getLedgerItemList]
SELECT * FROM rptledgeritem WHERE parentid = $P{parentid} ORDER BY fromyear DESC 

[getSmallestFromYear]
SELECT MIN(fromyear) AS minfromyear FROM rptledgeritem WHERE parentid = $P{parentid} AND docstate = 'APPROVED' 


[getPayments]
SELECT 
	rp.*,  
	basic + basicint - basicdisc AS basicnet,   
	sef + sefint - sefdisc AS sefnet,  
	basic + basicint - basicdisc + sef + sefint - sefdisc AS total ,
	r.paidby, r.paidbyaddress 
FROM rptpayment rp  
	LEFT JOIN receiptlist r ON rp.receiptid = r.objid 
WHERE rp.rptledgerid = $P{ledgerid} 
ORDER BY rp.fromYear DESC, rp.fromqtr DESC   


[getPaymentsWithLguInfo]
SELECT
	rp.objid, rp.mode, rp.receiptno, rp.receiptdate, rp.collectorname, rp.period, rp.collectingagency, 
	rp.basic, rp.basicdisc, rp.basicint, rp.sef, rp.sefdisc, rp.sefint, 
	rp.basic + rp.basicint - rp.basicdisc AS basicnet,    
	rp.sef + rp.sefint - rp.sefdisc AS sefnet,  
	rp.basic + rp.basicint - rp.basicdisc + rp.sef + rp.sefint - rp.sefdisc AS total,
	r.paidby, r.paidbyaddress 
FROM rptpayment rp 
	LEFT JOIN receiptlist r ON rp.receiptid = r.objid 
WHERE rp.rptledgerid = $P{ledgerid}  
ORDER BY rp.fromYear DESC, rp.fromqtr DESC       


[updateFaasLedgerId]
UPDATE faas SET ledgerid = $P{ledgerid} WHERE objid = $P{objid}

[updateFaasListLedgerId]
UPDATE faaslist SET ledgerid = $P{ledgerid} WHERE objid = $P{objid}


[updateLastYearQtrPaid]
UPDATE rptledger SET lastyearpaid = $P{lastyearpaid}, lastqtrpaid = $P{lastqtrpaid} WHERE objid = $P{objid} 


#------------------------------------
# PROVINCE LEDGER SUPPORT
#------------------------------------
[deleteProvinceRPTLedger]
DELETE FROM rptledger WHERE faasid = $P{faasid} 

[deleteProvinceRPTLedgerItem]
DELETE FROM rptledgeritem WHERE faasid = $P{faasid} 

[updateFAASLedgerReference]
UPDATE faas SET ledgerid = $P{ledgerid} WHERE objid = $P{objid} 

[updateFAASListLedgerReference]
UPDATE faaslist SET ledgerid = $P{ledgerid} WHERE objid = $P{objid} 
