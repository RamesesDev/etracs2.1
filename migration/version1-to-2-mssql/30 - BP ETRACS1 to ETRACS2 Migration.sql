/**********************************************************************
*
* DATABASE NAMES TO BE REPLACED: 
*	bayombong_etracs, bayombong_system, etracs_bayombong
*
***********************************************************************/


/* *********************************************************************
*
* LOB CLASSIFICATION
*
**********************************************************************/

insert into bayombong_etracs..lobclassification 
	("objid", schemaname, schemaversion, name, remarks)
select
	c."objid", 
	'lobclassification' as schemaname, 
	'1.0' as schemaversion, 
	c.name, 
	null as remarks
from etracs_bayombong..lobclassification c
where parentid = 'c' ;


/* *********************************************************************
*
* LOB 
*
**********************************************************************/
insert into bayombong_etracs..lob 
(
	"objid", schemaname, schemaversion, docstate, name, classificationid, 
	classification, attributes
) 
select
	l."objid", 
	'lob' as schemaname, 
	'1.0' as schemaversion, 
	'APPROVED' as docstate, 
	l.name as name, 
	c."objid" as classificationid, 
	c.name as classification, 
	'[]' as attributes
from etracs_bayombong..lob l
	left join etracs_bayombong..lobclassification c on l.classificationid = c."objid"
where c.parentid = 'c';


insert into bayombong_etracs..lob 
	(
		"objid", schemaname, schemaversion, docstate, name, classificationid, 
		classification, attributes
	)
select
	l."objid", 
	'lob' as schemaname, 
	'1.0' as schemaversion, 
	'APPROVED' as docstate, 
	l.name as name, 
	c."objid" as classificationid, 
	c.name as classification, 
	'[]' as attributes
from etracs_bayombong..lob l, 
	bayombong_etracs..lobclassification c 
where c.name = 'RETAILERS'
  and l.name like '%RETAILER%'
  and not exists(select * from bayombong_etracs..lob b where b."objid" = l."objid" collate Latin1_General_CI_AS  );


insert into bayombong_etracs..lob 
	(
		"objid", schemaname, schemaversion, docstate, name, classificationid, 
		classification, attributes
	)
select
	l."objid", 
	'lob' as schemaname, 
	'1.0' as schemaversion, 
	'APPROVED' as docstate, 
	l.name as name, 
	p."objid" as classificationid, 
	p.name as classification, 
	'[]' as attributes
from etracs_bayombong..lob l
	inner join etracs_bayombong..lobclassification c on l.classificationid = c."objid"
	inner join etracs_bayombong..lobclassification p on c.parentid = p."objid" 
where not exists(select * from bayombong_etracs..lob where "objid" = l."objid" collate Latin1_General_CI_AS  );



insert into bayombong_etracs..lobattribute 
	("objid", name, description)
values
	('ESSENTIAL', 'ESSENTIAL', 'ESSENTIAL PRODUCTS'),
	('HAS_WM', 'HAS WEIGHTS AND MEASURE', 'REQUIRES WEIGHTS AND MEASURE');




/* *********************************************************************
*
* VARIABLE 
*
**********************************************************************/
delete from bayombong_etracs..variable ;

insert into bayombong_etracs..variable 
	(
		"objid", schemaname, schemaversion, name, datatype, caption, 
		description, arrayvalues
	)
select
	v."objid", 
	'variable' as schemaname, 
	'1.0' as schemaversion, 
	v.name,
	lower(v.datatype) as datatype , 
	v.caption, 
	v.description, 
	case 
		when v.arrayvalue is null then null 
		when cast( v.arrayvalue as varchar(255)) = '' then '[]'
		else '["' + replace(cast( v.arrayValue as varchar(1000)),',', '","') + '"]'
	end  as arrayvalues
from etracs_bayombong..abstractvariable v;


delete from bayombong_etracs..variable where "objid" in ('GROSS_ESSENTIAL','GROSS_NON_ESSENTIAL');


/* *********************************************************************
*
* RULEGROUP 
*
********************************************************************* */

delete from bayombong_system..rulegroup where ruleset = 'bpassessment';

insert into bayombong_system..rulegroup ( "objid", name, sortorder, ruleset )
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

delete from bayombong_system.."rule" where ruleset = 'bpassessment';

insert into bayombong_system.."rule" 
	(
		"objid", schemaname, schemaversion, docstate, rulename, 
		description,packagename, author, salience, agendagroupid, 
		agendagroup, ruleset, effectivefrom, effectiveto, ruletext, 
		conditions,	actions, extended
	)
select
	r."objid", 
	'rule' as schemaname, 
	'1.0' as schemaversion, 
	'DRAFT' as docstate, 
	r.rulename, 
	r.description, 
	('bp.assessment.rules.' + r.rulename ) as packagename, 
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
from etracs_bayombong..abstractrule r 
	inner join etracs_bayombong..rulegroup rg on r.rulegroupid = rg.name ;


update bayombong_etracs..variable set printtopermit = 0;



/*--------------------------------------------------------------------------
*
* BP Application 
*
*--------------------------------------------------------------------------*/
insert into bayombong_etracs..bpapplication 
(
	"objid", schemaname, schemaversion, docstate, businessid, info, 
	txnmode, txntype, taxpayerid, tradename, businessaddress, txndate, 
	txnno, iyear, parentid, extended, barcode, lobs, appinfos, taxfees, 
	receivables, credits
)
SELECT 	
	abp."objid", 
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
FROM etracs_bayombong..abstractbpapplication abp
	inner join etracs_bayombong..bpapplication bp on abp."objid" = bp."objid" ;

/**
alter table bayombong_etracs..bpapplicationlisting add fullypaid int not null;
**/

	
insert into bayombong_etracs..bpapplicationlisting 
(
	"objid", txnno, txntype, txnmode, barcode, docstate, taxpayerid, 
	taxpayername, taxpayeraddress, tradename, businessaddress, tin, 
	bin, pin, officetype, organization, ctcno, ctcplaceissued, ctcdateissued, 
	administratorname, administratoraddress, iyear, businessid, parentid, 
	barangayid, barangayname, txndate, fullypaid
)
SELECT 	
	abp."objid", 
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
FROM etracs_bayombong..abstractbpapplication abp
	inner join etracs_bayombong..bpapplication bp on abp."objid" = bp."objid" ;


insert into bayombong_etracs..bpappinfolisting 
 (
	"objid", applicationid, lobid, lobname, varid, 
	varname, vartype, value, arrayvalues, requiredbeforeprint
 )
SELECT 	
	binfo."objid", 
	abp."objid" as applicationid, 
	binfo.lobid, 
	l.name as lobname, 
	binfo.variableid as varid, 
	v.name as varname, 
	lower(v.datatype) as vartype, 
	case 
		when binfo.stringvalue is not null then binfo.stringvalue 
		when binfo.doublevalue is not null then convert( varchar(100), convert(decimal(16, 2), binfo.doublevalue ) )
		when binfo.integervalue is not null then cast(binfo.integervalue as varchar(255)) 
	end as value, 
	'[]' as arrayvalues, 
	binfo.beforeprint as  requiredbeforeprint
FROM etracs_bayombong..abstractbpapplication abp
	inner join etracs_bayombong..bpapplicationinfo binfo on abp."objid" = binfo.parentid
	left join etracs_bayombong..lob l on binfo.lobid = l."objid" 
	left join etracs_bayombong..abstractvariable v on binfo.variableid = v."objid" ;

	
insert into bayombong_etracs..bploblisting 
(
	"objid", applicationid, lobid, classificationid, name, 
	iyear, assessmenttype
)
SELECT	
	( abp.objid + '-' + l.objid ) as "objid", 
	abp."objid" as applicationid, 
	l."objid" as lobid, 
	l.classificationid, 
	l.name, 
	abp.year as iyear, 
	ba.type as assessmenttype
FROM etracs_bayombong..abstractbpapplication abp
	inner join etracs_bayombong..bpapplication ba on abp.objid = ba.objid 
	inner join etracs_bayombong..bpapplication_lob bl on abp.objid = bl.bpapplication_objid
	inner join etracs_bayombong..lob l on bl.lines_objid = l.objid ;


update x  set
	x.lobs = (
			select 
				'[' +stuff( (  
					select N',' + 
						'[lobid:"' + l.objid + '",' 
						+ 'name:"' +  isnull( l.name, '') + '",'
						+ 'assessmenttype:"' + ba.type + '",' 
						+ 'classificationid:"' + isnull(l.classificationid,'') + '"'
						+ ']' 
					from  etracs_bayombong..bpapplication ba
						inner join etracs_bayombong..bpapplication_lob bl on ba."objid" = bl.bpapplication_objid
						inner join etracs_bayombong..lob l on bl.lines_objid = l."objid" 
					where bl.bpapplication_objid = b."objid"  collate SQL_Latin1_General_CP1_CI_AS
					FOR XML PATH(''), TYPE).value('text()[1]', 'nvarchar(max)'),1,1,N'') 
				 + ']' as lobs 
			from bayombong_etracs..bpapplication b
			where b.objid = x."objid"
	)
 from bayombong_etracs..bpapplication x ;
  

update xba  set
	xba.appinfos = ( 
			select isnull(
				'[' + stuff( (  
						select N','+
							'[lobid:' + case when l."objid" is null then 'null' else ('"' + l.objid + '"') end 
							+ ',required:' + case when info.required = 1 then 'true' else 'false' end + 
							+ ',varid:"' + info.variableid + '",'
							+ 'varname:"' + isnull(v.name,'') + '",', 
							+ 'vartype:"' + lower(isnull(v.datatype,'')) + '",' 
							+ 'requiredbeforeprint:' + case when info.beforeprint = 1 then 'true' else 'false' end 
							+ ',lobname:"'+ isnull(l.name,'') + '",' 
							+ 'objid:"' + info.objid + '",'  
							+ 'arrayvalues:' + case when v.arrayvalue is null then '[]' else ('["' + replace(cast( v.arrayvalue as varchar(255)) , ',', '","') + '"]' ) end 
							+ ',rulename:"' + '-",' 
							+ 'datatype:"' + lower(v.datatype) + '",'
							+ 'category:"' + isnull(l.name,'') + '",'
							+ 'caption:"' + isnull(v.caption,'') + '",'
							+ 'varcaption:"' + isnull(v.caption,'') + '",'  
							+ 'items:' + case when v.arrayvalue is null then '[]' else ('["' + replace( cast( v.arrayvalue as varchar(255)) , ',', '","') + '"]') end 
							+ ',value:' + case when info.stringvalue is not null then ('"' + info.stringvalue + '"')
									   when info.doublevalue is not null then convert( varchar(100), convert(decimal(16, 2), info.doublevalue ) )
								when info.integervalue is not null then cast(info.integervalue as varchar(255)) 
								end, ']' 
						from etracs_bayombong..bpapplicationinfo info 
							left join etracs_bayombong..lob l on info.lobid = l."objid" 
							inner join etracs_bayombong..abstractvariable v on info.variableid = v."objid" 
						where info.parentid = b.objid  collate SQL_Latin1_General_CP1_CI_AS
						FOR XML PATH(''), TYPE).value('text()[1]', 'nvarchar(max)'),1,1,N'') 
				 + ']', '[]' ) as appinfos 
			from bayombong_etracs..bpapplication b
			where b.objid = xba.objid  		
		)
from bayombong_etracs..bpapplication xba ;


update xba set 
	xba.info = (
			select 
				'[' + 
				'taxpayername:"' + aba.taxpayername + '",' + 
				'taxpayeraddress:"' + aba.taxpayeraddress + '",' + 
				'taxpayerid:"' + aba.taxpayerid + '",' +
				'organization:"' + aba.organizationtype + '",' + 
				'officetype:"' + aba.officetype+ '",' + 
				'tradename:"' + ba.tradename + '",' + 
				'businessaddress:"' + ba.address + '",' +  
				'ctcno:' + case when aba.ctcno is null then 'null' else aba.ctcno end + ',' + 
				'barangay:[barangayid:"' + ba.barangayid + '",barangayname:"' + ba.barangayname + '"],' +
				'applicationsignatories:[],' + 
				'assessmentsignatories:[],' +
				'requirements:[]' + 
				']' 
			from etracs_bayombong..abstractbpapplication aba
			inner join etracs_bayombong..bpapplication ba on aba."objid" = ba."objid" 
			where aba.objid = xba.objid collate SQL_Latin1_General_CP1_CI_AS
		)
from bayombong_etracs..bpapplication xba;


update xba set
	xba.taxfees = (
		select  isnull(
			'[' + stuff( (  
					select N','+
						'[appid:"' + aba."objid" + '",' +
						'lobid:' + case when btf.lobid is null then 'null' else ('"' + btf.lobid +'"') end + ',' + 
						'lobname:' + case when btf.lobname is null then 'null' else ('"' + btf.lobname + '"') end + ',' +
						'acctid:"' + btf.acctid  + '",' + 
						'accttitle:"' + btf.accounttitle + '",' + 
						'systype:"' + btf.accttype + '",' + 
						'rulename:"-",' + 
						'assessedvalue:' + cast( cast(btf.assessedvalue as decimal(16, 2)) as varchar(255)) + ',' + 
						'amountdue:' +  cast( cast(btf.amtdue as decimal(16, 2)) as varchar(255)) + ',' + 
						'amtdue:' +  cast( cast(btf.amtdue as decimal(16, 2)) as varchar(255)) + ']'
					from etracs_bayombong..abstractbpapplication aba
					inner join etracs_bayombong..bptaxfee btf on aba."objid" = btf.parentid 
					where aba.objid = b.objid  collate SQL_Latin1_General_CP1_CI_AS
					FOR XML PATH(''), TYPE).value('text()[1]', 'nvarchar(max)'),1,1,N'') 
			 + ']', '[]') as taxfees 
		from bayombong_etracs..bpapplication b
		where b.objid = xba.objid 
	)
from  bayombong_etracs..bpapplication xba ;

update bayombong_etracs..bpapplication set taxfees = '[]' where taxfees is null;

update  xba set
	xba.receivables = (
		select isnull(
			'[' + stuff( (  
					select N','+
						'["objid":"' + br."objid" + '",'+ 
						'businessid:"'+ br.businessid + '",' + 
						'applicationid:"' + aba.objid + '",' +
						'applicationtype:"' + br.applicationtype + '",' + 
						'appno:"' + aba.appno + '",' + 
						'iyear:' + cast( aba.year as varchar(255)) + ',' + 
						'iqtr:1,' + 
						'lobid:' + case when btf.lobid is null then 'null' else ('"' + btf.lobid + '"') end + ',' + 
						'lobname:', case when btf.lobid is null then 'null' else ('"' + btf.lobname + '"') end + ',' + 
						'acctid:"' +  btf.acctid + '",' + 
						'acctno:"' + isnull(btf.accountno,'') + '",' + 
						'accttitle:"' + btf.accounttitle, '",' + 
						'amount:' + cast( cast(br.amount as decimal(16, 2)) as varchar(255)) + ',' + 
						'amtpaid:' + cast( cast(br.amtpaid as decimal(16, 2)) as varchar(255)) + ']'
					from etracs_bayombong..abstractbpapplication aba
					inner join etracs_bayombong..bptaxfee btf on aba."objid" = btf.parentid 
					inner join etracs_bayombong..bpreceivable br on btf."objid" = br.taxfeeid 
					where aba.objid = b.objid  collate SQL_Latin1_General_CP1_CI_AS
					FOR XML PATH(''), TYPE).value('text()[1]', 'nvarchar(max)'),1,1,N'') 
			 + ']', '[]') as receivables 
		from bayombong_etracs..bpapplication b 
		where b.objid = xba.objid 
	)
from bayombong_etracs..bpapplication xba;

update bayombong_etracs..bpapplication set receivables = '[]' where receivables is null;


update xba set
	xba.credits = (select isnull(
				'[' + stuff( (  
						select N','+
							'["objid":"' + bcr."objid" + '",' + 
							'bpreceivableid:"' + bcr.parentid + '",' + 
							'refid:"' + case when bcr.capturepaymentid is null then bcr.receiptid else bcr.capturepaymentid end +  '",' +
							'reftype:"' + case when bcr.capturepaymentid is null then 'ONLINE' else 'CAPTURE' end + '",' + 
							'refno:"' + case when bcr.capturepaymentid is null then bcr.receiptno else cp.orno end + '",' + 
							'refdate:"' + case when bcr.capturepaymentid is null then CONVERT(varchar(19), bcr.receiptdate, 120) else CONVERT(varchar(19), cp.ordate, 120) end + '",' + 
							'amount:' + cast(bcr.amount as varchar(255)) +  ',' + 
							'surcharge:' + cast(bcr.surcharge as varchar(255)) + ',' + 
							'interest:' +  cast(bcr.interest as varchar(255))  + ',' + 
							'discount:' + CAST(bcr.discount as varchar(255)) + ']'
						from etracs_bayombong..abstractbpapplication aba
						inner join etracs_bayombong..bptaxfee btf on aba."objid" = btf.parentid 
						inner join etracs_bayombong..bpreceivable br on btf."objid" = br.taxfeeid 
						inner join etracs_bayombong..bpreceivablecredit bcr on br."objid" = bcr.parentid
						left join etracs_bayombong..bpcapturepayment cp on bcr.capturepaymentid = cp."objid" 
						where aba.objid = b.objid  collate SQL_Latin1_General_CP1_CI_AS
						FOR XML PATH(''), TYPE).value('text()[1]', 'nvarchar(max)'),1,1,N'') 
				 + ']', '[]') as credits 
			from bayombong_etracs..bpapplication b 
			where b.objid = xba.objid 
	)
from bayombong_etracs..bpapplication xba;

update bayombong_etracs..bpapplication set credits = '[]' where credits is null;



update xba set
	xba.extended = (
		select isnull(
				'[' + stuff( (  
						select N','+
							'[ refno:"' + xcr.refno + '",' +
							'refid:' + case when xcr.refid is null then 'null' else ('"' + xcr.refid + '"') end + ',' + 
							'reftype:"' + xcr.reftype + '",' +
							'refdate:"' + CONVERT(varchar(19), xcr.refdate, 120) + '",' + 
							'qtr:' + CONVERT(varchar(19), xcr.lastqtrpaid, 120) + ',' + 
							'year:' +  cast( xcr.year as varchar(255)) + ',' + 
							'lastyearpaid:' + cast(xcr.year as varchar(255)) + ',' + 
							'lastqtrpaid:' + cast(xcr.lastqtrpaid as varchar(255)) + ',' + 
							'amount:' + CAST( cast(xcr.amount as decimal( 16, 2)) as varchar(255)) + ',' + 
							'head:null ]'
						from (
								select 
									aba."objid",
									min(case when bcr.capturepaymentid is null then bcr.receiptno else cp.orno end) as refno,
									min(case when bcr.capturepaymentid is null then bcr.receiptid else null end) as refid,
									min(case when bcr.capturepaymentid is null then 'ONLINE' else 'CAPTURE' end) as reftype,
									min(case when bcr.capturepaymentid is null then bcr.receiptdate else cp.ordate end) as refdate,
									max(br.lastqtrpaid) as qtr,
									max(aba.year) as year,
									max(aba.year) as lastyearpaid,
									max(br.lastqtrpaid) as lastqtrpaid,
									sum(isnull(bcr.amount,0) + isnull(bcr.surcharge,0) + isnull(bcr.interest,0) - isnull(bcr.discount,0)) as amount
								from etracs_bayombong..abstractbpapplication aba
								inner join etracs_bayombong..bptaxfee btf on aba.objid = btf.parentid 
								inner join etracs_bayombong..bpreceivable br on btf.objid = br.taxfeeid 
								inner join etracs_bayombong..bpreceivablecredit bcr on br.objid = bcr.parentid
								left join etracs_bayombong..bpcapturepayment cp on bcr.capturepaymentid = cp.objid 
								group by aba.objid, bcr.receiptno, bcr.capturepaymentid 
						) xcr
						where xcr.objid = b.objid collate SQL_Latin1_General_CP1_CI_AS
						FOR XML PATH(''), TYPE).value('text()[1]', 'nvarchar(max)'),1,1,N'') 
				 + ']', '[]') as extended  
			from bayombong_etracs..bpapplication b 
			where xba.objid=b.objid 
	)
from  bayombong_etracs..bpapplication xba;
	


/*--------------------------------------------------------------------------
*
* BUSINESS PERMIT 
*
*--------------------------------------------------------------------------*/

alter table bayombong_etracs..business alter column dtregistered  date null;
																		

insert into bayombong_etracs..business
 (
	"objid", schemaname,schemaversion, docstate, taxpayerid, taxpayername, 
	taxpayeraddress, yearstarted, dtregistered, sec, dti, sss, pin, tin, 
	applicationid, tradename, businessaddress, permitid, adminid, adminname, 
	adminaddress, organization, officetype, bin, lastyrpaid, lastqtrpaid
)
select
	b."objid", 
	'business:business' as schemaname, 
	'1.0' as schemaversion, 
	aba.state as docstate, 
	b.taxpayerid, 
	b.taxpayername, 
	b.taxpayeraddress, 
	0 as yearstarted, 
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
	isnull((select max(lastqtrpaid) from etracs_bayombong..bpreceivable where businessid = b."objid"  ),0) as lastqtrpaid
from etracs_bayombong..abstractbpapplication aba
inner join etracs_bayombong..bpapplication ba on aba."objid" = ba."objid" 
inner join etracs_bayombong..business b on b.applicationid = ba."objid";



/*==== update the active permits ======*/
update bayombong_etracs..business set docstate = 'ACTIVE' where docstate <> 'RETIRED'


insert into bayombong_etracs..bppermit 
(
	"objid", schemaname, schemaversion, txnno, txndate, docstate, 
	taxpayerid, taxpayername, taxpayeraddress, businessid, tradename, 
	businessaddress, lobs, applicationid, iyear, plateno, info
)
select
	p."objid", 
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
	aba."objid" as applicationid, 
	aba.year as iyear, 
	p.plateno, 
	null as info
from etracs_bayombong..abstractbpapplication aba
inner join etracs_bayombong..bpapplication ba on aba."objid" = ba."objid" 
inner join etracs_bayombong..business b on b."objid" = ba.businessid
inner join etracs_bayombong..businesspermit p on aba."objid" = p.applicationid;


update xba set
	xba.lobs =  (
		select isnull(
			'[' + stuff( (  
					select N','+
							'[lobid:"' + l."objid" + '",' + 
							' name:"' + isnull(l.name,'') + '",' + 
							'assessmenttype:"' + ba.type + '",' +
							'classificationid:"' + isnull(l.classificationid,'') + '",' + 
							'iyear:' + cast( b.iyear as varchar(255)) + ']'  
					from etracs_bayombong..bpapplication ba
					inner join etracs_bayombong..bpapplication_lob bl on ba."objid" = bl.bpapplication_objid
					inner join etracs_bayombong..lob l on bl.lines_objid = l."objid" 
					where bl.bpapplication_objid = b.applicationid collate SQL_Latin1_General_CP1_CI_AS
				FOR XML PATH(''), TYPE).value('text()[1]', 'nvarchar(max)'),1,1,N'') 
			 + ']', '[]') as lobs 
		from bayombong_etracs..bppermit b 
		where b.objid = xba.objid
	)
from  bayombong_etracs..bppermit xba ;	
	

