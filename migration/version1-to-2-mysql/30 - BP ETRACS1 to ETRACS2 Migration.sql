/**********************************************************************
*
* DATABASE NAMES TO BE REPLACED: 
*	lguname_etracs, lguname_system, etracs_lguname
*
***********************************************************************/


set foreign_key_checks=0;



/* *********************************************************************
*
* LOB CLASSIFICATION
*
**********************************************************************/

insert into lguname_etracs.lobclassification 
	(objid, schemaname, schemaversion, name, remarks)
select
	c.objid, 
	'lobclassification' as schemaname, 
	'1.0' as schemaversion, 
	c.name, 
	null as remarks
from etracs_lguname.lobclassification c
where parentid = 'c' ;



/* *********************************************************************
*
* LOB 
*
**********************************************************************/
insert into lguname_etracs.lob 
	(objid, schemaname, schemaversion, docstate, name, classificationid, 
	classification, 
	attributes
	)
select
	l.objid, 
	'lob' as schemaname, 
	'1.0' as schemaversion, 
	'APPROVED' as docstate, 
	l.name as name, 
	c.objid as classificationid, 
	c.name as classification, 
	'[]' as attributes
from etracs_lguname.lob l
	left join etracs_lguname.lobclassification c on l.classificationid = c.objid
where c.parentid = 'c';


insert into lguname_etracs.lob 
	(objid, schemaname, schemaversion, docstate, name, classificationid, 
	classification, 
	attributes
	)
select
	l.objid, 
	'lob' as schemaname, 
	'1.0' as schemaversion, 
	'APPROVED' as docstate, 
	l.name as name, 
	c.objid as classificationid, 
	c.name as classification, 
	'[]' as attributes
from etracs_lguname.lob l, 
	lguname_etracs.lobclassification c 
where c.name = 'RETAILERS'
  and l.name like '%RETAILER%'
  and not exists(select * from lguname_etracs.lob where objid = l.objid );


insert into lguname_etracs.lob 
	(objid, schemaname, schemaversion, docstate, name, classificationid, 
	classification, 
	attributes
	)
select
	l.objid, 
	'lob' as schemaname, 
	'1.0' as schemaversion, 
	'APPROVED' as docstate, 
	l.name as name, 
	p.objid as classificationid, 
	p.name as classification, 
	'[]' as attributes
from etracs_lguname.lob l
	inner join etracs_lguname.lobclassification c on l.classificationid = c.objid
	inner join etracs_lguname.lobclassification p on c.parentid = p.objid 
where 
not exists(select * from lguname_etracs.lob where objid = l.objid );



insert into lguname_etracs.lobattribute 
	(objid, name, description)
values
	('ESSENTIAL', 'ESSENTIAL', 'ESSENTIAL PRODUCTS'),
	('HAS_WM', 'HAS WEIGHTS AND MEASURE', 'REQUIRES WEIGHTS AND MEASURE');




/* *********************************************************************
*
* VARIABLE 
*
**********************************************************************/
delete from lguname_etracs.variable ;

insert into lguname_etracs.variable 
	(objid, schemaname, schemaversion, name, datatype, caption, 
	description, 
	arrayvalues
	)
select
	v.objid, 
	'variable' as schemaname, 
	'1.0' as schemaversion, 
	v.name,
	lower(v.datatype) as datatype , 
	v.caption, 
	v.description, 
	concat('["',case when v.arrayvalue is null then null else replace(v.arrayvalue,',', '","') end , '"]') as arrayvalues
from etracs_lguname.abstractvariable v;


delete from lguname_etracs.variable where objid in ('GROSS_ESSENTIAL','GROSS_NON_ESSENTIAL');




/* *********************************************************************
*
* RULEGROUP 
*
********************************************************************* */

delete from lguname_system.rulegroup where ruleset = 'bpassessment';

insert into lguname_system.rulegroup ( objid, name, sortorder, ruleset )
values
	('APPINFO', 'APPLICATION INFO', 1, 'bpassessment' ),
	('BT', 'BUSINESS TAX', 2, 'bpassessment' ),
	('ABT', 'AFTER BUSINESS TAX', 3, 'bpassessment'),
	('RF', 'REGULATORY FEE', 4, 'bpassessment'),
	('ARF', 'AFTER REGULATORY FEE', 5, 'bpassessment'),
	('OC', 'OTHER CHARGE', 6, 'bpassessment'),
	('AOC', 'AFTER OTHER CHARGE', 7, 'bpassessment'),
	('SUM', 'SUMMARY', 8, 'bpassessment' );



/* *********************************************************************
*
* RULE 
*
********************************************************************* */

delete from lguname_system.rule where ruleset = 'bpassessment';

insert into lguname_system.rule 
	(objid, schemaname, schemaversion, docstate, rulename, 
	description, 
	packagename, 
	author, 
	salience, 
	agendagroupid, 
	agendagroup, 
	ruleset, 
	effectivefrom, 
	effectiveto, 
	ruletext, 
	conditions, 
	actions, 
	extended
	)
select
	r.objid, 
	'rule' as schemaname, 
	'1.0' as schemaversion, 
	'DRAFT' as docstate, 
	r.rulename, 
	r.description, 
	concat('bp.assessment.rules.', r.rulename) as packagename, 
	r.author, 
	r.salience, 
	rg.name as agendagroupid, 
	rg.ruletitle as agendagroup, 
	'bpassessment' as ruleset, 
	r.fromdate as effectivefrom, 
	r.todate as effectiveto, 
	null as ruletext, 
	'[]' as conditions, 
	'[]' as actions, 
	'[:]' as extended
from etracs_lguname.abstractrule r 
	inner join etracs_lguname.rulegroup rg on r.rulegroupid = rg.name ;


update lguname_etracs.variable set printtopermit = 0;



/*--------------------------------------------------------------------------
*
* BP Application 
*
*--------------------------------------------------------------------------*/
insert into lguname_etracs.bpapplication (
	objid, 
	schemaname, 
	schemaversion, 
	docstate, 
	businessid, 
	info, 
	txnmode, 
	txntype, 
	taxpayerid, 
	tradename, 
	businessaddress, 
	txndate, 
	txnno, 
	iyear, 
	parentid, 
	extended, 
	barcode, 
	lobs, 
	appinfos, 
	taxfees, 
	receivables, 
	credits
)
SELECT 	
	abp.objid, 
	'bpapplication:bpapplication' as schemaname, 
	'1.0' as schemaversion, 
	abp.state as docstate, 
	bp.businessid, 
	null as info, 
	abp.mode as txnmode, 
	bp.type as txntype, 
	abp.taxpayerid, 
	bp.tradename, 
	bp.address as businessaddress, 
	abp.dtapplied as txndate, 
	abp.appno as txnno, 
	abp.year as iyear, 
	bp.parentid, 
	'[:]' as extended, 
	'-' as barcode, 
	'[]' as lobs, 
	'[]' as appinfos, 
	'[]' as taxfees, 
	'[]' as receivables, 
	'[]' as credits
FROM etracs_lguname.abstractbpapplication abp
	inner join etracs_lguname.bpapplication bp on abp.objid = bp.objid ;


alter table lguname_etracs.bpapplicationlisting add column fullypaid int not null;

	
insert into lguname_etracs.bpapplicationlisting (
	objid, 
	txnno, 
	txntype, 
	txnmode, 
	barcode, 
	docstate, 
	taxpayerid, 
	taxpayername, 
	taxpayeraddress, 
	tradename, 
	businessaddress, 
	tin, 
	bin, 
	pin, 
	officetype, 
	organization, 
	ctcno, 
	ctcplaceissued, 
	ctcdateissued, 
	administratorname, 
	administratoraddress, 
	iyear, 
	businessid, 
	parentid, 
	barangayid, 
	barangayname, 
	txndate, 
	fullypaid
)
SELECT 	
	abp.objid, 
	abp.appno as txnno, 
	bp.type as txntype, 
	abp.mode as txnmode, 
	'-' as barcode, 
	abp.state as docstate, 
	abp.taxpayerid, 
	abp.taxpayername, 
	abp.taxpayeraddress, 
	bp.tradename, 
	bp.address as businessaddress, 
	abp.tin, 
	bp.bin, 
	bp.pin, 
	abp.officetype, 
	abp.organizationtype as organization, 
	abp.ctcno, 
	abp.ctcplaceissued, 
	abp.ctcdtissued as ctcdateissued, 
	abp.adminname as administratorname, 
	abp.adminaddress as administratoraddress, 
	abp.year as iyear, 
	bp.businessid, 
	bp.parentid, 
	bp.barangayid, 
	bp.barangayname, 
	abp.dtapplied as txndate, 
	case when amtdue = amtpaid then 1 else 0 end as fullypaid
FROM etracs_lguname.abstractbpapplication abp
	inner join etracs_lguname.bpapplication bp on abp.objid = bp.objid ;


insert into lguname_etracs.bpappinfolisting  (
	objid, 
	applicationid, 
	lobid, 
	lobname, 
	varid, 
	varname, 
	vartype, 
	value, 
	arrayvalues, 
	requiredbeforeprint
)
SELECT 	
	binfo.objid, 
	abp.objid as applicationid, 
	binfo.lobid, 
	l.name as lobname, 
	binfo.variableid as varid, 
	v.name as varname, 
	lower(v.datatype) as vartype, 
	case 
		when stringvalue is not null then stringvalue 
		when doublevalue is not null then doublevalue
		when integervalue is not null then integervalue 
	end as value, 
	'[]' as arrayvalues, 
	case when binfo.beforeprint = true then 1 else 0 end as  requiredbeforeprint
FROM etracs_lguname.abstractbpapplication abp
	inner join etracs_lguname.bpapplicationinfo binfo on abp.objid = binfo.parentid
	left join etracs_lguname.lob l on binfo.lobid = l.objid 
	left join etracs_lguname.abstractvariable v on binfo.variableid = v.objid ;



	
insert into lguname_etracs.bploblisting (
	objid, 
	applicationid, 
	lobid, 
	classificationid, 
	name, 
	iyear, 
	assessmenttype
)
SELECT	
	concat(abp.objid,'-', l.objid ) as objid, 
	abp.objid as applicationid, 
	l.objid as lobid, 
	l.classificationid, 
	l.name, 
	abp.year as iyear, 
	ba.type as assessmenttype
FROM etracs_lguname.abstractbpapplication abp
	inner join etracs_lguname.bpapplication ba on abp.objid = ba.objid 
	inner join etracs_lguname.bpapplication_lob bl on abp.objid = bl.bpapplication_objid
	inner join etracs_lguname.lob l on bl.lines_objid = l.objid ;


	
set @@group_concat_max_len=32768;

update lguname_etracs.bpapplication xba set
	xba.lobs = concat('[', (
		select 
			group_concat('[',
			'lobid:"', l.objid, '",', 
			'name:"', ifnull(l.name,''), '",', 
			'assessmenttype:"', ba.type, '",',
			'classificationid:"', ifnull(l.classificationid,''), '",', 
			'iyear:', xba.iyear, ']') 
		from etracs_lguname.bpapplication ba
		inner join etracs_lguname.bpapplication_lob bl on ba.objid = bl.bpapplication_objid
		inner join etracs_lguname.lob l on bl.lines_objid = l.objid 
		where bl.bpapplication_objid = xba.objid 
		group by bl.bpapplication_objid 
	), ']');


set @@group_concat_max_len=32768;

update lguname_etracs.bpapplication xba set
xba.appinfos = concat('[', (
	select 
		group_concat('[',
		'lobid:', case when l.objid is null then 'null' else concat('"', l.objid, '"') end , ',', 
		'required:', case when info.required = true then 'true' else 'false' end , ',', 
		'varid:"', info.variableid, '",',
		'varname:"', ifnull(v.name,''), '",', 
		'vartype:"', lower(ifnull(v.datatype,'')), '",', 
		'requiredbeforeprint:', case when info.beforeprint = true then 'true' else 'false' end, ',', 
		'lobname:"', ifnull(l.name,''), '",', 
		'objid:"', info.objid, '",', 
		'arrayvalues:', case when v.arrayvalue is null then '[]' else concat('["', replace(v.arrayvalue, ',', '","'),'"]')   end , ',', 
		'rulename:"', '-', '",', 
		'datatype:"', lower(v.datatype), '",', 
		'category:"', ifnull(l.name,''), '",', 
		'caption:"', ifnull(v.caption,''), '",', 
		'varcaption:"', ifnull(v.caption,''), '",', 
		'items:', case when v.arrayvalue is null then '[]' else concat('["', replace(v.arrayvalue, ',', '","'),'"]')   end , ',', 
		'value:', case when info.stringvalue is not null then concat('"', info.stringvalue, '"')
			       when info.doublevalue is not null then doublevalue
			       when info.integervalue is not null then integervalue 
			end, ']') 
	from etracs_lguname.bpapplicationinfo info 
	left join etracs_lguname.lob l on info.lobid = l.objid 
	inner join etracs_lguname.abstractvariable v on info.variableid = v.objid 
	where info.parentid = xba.objid 
	group by info.parentid
), ']');

set @@group_concat_max_len=32768;

update lguname_etracs.bpapplication xba set 
	xba.info = (select 
			concat('[',
			'taxpayername:"', aba.taxpayername , '",', 
			'taxpayeraddress:"', aba.taxpayeraddress, '",', 
			'taxpayerid:"', aba.taxpayerid, '",',
			'organization:"', aba.organizationtype, '",', 
			'officetype:"', aba.officetype, '",', 
			'tradename:"', ba.tradename, '",', 
			'businessaddress:"', ba.address, '",', 
			'ctcno:', case when aba.ctcno is null then 'null' else aba.ctcno end , ',', 
			'barangay:[barangayid:"', ba.barangayid, '",barangayname:"', ba.barangayname, '"],',
			'applicationsignatories:[],', 
			'assessmentsignatories:[],', 
			'requirements:[]', 
			']') 
		from etracs_lguname.abstractbpapplication aba
		inner join etracs_lguname.bpapplication ba on aba.objid = ba.objid 
		where aba.objid = xba.objid );


set @@group_concat_max_len=32768;

update lguname_etracs.bpapplication xba set
xba.taxfees = concat('[', (
	select 
	group_concat('[',
		'appid:"', aba.objid , '",', 
		'lobid:', case when btf.lobid is null then 'null' else concat('"',btf.lobid,'"') end, ',', 
		'lobname:', case when btf.lobname is null then 'null' else concat('"',btf.lobname,'"') end, ',',
		'acctid:"', btf.acctid , '",', 
		'accttitle:"', btf.accounttitle, '",', 
		'systype:"', btf.accttype , '",', 
		'rulename:"-",', 
		'assessedvalue:', btf.assessedvalue, ',', 
		'amountdue:', btf.amtdue, ',', 
		'amtdue:', btf.amtdue,']')
	from etracs_lguname.abstractbpapplication aba
	inner join etracs_lguname.bptaxfee btf on aba.objid = btf.parentid 
	where aba.objid = xba.objid 
	group by aba.objid 
), ']');

update lguname_etracs.bpapplication set taxfees = '[]' where taxfees is null;

set @@group_concat_max_len=32768;

update lguname_etracs.bpapplication xba set
xba.receivables = concat('[', (
	select 
	group_concat('[',
		'objid:"', br.objid , '",', 
		'businessid:"', br.businessid , '",', 
		'applicationid:"', aba.objid, '",',
		'applicationtype:"', br.applicationtype, '",', 
		'appno:"', aba.appno, '",', 
		'iyear:', aba.year, ',', 
		'iqtr:1,', 
		'lobid:', case when btf.lobid is null then 'null' else concat('"',btf.lobid,'"') end, ',', 
		'lobname:', case when btf.lobid is null then 'null' else concat('"',btf.lobname,'"') end, ',', 
		'acctid:"', btf.acctid, '",', 
		'acctno:"', ifnull(btf.accountno,''), '",', 
		'accttitle:"', btf.accounttitle, '",', 
		'amount:', br.amount, ',', 
		'amtpaid:', br.amtpaid,']')
	from etracs_lguname.abstractbpapplication aba
	inner join etracs_lguname.bptaxfee btf on aba.objid = btf.parentid 
	inner join etracs_lguname.bpreceivable br on btf.objid = br.taxfeeid 
	where aba.objid = xba.objid 
	group by aba.objid 
), ']');

update lguname_etracs.bpapplication set receivables = '[]' where receivables is null;
		
	
set @@group_concat_max_len=32768;

update lguname_etracs.bpapplication xba set
xba.credits = concat('[', (
	select 
	group_concat('[',
		'objid:"', bcr.objid , '",', 
		'bpreceivableid:"', bcr.parentid , '",', 
		'refid:"', case when bcr.capturepaymentid is null then bcr.receiptid else bcr.capturepaymentid end, '",',
		'reftype:"', case when bcr.capturepaymentid is null then 'ONLINE' else 'CAPTURE' end, '",', 
		'refno:"', case when bcr.capturepaymentid is null then bcr.receiptno else cp.orno end, '",', 
		'refdate:"', case when bcr.capturepaymentid is null then bcr.receiptdate else cp.ordate end, '",', 
		'amount:', bcr.amount, ',', 
		'surcharge:', bcr.surcharge, ',', 
		'interest:', bcr.interest, ',', 
		'discount:', bcr.discount,']'
	)
	from etracs_lguname.abstractbpapplication aba
	inner join etracs_lguname.bptaxfee btf on aba.objid = btf.parentid 
	inner join etracs_lguname.bpreceivable br on btf.objid = br.taxfeeid 
	inner join etracs_lguname.bpreceivablecredit bcr on br.objid = bcr.parentid
	left join etracs_lguname.bpcapturepayment cp on bcr.capturepaymentid = cp.objid 
	where aba.objid = xba.objid 
	group by aba.objid 
), ']');

update lguname_etracs.bpapplication set credits = '[]' where credits is null;



set @@group_concat_max_len=32768;


update lguname_etracs.bpapplication xba set
xba.extended = concat('[payments:[', (
	select 
	group_concat('[',
		'refno:"', xcr.refno , '",', 
		'refid:', case when xcr.refid is null then 'null' else concat('"',xcr.refid,'"') end, ',', 
		'reftype:"', xcr.reftype, '",',
		'refdate:"', xcr.refdate, '",', 
		'qtr:', xcr.lastqtrpaid, ',', 
		'year:', xcr.year, ',', 
		'lastyearpaid:', xcr.year, ',', 
		'lastqtrpaid:', xcr.lastqtrpaid, ',', 
		'amount:', xcr.amount, ',', 
		'head:null ]'
	)
	from (
		select 
			aba.objid,
			case when bcr.capturepaymentid is null then bcr.receiptno else cp.orno end as refno,
			case when bcr.capturepaymentid is null then bcr.receiptid else null end as refid,
			case when bcr.capturepaymentid is null then 'ONLINE' else 'CAPTURE' end as reftype,
			case when bcr.capturepaymentid is null then bcr.receiptdate else cp.ordate end as refdate,
			max(br.lastqtrpaid) as qtr,
			aba.year,
			aba.year as lastyearpaid,
			max(br.lastqtrpaid) as lastqtrpaid,
			sum(ifnull(bcr.amount,0) + ifnull(bcr.surcharge,0) + ifnull(bcr.interest,0) - ifnull(bcr.discount,0)) as amount
		from etracs_lguname.abstractbpapplication aba
		inner join etracs_lguname.bptaxfee btf on aba.objid = btf.parentid 
		inner join etracs_lguname.bpreceivable br on btf.objid = br.taxfeeid 
		inner join etracs_lguname.bpreceivablecredit bcr on br.objid = bcr.parentid
		left join etracs_lguname.bpcapturepayment cp on bcr.capturepaymentid = cp.objid 
		group by aba.objid, bcr.receiptno, bcr.capturepaymentid  
	)xcr
	where xcr.objid = xba.objid 
	group by xcr.objid
), ']]');




/*--------------------------------------------------------------------------
*
* BUSINESS PERMIT 
*
*--------------------------------------------------------------------------*/

alter table lguname_etracs.business change column dtregistered dtregistered date null;


insert into lguname_etracs.business (
	objid, 
	schemaname, 
	schemaversion, 
	docstate, 
	taxpayerid, 
	taxpayername, 
	taxpayeraddress, 
	yearstarted, 
	dtregistered, 
	sec, 
	dti, 
	sss, 
	pin, 
	tin, 
	applicationid, 
	tradename, 
	businessaddress, 
	permitid, 
	adminid, 
	adminname, 
	adminaddress, 
	organization, 
	officetype, 
	bin, 
	lastyrpaid, 
	lastqtrpaid
)
select
	b.objid, 
	'business:business' as schemaname, 
	'1.0' as schemaversion, 
	aba.state as docstate, 
	b.taxpayerid, 
	b.taxpayername, 
	b.taxpayeraddress, 
	null as yearstarted, 
	null as dtregistered, 
	null as sec, 
	null as dti, 
	b.sss, 
	ba.pin, 
	b.tin, 
	b.applicationid, 
	b.tradename, 
	b.businessaddress, 
	null as permitid,
	null as adminid, 
	aba.adminname, 
	aba.adminaddress, 
	aba.organizationtype as organization, 
	aba.officetype, 
	b.bin, 
	aba.year as lastyrpaid, 
	ifnull((select max(lastqtrpaid) from etracs_lguname.bpreceivable where businessid = b.objid  ),0) as lastqtrpaid
from etracs_lguname.abstractbpapplication aba
inner join etracs_lguname.bpapplication ba on aba.objid = ba.objid 
inner join etracs_lguname.business b on b.applicationid = ba.objid;

/*==== update the active permits ======*/
update business set docstate = 'ACTIVE' where docstate <> 'RETIRED'


insert into lguname_etracs.bppermit (
	objid, 
	schemaname, 
	schemaversion, 
	txnno, 
	txndate, 
	docstate, 
	taxpayerid, 
	taxpayername, 
	taxpayeraddress, 
	businessid, 
	tradename, 
	businessaddress, 
	lobs, 
	applicationid, 
	iyear, 
	plateno, 
	info
)
select
	p.objid, 
	'bppermit:bppermit' as schemaname, 
	'1.0' as schemaversion, 
	p.permitno as txnno, 
	p.dtposted as txndate, 
	aba.state as docstate, 
	aba.taxpayerid, 
	aba.taxpayername, 
	aba.taxpayeraddress, 
	ba.businessid, 
	ba.tradename, 
	ba.address as businessaddress, 
	'[]' as lobs, 
	aba.objid as applicationid, 
	aba.year as iyear, 
	p.plateno, 
	null as info
from etracs_lguname.abstractbpapplication aba
inner join etracs_lguname.bpapplication ba on aba.objid = ba.objid 
inner join etracs_lguname.business b on b.objid = ba.businessid
inner join etracs_lguname.businesspermit p on aba.objid = p.applicationid;


	
set @@group_concat_max_len=32768;

update lguname_etracs.bppermit xba set
	xba.lobs = concat('[', (
		select 
			group_concat('[',
			'lobid:"', l.objid, '",', 
			'name:"', ifnull(l.name,''), '",', 
			'assessmenttype:"', ba.type, '",',
			'classificationid:"', ifnull(l.classificationid,''), '",', 
			'iyear:', xba.iyear, ']') 
		from etracs_lguname.bpapplication ba
		inner join etracs_lguname.bpapplication_lob bl on ba.objid = bl.bpapplication_objid
		inner join etracs_lguname.lob l on bl.lines_objid = l.objid 
		where bl.bpapplication_objid = xba.applicationid 
		group by bl.bpapplication_objid 
	), ']');	
	


	
set foreign_key_checks=1;


