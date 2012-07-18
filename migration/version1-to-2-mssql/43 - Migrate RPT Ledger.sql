-- MIGRATE RPT LEDGERS 

alter table bayombong_etracs..rptledger alter column taxpayername varchar(800);
alter table bayombong_etracs..rptledger alter column administratorname varchar(255);

INSERT INTO bayombong_etracs..rptledger
(
	objid, 
	schemaname, 
	schemaversion, 
	docstate, 
	fullpin, 
	claimno, 
	faasid, 
	rputype, 
	classid, 
	classcode , 
	actualuseid, 
	actualusecode, 
	tdno,
	prevtdno, 
	cadastrallotno, 
	blockno, 
	barangay, 
	txntype, 
	taxable, 
	assessedvalue, 
	taxpayerid, 
	taxpayerno, 
	taxpayername, 
	taxpayeraddress, 
	administratorid, 
	administratorno, 
	administratorname, 
	administratoraddress, 
	lastyearpaid, 
	lastqtrpaid, 
	partialbasic, 
	partialsef, 
	firstqtrpaidontime, 
	partialbasicint, 
	partialsefint
)
SELECT
	rl.objid, 
	'rptledger' AS schemaname, 
	'1.0' AS schemaversion, 
	rl.state AS docstate, 
	case when r.suffix = 0 
		then rp.pin 
		else (rp.pin + '-' + cast(r.suffix as varchar(255)))
	end as fullpin, 
	rp.claimno as claimno, 
	td.objid as faasid, 
	lower(r.type ) as  rputype, 
	r.classificationId as  classid, 
	r.classCode as classcode , 
	r.classificationId as  actualuseid, 
	r.classCode as  actualusecode, 
	td.tdno,
	td.previousTdNo as  prevtdno, 
	isnull(rp.cadastralLotNo,'-') as  cadastrallotno, 
	rp.blockNo as  blockno, 
	rp.location as  barangay, 
	td.txnType as  txntype, 
	r.taxable as  taxable, 
	r.totalAV as  assessedvalue, 
	td.taxpayerId as taxpayerid, 
	p.taxpayerno as  taxpayerno, 
	td.taxpayerName as taxpayername, 
	td.taxpayerAddress as taxpayeraddress, 
	td.administratorId as administratorid, 
	null as  administratorno, 
	td.administratorName as administratorname, 
	td.administratorAddress as  administratoraddress, 
	rl.lastYearPaid as lastyearpaid, 
	rl.lastQtrPaid as lastqtrpaid, 
	0 as partialbasic, 
	0 as partialsef, 
	0 as firstqtrpaidontime, 
	0 as partialbasicint, 
	0 as partialsefint
FROM etracs_bayombong..RPTLedger rl
	INNER JOIN etracs_bayombong..TaxDeclaration td ON rl.tdid = td.objid 
	INNER JOIN etracs_bayombong..RPU r ON td.rpuid = r.objid 
	INNER JOIN etracs_bayombong..RealProperty rp ON r.realpropertyid= rp.objid
	INNER JOIN etracs_bayombong..payer p on td.taxpayerId = p.objid;



-- MIGRATE RPT LEDGER ITEMS 
INSERT INTO bayombong_etracs..rptledgeritem
(
	objid, 
	schemaname, 
	schemaversion, 
	docstate, 
	parentid, 
	faasid, 
	tdno, 
	txntype, 
	classid, 
	classcode, 
	actualuseid, 
	actualusecode, 
	taxable, 
	backtax, 
	fromyear, 
	toyear,
	assessedvalue, 
	systemcreated 	
)
SELECT
	rli.objid, 
	'rptledger:rptledgeritem' as schemaname, 
	'1.0' as schemaversion, 
	rli.state as  docstate, 
	rl.objid as  parentid, 
	td.objid as  faasid, 
	rli.tdno as tdno, 
	td.txntype as txntype, 
	r.classificationId as classid, 
	r.classCode as  classcode, 
	r.classificationId as actualuseid, 
	r.classCode as actualusecode, 
	case when r.taxable is null then 1 else r.taxable end as  taxable, 
	0 as backtax, 
	rli.fromYear as  fromyear, 
	rli.toYear as  toyear,
	rli.assessedValue as  assessedvalue, 
	rli.systemCreated as  systemcreated 
FROM etracs_bayombong..RPTLedger rl
	INNER JOIN etracs_bayombong..RPTLedgerItem rli ON rl.objid = rli.parentid 
	LEFT JOIN etracs_bayombong..TaxDeclaration td ON rli.tdno  = td.tdno 
	LEFT JOIN etracs_bayombong..RPU r ON td.rpuid = r.objid;



