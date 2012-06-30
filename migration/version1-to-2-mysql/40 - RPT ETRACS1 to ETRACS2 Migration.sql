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

INSERT INTO lguname_etracs.propertyclassification 
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
	case when special= true then 1 else 0 end, 
	orderno
FROM etracs_lguname.propertyclassification;


/**********************************************************************
*
* REAL PROPERTY : EXEMPTION TYPES
*
**********************************************************************/

insert into lguname_etracs.exemptiontype 
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
FROM etracs_lguname.exemptiontype ;



/**********************************************************************
*
* REAL PROPERTY : KINDS OF BUILDING
*
**********************************************************************/
insert into lguname_etracs.kindofbuilding 
	(objid, schemaname, schemaversion, bldgcode, bldgkind
	)
SELECT
	objid, 
	'kindofbuilding:kindofbuilding' AS schemaname, 
	'1.0' AS schemaversion, 
	code AS bldgcode, 
	description AS bldgkind
FROM etracs_lguname.bldgkind ;




/**********************************************************************
*
* REAL PROPERTY : MATERIALS
*
**********************************************************************/
insert into lguname_etracs.materials 
	(objid, schemaname, schemaversion, materialcode, materialdesc
	)
SELECT
	objid, 
	'materials:materials' AS schemaname, 
	'1.0' AS schemaversion, 
	code AS materialcode, 
	description AS materialdesc
FROM etracs_lguname.material;





/**********************************************************************
*
* REAL PROPERTY : STRUCTURES
*
**********************************************************************/
insert into lguname_etracs.structures 
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
FROM etracs_lguname.structure;	



/**********************************************************************
*
* REAL PROPERTY : MACHINERY
*
**********************************************************************/
insert into lguname_etracs.machines 
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
FROM etracs_lguname.machine ;	




/**********************************************************************
*
* REAL PROPERTY : PLANT/TREE
*
**********************************************************************/

insert into lguname_etracs.plantsandtrees 
	(objid, schemaname, schemaversion, planttreecode, planttreedesc
	)
SELECT
	objid, 
	'plantsandtrees:plantsandtrees' AS schemaname, 
	'1.0' AS schemaversion, 
	code AS planttreecode, 
	description AS planttreedesc
FROM etracs_lguname.tree;




/**********************************************************************
* (9)
* REAL PROPERTY : CANCELTDREASON
*
**********************************************************************/
insert into lguname_etracs.canceltdreason 
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
FROM etracs_lguname.canceltdreason;




/**********************************************************************
*
* REAL PROPERTY : RPTPARAMETER
*
**********************************************************************/
insert into lguname_etracs.rptparameters 
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
FROM etracs_lguname.rptparameter;



/**********************************************************************
*
* REAL PROPERTY : RPTSETTING
*
**********************************************************************/
insert into lguname_etracs.rptsetting 
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
	(SELECT description FROM etracs_lguname.propertyclassification WHERE objid = r.agriculturalid ) as agriculturaltitle, 
	adjustplanttree, 
	'[]' as propertyclassifications
FROM etracs_lguname.rptsetting  r;




/**********************************************************************
*
* REAL PROPERTY : LANDRYSETTING
*
**********************************************************************/

insert into lguname_etracs.landrysetting 
	(objid, schemaname, schemaversion, ry, previd)
select
	objid, 
	'landrysetting:landrysetting' as schemaname, 
	'1.0' as schemaversion, 
	ry, 
	previd
from etracs_lguname.rysetting 
where dtype = 'LandRYSetting';



insert into lguname_etracs.landassesslevel 
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
from etracs_lguname.landassesslevel ;


insert into lguname_etracs.lcuv 
	(objid, classcode, classname, landrysettingid, previd
	)
select	
	l.objid, 
	pc.code as classcode, 
	pc.description as classname, 
	l.rysettingid as landrysettingid, 
	l.previd
from etracs_lguname.lcuv l
	inner join etracs_lguname.propertyclassification pc on l.propertyclassificationid = pc.objid ;


insert into lguname_etracs.lcuvspecificclass 
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
from etracs_lguname.lcuvspecificclass s
	inner join etracs_lguname.lcuv l on s.lcuvid = l.objid ;



insert into lguname_etracs.lcuvsubclass 
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
from etracs_lguname.lcuv l
	inner join etracs_lguname.lcuvspecificclass s on l.objid = s.lcuvid
	inner join etracs_lguname.lcuvsubclass sb on s.objid = sb.specificclassid ;





insert into lguname_etracs.lcuvstripping 
	(objid, striplevel, rate, lcuvid, previd, landrysettingid
	)
select
	s.objid, 
	s.striplevel, 
	s.rate, 
	s.lcuvid, 
	s.previd, 
	l.rysettingid as landrysettingid
from etracs_lguname.lcuv l
	inner join etracs_lguname.lcuvstripping s on l.objid = s.lcuvid ;



insert into lguname_etracs.landadjustment 
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
		else concat('SYS_BASE_MARKET_VALUE * ', expression / 100 )
	END as expression, 
	l.rysettingid landrysettingid, 
	null as appliedto, 
	null as previd
from etracs_lguname.landadjustmenttype l;

update  lguname_etracs.landadjustment set expression = replace(replace(replace( expression, '$F{', ''), '$P{',''),'}','');


set @@group_concat_max_len=32768;

update lguname_etracs.landadjustment l
set 
 classids = (
	select group_concat(propertyclassificationid) 
	from etracs_lguname.landadjustmenttype_propertyclassification 
	where landadjustmenttypeid = l.objid
 ),
 appliedto = (
	select group_concat(pc.code) 
	from etracs_lguname.landadjustmenttype_propertyclassification la,
		 etracs_lguname.propertyclassification pc
	where la.landadjustmenttypeid = l.objid
	  and la.propertyclassificationid = pc.objid
 ),
 classifications = concat(
	'[',
	(
		select group_concat(
			'[propertyclass:[classname:"', pc.description, '", classcode:"', pc.code, '", classid:"', pc.objid, '"],',
			'propertyid:"', pc.objid, '", propertycode:"', pc.code, '", propertyname:"', pc.description, '"]'
		) 
		from etracs_lguname.landadjustmenttype_propertyclassification la,
             etracs_lguname.propertyclassification pc
		where la.landadjustmenttypeid = l.objid
		  and la.propertyclassificationid = pc.objid
	),
	']'
);



/**********************************************************************
* (20)
* REAL PROPERTY : BLDG RY SETTING
*
**********************************************************************/
insert into lguname_etracs.bldgrysetting 
	(objid, schemaname, schemaversion, ry, predominant, depreciatecoreanditemseparately, 
	computedepreciationbasedonschedule, 
	previd
	)
select
	r.objid, 
	'bldgrysetting' as schemaname, 
	'1.0' as schemaversion, 
	r.ry, 
	r.predominant, 
	r.depreciateCoreAndItemsSeparately as depreciatecoreanditemseparately, 
	r.autoComputeBldgDepreciation as computedepreciationbasedonschedule, 
	r.previd
from etracs_lguname.rysetting r
where dtype = 'BldgRYSetting';




insert into lguname_etracs.bldgassesslevel 
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
from etracs_lguname.bldgassesslevel a ;



insert into lguname_etracs.bldgtype 
(
	objid, bldgrysettingid, code, name, basevaluetype, residualrate, multistoreyadjustments, depreciations, previd
)
select 
	objid, bldgrysettingid, code, description, 
	(select basevaluetype from bldgkindbucc where bldgtypeid=bt.objid limit 1) as basevaluetype, 
	residualvalue, 
	'[]' as multistoreyadjustments, 
	'[]' as depreciations, 
	previd
from etracs_lguname.bldgtype bt


insert into lguname_etracs.bldgkindbucc 
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
	btc.gapvalue, 
	btc.minarea, 
	btc.maxarea, 
	btc.bldgclass, 
	btc.previd, 
	'[:]' as extended
from etracs_lguname.bldgtypeclassification btc 
	inner join etracs_lguname.bldgtype bt on btc.bldgtypeid = bt.objid 
	inner join etracs_lguname.bldgkind bk on btc.bldgkindid = bk.objid ;



insert into lguname_etracs.bldgadditionalitem 
	(objid, bldgrysettingid, code, name, unit, expr, previd
	)
select
	bi.objid, 
	bi.bldgrysettingid, 
	bi.code, 
	bi.description as name, 
	bi.unit, 
	replace(
		replace(
			replace(
				replace(bi.expression, '$P{', ''), 
				'}', ''
			), '$F{',''
		), 
		'BASE_VALUE', 'SYS_BASE_VALUE'
	) as expr, 
	bi.previd
from etracs_lguname.bldgadditionalitem bi ;




/**********************************************************************
*
* REAL PROPERTY : MACH RY SETTING 
*
**********************************************************************/

insert into lguname_etracs.machrysetting 
	(objid, schemaname, schemaversion, ry, previd)
select
	objid, 
	'machrysetting' as schemaname, 
	'1.0' as schemaversion, 
	ry, 
	previd
from etracs_lguname.rysetting 
where dtype= 'MachRYSetting' ;	



insert into lguname_etracs.machassesslevel 
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
from etracs_lguname.machassesslevel ma;


insert into lguname_etracs.machforex 
	(objid, machrysettingid, iyear, forex, previd)
select
	f.objid, 
	f.machrysettingid, 
	f.year as iyear, 
	f.forex, 
	f.previd
from etracs_lguname.machforex f;	





/**********************************************************************
*
* REAL PROPERTY : TREERYSETTING
*
**********************************************************************/

insert into lguname_etracs.planttreerysetting 
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
from etracs_lguname.rysetting r
where dtype = 'TreeRYSetting' ;


insert into lguname_etracs.planttreeunitvalue 
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
from etracs_lguname.treeunitvalue tuv 
	inner join etracs_lguname.treeunit tu on tuv.treeunitid = tu.objid 
	inner join etracs_lguname.tree t on tu.treeid = t.objid ;







/**********************************************************************
*
* REAL PROPERTY : ENTITY 
*
**********************************************************************/
insert into lguname_etracs.entity 
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
from etracs_lguname.payer p ;




insert into lguname_etracs.entitymember 
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
from etracs_lguname.multipletaxpayermember m 
	inner join etracs_lguname.payer p on m.taxpayerid = p.objid;









/**********************************************************************
*
* REAL PROPERTY : FAAS 
*
**********************************************************************/
insert into lguname_etracs.pin 
	( pin, claimno, docstate )
select distinct 
	rp.pin,
	case when rp.claimno = 0 then '-' else rp.claimno end as claimno,
	rp.state as docstate 
from etracs_lguname.realproperty rp
	inner join etracs_lguname.rpu r on rp.objid = r.realpropertyid 
	inner join etracs_lguname.taxdeclaration td on r.objid = td.rpuid 
where r.type = 'land' ;
  
create index ix_rptledger_tdid on etracs_lguname.rptledger( tdid);


insert into lguname_etracs.faas (
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
	rl.objid as ledgerid, 
	'[]' as attachments
from etracs_lguname.taxdeclaration td
	left join etracs_lguname.rptledger rl on td.objid = rl.tdid ;




insert into lguname_etracs.faaslist 
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
		when suffix = 0 then rp.pin 
		else concat(rp.pin, '-', rpu.suffix)
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
	rl.objid as ledgerid, 
	rp.barangayid, 
	td.taxpayername as ownername, 
	td.taxpayeraddress as owneraddress, 
	CONCAT(YEAR(td.issuedate), 
		QUARTER(td.issuedate), 
		CASE WHEN MONTH(td.issuedate) < 10 THEN CONCAT('0',MONTH(td.issuedate)) ELSE MONTH(td.issuedate) END,
		CASE WHEN DAY(td.issuedate) < 10 THEN CONCAT('0',DAY(td.issuedate)) ELSE DAY(td.issuedate) END
	) AS txntimestamp, 
	rp.sectionno as section, 
	rp.parcelno as parcel, 
	td.remarks as memoranda, 
	rpu.exemptionTypeId as exemptid, 
	rpu.exemptcode, 
	td.annotated,
	null as message,
	null as restriction 
from etracs_lguname.taxdeclaration td
	inner join etracs_lguname.rpu rpu on td.rpuid = rpu.objid 
	inner join etracs_lguname.realproperty rp on rpu.realpropertyid = rp.objid 
	left join etracs_lguname.rptledger rl on td.objid = rl.tdid ;


update lguname_etracs.faaslist fl set 
	fl.provcity = (select lguname from lguname_etracs.lgu where indexno=fl.provcityindex);




update lguname_etracs.faaslist fl set 
	fl.munidistrict = (select lguname from lguname_etracs.lgu where indexno=fl.munidistrictindex);


update lguname_etracs.faaslist set 
	txntype = 'RE'
where txntype in( 'CT','PC','CD','CC','PD' );



update lguname_etracs.faaslist fl, lguname_etracs.faaslist fl2 set 
	fl.landfaasid = fl2.objid,
	fl.landfaastaxpayerid = fl2.taxpayerid 
where fl.rputype <>'land' 
  and fl.landfaasid is null  
  and fl2.rputype = 'land' 
  and fl2.pin = fl.pin 
  and fl2.docstate <> 'CANCELLED';

update lguname_etracs.faas set extended = '[txntimestamp:"201130819",transmitted:false,lgutype:"municipality"]' ;




insert into lguname_etracs.faasannotation 
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
			concat('Mortgage for Php. ', a.loanamount, ' to the ', a.bank, '. This instrument executed on ', a.mortgagedate,
				' by ', a.mortgageby, '. Ratified by ', a.signedby, '. ', a.signedbyposition, ' on ', a.signeddate, '.'
			)
		else 
			concat('Bail Bond: File under Case No. ', a.caseno, ' on ', a.branchno, ' between ', a.mortgageby )
	end as details, 
	case 
		when a.dtype='MortgageAnnotation' then 
			concat( '[mortgageby:"', a.mortgageby ,'",mortgagedate:"', a.mortgagedate, '",loanamount:', a.loanamount,',bank:"', a.bank, '",marketvalue:',fl.totalmv,',assessedvalue:', fl.totalav,']' ) 
		else 
			concat( '[caseno:"', a.caseno, '",branchno:"', a.branchno,'",marketvalue:',fl.totalmv,',assessedvalue:', fl.totalav,']')
	end as extended
from etracs_lguname.abstracttdannotation a
	inner join lguname_etracs.faaslist fl on a.tdid = fl.objid ;



update lguname_etracs.faasannotation  set memoranda = details where details is not null;


set foreign_key_checks=1;
