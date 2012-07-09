/**********************************************************************
*
* DATABASE NAMES TO BE REPLACED: 
*	lguname_etracs, etracs_lguname
*
***********************************************************************/

set foreign_key_checks=0;


/**********************************************************************
*
* REAL PROPERTY : PROPERTY CLASSIFICATION
*
**********************************************************************/

INSERT INTO bayombong_etracs..propertyclassification 
	(objid, schemaname, schemaversion, propertycode, propertydesc, 
	special, 
	orderno
	)
SELECT
	objid, 
	'propertyclassification:propertyclassification' AS schemaname, 
	'1.0' AS schemaversion, 
	code AS propertycode, 
	description AS propertydesc, 
	special, 
	orderno
FROM etracs_bayombong..propertyclassification;


/**********************************************************************
*
* REAL PROPERTY : EXEMPTION TYPES
*
**********************************************************************/

insert into bayombong_etracs..exemptiontype 
	(objid, schemaname, schemaversion, exemptcode, exemptdesc, 
	orderno
	)
SELECT 
	objid, 
	'exemptiontype:exemptiontype' AS schemaname, 
	'1.0' AS schemaversion, 
	code AS exemptcode, 
	description AS exemptdesc, 
	orderno
FROM etracs_bayombong..exemptiontype ;



/**********************************************************************
*
* REAL PROPERTY : KINDS OF BUILDING
*
**********************************************************************/
insert into bayombong_etracs..kindofbuilding 
	(objid, schemaname, schemaversion, bldgcode, bldgkind
	)
SELECT
	objid, 
	'kindofbuilding:kindofbuilding' AS schemaname, 
	'1.0' AS schemaversion, 
	code AS bldgcode, 
	description AS bldgkind
FROM etracs_bayombong..bldgkind ;




/**********************************************************************
*
* REAL PROPERTY : MATERIALS
*
**********************************************************************/
insert into bayombong_etracs..materials 
	(objid, schemaname, schemaversion, materialcode, materialdesc
	)
SELECT
	objid, 
	'materials:materials' AS schemaname, 
	'1.0' AS schemaversion, 
	code AS materialcode, 
	description AS materialdesc
FROM etracs_bayombong..material;





/**********************************************************************
*
* REAL PROPERTY : STRUCTURES
*
**********************************************************************/
insert into bayombong_etracs..structures 
	(objid, schemaname, schemaversion, structurecode, structuredesc, 
	materials
	)
SELECT
	objid, 
	'structures:structures' AS schemaname, 
	'1.0' AS schemaversion, 
	code AS structurecode, 
	description AS structuredesc, 
	'[]' AS materials
FROM etracs_bayombong..structure;	



/**********************************************************************
*
* REAL PROPERTY : MACHINERY
*
**********************************************************************/
insert into bayombong_etracs..machines 
	(objid, schemaname, schemaversion, machinecode, machinedesc, 
	economiclife, 
	residualrate
	)
SELECT 
	objid, 
	'machines:machines' AS schemaname, 
	'1.0' as schemaversion, 
	code AS machinecode, 
	description AS machinedesc, 
	0 AS economiclife, 
	0 as residualrate
FROM etracs_bayombong..machine ;	




/**********************************************************************
*
* REAL PROPERTY : PLANT/TREE
*
**********************************************************************/

insert into bayombong_etracs..plantsandtrees 
	(objid, schemaname, schemaversion, planttreecode, planttreedesc
	)
SELECT
	objid, 
	'plantsandtrees:plantsandtrees' AS schemaname, 
	'1.0' AS schemaversion, 
	code AS planttreecode, 
	description AS planttreedesc
FROM etracs_bayombong..tree;




/**********************************************************************
* (9)
* REAL PROPERTY : CANCELTDREASON
*
**********************************************************************/
insert into bayombong_etracs..canceltdreason 
	(objid, schemaname, schemaversion, cancelcode, canceltitle, 
	canceldesc
	)
SELECT 
	objid, 
	'canceltdreason' AS schemaname, 
	'1.0' AS schemaversion, 
	code AS cancelcode, 
	title AS canceltitle, 
	description AS canceldesc	
FROM etracs_bayombong..canceltdreason;




/**********************************************************************
*
* REAL PROPERTY : RPTPARAMETER
*
**********************************************************************/
insert into bayombong_etracs..rptparameters 
	(objid, schemaname, schemaversion, paramname, paramcaption, 
	paramdesc, 
	paramtype, 
	parammin, 
	parammax
	)
SELECT
	objid, 
	'rptparameters:rptparameters' AS schemaname, 
	'1.0' AS schemaversion, 
	name AS paramname, 
	caption AS paramcaption, 
	description AS paramdesc, 
	CASE 
		WHEN datatype = 'INTEGER' THEN 'integer' 
		WHEN datatype = 'DECIMAL' THEN 'decimal' 
	END AS paramtype, 
	0 AS parammin, 
	0 AS parammax
FROM etracs_bayombong..rptparameter;



/**********************************************************************
*
* REAL PROPERTY : RPTSETTING
*
**********************************************************************/
insert into bayombong_etracs..rptsetting 
	(objid, 
	schemaname, 
	schemaversion, 
	ry, 
	ordinanceno, 
	ordinancedate, 
	roundadjmarketvalue, 
	allowlandcancellation, 
	usenewtdprintout, 
	landreportbasedonactualuse, 
	allowtransferwithbalance, 
	allowcorrectionwithbalance, 
	allowdepreciationwithbalance, 
	allowchangetaxabilitywithbalance, 
	allowsubdivisionwithbalance, 
	allowconsolidationwithbalance, 
	allowreclasswithbalance, 
	approvedmvbelow, 
	agriculturalid, 
	agriculturaltitle, 
	adjustplanttree, 
	propertyclassifications
	)
SELECT
	objid, 
	'rptsetting:rptsetting' as schemaname, 
	'1.0' as schemaversion, 
	ry, 
	ordinanceno, 
	ordinancedate, 
	roundadjmarketvalue, 
	allowlandcancellation, 
	usenewtdprintout, 
	landreportbasedonactualuse, 
	allowtransferwithbalance, 
	allowcorrectionwithbalance, 
	allowdepreciationwithbalance, 
	allowchangetaxabilitywithbalance, 
	allowsubdivisionwithbalance, 
	allowAmalgamationWithBalance as allowconsolidationwithbalance, 
	allowreclasswithbalance, 
	approvedmvbelow, 
	agriculturalid , 
	(SELECT description FROM etracs_bayombong..propertyclassification WHERE objid = r.agriculturalid ) as agriculturaltitle, 
	ISNULL(adjustplanttree, 0), 
	'[]' as propertyclassifications
FROM etracs_bayombong..rptsetting  r;




/**********************************************************************
*
* REAL PROPERTY : LANDRYSETTING
*
**********************************************************************/

insert into bayombong_etracs..landrysetting 
	(objid, schemaname, schemaversion, ry, previd)
select
	objid, 
	'landrysetting:landrysetting' as schemaname, 
	'1.0' as schemaversion, 
	ry, 
	previd
from etracs_bayombong..rysetting 
where dtype = 'LandRYSetting';



insert into bayombong_etracs..landassesslevel 
	(objid, classcode, classname, fixrate, rate, previd, 
	landrysettingid, 
	ranges
	)
select
	objid, 
	code as classcode, 
	description as classname, 
	special as fixrate, 
	assesslevel as rate, 
	null as previd, 
	rysettingid as landrysettingid, 
	'[]' as ranges
from etracs_bayombong..landassesslevel ;


insert into bayombong_etracs..lcuv 
	(objid, classcode, classname, landrysettingid, previd
	)
select	
	l.objid, 
	pc.code as classcode, 
	pc.description as classname, 
	l.rysettingid as landrysettingid, 
	l.previd
from etracs_bayombong..lcuv l
	inner join etracs_bayombong..propertyclassification pc on l.propertyclassificationid = pc.objid ;


insert into bayombong_etracs..lcuvspecificclass 
	(objid, classcode, classname, areatype, lcuvid, previd, 
	landrysettingid
	)
select
	s.objid, 
	s.code as classcode, 
	s.description as classname, 
	case when s.areatype = 'HEC' then 'HA' else 'SQM' END AS areatype, 
	s.lcuvid, 
	s.previd, 
	l.rysettingid as landrysettingid
from etracs_bayombong..lcuvspecificclass s
	inner join etracs_bayombong..lcuv l on s.lcuvid = l.objid ;



insert into bayombong_etracs..lcuvsubclass 
	(objid, subclasscode, subclassname, unitvalue, specificclassid, 
	previd, 
	landrysettingid
	)
select 
	sb.objid, 
	sb.code as subclasscode, 
	sb.description as subclassname, 
	sb.unitvalue, 
	sb.specificclassid, 
	sb.previd, 
	l.rysettingid as landrysettingid
from etracs_bayombong..lcuv l
	inner join etracs_bayombong..lcuvspecificclass s on l.objid = s.lcuvid
	inner join etracs_bayombong..lcuvsubclass sb on s.objid = sb.specificclassid ;





insert into bayombong_etracs..lcuvstripping 
	(objid, striplevel, rate, lcuvid, previd, landrysettingid
	)
select
	s.objid, 
	s.striplevel, 
	s.rate, 
	s.lcuvid, 
	s.previd, 
	l.rysettingid as landrysettingid
from etracs_bayombong..lcuv l
	inner join etracs_bayombong..lcuvstripping s on l.objid = s.lcuvid ;



insert into bayombong_etracs..landadjustment 
	(objid, adjustmentcode, adjustmentname, classids, classifications, 
	expression, 
	landrysettingid, 
	appliedto, 
	previd
	)
select
	l.objid, 
	l.code as adjustmentcode, 
	l.description as adjustmentname, 
	null as classids, 
	'[]' as classifications, 
	CASE 
		when expression like '%if%' then expression
		else 'SYS_BASE_MARKET_VALUE * ' + 
		  cast( convert(decimal(10,2), (convert(decimal(10,2),cast(expression as varchar(1000))) / 100 )) as varchar(1000))
	END as expression, 
	l.rysettingid landrysettingid, 
	'' as appliedto, 
	null as previd
from etracs_bayombong..landadjustmenttype l;

update  bayombong_etracs..landadjustment set expression = replace(replace(replace( expression, '$F{', ''), '$P{',''),'}','');


update l
set
 classids = stuff(
	(
		select ',' + propertyclassificationid
		from etracs_bayombong..landadjustmenttype_propertyclassification 
		where landadjustmenttypeid = l.objid
		FOR XML PATH(''),TYPE
	).value('text()[1]','nvarchar(max)'),1,1,''
 ),
 appliedto = stuff(
	(
		select ',' + pc.code 
		from etracs_bayombong..landadjustmenttype_propertyclassification la,
			 etracs_bayombong..propertyclassification pc
		where la.landadjustmenttypeid = l.objid
		  and la.propertyclassificationid = pc.objid
		FOR XML PATH(''),TYPE
	).value('text()[1]','nvarchar(max)'),1,1,''
 ),
 classifications = (
	'[' +
	stuff(
		(
			select 
				','+
				'[propertyclass:[classname:"' + pc.description + '", classcode:"' + pc.code + '", classid:"' + pc.objid, '"],' +
				'propertyid:"' + pc.objid + '", propertycode:"' + pc.code + '", propertyname:"' + pc.description, '"]'
			from etracs_bayombong..landadjustmenttype_propertyclassification la,
				 etracs_bayombong..propertyclassification pc
			where la.landadjustmenttypeid = l.objid
			  and la.propertyclassificationid = pc.objid
			FOR XML PATH(''),TYPE
		).value('text()[1]','nvarchar(max)'),1,1,''
	 ) + 
	']'
)
from bayombong_etracs..landadjustment l;




/**********************************************************************
* (20)
* REAL PROPERTY : BLDG RY SETTING
*
**********************************************************************/
insert into bayombong_etracs..bldgrysetting 
	(objid, schemaname, schemaversion, ry, predominant, depreciatecoreanditemseparately, 
	computedepreciationbasedonschedule, 
	previd,
	calcbldgagebasedondtoccupied
	)
select
	r.objid, 
	'bldgrysetting' as schemaname, 
	'1.0' as schemaversion, 
	r.ry, 
	r.predominant, 
	r.depreciateCoreAndItemsSeparately as depreciatecoreanditemseparately, 
	r.autoComputeBldgDepreciation as computedepreciationbasedonschedule, 
	r.previd,
	0
from etracs_bayombong..rysetting r
where dtype = 'BldgRYSetting';




insert into bayombong_etracs..bldgassesslevel 
	(objid, bldgrysettingid, code, name, fixrate, rate, previd, 
	ranges
	)
select
	a.objid, 
	a.bldgrysettingid, 
	a.code, 
	a.description as name, 
	a.special as fixrate, 
	a.assesslevel as rate, 
	a.previd, 
	'[]' as ranges
from etracs_bayombong..bldgassesslevel a ;



insert into bayombong_etracs..bldgkindbucc 
	(objid, bldgrysettingid, bldgtypeid, bldgkindid, bldgkindcode, 
	bldgkindname, 
	basevaluetype, 
	basevalue, 
	minbasevalue, 
	maxbasevalue, 
	gapvalue, 
	minarea, 
	maxarea, 
	bldgclass, 
	previd, 
	extended
	)
select
	btc.objid, 
	bt.bldgrysettingid, 
	btc.bldgtypeid, 
	btc.bldgkindid, 
	bk.code as bldgkindcode, 
	bk.description as bldgkindname, 
	CASE WHEN btc.basevaluetype = 'RANGE' THEN 'range' ELSE 'fix' END as basevaluetype , 
	btc.basevalue, 
	btc.minbasevalue, 
	btc.maxbasevalue, 
	0.00, -- btc.gapvalue, 
	0.00, -- btc.minarea, 
	0.00, -- btc.maxarea, 
	null, -- btc.bldgclass, 
	btc.previd, 
	'[:]' as extended
from etracs_bayombong..bldgtypeclassification btc 
	inner join etracs_bayombong..bldgtype bt on btc.bldgtypeid = bt.objid 
	inner join etracs_bayombong..bldgkind bk on btc.bldgkindid = bk.objid ;

	
insert into bayombong_etracs..bldgtype 
(
	objid, bldgrysettingid, code, name, basevaluetype, residualrate, multistoreyadjustments, depreciations, previd
)
select 
	objid, bldgrysettingid, code, description, 
	(select top 1 basevaluetype from bayombong_etracs..bldgkindbucc where bldgtypeid=bt.objid) as basevaluetype, 
	residualvalue, 
	'[]' as multistoreyadjustments, 
	'[]' as depreciations, 
	previd
from etracs_bayombong..bldgtype bt

	


insert into bayombong_etracs..bldgadditionalitem 
	(objid, bldgrysettingid, code, name, unit, expr, previd
	)
select
	bi.objid, 
	bi.bldgrysettingid, 
	bi.code, 
	bi.description as name, 
	bi.unit, 
	replace(replace(replace(bi.expression, '$P{', ''), '}', ''), '$F{','') as expr, 
	bi.previd
from etracs_bayombong..bldgadditionalitem bi ;




/**********************************************************************
*
* REAL PROPERTY : MACH RY SETTING 
*
**********************************************************************/

insert into bayombong_etracs..machrysetting 
	(objid, schemaname, schemaversion, ry, previd)
select
	objid, 
	'machrysetting' as schemaname, 
	'1.0' as schemaversion, 
	ry, 
	previd
from etracs_bayombong..rysetting 
where dtype= 'MachRYSetting' ;	



insert into bayombong_etracs..machassesslevel 
	(objid, machrysettingid, code, name, fixrate, rate, previd, 
	ranges
	)
select
	ma.objid, 
	ma.machrysettingid, 
	ma.code, 
	ma.description as name, 
	ma.special as fixrate, 
	ma.assesslevel as rate, 
	previd, 
	'[]' as ranges
from etracs_bayombong..machassesslevel ma;


insert into bayombong_etracs..machforex 
	(objid, machrysettingid, iyear, forex, previd)
select
	f.objid, 
	f.machrysettingid, 
	f.year as iyear, 
	f.forex, 
	f.previd
from etracs_bayombong..machforex f;	





/**********************************************************************
*
* REAL PROPERTY : TREERYSETTING
*
**********************************************************************/

insert into bayombong_etracs..planttreerysetting 
	(objid, schemaname, schemaversion, ry, applyagriadjustment, 
	previd, 
	assesslevels, 
	planttreeunits
	)
select
	r.objid, 
	'planttreerysetting' as schemaname, 
	'1.0' as schemaversion, 
	r.ry, 
	0 as applyagriadjustment, 
	r.previd, 
	'[]' as assesslevels, 
	'[]' as planttreeunits
from etracs_bayombong..rysetting r
where dtype = 'TreeRYSetting' ;


insert into bayombong_etracs..planttreeunitvalue 
	(objid, planttreerysettingid, planttreeid, planttreecode, 
	planttreename, 
	code, 
	name, 
	unitvalue, 
	previd)
select
	tuv.objid, 
	tu.rysettingid as planttreerysettingid, 
	t.objid as planttreeid, 
	t.code as planttreecode, 
	t.description as planttreename, 
	tuv.code, 
	tuv.description as name, 
	tuv.unitvalue, 
	tuv.previd
from etracs_bayombong..treeunitvalue tuv 
	inner join etracs_bayombong..treeunit tu on tuv.treeunitid = tu.objid 
	inner join etracs_bayombong..tree t on tu.treeid = t.objid ;







/**********************************************************************
*
* REAL PROPERTY : ENTITY 
*
**********************************************************************/
alter table bayombong_etracs..entity alter column entityname varchar(1000);
alter table bayombong_etracs..entity alter column entityaddress varchar(200);
alter table bayombong_etracs..entity alter column mailingaddress varchar(200);
alter table bayombong_etracs..entity alter column remarks varchar(200);
alter table bayombong_etracs..entity alter column entityno varchar(50);

insert into bayombong_etracs..entity 
	(objid, schemaname, schemaversion, entityno, entityname, 
	entityaddress, 
	mailingaddress, 
	entitytype, 
	info, 
	sys_lastupdate, 
	sys_lastupdateby, 
	remarks
	)
select 	
	p.objid, 
	'entity:entity' as schemaname, 
	'1.0' as schemaversion, 
	p.taxpayerno as entityno, 
	p.name as entityname, 
	p.primaryaddress as entityaddress, 
	p.mailingaddress, 
	case 
		when p.dtype = 'MultipleTaxpayer' then 'multiple' 
		when p.dtype = 'IndividualTaxpayer' then 'individual' 
		else 'juridical'
	end as entitytype, 
	'[:]' as info, 
	null as sys_lastupdate, 
	null as sys_lastupdateby, 
	p.remarks
from etracs_bayombong..payer p ;



alter table bayombong_etracs..entitymember alter column taxpayername varchar(1000);
alter table bayombong_etracs..entitymember alter column taxpayeraddress varchar(200);
alter table bayombong_etracs..entitymember alter column remarks varchar(200);
alter table bayombong_etracs..entitymember alter column prefix varchar(100);
alter table bayombong_etracs..entitymember alter column suffix varchar(100);

insert into bayombong_etracs..entitymember 
	(objid, entityid, itemno, prefix, taxpayerid, taxpayername, 
	taxpayeraddress, 
	suffix, 
	remarks
	)
select
	m.objid, 
	m.parentid as entityid, 
	m.itemno, 
	m.prefix, 
	m.taxpayerid, 
	p.name as taxpayername, 
	p.primaryaddress as taxpayeraddress, 
	m.suffix, 
	null as remarks
from etracs_bayombong..multipletaxpayermember m 
	inner join etracs_bayombong..payer p on m.taxpayerid = p.objid;









/**********************************************************************
*
* REAL PROPERTY : FAAS 
*
**********************************************************************/
insert into bayombong_etracs..pin 
	( pin, claimno, docstate )
select distinct 
	rp.pin,
	case when rp.claimno = 0 then '-' else rp.claimno end as claimno,
	rp.state as docstate 
from etracs_bayombong..realproperty rp
	inner join etracs_bayombong..rpu r on rp.objid = r.realpropertyid 
	inner join etracs_bayombong..taxdeclaration td on r.objid = td.rpuid 
where r.type = 'land' ;

create index ix_rptledger_tdid on etracs_bayombong..rptledger( tdid);


insert into bayombong_etracs..faas (
	objid, 	schemaname, schemaversion, 
	docstate, 
	transmittalid, 
	transmitted, 
	info, 
	rp, 
	rpu, 
	previousfaases, 
	extended, 
	message, 
	sys_dtapproved, 
	ledgerid, 
	attachments
)
select
	td.objid, 
	'faas:faas' as schemaname, 
	'1.0' as schemaversion, 
	td.state as docstate, 
	null as transmittalid, 
	null as transmitted, 
	'[:]' as info, 
	'[:]' as rp, 
	'[:]' as rpu, 
	'[]' as previousfaases, 
	'[:]' as extended, 
	null as message, 
	null as sys_dtapproved, 
	(select top 1 objid from etracs_bayombong..rptledger where tdid = td.objid) as ledgerid, 
	'[]' as attachments
from etracs_bayombong..taxdeclaration td;



alter table bayombong_etracs..faaslist alter column tdno varchar(30);
alter table bayombong_etracs..faaslist alter column taxpayerno varchar(50);
alter table bayombong_etracs..faaslist alter column taxpayername varchar(1000);
alter table bayombong_etracs..faaslist alter column taxpayeraddress varchar(200);
alter table bayombong_etracs..faaslist alter column datacapture tinyint;
alter table bayombong_etracs..faaslist alter column memoranda text;
alter table bayombong_etracs..faaslist alter column prevtdno varchar(800);
alter table bayombong_etracs..faaslist alter column titletype varchar(255);
alter table bayombong_etracs..faaslist alter column administratorname varchar(255);
alter table bayombong_etracs..faaslist alter column administratoraddress varchar(150);
alter table bayombong_etracs..faaslist alter column appraisedbytitle varchar(75);
alter table bayombong_etracs..faaslist alter column recommendedbytitle varchar(75);
alter table bayombong_etracs..faaslist alter column approvedbytitle varchar(75);
alter table bayombong_etracs..faaslist alter column rputype varchar(25);
alter table bayombong_etracs..faaslist alter column classcode varchar(50);
alter table bayombong_etracs..faaslist alter column pin varchar(30);
alter table bayombong_etracs..faaslist alter column cadastrallotno varchar(300);
alter table bayombong_etracs..faaslist alter column cancelreason varchar(50);
alter table bayombong_etracs..faaslist alter column cancelledbytdnos varchar(800);
alter table bayombong_etracs..faaslist alter column ownername varchar(800);
alter table bayombong_etracs..faaslist alter column owneraddress varchar(150);


insert into bayombong_etracs..faaslist 
	(objid, schemaname, schemaversion, docstate, datacapture, 
	autonumber, 
	claimno, 
	backtaxyrs, 
	landfaasid, 
	landfaastaxpayerid, 
	txntype, 
	tdno, 
	prevtdno, 
	issuedate, 
	effectivityyear, 
	effectivityqtr, 
	titleno, 
	titletype, 
	titledate, 
	prevtaxpayerid, 
	taxpayerid, 
	taxpayerno, 
	taxpayername, 
	taxpayeraddress, 
	administratorid, 
	administratorno, 
	administratorname, 
	administratoraddress, 
	appraisedby, 
	appraisedbytitle, 
	recommendedby, 
	recommendedbytitle, 
	approvedby, 
	approvedbytitle, 
	rputype, 
	ry, 
	fullpin, 
	classid, 
	classcode, 
	taxable, 
	totalareasqm, 
	totalareaha, 
	totalmv, 
	totalav, 
	pintype, 
	pin, 
	provcityindex, 
	munidistrictindex, 
	barangayindex, 
	provcity, 
	munidistrict, 
	barangay, 
	cadastrallotno, 
	blockno, 
	surveyno, 
	cancelreason, 
	canceldate, 
	cancelledbytdnos, 
	ledgerid, 
	barangayid, 
	ownername, 
	owneraddress, 
	txntimestamp, 
	section, 
	parcel, 
	memoranda, 
	exemptid, 
	exemptcode, 
	annotated,
	message,
	restriction
	)
select
	td.objid, 
	'faas:faas' as schemaname, 
	'1.0' as schemaversion, 
	td.state as docstate, 
	td.datacapture, 
	td.autonumber, 
	rp.claimno, 
	td.backtaxyears as  backtaxyrs, 
	null as landfaasid, 
	null as landfaastaxpayerid, 
	td.txntype, 
	td.tdno, 
	td.previousTdNo as prevtdno, 
	td.issuedate, 
	td.effectivityyear, 
	td.effectivityqtr, 
	td.titleno, 
	td.titletype, 
	td.titledate, 
	null as prevtaxpayerid, 
	td.taxpayerid, 
	null as taxpayerno, 
	td.taxpayername, 
	td.taxpayeraddress, 
	td.administratorid, 
	null as administratorno, 
	td.administratorname, 
	td.administratoraddress, 
	td.appraisedby, 
	td.appraisedbyposition as appraisedbytitle, 
	td.recommendedby, 
	td.recommendedbyposition as recommendedbytitle, 
	td.approvedby, 
	td.approvedbyposition as approvedbytitle, 
	LOWER(rpu.type) as  rputype, 
	rpu.ry, 
	case 
		when rpu.suffix = 0 then rp.pin 
		else rp.pin + '-' + cast(rpu.suffix as varchar(255))
	end as fullpin, 
	rpu.classificationid as classid, 
	rpu.classcode, 
	rpu.taxable, 
	rpu.areainsqm as totalareasqm, 
	rpu.areainhec as totalareaha, 
	rpu.totalamv as totalmv, 
	rpu.totalav as totalav, 
	'new' as pintype, 
	rp.pin, 
	rp.provcityindex, 
	rp.munidistrictindex, 
	rp.brgyIndex as barangayindex, 
	'-' as provcity, 
	'-' as munidistrict, 
	rp.location as barangay, 
	rp.cadastrallotno, 
	rp.blockno, 
	rp.surveyno, 
	td.cancelreason, 
	td.canceldate, 
	td.cancelledbytdno as cancelledbytdnos, 
	-- rl.objid as ledgerid, 
	(select top 1 objid from etracs_bayombong..rptledger where tdid = td.objid) as ledgerid,
	rp.barangayid, 
	td.taxpayername as ownername, 
	td.taxpayeraddress as owneraddress, 
	(YEAR(td.issuedate) + 
		datepart(qq, td.issuedate) +
		CASE WHEN MONTH(td.issuedate) < 10 THEN ('0' + MONTH(td.issuedate)) ELSE MONTH(td.issuedate) END +
		CASE WHEN DAY(td.issuedate) < 10 THEN ('0' + DAY(td.issuedate)) ELSE DAY(td.issuedate) END
	) AS txntimestamp, 
	rp.sectionno as section, 
	rp.parcelno as parcel, 
	td.remarks as memoranda, 
	rpu.exemptionTypeId as exemptid, 
	rpu.exemptcode, 
	td.annotated,
	null as message,
	null as restriction 
from etracs_bayombong..taxdeclaration td
	inner join etracs_bayombong..rpu rpu on td.rpuid = rpu.objid 
	inner join etracs_bayombong..realproperty rp on rpu.realpropertyid = rp.objid; 


update fl set 
	fl.provcity = isnull((select lguname from bayombong_etracs..lgu where indexno=fl.provcityindex), '-')
from bayombong_etracs..faaslist fl;



update fl set 
	fl.munidistrict = isnull((select lguname from bayombong_etracs..lgu where indexno=fl.munidistrictindex), '-')
from bayombong_etracs..faaslist fl;


update bayombong_etracs..faaslist set 
	txntype = 'RE'
where txntype in( 'CT','PC','CD','CC','PD' );



update fl set 
	fl.landfaasid = fl2.objid,
	fl.landfaastaxpayerid = fl2.taxpayerid 
from bayombong_etracs..faaslist fl, bayombong_etracs..faaslist fl2
where fl.rputype <>'land' 
  and fl.landfaasid is null  
  and fl2.rputype = 'land' 
  and fl2.pin = fl.pin 
  and fl2.docstate <> 'CANCELLED';

update bayombong_etracs..faas set extended = '[txntimestamp:"201130819",transmitted:false,lgutype:"municipality"]' ;




insert into bayombong_etracs..faasannotation 
	(objid, schemaname, schemaversion, docstate, doctype, 
	opener, 
	docno, 
	fileno, 
	faasid, 
	tdno, 
	fullpin, 
	cadastrallotno, 
	surveyno, 
	blockno, 
	ownername, 
	submittedby, 
	submittedbytitle, 
	dtsubmitted, 
	signedby, 
	signedbytitle, 
	dtsigned, 
	approvedby, 
	approvedbytitle, 
	dtapproved, 
	memoranda, 
	orno, 
	ordate, 
	oramount, 
	details, 
	extended
	)
select
	a.objid, 
	'annotation' as schemaname, 
	'1.0' as schemaversion, 
	a.state as docstate, 
	case when a.dtype='MortgageAnnotation' then 'mortgage' else 'bailbond'  end as doctype, 
	case when a.dtype='MortgageAnnotation' then 'mortgage' else 'bailbond'  end as opener, 
	'-'  as docno, 
	a.fileno, 
	a.tdid as faasid, 
	fl.tdno, 
	fl.fullpin, 
	fl.cadastrallotno, 
	fl.surveyno, 
	fl.blockno, 
	fl.ownername, 
	a.submittedby, 
	null as submittedbytitle, 
	a.dtsubmitted, 
	a.signedby, 
	a.signedbyposition as signedbytitle, 
	null, 
	a.approvedby, 
	'-' as approvedbytitle, 
	a.dtapproved, 
	a.remarks as memoranda, 
	a.orno, 
	a.ordate, 
	a.oramount, 
	case 
		when a.dtype='MortgageAnnotation' then 
			(
				'Mortgage for Php. ' + a.loanamount + ' to the ' + a.bank + 
				'. This instrument executed on ' + a.mortgagedate +
				' by ' + a.mortgageby + '. Ratified by ' + a.signedby + '. ' + a.signedbyposition + 
				' on ' + a.signeddate + '.'
			)
		else 
			('Bail Bond: File under Case No. ' + a.caseno + ' on ' + a.branchno + ' between ' + a.mortgageby )
	end as details, 
	case 
		when a.dtype='MortgageAnnotation' then 
			( 
				'[mortgageby:"' + a.mortgageby + '",mortgagedate:"' + a.mortgagedate + '",loanamount:' + a.loanamount + 
				',bank:"' + a.bank + '",marketvalue:' + fl.totalmv + ',assessedvalue:' + fl.totalav + ']' 
			) 
		else 
			(
				'[caseno:"' + a.caseno + '",branchno:"' + a.branchno + '",marketvalue:' + fl.totalmv + 
				',assessedvalue:' + fl.totalav + ']'
			)
	end as extended
from etracs_bayombong..abstracttdannotation a
	inner join bayombong_etracs..faaslist fl on a.tdid = fl.objid ;


update bayombong_etracs..faasannotation  set memoranda = details where details is not null;

