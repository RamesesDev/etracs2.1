/*
 *	 database names to be replaced: bayombong_etracs., etracs_bayombong.
 */
 

/*=== insert admin account =====*/
insert into bayombong_etracs..personnel ("objid",staffno,firstname,lastname)
select 'admin', '00000000', 'admin', 'admin';

insert into bayombong_etracs..useraccount ("objid", "uid", pwd, usertype, firstname, lastname)
select 'admin', 'admin', '02290d335d44fac6a4d6b3766f0bed51', 'personnel', 'admin', 'admin';

insert into bayombong_etracs..jobposition
select 'ADMIN', 'ADMIN', 'ADMIN', null, 'ADMIN', 'ADMIN_DEFAULT', null, 'HR', 'ADMIN', 'R';


/*====== insert personnel records ==========*/
insert into bayombong_etracs..personnel 
(	
	"objid", 
	staffno, 
	firstname, 
	lastname, 
	middlename, 
	email
)
select
	"objid",
	username,
	firstname,
	lastname,
	middlename,
	email
from etracs_bayombong..sys_user
where username <> 'sysadmin';

insert into bayombong_etracs..useraccount
(
	"objid", 
	"uid", 
	usertype, 
	firstname, 
	lastname, 
	middlename, 
	email
)
select
	"objid",
	username,
	'personnel',
	firstname,
	lastname,
	middlename,
	email
from etracs_bayombong..sys_user;


/*======= insert job collector positions ====*/
insert into bayombong_etracs..jobposition 
	("objid", 
	code, 
	title, 
	roleclass, 
	role, 
	excluded, 
	orgunitid, 
	assigneeid, 
	jobstatus
	)
select
	case when LEN(u.assignees_objid) < 20
		then 
			SUBSTRING(o.objid + u.assignees_objid, 0, 50)
		else
			SUBSTRING(o.objid + SUBSTRING(u.assignees_objid,20,20), 0, 50)
	end As objid,
	o.jobtitle,
	o.jobtitle,
	'TREASURY',
	'COLLECTOR',
	'[]',
	'TR',
	u.assignees_objid,
	'R'
from etracs_bayombong..orgunit o
inner join etracs_bayombong..orgunit_sys_user u on u.OrgUnit_objid = o.objid
where dtype = 'Position' and approle='collector';

insert into bayombong_etracs..jobposition_tag (jobid, tagid)
select "objid", 'COLLECTOR' from bayombong_etracs..jobposition where role = 'COLLECTOR';
	

/*======= insert job liquidating officer positions ====*/
insert into bayombong_etracs..jobposition 
	("objid", 
	code, 
	title, 
	roleclass, 
	role, 
	excluded, 
	orgunitid, 
	assigneeid, 
	jobstatus
	)
select
	o.objid,
	o.jobtitle,
	o.jobtitle,
	'TREASURY',
	'LIQUIDATING_OFFICER',
	'[]',
	'TR',
	u.assignees_objid,
	'R'
from etracs_bayombong..orgunit o
inner join etracs_bayombong..orgunit_sys_user u on u.OrgUnit_objid = o.objid
where dtype = 'Position' and approle='LIQUIDATING_OFFICER';

insert into bayombong_etracs..jobposition_tag (jobid, tagid)
select "objid", 'LIQUIDATING_OFFICER' from bayombong_etracs..jobposition where role = 'LIQUIDATING_OFFICER';




