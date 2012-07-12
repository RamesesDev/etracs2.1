alter table bayombong_etracs..subdivision alter column appraisedby varchar(75);
alter table bayombong_etracs..subdivision alter column appraisedbytitle varchar(75);
alter table bayombong_etracs..subdivision alter column recommendedby varchar(75);
alter table bayombong_etracs..subdivision alter column recommendedbytitle varchar(75);
alter table bayombong_etracs..subdivision alter column approvedby varchar(75);
alter table bayombong_etracs..subdivision alter column approvedbytitle varchar(75);
alter table bayombong_etracs..subdivision alter column mothertaxpayername varchar(800);
alter table bayombong_etracs..subdivision alter column mothertdno varchar(30);
alter table bayombong_etracs..subdivision alter column motherclasscode varchar(30);
alter table bayombong_etracs..subdivision alter column motherpin varchar(30);
alter table bayombong_etracs..subdivision alter column mothercadastrallotno varchar(300);
alter table bayombong_etracs..subdivision alter column docno varchar(50);

insert into bayombong_etracs..subdivision 
	(objid, schemaname, schemaversion, docstate, ry, txntype, 
	autonumber, 
	issuedate, 
	effectivityyear, 
	effectivityqtr, 
	memoranda, 
	motherfaasid, 
	mothertdno, 
	motherpin, 
	motherclasscode, 
	mothertaxpayername, 
	mothercadastrallotno, 
	mothersurveyno, 
	mothermv, 
	motherav, 
	motherareasqm, 
	motherareaha, 
	subdivisioncount, 
	affectedrpucount, 
	appraisedby, 
	appraisedbytitle, 
	dtappraised, 
	recommendedby, 
	recommendedbytitle, 
	dtrecommended, 
	approvedby, 
	approvedbytitle, 
	dtapproved, 
	extended, 
	docno
	)
select
	a.objid, 
	'subdivision' as schemaname, 
	'1.0' as schemaversion, 
	a.state as docstate, 
	r.ry, 
	'SD' as txntype, 
	0 as autonumber, 
	a.issuedate, 
	a.effectivityyear, 
	a.effectivityqtr, 
	a.remarks as memoranda, 
	a.taxdeclarationid as motherfaasid, 
	td.tdno as mothertdno, 
	rp.pin as motherpin, 
	r.classcode as motherclasscode, 
	td.taxpayername as mothertaxpayername, 
	rp.cadastrallotno as mothercadastrallotno, 
	rp.surveyno as mothersurveyno, 
	r.totalamv as mothermv, 
	r.totalav as  motherav, 
	r.areainsqm as motherareasqm, 
	r.areainhec as motherareaha, 
	s.subdivisioncount, 
	0 as affectedrpucount, 
	a.appraisedby, 
	a.appraisedbyposition as appraisedbytitle, 
	a.issuedate as dtappraised, 
	a.recommendedby, 
	a.recommendedbyposition as recommendedbytitle, 
	case when a.recommendedby is null then null else a.issuedate end as dtrecommended, 
	a.approvedby, 
	a.approvedbyposition as approvedbytitle, 
	a.dtsubmitted as dtapproved, 
	'[:]' as extended, 
	a.txnno as docno
from etracs_bayombong..tdtransaction a
	inner join etracs_bayombong..subdivisiontdtransaction s on a.objid = s.objid 
	inner join etracs_bayombong..taxdeclaration td on a.taxdeclarationid = td.objid 
	inner join etracs_bayombong..rpu r on td.rpuid = r.objid 
	inner join etracs_bayombong..realproperty rp on r.realpropertyid = rp.objid;


insert into bayombong_etracs..subdivisionland 
	(objid, subdivisionid, newtdno, newpin, newtitletype, 
	newtitleno, 
	newtitledate, 
	areasqm, 
	areaha, 
	memoranda, 
	taxpayerid, 
	taxpayerno, 
	taxpayername, 
	taxpayeraddress, 
	rp, 
	rpu, 
	newfaasid, 
	extended, 
	itemno
	)
select
	sl.objid, 	
	s.objid as subdivisionid, 
	sl.newtdno, 
	nr.pin as newpin, 
	null as newtitletype, 
	sl.newtitleno, 
	sl.newtitledate, 
	nr.areainsqm as areasqm, 
	nr.areainhec as areaha, 
	sl.remarks as memoranda, 
	otd.taxpayerid, 
	p.taxpayerno, 
	otd.taxpayername, 
	otd.taxpayeraddress, 
	'[:]' as rp, 
	'[:]' as rpu, 
	sl.newtaxdeclarationid as newfaasid, 
	'[:]' as extended, 
	sl.line_no as itemno
from etracs_bayombong..tdtransaction a
	inner join etracs_bayombong..subdivisiontdtransaction s on a.objid = s.objid 
	inner join etracs_bayombong..subdivisionland sl on s.objid = sl.subdivisiontdtransactionid 
	inner join etracs_bayombong..taxdeclaration otd on a.taxdeclarationid = otd.objid 
	inner join etracs_bayombong..rpu nr on sl.landrpuid = nr.objid
	inner join etracs_bayombong..payer p on otd.taxpayerid = p.objid ;


alter table bayombong_etracs..subdivisionaffectedrpu alter column prevtdno varchar(30);
alter table bayombong_etracs..subdivisionaffectedrpu alter column prevfullpin varchar(30);
alter table bayombong_etracs..subdivisionaffectedrpu alter column newtdno varchar(30);
alter table bayombong_etracs..subdivisionaffectedrpu alter column newpin varchar(30);

insert into bayombong_etracs..subdivisionaffectedrpu 
	(objid, subdivisionid, itemno, rputype, prevfaasid, 
	prevtdno, 
	prevfullpin, 
	newtdno, 
	subdivisionlandid, 
	newpin, 
	newsuffix, 
	memoranda, 
	newfaasid
	)
select
	sa.objid, 
	sa.subdivisiontdtransactionid as subdivisionid, 
	0 as itemno, 
	lower(orpu.type) as rputype, 
	sa.taxdeclarationid as prevfaasid, 
	otd.tdno as prevtdno, 
	(orpu.pin + '-' + cast(orpu.suffix as varchar)) as prevfullpin ,
	ntd.tdno as newtdno, 
	sa.subdivisionlandid, 
	(nrpu.pin + '-' + cast(nrpu.suffix as varchar)) as newpin, 
	sa.newsuffix, 
	sa.remarks as memoranda, 
	sa.newtaxdeclarationid as newfaasid
from etracs_bayombong..tdtransaction a
	inner join etracs_bayombong..subdivisiontdtransaction s on a.objid = s.objid 
	inner join etracs_bayombong..subdivisionaffectedrpu sa on s.objid = sa.subdivisiontdtransactionid 
	inner join etracs_bayombong..taxdeclaration otd on sa.taxdeclarationid = otd.objid 
	inner join etracs_bayombong..rpu orpu on otd.rpuid = orpu.objid 
	inner join etracs_bayombong..taxdeclaration ntd on sa.newtaxdeclarationid = ntd.objid 
	inner join etracs_bayombong..rpu nrpu on ntd.rpuid = nrpu.objid ;


update sl set
	sl.rp = f.rp,
	sl.rpu = f.rpu
from bayombong_etracs..subdivisionland sl, bayombong_etracs..faas f
where sl.newfaasid = f.objid;




insert into bayombong_etracs..consolidation 
	(objid, schemaname, schemaversion, docstate, ry, txntype, 
	autonumber, 
	issuedate, 
	effectivityyear, 
	effectivityqtr, 
	memoranda, 
	consolidatedlandcount, 
	affectedrpucount, 
	appraisedby, 
	appraisedbytitle, 
	dtappraised, 
	recommendedby, 
	recommendedbytitle, 
	dtrecommended, 
	approvedby, 
	approvedbytitle, 
	dtapproved, 
	newtdno, 
	newpin, 
	newtitletype, 
	newtitleno, 
	newtitledate, 
	areasqm, 
	areaha, 
	newtaxpayerid, 
	newtaxpayerno, 
	newtaxpayername, 
	newtaxpayeraddress, 
	rp, 
	rpu, 
	newfaasid, 
	extended
	)
select 
	t.objid, 
	'consolidation' as schemaname, 
	'1.0' as schemaversion, 
	t.state as docstate, 
	nr.ry as ry, 
	'CS' as txntype, 
	0 as autonumber, 
	t.issuedate, 
	t.effectivityyear, 
	t.effectivityqtr, 
	t.remarks as memoranda, 
	0 as consolidatedlandcount, 
	0 as affectedrpucount, 
	t.appraisedby, 
	t.appraisedbyposition as appraisedbytitle, 
	t.issuedate as dtappraised, 
	t.recommendedby, 
	t.recommendedbyposition as recommendedbytitle, 
	case when t.recommendedby is null then null else t.issuedate end dtrecommended, 
	t.approvedby, 
	t.approvedbyposition as approvedbytitle, 
	t.issuedate as dtapproved, 
	a.newtdno,  
	nrp.pin as newpin, 
	null as newtitletype, 
	a.newtitleno, 
	a.newtitledate, 
	nr.areainsqm as areasqm, 
	nr.areainhec as areaha, 
	ntd.taxpayerid as newtaxpayerid, 
	p.taxpayerno as newtaxpayerno, 
	ntd.taxpayername as newtaxpayername, 
	ntd.taxpayeraddress as newtaxpayeraddress, 
	'[:]' as rp, 
	'[:]' as rpu, 
	ntd.objid as newfaasid, 
	'[:]' as extended
from etracs_bayombong..tdtransaction t
inner join etracs_bayombong..amalgamationtdtransaction a on t.objid = a.objid 
inner join etracs_bayombong..taxdeclaration ntd on a.newtaxdeclarationid = ntd.objid 
inner join etracs_bayombong..rpu nr on ntd.rpuid = nr.objid 
inner join etracs_bayombong..realproperty nrp on nr.realpropertyid = nrp.objid 
inner join etracs_bayombong..payer p on ntd.taxpayerid = p.objid ;


alter table bayombong_etracs..consolidationaffectedrpu alter column prevtdno varchar(30);
alter table bayombong_etracs..consolidationaffectedrpu alter column prevfullpin varchar(30);
alter table bayombong_etracs..consolidationaffectedrpu alter column newtdno varchar(30);
alter table bayombong_etracs..consolidationaffectedrpu alter column newpin varchar(30);

insert into bayombong_etracs..consolidationaffectedrpu 
	(objid, consolidationid, rputype, landfaasid, prevfaasid, 
	prevtdno, 
	prevfullpin, 
	newtdno, 
	newpin, 
	newsuffix, 
	memoranda, 
	newfaasid, 
	extended
	)
select
	ar.objid, 
	a.objid as consolidationid, 
	lower(orpu.type) as rputype, 
	ntd.objid as landfaasid, 
	otd.objid as prevfaasid, 
	otd.tdno as prevtdno, 
	(orpu.pin + '-' + cast(orpu.suffix as varchar)) as prevfullpin, 
	ntd.tdno as newtdno, 
	(nrpu.pin + '-' + cast(nrpu.suffix as varchar)) as newpin, 
	ar.newsuffix, 
	ar.remarks as memoranda, 
	ntd.objid as newfaasid, 
	'[:]' as extended
from etracs_bayombong..tdtransaction t
	inner join etracs_bayombong..amalgamationtdtransaction a on t.objid = a.objid 
	inner join etracs_bayombong..amalgamationaffectedrpu ar on a.objid = ar.amalgamationtdtransactionid 
	inner join etracs_bayombong..taxdeclaration otd on ar.taxdeclarationid = otd.objid 
	inner join etracs_bayombong..rpu orpu on otd.rpuid = orpu.objid 
	inner join etracs_bayombong..taxdeclaration ntd on ar.newtaxdeclarationid = ntd.objid 
	inner join etracs_bayombong..rpu nrpu on ntd.rpuid = nrpu.objid ;	



update c set
	c.rp = f.rp,
	c.rpu = f.rpu 
from bayombong_etracs..consolidation c, bayombong_etracs..faas f
where c.newfaasid = f.objid ;




