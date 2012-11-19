ALTER TABLE lguname_etracs.personnel ADD COLUMN `txncode` VARCHAR(50) NULL AFTER `spouseinfo`;

UPDATE lguname_etracs.personnel p, lguname_etracs.personnel_txncode pc SET
p.txncode = pc.txncode 
WHERE pc.personnelid = p.objid;

DROP TABLE lguname_etracs.personnel_txncode;

-- drop table jobposition_tag;

ALTER TABLE lguname_etracs.jobposition DROP FOREIGN KEY  `FK_jobposition_role`;


ALTER TABLE lguname_etracs.`jobposition` DROP COLUMN `roleclass`, DROP COLUMN `role`, DROP COLUMN `excluded`;


ALTER TABLE lguname_etracs.`role` 
	DROP COLUMN `included`,
	ADD COLUMN `domain` VARCHAR(50) NULL AFTER `role`, 
	ADD COLUMN `excluded` TEXT NULL AFTER `sysrole`,
	CHANGE `name` `role` VARCHAR(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '' NOT NULL, 
	CHANGE `description` `description` VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL , 
	CHANGE `roleclass` `sysrole` VARCHAR(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '' NOT NULL, 
	CHANGE `system` `system` INT(6) DEFAULT '0' NULL ;


ALTER TABLE lguname_etracs.`role` 
	CHANGE `domain` `domain` VARCHAR(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL, 
	CHANGE `sysrole` `sysrole` VARCHAR(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '' NOT NULL, DROP PRIMARY KEY,  
	ADD PRIMARY KEY(`role`, `domain`);


ALTER TABLE lguname_etracs.`role` DROP KEY `FK_role`;

ALTER TABLE lguname_etracs.`role` ADD INDEX `role_sysrole` (`sysrole`);


CREATE TABLE lguname_etracs.`jobposition_role` (
  `jobpositionid` VARCHAR(50) NOT NULL,
  `role` VARCHAR(50) NOT NULL,
  `domain` VARCHAR(50) NOT NULL,
  `sysrole` VARCHAR(50) NOT NULL,
  `disallowed` TEXT,
  PRIMARY KEY  (`jobpositionid`,`role`,`domain`),
  UNIQUE KEY `unique_jobposition_sysrole` (`jobpositionid`,`sysrole`),
  KEY `FK_jobposition_role_role` (`role`,`domain`),
  CONSTRAINT `FK_jobposition_role_jobposition` FOREIGN KEY (`jobpositionid`) REFERENCES `jobposition` (`objid`),
  CONSTRAINT `FK_jobposition_role_role` FOREIGN KEY (`role`, `domain`) REFERENCES `role` (`role`, `domain`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;



CREATE TABLE lguname_system.`sys_role` (
  `name` VARCHAR(50) NOT NULL,
  `domain` VARCHAR(50) NOT NULL,
  PRIMARY KEY  (`name`,`domain`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;


CREATE TABLE lguname_system.`sys_role_permission` (
  `sysrole` VARCHAR(50) NOT NULL,
  `domain` VARCHAR(50) NOT NULL,
  `key` VARCHAR(50) NOT NULL,
  `title` VARCHAR(50) DEFAULT NULL,
  `module` VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY  (`sysrole`,`domain`,`key`),
  CONSTRAINT `FK_sys_role_permission` FOREIGN KEY (`sysrole`, `domain`) REFERENCES `sys_role` (`name`, `domain`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;



delete from lguname_etracs.jobposition_role;
delete from lguname_etracs.role;
delete from lguname_system.sys_role;

insert  into lguname_system.sys_role(name,domain) values ('AFO','TREASURY');
insert  into lguname_system.sys_role(name,domain) values ('APPRAISER','RPT');
insert  into lguname_system.sys_role(name,domain) values ('APPROVER','RPT');
insert  into lguname_system.sys_role(name,domain) values ('ASSESSOR_REPORTS','RPT');
insert  into lguname_system.sys_role(name,domain) values ('BP_REPORTS','BP');
insert  into lguname_system.sys_role(name,domain) values ('CASHIER','TREASURY');
insert  into lguname_system.sys_role(name,domain) values ('CERTIFICATION_ISSUANCE','RPT');
insert  into lguname_system.sys_role(name,domain) values ('CITY_ASSESSOR','RPT');
insert  into lguname_system.sys_role(name,domain) values ('COLLECTOR','BP');
insert  into lguname_system.sys_role(name,domain) values ('COLLECTOR','TREASURY');
insert  into lguname_system.sys_role(name,domain) values ('ENTITY_ENCODER','ENTITY');
insert  into lguname_system.sys_role(name,domain) values ('LANDTAX','RPT');
insert  into lguname_system.sys_role(name,domain) values ('LICENSING','BP');
insert  into lguname_system.sys_role(name,domain) values ('LIQUIDATING_OFFICER','TREASURY');
insert  into lguname_system.sys_role(name,domain) values ('MASTER_ENCODER','BP');
insert  into lguname_system.sys_role(name,domain) values ('MASTER_ENCODER','RPT');
insert  into lguname_system.sys_role(name,domain) values ('MASTER_ENCODER','TREASURY');
insert  into lguname_system.sys_role(name,domain) values ('MUNICIPAL_ASSESSOR','RPT');
insert  into lguname_system.sys_role(name,domain) values ('PROVINCIAL_ASSESSOR','RPT');
insert  into lguname_system.sys_role(name,domain) values ('RELEASING','BP');
insert  into lguname_system.sys_role(name,domain) values ('RULE_AUTHOR','BP');
insert  into lguname_system.sys_role(name,domain) values ('RULE_AUTHOR','CTC');
insert  into lguname_system.sys_role(name,domain) values ('RULE_AUTHOR','RPT');
insert  into lguname_system.sys_role(name,domain) values ('RULE_MANAGEMENT','RULEMGMT');
insert  into lguname_system.sys_role(name,domain) values ('SHARED','BP');
insert  into lguname_system.sys_role(name,domain) values ('SHARED','RPT');
insert  into lguname_system.sys_role(name,domain) values ('SUBCOLLECTOR','TREASURY');
insert  into lguname_system.sys_role(name,domain) values ('TREASURY_ADMIN','TREASURY');
insert  into lguname_system.sys_role(name,domain) values ('TREASURY_REPORTS','TREASURY');


insert  into lguname_etracs.role(role,domain,description,sysrole,excluded,system) values ('AFO','TREASURY',NULL,'AFO',NULL,1);
insert  into lguname_etracs.role(role,domain,description,sysrole,excluded,system) values ('APPRAISER','RPT',NULL,'APPRAISER',NULL,1);
insert  into lguname_etracs.role(role,domain,description,sysrole,excluded,system) values ('APPROVER','RPT',NULL,'APPROVER',NULL,1);
insert  into lguname_etracs.role(role,domain,description,sysrole,excluded,system) values ('ASSESSOR_REPORTS','RPT',NULL,'ASSESSOR_REPORTS',NULL,1);
insert  into lguname_etracs.role(role,domain,description,sysrole,excluded,system) values ('BP_REPORTS','BP',NULL,'BP_REPORTS',NULL,1);
insert  into lguname_etracs.role(role,domain,description,sysrole,excluded,system) values ('CASHIER','TREASURY',NULL,'CASHIER',NULL,1);
insert  into lguname_etracs.role(role,domain,description,sysrole,excluded,system) values ('CERTIFICATION_ISSUANCE','RPT',NULL,'CERTIFICATION_ISSUANCE',NULL,1);
insert  into lguname_etracs.role(role,domain,description,sysrole,excluded,system) values ('CITY_ASSESSOR','RPT',NULL,'CITY_ASSESSOR',NULL,1);
insert  into lguname_etracs.role(role,domain,description,sysrole,excluded,system) values ('COLLECTOR','BP',NULL,'COLLECTOR',NULL,1);
insert  into lguname_etracs.role(role,domain,description,sysrole,excluded,system) values ('COLLECTOR','TREASURY',NULL,'COLLECTOR',NULL,1);
insert  into lguname_etracs.role(role,domain,description,sysrole,excluded,system) values ('ENTITY_ENCODER','ENTITY',NULL,'ENTITY_ENCODER',NULL,1);
insert  into lguname_etracs.role(role,domain,description,sysrole,excluded,system) values ('LANDTAX','RPT',NULL,'LANDTAX',NULL,1);
insert  into lguname_etracs.role(role,domain,description,sysrole,excluded,system) values ('LICENSING','BP',NULL,'LICENSING',NULL,1);
insert  into lguname_etracs.role(role,domain,description,sysrole,excluded,system) values ('LIQUIDATING_OFFICER','TREASURY',NULL,'LIQUIDATING_OFFICER',NULL,1);
insert  into lguname_etracs.role(role,domain,description,sysrole,excluded,system) values ('MASTER_ENCODER','BP',NULL,'MASTER_ENCODER',NULL,1);
insert  into lguname_etracs.role(role,domain,description,sysrole,excluded,system) values ('MASTER_ENCODER','RPT',NULL,'MASTER_ENCODER',NULL,1);
insert  into lguname_etracs.role(role,domain,description,sysrole,excluded,system) values ('MASTER_ENCODER','TREASURY',NULL,'MASTER_ENCODER',NULL,1);
insert  into lguname_etracs.role(role,domain,description,sysrole,excluded,system) values ('MUNICIPAL_ASSESSOR','RPT',NULL,'MUNICIPAL_ASSESSOR',NULL,1);
insert  into lguname_etracs.role(role,domain,description,sysrole,excluded,system) values ('PROVINCIAL_ASSESSOR','RPT',NULL,'PROVINCIAL_ASSESSOR',NULL,1);
insert  into lguname_etracs.role(role,domain,description,sysrole,excluded,system) values ('RELEASING','BP',NULL,'RELEASING',NULL,1);
insert  into lguname_etracs.role(role,domain,description,sysrole,excluded,system) values ('RULE_AUTHOR','BP',NULL,'RULE_AUTHOR',NULL,1);
insert  into lguname_etracs.role(role,domain,description,sysrole,excluded,system) values ('RULE_AUTHOR','CTC',NULL,'RULE_AUTHOR',NULL,1);
insert  into lguname_etracs.role(role,domain,description,sysrole,excluded,system) values ('RULE_AUTHOR','RPT',NULL,'RULE_AUTHOR',NULL,1);
insert  into lguname_etracs.role(role,domain,description,sysrole,excluded,system) values ('RULE_MANAGEMENT','RULEMGMT',NULL,'RULE_MANAGEMENT',NULL,1);
insert  into lguname_etracs.role(role,domain,description,sysrole,excluded,system) values ('SHARED','BP',NULL,'SHARED',NULL,1);
insert  into lguname_etracs.role(role,domain,description,sysrole,excluded,system) values ('SHARED','RPT',NULL,'SHARED',NULL,1);
insert  into lguname_etracs.role(role,domain,description,sysrole,excluded,system) values ('SUBCOLLECTOR','TREASURY',NULL,'SUBCOLLECTOR',NULL,1);
insert  into lguname_etracs.role(role,domain,description,sysrole,excluded,system) values ('TREASURY_ADMIN','TREASURY',NULL,'TREASURY_ADMIN',NULL,1);
insert  into lguname_etracs.role(role,domain,description,sysrole,excluded,system) values ('TREASURY_REPORTS','TREASURY',NULL,'TREASURY_REPORTS',NULL,1);



INSERT INTO lguname_etracs.`jobposition_role`(jobpositionid, role, domain, sysrole) 
SELECT t.jobid, t.tagid, s.domain, t.tagid FROM lguname_etracs.`jobposition_tag` t, lguname_system.`sys_role` s
WHERE t.tagid = s.name ;

