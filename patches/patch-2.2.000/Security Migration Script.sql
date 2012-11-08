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


-- drop table lguname_system.sys_roleclass_module;

-- drop table lguname_system.sys_module;
-- drop table lguname_system.sys_roleclass;




INSERT INTO lguname_system.sys_role (`name`)
SELECT DISTINCT tagid FROM lguname_etracs.`jobposition_tag`;


DELETE FROM lguname_etracs.role;

INSERT INTO lguname_etracs.role (role, sysrole, domain, system)
SELECT `name`, `name`, domain, 1 FROM lguname_system.`sys_role`;


INSERT INTO lguname_etracs.`jobposition_role`(jobpositionid, role, domain, sysrole) 
SELECT t.jobid, t.tagid, s.domain, t.tagid FROM lguname_etracs.`jobposition_tag` t, lguname_system.`sys_role` s
WHERE t.tagid = s.name ;



INSERT INTO lguname_system.`sys_role_permission` (sysrole, domain, `key`, title, module)
VALUES('COLLECTOR', 'TREASURY', 'remittance.create', 'Perform Remittance', 'TC2');

INSERT INTO lguname_system.`sys_role_permission` (sysrole, domain, `key`, title, module)
VALUES('COLLECTOR', 'TREASURY', 'collection.create_online', 'Online Collection', 'TC2');








