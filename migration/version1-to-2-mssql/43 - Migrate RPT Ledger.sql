-- MIGRATE RPT LEDGERS 
-- delete from bayombong_etracs..rptledger where objid  not (select objid from etracs_bayombong..RPTLedger);

alter table bayombong_etracs..rptledger alter column taxpayername varchar(800);
alter table bayombong_etracs..rptledger alter column administratorname varchar(255);

-- INSERT RPTLEDGERS WITHOUT DUPLICATE FULLPIN AND CLAIMNO --
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
select * from (
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
		INNER JOIN etracs_bayombong..payer p on td.taxpayerId = p.objid
) t 
where fullpin not in (
	select fullpin from (
		SELECT
			case when r.suffix = 0 
				then rp.pin 
				else (rp.pin + '-' + cast(r.suffix as varchar(255)))
			end as fullpin,
			rp.claimno as claimno
		FROM etracs_bayombong..RPTLedger rl
			INNER JOIN etracs_bayombong..TaxDeclaration td ON rl.tdid = td.objid 
			INNER JOIN etracs_bayombong..RPU r ON td.rpuid = r.objid 
			INNER JOIN etracs_bayombong..RealProperty rp ON r.realpropertyid= rp.objid
			INNER JOIN etracs_bayombong..payer p on td.taxpayerId = p.objid
	) t
	group by fullpin, claimno
	having count(fullpin) > 1
);


-- INSERT THE FIRST ITEM IN THE RPTLEDGERS WITH DUPLICATE FULLPIN AND CLAIMNO --
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
select * from (
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
		INNER JOIN etracs_bayombong..payer p on td.taxpayerId = p.objid
) t 
where objid in (
	select MIN(objid) from (
		SELECT
			rl.objid,
			case when r.suffix = 0 
				then rp.pin 
				else (rp.pin + '-' + cast(r.suffix as varchar(255)))
			end as fullpin,
			rp.claimno as claimno
		FROM etracs_bayombong..RPTLedger rl
			INNER JOIN etracs_bayombong..TaxDeclaration td ON rl.tdid = td.objid 
			INNER JOIN etracs_bayombong..RPU r ON td.rpuid = r.objid 
			INNER JOIN etracs_bayombong..RealProperty rp ON r.realpropertyid= rp.objid
			INNER JOIN etracs_bayombong..payer p on td.taxpayerId = p.objid
	) t
	group by fullpin, claimno
	having count(fullpin) > 1
);



-- INSERT THE LAST ITEM IN THE RPTLEDGERS WITH THREE DUPLICATE FULLPIN AND CLAIMNO
-- AND PUT A DOT (.) ON THE LAST PART OF THE FULLPIN
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
select * from (
	SELECT
		rl.objid, 
		'rptledger' AS schemaname, 
		'1.0' AS schemaversion, 
		rl.state AS docstate,
		( 
			case when r.suffix = 0 
				then rp.pin 
				else (rp.pin + '-' + cast(r.suffix as varchar(255)))
			end 
			+ '.'
		) as fullpin, 
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
		INNER JOIN etracs_bayombong..payer p on td.taxpayerId = p.objid
) t 
where objid in (
	select MAX(objid) from (
		SELECT
			rl.objid,
			case when r.suffix = 0 
				then rp.pin 
				else (rp.pin + '-' + cast(r.suffix as varchar(255)))
			end as fullpin,
			rp.claimno as claimno
		FROM etracs_bayombong..RPTLedger rl
			INNER JOIN etracs_bayombong..TaxDeclaration td ON rl.tdid = td.objid 
			INNER JOIN etracs_bayombong..RPU r ON td.rpuid = r.objid 
			INNER JOIN etracs_bayombong..RealProperty rp ON r.realpropertyid= rp.objid
			INNER JOIN etracs_bayombong..payer p on td.taxpayerId = p.objid
	) t
	group by fullpin, claimno
	having count(fullpin) = 3
);




-- LASTLY, INSERT THE RPTLEDGERS WITH DUPLICATE FULLPIN AND CLAIMNO WHICH ARE NOT YET
-- INSERTED TO THE ETRACS2 DB AND ADD TWO DOTS (..) ON THE LAST PART OF THE FULLPIN
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
select * from (
	SELECT
		rl.objid, 
		'rptledger' AS schemaname, 
		'1.0' AS schemaversion, 
		rl.state AS docstate,
		( 
			case when r.suffix = 0 
				then rp.pin 
				else (rp.pin + '-' + cast(r.suffix as varchar(255)))
			end 
			+ '..'
		) as fullpin, 
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
		INNER JOIN etracs_bayombong..payer p on td.taxpayerId = p.objid
) t 
where objid not in (
	select objid 
	from bayombong_etracs..rptledger
);



-- MIGRATE RPT LEDGER ITEMS 
-- delete from bayombong_etracs..rptledgeritem where parentid not in (select objid from bayombong_etracs..rptledger)

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
	convert(varchar(25),rli.state) as  docstate, 
	rl.objid as  parentid, 
	td.objid as  faasid, 
	convert(varchar(30), rli.tdno) as tdno, 
	isnull(td.txntype, '') as txntype, 
	isnull(r.classificationId, '') as classid, 
	isnull(r.classCode, '') as  classcode, 
	isnull(r.classificationId, '') as actualuseid, 
	isnull(r.classCode, '') as actualusecode, 
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



