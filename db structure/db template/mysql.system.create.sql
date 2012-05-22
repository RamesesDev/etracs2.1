/*
SQLyog Enterprise - MySQL GUI v7.15 
MySQL - 5.0.27-community-nt : Database - sancarlos_system2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `rule` */

DROP TABLE IF EXISTS `rule`;

CREATE TABLE `rule` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(25) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `docstate` varchar(25) NOT NULL,
  `rulename` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `packagename` varchar(100) NOT NULL,
  `author` varchar(50) NOT NULL,
  `salience` int(11) NOT NULL,
  `agendagroupid` varchar(50) NOT NULL,
  `agendagroup` varchar(25) NOT NULL,
  `ruleset` varchar(50) NOT NULL,
  `effectivefrom` date default NULL,
  `effectiveto` date default NULL,
  `ruletext` text,
  `conditions` text,
  `actions` text,
  `extended` text,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `ruleset_rulename` (`rulename`,`ruleset`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `rule_package` */

DROP TABLE IF EXISTS `rule_package`;

CREATE TABLE `rule_package` (
  `ruleset` varchar(50) NOT NULL,
  `rulegroup` varchar(50) NOT NULL,
  `packagename` varchar(255) NOT NULL,
  `orderindex` int(11) default NULL,
  `type` varchar(10) default NULL,
  `content` text,
  `lastmodified` datetime default NULL,
  PRIMARY KEY  (`ruleset`,`rulegroup`,`packagename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `rule_sets` */

DROP TABLE IF EXISTS `rule_sets`;

CREATE TABLE `rule_sets` (
  `name` varchar(50) NOT NULL default '',
  `rulegroup` varchar(50) NOT NULL,
  PRIMARY KEY  (`name`,`rulegroup`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `rulegroup` */

DROP TABLE IF EXISTS `rulegroup`;

CREATE TABLE `rulegroup` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) default NULL,
  `sortorder` int(11) default NULL,
  `ruleset` varchar(50) NOT NULL,
  PRIMARY KEY  (`objid`,`ruleset`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_async_response` */

DROP TABLE IF EXISTS `sys_async_response`;

CREATE TABLE `sys_async_response` (
  `objid` varchar(50) NOT NULL,
  `requestId` varchar(50) default NULL,
  `data` blob,
  `expiryDate` datetime default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_cache` */

DROP TABLE IF EXISTS `sys_cache`;

CREATE TABLE `sys_cache` (
  `id` varchar(50) NOT NULL,
  `host` varchar(50) default NULL,
  PRIMARY KEY  (`id`),
  KEY `host` (`host`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `sys_cluster_host` */

DROP TABLE IF EXISTS `sys_cluster_host`;

CREATE TABLE `sys_cluster_host` (
  `name` varchar(50) NOT NULL,
  `context` varchar(50) default NULL,
  `host` varchar(50) default NULL,
  PRIMARY KEY  (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `sys_ds` */

DROP TABLE IF EXISTS `sys_ds`;

CREATE TABLE `sys_ds` (
  `name` varchar(50) NOT NULL,
  `host` varchar(20) default NULL,
  `dbname` varchar(50) default NULL,
  `user` varchar(50) default NULL,
  `pwd` varchar(50) default NULL,
  `scheme` varchar(10) default NULL,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_module` */

DROP TABLE IF EXISTS `sys_module`;

CREATE TABLE `sys_module` (
  `name` varchar(50) NOT NULL,
  `title` varchar(50) default NULL,
  `description` varchar(255) default NULL,
  `version` decimal(10,4) default NULL,
  `filename` varchar(255) default NULL,
  `lastmodified` datetime default NULL,
  `permissions` mediumtext,
  PRIMARY KEY  (`name`),
  UNIQUE KEY `filename` (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_roleclass` */

DROP TABLE IF EXISTS `sys_roleclass`;

CREATE TABLE `sys_roleclass` (
  `name` varchar(50) NOT NULL,
  `description` varchar(50) default NULL,
  `rolelevel` int(11) default NULL,
  `tags` mediumtext,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_roleclass_module` */

DROP TABLE IF EXISTS `sys_roleclass_module`;

CREATE TABLE `sys_roleclass_module` (
  `roleclass` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  PRIMARY KEY  (`roleclass`,`module`),
  KEY `FK_roleclass_module_module1` (`module`),
  CONSTRAINT `FK_roleclass_module_module` FOREIGN KEY (`module`) REFERENCES `sys_module` (`name`),
  CONSTRAINT `FK_sys_roleclass_module` FOREIGN KEY (`roleclass`) REFERENCES `sys_roleclass` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_schema` */

DROP TABLE IF EXISTS `sys_schema`;

CREATE TABLE `sys_schema` (
  `name` varchar(50) NOT NULL,
  `content` text,
  `category` varchar(255) default NULL,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_script` */

DROP TABLE IF EXISTS `sys_script`;

CREATE TABLE `sys_script` (
  `name` varchar(50) NOT NULL,
  `content` text,
  `category` varchar(255) default NULL,
  `notes` text,
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `sys_sequence` */

DROP TABLE IF EXISTS `sys_sequence`;

CREATE TABLE `sys_sequence` (
  `objid` varchar(100) NOT NULL,
  `nextSeries` int(11) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_session` */

DROP TABLE IF EXISTS `sys_session`;

CREATE TABLE `sys_session` (
  `sessionid` varchar(50) NOT NULL,
  `username` varchar(50) default NULL,
  `host` varchar(50) default NULL,
  `dtaccessed` datetime default NULL,
  PRIMARY KEY  (`sessionid`),
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `sys_sql` */

DROP TABLE IF EXISTS `sys_sql`;

CREATE TABLE `sys_sql` (
  `name` varchar(50) NOT NULL,
  `content` text,
  `category` varchar(255) default NULL,
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `sys_task` */

DROP TABLE IF EXISTS `sys_task`;

CREATE TABLE `sys_task` (
  `id` varchar(50) NOT NULL,
  `appcontext` varchar(50) default NULL,
  `apphost` varchar(50) default NULL,
  `service` varchar(50) default NULL,
  `servicetype` varchar(10) default NULL,
  `method` varchar(50) default NULL,
  `startdate` datetime default NULL,
  `enddate` datetime default NULL,
  `currentdate` datetime default NULL,
  `interval` varchar(5) default NULL,
  `parameters` text,
  `allowedhost` varchar(50) default NULL,
  `description` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_task_active` */

DROP TABLE IF EXISTS `sys_task_active`;

CREATE TABLE `sys_task_active` (
  `id` varchar(50) NOT NULL,
  `host` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_task_error` */

DROP TABLE IF EXISTS `sys_task_error`;

CREATE TABLE `sys_task_error` (
  `id` varchar(50) NOT NULL,
  `message` mediumtext,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_task_suspended` */

DROP TABLE IF EXISTS `sys_task_suspended`;

CREATE TABLE `sys_task_suspended` (
  `id` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_template` */

DROP TABLE IF EXISTS `sys_template`;

CREATE TABLE `sys_template` (
  `name` varchar(50) NOT NULL,
  `content` text,
  `category` varchar(255) default NULL,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_var` */

DROP TABLE IF EXISTS `sys_var`;

CREATE TABLE `sys_var` (
  `name` varchar(50) NOT NULL,
  `value` text,
  `description` varchar(255) default NULL,
  `datatype` varchar(15) default NULL,
  `category` varchar(50) default NULL,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
