ALTER TABLE dev22_etracs..personnel ADD txncode VARCHAR(50) NULL
go

UPDATE p SET
p.txncode = pc.txncode 
from dev22_etracs..personnel p, dev22_etracs..personnel_txncode pc
WHERE pc.personnelid = p.objid
go

DROP TABLE dev22_etracs..personnel_txncode
go

ALTER TABLE dev22_etracs..jobposition DROP FK_jobposition_role
go

use dev22_etracs
go

drop index jobposition.ix_jobposition_roleclass
go

alter table jobposition drop constraint DF__jobpositi__rolec__1D114BD1
go


ALTER TABLE dev22_etracs..jobposition DROP COLUMN roleclass
go 


alter table jobposition drop constraint DF__jobpositio__role__1E05700A
go

drop index jobposition.ix_jobposition_role
go

ALTER TABLE dev22_etracs..jobposition DROP COLUMN role
go


ALTER TABLE dev22_etracs..jobposition DROP COLUMN excluded;


ALTER TABLE dev22_etracs..role DROP COLUMN included
go

ALTER TABLE dev22_etracs..role ADD domain VARCHAR(50) NULL
go 

ALTER TABLE dev22_etracs..role ADD excluded TEXT NULL
go

sp_rename 'role.name', 'role', 'column'
go

alter table role alter column description varchar(255)
go

sp_rename 'role.roleclass', 'sysrole', 'column'
go

alter table role drop constraint PK__role__B3D2E26A67FE6514
go

alter table role alter column role varchar(50) not null
go

update role set domain = ''
go

alter table role alter column domain varchar(50) not null
go

alter table role add primary key(role, domain)
go



CREATE TABLE dev22_etracs..jobposition_role (
  jobpositionid VARCHAR(50) NOT NULL,
  role VARCHAR(50) NOT NULL,
  domain VARCHAR(50) NOT NULL,
  sysrole VARCHAR(50) NOT NULL,
  disallowed TEXT,
  PRIMARY KEY  (jobpositionid,role,domain)  
) 
go

CREATE UNIQUE INDEX unique_jobposition_sysrole on jobposition_role(jobpositionid,sysrole)
GO

alter table jobposition_role 
	add constraint FK_jobposition_role_role foreign key (role,domain)
	references role(role,domain)
go	
	
alter table jobposition_role 	
  add CONSTRAINT FK_jobposition_role_jobposition FOREIGN KEY (jobpositionid) 
  REFERENCES jobposition (objid)
go  
  

CREATE TABLE dev22_system..sys_role (
  name VARCHAR(50) NOT NULL,
  domain VARCHAR(50) NOT NULL,
  PRIMARY KEY  (name,domain)
)
go


CREATE TABLE dev22_system..sys_role_permission (
  sysrole VARCHAR(50) NOT NULL,
  domain VARCHAR(50) NOT NULL,
  key VARCHAR(50) NOT NULL,
  title VARCHAR(50) DEFAULT NULL,
  module VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY  (sysrole,domain,key),
  CONSTRAINT FK_sys_role_permission FOREIGN KEY (sysrole, domain) REFERENCES sys_role (name, domain)
)
go


delete from lguname_etracs.jobposition_role;
delete from lguname_etracs..role;
delete from lguname_system..sys_role;

insert  into lguname_system..sys_role(name,domain) values ('AFO','TREASURY');
insert  into lguname_system..sys_role(name,domain) values ('APPRAISER','RPT');
insert  into lguname_system..sys_role(name,domain) values ('APPROVER','RPT');
insert  into lguname_system..sys_role(name,domain) values ('ASSESSOR_REPORTS','RPT');
insert  into lguname_system..sys_role(name,domain) values ('BP_REPORTS','BP');
insert  into lguname_system..sys_role(name,domain) values ('CASHIER','TREASURY');
insert  into lguname_system..sys_role(name,domain) values ('CERTIFICATION_ISSUANCE','RPT');
insert  into lguname_system..sys_role(name,domain) values ('CITY_ASSESSOR','RPT');
insert  into lguname_system..sys_role(name,domain) values ('COLLECTOR','BP');
insert  into lguname_system..sys_role(name,domain) values ('COLLECTOR','TREASURY');
insert  into lguname_system..sys_role(name,domain) values ('ENTITY_ENCODER','ENTITY');
insert  into lguname_system..sys_role(name,domain) values ('LANDTAX','RPT');
insert  into lguname_system..sys_role(name,domain) values ('LICENSING','BP');
insert  into lguname_system..sys_role(name,domain) values ('LIQUIDATING_OFFICER','TREASURY');
insert  into lguname_system..sys_role(name,domain) values ('MASTER_ENCODER','BP');
insert  into lguname_system..sys_role(name,domain) values ('MASTER_ENCODER','RPT');
insert  into lguname_system..sys_role(name,domain) values ('MASTER_ENCODER','TREASURY');
insert  into lguname_system..sys_role(name,domain) values ('MUNICIPAL_ASSESSOR','RPT');
insert  into lguname_system..sys_role(name,domain) values ('PROVINCIAL_ASSESSOR','RPT');
insert  into lguname_system..sys_role(name,domain) values ('RELEASING','BP');
insert  into lguname_system..sys_role(name,domain) values ('RULE_AUTHOR','BP');
insert  into lguname_system..sys_role(name,domain) values ('RULE_AUTHOR','CTC');
insert  into lguname_system..sys_role(name,domain) values ('RULE_AUTHOR','RPT');
insert  into lguname_system..sys_role(name,domain) values ('RULE_MANAGEMENT','RULEMGMT');
insert  into lguname_system..sys_role(name,domain) values ('SHARED','BP');
insert  into lguname_system..sys_role(name,domain) values ('SHARED','RPT');
insert  into lguname_system..sys_role(name,domain) values ('SUBCOLLECTOR','TREASURY');
insert  into lguname_system..sys_role(name,domain) values ('TREASURY_ADMIN','TREASURY');
insert  into lguname_system..sys_role(name,domain) values ('TREASURY_REPORTS','TREASURY');


insert  into lguname_etracs..role(role,domain,description,sysrole,excluded,system) values ('AFO','TREASURY',NULL,'AFO',NULL,1);
insert  into lguname_etracs..role(role,domain,description,sysrole,excluded,system) values ('APPRAISER','RPT',NULL,'APPRAISER',NULL,1);
insert  into lguname_etracs..role(role,domain,description,sysrole,excluded,system) values ('APPROVER','RPT',NULL,'APPROVER',NULL,1);
insert  into lguname_etracs..role(role,domain,description,sysrole,excluded,system) values ('ASSESSOR_REPORTS','RPT',NULL,'ASSESSOR_REPORTS',NULL,1);
insert  into lguname_etracs..role(role,domain,description,sysrole,excluded,system) values ('BP_REPORTS','BP',NULL,'BP_REPORTS',NULL,1);
insert  into lguname_etracs..role(role,domain,description,sysrole,excluded,system) values ('CASHIER','TREASURY',NULL,'CASHIER',NULL,1);
insert  into lguname_etracs..role(role,domain,description,sysrole,excluded,system) values ('CERTIFICATION_ISSUANCE','RPT',NULL,'CERTIFICATION_ISSUANCE',NULL,1);
insert  into lguname_etracs..role(role,domain,description,sysrole,excluded,system) values ('CITY_ASSESSOR','RPT',NULL,'CITY_ASSESSOR',NULL,1);
insert  into lguname_etracs..role(role,domain,description,sysrole,excluded,system) values ('COLLECTOR','BP',NULL,'COLLECTOR',NULL,1);
insert  into lguname_etracs..role(role,domain,description,sysrole,excluded,system) values ('COLLECTOR','TREASURY',NULL,'COLLECTOR',NULL,1);
insert  into lguname_etracs..role(role,domain,description,sysrole,excluded,system) values ('ENTITY_ENCODER','ENTITY',NULL,'ENTITY_ENCODER',NULL,1);
insert  into lguname_etracs..role(role,domain,description,sysrole,excluded,system) values ('LANDTAX','RPT',NULL,'LANDTAX',NULL,1);
insert  into lguname_etracs..role(role,domain,description,sysrole,excluded,system) values ('LICENSING','BP',NULL,'LICENSING',NULL,1);
insert  into lguname_etracs..role(role,domain,description,sysrole,excluded,system) values ('LIQUIDATING_OFFICER','TREASURY',NULL,'LIQUIDATING_OFFICER',NULL,1);
insert  into lguname_etracs..role(role,domain,description,sysrole,excluded,system) values ('MASTER_ENCODER','BP',NULL,'MASTER_ENCODER',NULL,1);
insert  into lguname_etracs..role(role,domain,description,sysrole,excluded,system) values ('MASTER_ENCODER','RPT',NULL,'MASTER_ENCODER',NULL,1);
insert  into lguname_etracs..role(role,domain,description,sysrole,excluded,system) values ('MASTER_ENCODER','TREASURY',NULL,'MASTER_ENCODER',NULL,1);
insert  into lguname_etracs..role(role,domain,description,sysrole,excluded,system) values ('MUNICIPAL_ASSESSOR','RPT',NULL,'MUNICIPAL_ASSESSOR',NULL,1);
insert  into lguname_etracs..role(role,domain,description,sysrole,excluded,system) values ('PROVINCIAL_ASSESSOR','RPT',NULL,'PROVINCIAL_ASSESSOR',NULL,1);
insert  into lguname_etracs..role(role,domain,description,sysrole,excluded,system) values ('RELEASING','BP',NULL,'RELEASING',NULL,1);
insert  into lguname_etracs..role(role,domain,description,sysrole,excluded,system) values ('RULE_AUTHOR','BP',NULL,'RULE_AUTHOR',NULL,1);
insert  into lguname_etracs..role(role,domain,description,sysrole,excluded,system) values ('RULE_AUTHOR','CTC',NULL,'RULE_AUTHOR',NULL,1);
insert  into lguname_etracs..role(role,domain,description,sysrole,excluded,system) values ('RULE_AUTHOR','RPT',NULL,'RULE_AUTHOR',NULL,1);
insert  into lguname_etracs..role(role,domain,description,sysrole,excluded,system) values ('RULE_MANAGEMENT','RULEMGMT',NULL,'RULE_MANAGEMENT',NULL,1);
insert  into lguname_etracs..role(role,domain,description,sysrole,excluded,system) values ('SHARED','BP',NULL,'SHARED',NULL,1);
insert  into lguname_etracs..role(role,domain,description,sysrole,excluded,system) values ('SHARED','RPT',NULL,'SHARED',NULL,1);
insert  into lguname_etracs..role(role,domain,description,sysrole,excluded,system) values ('SUBCOLLECTOR','TREASURY',NULL,'SUBCOLLECTOR',NULL,1);
insert  into lguname_etracs..role(role,domain,description,sysrole,excluded,system) values ('TREASURY_ADMIN','TREASURY',NULL,'TREASURY_ADMIN',NULL,1);
insert  into lguname_etracs..role(role,domain,description,sysrole,excluded,system) values ('TREASURY_REPORTS','TREASURY',NULL,'TREASURY_REPORTS',NULL,1);





INSERT INTO dev22_etracs..jobposition_role(jobpositionid, role, domain, sysrole) 
SELECT t.jobid, t.tagid, s.domain, t.tagid FROM dev22_etracs..jobposition_tag t, dev22_system..sys_role s
WHERE t.tagid = s.name ;
