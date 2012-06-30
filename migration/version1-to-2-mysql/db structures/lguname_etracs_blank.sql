/*
SQLyog Enterprise - MySQL GUI v7.15 
MySQL - 5.0.27-community-nt : Database - sancarlos_etracs
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(100) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `fromyear` int(11) NOT NULL,
  `toyear` int(11) default NULL,
  `acctcode` varchar(25) NOT NULL,
  `accttitle` varchar(150) NOT NULL,
  `charttype` varchar(25) NOT NULL,
  `accttype` varchar(25) NOT NULL,
  `target` decimal(10,2) default NULL,
  `acctlevel` int(11) NOT NULL,
  `parentid` varchar(50) default NULL,
  `rootid` varchar(50) default NULL,
  `pathbyids` varchar(200) default NULL,
  `pathbytitle` varchar(200) default NULL,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `ux_title_parentid` (`accttitle`,`parentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `account` */

/*Table structure for table `active_session` */

DROP TABLE IF EXISTS `active_session`;

CREATE TABLE `active_session` (
  `sessionid` varchar(50) NOT NULL,
  `timein` datetime default NULL,
  `uid` varchar(50) default NULL,
  `expirydate` datetime default NULL,
  PRIMARY KEY  (`sessionid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `active_session` */

/*Table structure for table `af` */

DROP TABLE IF EXISTS `af`;

CREATE TABLE `af` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(10) NOT NULL,
  `docstate` varchar(10) NOT NULL,
  `description` varchar(100) default NULL,
  `aftype` varchar(10) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `pcsperunit` int(11) NOT NULL,
  `denomination` decimal(10,2) default NULL,
  `serieslength` int(11) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `af` */

/*Table structure for table `afcontrol` */

DROP TABLE IF EXISTS `afcontrol`;

CREATE TABLE `afcontrol` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `docstate` varchar(30) NOT NULL,
  `active` int(11) NOT NULL,
  `mode` varchar(25) NOT NULL,
  `afinventorycreditid` varchar(50) NOT NULL,
  `dtissued` date NOT NULL,
  `collectorid` varchar(50) NOT NULL,
  `collectorname` varchar(75) NOT NULL,
  `collectortitle` varchar(50) NOT NULL,
  `stubno` varchar(20) NOT NULL,
  `aftype` varchar(25) NOT NULL,
  `afid` varchar(50) NOT NULL,
  `qtyreceived` int(11) NOT NULL,
  `startseries` int(11) default NULL,
  `endseries` int(11) default NULL,
  `currentseries` int(11) default NULL,
  `beginseries` int(11) default NULL,
  `beginqty` int(11) default NULL,
  `qtyissued` int(11) default NULL,
  `issuedfrom` int(11) default NULL,
  `issuedto` int(11) default NULL,
  `balance` int(11) default NULL,
  `prefix` varchar(10) default NULL,
  `suffix` varchar(10) default NULL,
  `serieslength` int(11) default NULL,
  `receiptformat` varchar(50) default NULL,
  `cancelledseries` text,
  `txndate` date default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_afcontrol_collectorid` (`collectorid`),
  KEY `ix_afcontrol_collectorname` (`collectorname`),
  KEY `ix_afcontrol_afid` (`afid`),
  KEY `ix_afcontrol_colid_afid` (`collectorid`,`afid`),
  KEY `ix_afcontrol_colafstatemode` (`collectorid`,`afid`,`docstate`,`mode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `afcontrol` */

/*Table structure for table `afcontroltransfer` */

DROP TABLE IF EXISTS `afcontroltransfer`;

CREATE TABLE `afcontroltransfer` (
  `objid` varchar(50) NOT NULL,
  `docstate` varchar(30) NOT NULL,
  `txndate` date NOT NULL,
  `afcontrolid` varchar(50) NOT NULL,
  `transferafcontrolid` varchar(50) NOT NULL,
  `collectorid` varchar(50) NOT NULL,
  `transfercollectorid` varchar(50) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `afcontroltransfer` */

/*Table structure for table `afinventory` */

DROP TABLE IF EXISTS `afinventory`;

CREATE TABLE `afinventory` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(25) NOT NULL,
  `schemaversion` varchar(10) NOT NULL,
  `docstate` varchar(35) NOT NULL,
  `irafid` varchar(50) NOT NULL,
  `irafno` varchar(50) NOT NULL,
  `iraftype` varchar(25) NOT NULL,
  `afid` varchar(50) NOT NULL,
  `aftype` varchar(10) NOT NULL,
  `afunit` varchar(20) NOT NULL,
  `stubfrom` int(11) NOT NULL,
  `stubto` int(11) NOT NULL,
  `qtyonhand` int(11) NOT NULL,
  `qtyissued` int(11) NOT NULL,
  `prefix` varchar(10) default NULL,
  `suffix` varchar(10) default NULL,
  `startseries` int(11) NOT NULL,
  `endseries` int(11) NOT NULL,
  `issuedfrom` int(11) default NULL,
  `issuedto` int(11) default NULL,
  `dtposted` timestamp NULL default NULL,
  `aflength` int(11) default NULL,
  `currentstub` int(11) default NULL,
  `stubprefix` varchar(50) default NULL,
  `startserialno` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `afinventory` */

/*Table structure for table `afinventorycredit` */

DROP TABLE IF EXISTS `afinventorycredit`;

CREATE TABLE `afinventorycredit` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(10) NOT NULL,
  `docstate` varchar(25) NOT NULL,
  `afinventoryid` varchar(50) NOT NULL,
  `irafid` varchar(50) NOT NULL,
  `iraftype` varchar(25) NOT NULL,
  `afid` varchar(50) NOT NULL,
  `aftype` varchar(15) NOT NULL,
  `afunit` varchar(15) NOT NULL,
  `prefix` varchar(20) default NULL,
  `suffix` varchar(20) default NULL,
  `startseries` int(11) default NULL,
  `endseries` int(11) default NULL,
  `stubfrom` int(11) default NULL,
  `stubto` int(11) default NULL,
  `qtyissued` int(11) default NULL,
  `irafno` varchar(50) default NULL,
  `stubno` varchar(50) default NULL,
  `balance` int(11) default NULL,
  `aflength` int(11) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `afinventorycredit` */

/*Table structure for table `bank` */

DROP TABLE IF EXISTS `bank`;

CREATE TABLE `bank` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(50) NOT NULL,
  `bankcode` varchar(50) NOT NULL,
  `bankname` varchar(50) NOT NULL,
  `branchname` varchar(50) NOT NULL,
  `address` varchar(100) default NULL,
  `manager` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `bank` */

/*Table structure for table `bankaccount` */

DROP TABLE IF EXISTS `bankaccount`;

CREATE TABLE `bankaccount` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(50) NOT NULL,
  `docstate` varchar(50) NOT NULL,
  `accttype` varchar(50) NOT NULL,
  `acctno` varchar(50) NOT NULL,
  `fund` varchar(50) NOT NULL,
  `bankid` varchar(50) NOT NULL,
  `bankcode` varchar(50) NOT NULL,
  `bankname` varchar(50) NOT NULL,
  `branchname` varchar(50) NOT NULL,
  `fundid` varchar(50) NOT NULL,
  `bankacctname` varchar(50) NOT NULL,
  `currency` varchar(50) NOT NULL,
  `cashreport` varchar(50) default NULL,
  `cashbreakdownreport` varchar(50) default NULL,
  `checkreport` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `bankaccount` */

/*Table structure for table `batchcapture` */

DROP TABLE IF EXISTS `batchcapture`;

CREATE TABLE `batchcapture` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(25) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `docstate` varchar(25) NOT NULL,
  `afid` varchar(5) NOT NULL,
  `startseries` int(11) NOT NULL,
  `series` int(11) NOT NULL,
  `collector` text NOT NULL,
  `afcontrol` text NOT NULL,
  `collectiontype` text NOT NULL,
  `defaulttxndate` date NOT NULL,
  `items` text NOT NULL,
  `extended` text,
  `encodedbyid` varchar(50) NOT NULL,
  `encodedby` varchar(100) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `collectorid` varchar(50) NOT NULL,
  `collectorname` varchar(100) NOT NULL,
  `opener` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_batchcapture_state` (`docstate`),
  KEY `ix_batchcapture_colname` (`collectorname`),
  KEY `ix_batchcapture_encodedby` (`encodedby`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `batchcapture` */

/*Table structure for table `bldgadditionalitem` */

DROP TABLE IF EXISTS `bldgadditionalitem`;

CREATE TABLE `bldgadditionalitem` (
  `objid` varchar(50) NOT NULL,
  `bldgrysettingid` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `unit` varchar(25) NOT NULL,
  `expr` varchar(100) NOT NULL,
  `previd` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `bldgadditionalitem` */

/*Table structure for table `bldgassesslevel` */

DROP TABLE IF EXISTS `bldgassesslevel`;

CREATE TABLE `bldgassesslevel` (
  `objid` varchar(50) NOT NULL,
  `bldgrysettingid` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `fixrate` int(11) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `previd` varchar(50) default NULL,
  `ranges` text,
  PRIMARY KEY  (`objid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `bldgassesslevel` */

/*Table structure for table `bldgkindbucc` */

DROP TABLE IF EXISTS `bldgkindbucc`;

CREATE TABLE `bldgkindbucc` (
  `objid` varchar(50) NOT NULL,
  `bldgrysettingid` varchar(50) NOT NULL,
  `bldgtypeid` varchar(50) NOT NULL,
  `bldgkindid` varchar(50) NOT NULL,
  `bldgkindcode` varchar(10) NOT NULL,
  `bldgkindname` varchar(100) NOT NULL,
  `basevaluetype` varchar(25) NOT NULL,
  `basevalue` decimal(10,2) NOT NULL,
  `minbasevalue` decimal(10,2) NOT NULL,
  `maxbasevalue` decimal(10,2) NOT NULL,
  `gapvalue` int(11) NOT NULL,
  `minarea` decimal(10,2) NOT NULL,
  `maxarea` decimal(10,2) NOT NULL,
  `bldgclass` varchar(20) default NULL,
  `previd` varchar(50) default NULL,
  `extended` text,
  PRIMARY KEY  (`objid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `bldgkindbucc` */

/*Table structure for table `bldgrysetting` */

DROP TABLE IF EXISTS `bldgrysetting`;

CREATE TABLE `bldgrysetting` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `ry` int(11) NOT NULL,
  `predominant` int(11) NOT NULL,
  `depreciatecoreanditemseparately` int(11) NOT NULL,
  `computedepreciationbasedonschedule` int(11) NOT NULL,
  `previd` varchar(50) default NULL,
  `straightdepreciation` int(11) default NULL,
  `calcbldgagebasedondtoccupied` int(11) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `bldgrysetting` */

/*Table structure for table `bldgtype` */

DROP TABLE IF EXISTS `bldgtype`;

CREATE TABLE `bldgtype` (
  `objid` varchar(50) NOT NULL,
  `bldgrysettingid` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `basevaluetype` varchar(10) NOT NULL,
  `residualrate` decimal(10,2) NOT NULL,
  `multistoreyadjustments` text,
  `depreciations` text,
  `previd` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `bldgtype` */

/*Table structure for table `bpappinfolisting` */

DROP TABLE IF EXISTS `bpappinfolisting`;

CREATE TABLE `bpappinfolisting` (
  `objid` varchar(100) NOT NULL,
  `applicationid` varchar(50) default NULL,
  `lobid` varchar(50) default NULL,
  `lobname` varchar(100) default NULL,
  `varid` varchar(50) default NULL,
  `varname` varchar(100) default NULL,
  `vartype` varchar(100) default NULL,
  `value` varchar(100) default NULL,
  `arrayvalues` text,
  `requiredbeforeprint` tinyint(1) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bpappinfolisting` */

/*Table structure for table `bpapplication` */

DROP TABLE IF EXISTS `bpapplication`;

CREATE TABLE `bpapplication` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(50) NOT NULL,
  `docstate` varchar(15) NOT NULL,
  `businessid` varchar(50) default NULL,
  `info` text,
  `txnmode` varchar(15) NOT NULL,
  `txntype` varchar(15) NOT NULL,
  `taxpayerid` varchar(50) NOT NULL,
  `tradename` varchar(500) NOT NULL,
  `businessaddress` varchar(500) NOT NULL,
  `txndate` date NOT NULL,
  `txnno` varchar(200) NOT NULL,
  `iyear` int(11) NOT NULL,
  `parentid` varchar(50) default NULL,
  `extended` text,
  `barcode` varchar(100) default NULL,
  `lobs` text,
  `appinfos` text,
  `taxfees` text,
  `receivables` text,
  `credits` text,
  `assessments` text,
  PRIMARY KEY  (`objid`),
  KEY `ix_bpapplication_docstate` (`docstate`),
  KEY `ix_bpapplication_businesid` (`businessid`),
  KEY `ix_bpapplication_businesid_docstate` (`businessid`,`docstate`),
  KEY `ix_bpapplication_txnno` (`txnno`),
  KEY `ix_bpapplication_tradename` (`tradename`),
  KEY `ix_bpapplication_barcode` (`barcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bpapplication` */

/*Table structure for table `bpapplication_list` */

DROP TABLE IF EXISTS `bpapplication_list`;

CREATE TABLE `bpapplication_list` (
  `objid` varchar(50) NOT NULL,
  `txnno` varchar(100) NOT NULL,
  `tradename` varchar(500) NOT NULL,
  `businessaddress` varchar(500) NOT NULL,
  `taxpayername` varchar(500) NOT NULL,
  `taxpayeraddress` varchar(500) NOT NULL,
  `txntype` varchar(50) NOT NULL,
  `txnmode` varchar(50) NOT NULL,
  `txndate` date NOT NULL,
  `iyear` bigint(20) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bpapplication_list` */

/*Table structure for table `bpapplicationlisting` */

DROP TABLE IF EXISTS `bpapplicationlisting`;

CREATE TABLE `bpapplicationlisting` (
  `objid` varchar(50) NOT NULL,
  `txnno` varchar(100) default NULL,
  `txntype` varchar(50) default NULL,
  `txnmode` varchar(50) default NULL,
  `barcode` varchar(100) default NULL,
  `docstate` varchar(100) default NULL,
  `taxpayerid` varchar(50) default NULL,
  `taxpayername` varchar(500) default NULL,
  `taxpayeraddress` varchar(500) default NULL,
  `tradename` varchar(500) default NULL,
  `businessaddress` varchar(500) default NULL,
  `tin` varchar(100) default NULL,
  `bin` varchar(100) default NULL,
  `pin` varchar(100) default NULL,
  `officetype` varchar(100) default NULL,
  `organization` varchar(100) default NULL,
  `ctcno` varchar(100) default NULL,
  `ctcplaceissued` varchar(100) default NULL,
  `ctcdateissued` varchar(100) default NULL,
  `administratorname` varchar(500) default NULL,
  `administratoraddress` varchar(500) default NULL,
  `iyear` int(11) default NULL,
  `businessid` varchar(50) default NULL,
  `parentid` varchar(50) default NULL,
  `barangayid` varchar(50) default NULL,
  `barangayname` varchar(50) default NULL,
  `txndate` date default NULL,
  `fullypaid` int(11) default '0',
  PRIMARY KEY  (`objid`),
  KEY `ix_bpapplicationlisting_businessid` (`businessid`),
  KEY `ix_bpapplicationlisting_tradename` (`tradename`),
  KEY `ix_bpapplicationlisting_docstate` (`docstate`),
  KEY `ix_bpapplicationlisting_txnno` (`txnno`),
  KEY `ix_bpapplicationlisting_businesid_docstate` (`businessid`,`docstate`),
  KEY `ix_bpapplicationlisting_tradenamedocstate` (`tradename`,`docstate`),
  KEY `ix_bpapplicationlisting_taxpayernamedocstate` (`taxpayername`,`docstate`),
  KEY `ix_bpapplicationlisting_bindocstate` (`bin`,`docstate`),
  KEY `ix_bpapplicationlisting_txnnodocstate` (`txnno`,`docstate`),
  KEY `ix_bpapplicationlisting_barcode` (`barcode`),
  KEY `ix_bpapplicationlisting_sym` (`docstate`,`iyear`,`txnmode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bpapplicationlisting` */

/*Table structure for table `bploblisting` */

DROP TABLE IF EXISTS `bploblisting`;

CREATE TABLE `bploblisting` (
  `objid` varchar(100) NOT NULL,
  `applicationid` varchar(50) default NULL,
  `lobid` varchar(50) default NULL,
  `classificationid` varchar(50) default NULL,
  `name` varchar(100) default NULL,
  `iyear` int(11) default NULL,
  `assessmenttype` varchar(100) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_bploblisting_appid` (`applicationid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bploblisting` */

/*Table structure for table `bppayment` */

DROP TABLE IF EXISTS `bppayment`;

CREATE TABLE `bppayment` (
  `objid` varchar(50) default NULL,
  `applicationid` varchar(50) default NULL,
  `receiptid` varchar(50) default NULL,
  `afid` varchar(20) default NULL,
  `serialno` varchar(30) default NULL,
  `txndate` date default NULL,
  `iyear` int(11) default NULL,
  `iqtr` int(11) default NULL,
  `imonth` int(11) default NULL,
  `iday` int(11) default NULL,
  `paidyear` int(11) default NULL,
  `paidqtr` int(11) default NULL,
  `lobid` varchar(50) default NULL,
  `lobname` varchar(50) default NULL,
  `acctid` varchar(50) default NULL,
  `accttitle` varchar(150) default NULL,
  `amount` decimal(10,2) default NULL,
  `surcharge` decimal(10,2) default NULL,
  `interest` decimal(10,2) default NULL,
  `discount` decimal(10,2) default NULL,
  `total` decimal(10,2) default NULL,
  `voided` int(11) default NULL,
  KEY `ix_bppayment_applicationid` (`applicationid`),
  KEY `ix_bppayment_txndate` (`txndate`),
  KEY `ix_bppayment_receiptid` (`receiptid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bppayment` */

/*Table structure for table `bppermit` */

DROP TABLE IF EXISTS `bppermit`;

CREATE TABLE `bppermit` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(255) default NULL,
  `schemaversion` varchar(10) default NULL,
  `txnno` varchar(100) default NULL,
  `txndate` date default NULL,
  `docstate` varchar(25) default NULL,
  `taxpayerid` varchar(50) default NULL,
  `taxpayername` varchar(500) default NULL,
  `taxpayeraddress` varchar(500) default NULL,
  `businessid` varchar(500) default NULL,
  `tradename` varchar(500) default NULL,
  `businessaddress` varchar(500) default NULL,
  `lobs` text,
  `applicationid` varchar(50) default NULL,
  `iyear` int(11) default NULL,
  `plateno` varchar(50) default NULL,
  `info` text,
  PRIMARY KEY  (`objid`),
  KEY `ix_bppermit_businessid` (`businessid`),
  KEY `ix_bppermit_appid` (`applicationid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bppermit` */

/*Table structure for table `bpreceivable` */

DROP TABLE IF EXISTS `bpreceivable`;

CREATE TABLE `bpreceivable` (
  `objid` varchar(32) NOT NULL,
  `businessid` varchar(32) NOT NULL,
  `applicationid` varchar(32) NOT NULL,
  `applicationtype` varchar(10) NOT NULL,
  `appno` varchar(100) NOT NULL,
  `iyear` int(11) NOT NULL,
  `lobid` varchar(32) default NULL,
  `lobname` varchar(200) default NULL,
  `acctid` varchar(32) NOT NULL,
  `accttitle` varchar(200) NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  `amtpaid` decimal(9,2) NOT NULL,
  `iqtr` int(11) default NULL,
  `acctno` varchar(32) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Data for the table `bpreceivable` */

/*Table structure for table `bpreceivablecredit` */

DROP TABLE IF EXISTS `bpreceivablecredit`;

CREATE TABLE `bpreceivablecredit` (
  `objid` varchar(50) NOT NULL default '',
  `bpreceivableid` varchar(50) NOT NULL default '',
  `refid` varchar(50) default '',
  `reftype` varchar(100) NOT NULL,
  `refno` varchar(100) NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  `surcharge` decimal(9,2) NOT NULL,
  `interest` decimal(9,2) NOT NULL,
  `discount` decimal(9,2) NOT NULL,
  `refdate` date default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Data for the table `bpreceivablecredit` */

/*Table structure for table `bpsetting` */

DROP TABLE IF EXISTS `bpsetting`;

CREATE TABLE `bpsetting` (
  `objid` varchar(50) NOT NULL,
  `applicationsignatories` text,
  `assessmentsignatories` text,
  `requirements` text,
  `collection` text,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bpsetting` */

/*Table structure for table `bptaxfeelisting` */

DROP TABLE IF EXISTS `bptaxfeelisting`;

CREATE TABLE `bptaxfeelisting` (
  `objid` varchar(100) NOT NULL,
  `applicationid` varchar(50) default NULL,
  `lobid` varchar(50) default NULL,
  `lobname` varchar(500) default NULL,
  `acctid` varchar(50) default NULL,
  `acctno` varchar(100) default NULL,
  `accttitle` varchar(100) default NULL,
  `assessedvalue` decimal(9,2) default NULL,
  `amountdue` decimal(9,2) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bptaxfeelisting` */

/*Table structure for table `bptxn` */

DROP TABLE IF EXISTS `bptxn`;

CREATE TABLE `bptxn` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(20) NOT NULL,
  `docstate` varchar(10) NOT NULL,
  `info` text NOT NULL,
  `txntype` varchar(20) NOT NULL,
  `business` text,
  `businessid` varchar(50) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bptxn` */

/*Table structure for table `business` */

DROP TABLE IF EXISTS `business`;

CREATE TABLE `business` (
  `objid` varchar(32) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(50) NOT NULL,
  `docstate` varchar(15) NOT NULL,
  `taxpayerid` varchar(32) NOT NULL,
  `taxpayername` varchar(2000) NOT NULL,
  `taxpayeraddress` varchar(2000) NOT NULL,
  `yearstarted` int(11) NOT NULL,
  `dtregistered` date default NULL,
  `sec` varchar(100) default NULL,
  `dti` varchar(100) default NULL,
  `sss` varchar(100) default NULL,
  `pin` varchar(100) default NULL,
  `tin` varchar(100) default NULL,
  `applicationid` varchar(32) NOT NULL,
  `tradename` varchar(100) NOT NULL,
  `businessaddress` varchar(255) NOT NULL,
  `permitid` varchar(50) default NULL,
  `adminid` varchar(50) default NULL,
  `adminname` varchar(100) default NULL,
  `adminaddress` varchar(255) default NULL,
  `organization` varchar(255) default NULL,
  `officetype` varchar(255) default NULL,
  `bin` varchar(255) default NULL,
  `lastyrpaid` int(11) default NULL,
  `lastqtrpaid` int(11) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_business_bin` (`bin`),
  KEY `ix_business_taxpayername` (`taxpayername`(767)),
  KEY `ix_business_adminname` (`adminname`),
  KEY `ix_business_businessaddress` (`businessaddress`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `business` */

/*Table structure for table `cancelannotation` */

DROP TABLE IF EXISTS `cancelannotation`;

CREATE TABLE `cancelannotation` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `docstate` varchar(25) NOT NULL,
  `docno` varchar(15) NOT NULL,
  `fileno` varchar(30) NOT NULL,
  `faasid` varchar(50) NOT NULL,
  `annotationid` varchar(50) NOT NULL,
  `annotationno` varchar(20) NOT NULL,
  `tdno` varchar(25) NOT NULL,
  `submittedby` varchar(50) default NULL,
  `submittedbytitle` varchar(50) default NULL,
  `dtsubmitted` date default NULL,
  `signedby` varchar(50) default NULL,
  `signedbytitle` varchar(50) default NULL,
  `dtsigned` date default NULL,
  `approvedby` varchar(50) default NULL,
  `approvedbytitle` varchar(50) default NULL,
  `dtapproved` date default NULL,
  `remarks` varchar(1000) default NULL,
  `orno` varchar(10) NOT NULL,
  `ordate` date NOT NULL,
  `oramount` decimal(12,2) NOT NULL,
  `extended` text NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cancelannotation` */

/*Table structure for table `cancelfaas` */

DROP TABLE IF EXISTS `cancelfaas`;

CREATE TABLE `cancelfaas` (
  `objid` varchar(50) NOT NULL,
  `docstate` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `tdno` varchar(30) NOT NULL,
  `ownername` varchar(800) NOT NULL,
  `fullpin` varchar(35) NOT NULL,
  `classcode` varchar(10) NOT NULL,
  `faasid` varchar(50) NOT NULL,
  `rputype` varchar(20) NOT NULL,
  `remarks` varchar(200) NOT NULL,
  `dtapproved` date default NULL,
  `approvedby` varchar(100) default NULL,
  `cancelreasonid` varchar(50) NOT NULL,
  `cancelreason` varchar(25) NOT NULL,
  `extended` text,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cancelfaas` */

/*Table structure for table `canceltdreason` */

DROP TABLE IF EXISTS `canceltdreason`;

CREATE TABLE `canceltdreason` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `cancelcode` varchar(10) NOT NULL,
  `canceltitle` varchar(100) NOT NULL,
  `canceldesc` varchar(150) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Data for the table `canceltdreason` */

/*Table structure for table `changeaddresslist` */

DROP TABLE IF EXISTS `changeaddresslist`;

CREATE TABLE `changeaddresslist` (
  `objid` varchar(50) NOT NULL,
  `docstate` varchar(10) NOT NULL,
  `txnno` varchar(20) NOT NULL,
  `txntype` varchar(20) NOT NULL,
  `businessid` varchar(50) NOT NULL,
  `tradename` varchar(100) NOT NULL,
  `prevbusinessaddress` varchar(255) NOT NULL,
  `newbusinessaddress` varchar(255) NOT NULL,
  `taxpayername` varchar(100) NOT NULL,
  `taxpayeraddress` varchar(255) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_changeaddresslist_business` (`businessid`),
  CONSTRAINT `FK_changeaddresslist` FOREIGN KEY (`objid`) REFERENCES `bptxn` (`objid`),
  CONSTRAINT `FK_changeaddresslist_business` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `changeaddresslist` */

/*Table structure for table `changeadminlist` */

DROP TABLE IF EXISTS `changeadminlist`;

CREATE TABLE `changeadminlist` (
  `objid` varchar(50) NOT NULL,
  `docstate` varchar(10) NOT NULL,
  `txnno` varchar(20) NOT NULL,
  `txntype` varchar(20) NOT NULL,
  `businessid` varchar(50) NOT NULL,
  `tradename` varchar(100) NOT NULL,
  `businessaddress` varchar(255) NOT NULL,
  `taxpayername` varchar(100) NOT NULL,
  `taxpayeraddress` varchar(255) NOT NULL,
  `prevadminid` varchar(50) default NULL,
  `prevadminname` varchar(100) default NULL,
  `prevadminaddress` varchar(255) default NULL,
  `newadminid` varchar(50) default NULL,
  `newadminname` varchar(100) default NULL,
  `newadminaddress` varchar(255) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_changeadminlist_newadmin` (`newadminid`),
  KEY `FK_changeadminlist_prevadmin` (`prevadminid`),
  KEY `FK_changeadminlist_business` (`businessid`),
  CONSTRAINT `FK_changeadminlist` FOREIGN KEY (`objid`) REFERENCES `bptxn` (`objid`),
  CONSTRAINT `FK_changeadminlist_business` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`),
  CONSTRAINT `FK_changeadminlist_newadmin` FOREIGN KEY (`newadminid`) REFERENCES `entity` (`objid`),
  CONSTRAINT `FK_changeadminlist_prevadmin` FOREIGN KEY (`prevadminid`) REFERENCES `entity` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `changeadminlist` */

/*Table structure for table `changepermitteelist` */

DROP TABLE IF EXISTS `changepermitteelist`;

CREATE TABLE `changepermitteelist` (
  `objid` varchar(50) NOT NULL,
  `docstate` varchar(20) NOT NULL,
  `txnno` varchar(20) NOT NULL,
  `txntype` varchar(20) NOT NULL,
  `businessid` varchar(50) NOT NULL,
  `tradename` varchar(100) NOT NULL,
  `businessaddress` varchar(255) NOT NULL,
  `prevtaxpayerid` varchar(50) NOT NULL,
  `prevtaxpayername` varchar(100) NOT NULL,
  `prevtaxpayeraddress` varchar(255) NOT NULL,
  `newtaxpayerid` varchar(50) NOT NULL,
  `newtaxpayername` varchar(100) NOT NULL,
  `newtaxpayeraddress` varchar(255) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_changepermitteelist_newtaxpayer` (`newtaxpayerid`),
  KEY `FK_changepermitteelist_prevtaxpayer` (`prevtaxpayerid`),
  KEY `FK_changepermitteelist_business` (`businessid`),
  CONSTRAINT `FK_changepermitteelist` FOREIGN KEY (`objid`) REFERENCES `bptxn` (`objid`),
  CONSTRAINT `FK_changepermitteelist_business` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`),
  CONSTRAINT `FK_changepermitteelist_newtaxpayer` FOREIGN KEY (`newtaxpayerid`) REFERENCES `entity` (`objid`),
  CONSTRAINT `FK_changepermitteelist_prevtaxpayer` FOREIGN KEY (`prevtaxpayerid`) REFERENCES `entity` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `changepermitteelist` */

/*Table structure for table `changetradenamelist` */

DROP TABLE IF EXISTS `changetradenamelist`;

CREATE TABLE `changetradenamelist` (
  `objid` varchar(50) NOT NULL,
  `docstate` varchar(10) NOT NULL,
  `txnno` varchar(20) NOT NULL,
  `businessid` varchar(50) NOT NULL,
  `newtradename` varchar(100) NOT NULL,
  `prevtradename` varchar(100) NOT NULL,
  `taxpayername` varchar(100) NOT NULL,
  `taxpayeraddress` varchar(255) NOT NULL,
  `txntype` varchar(20) NOT NULL,
  `businessaddress` varchar(255) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_changetradenamelist_business` (`businessid`),
  CONSTRAINT `FK_changetradenamelist` FOREIGN KEY (`objid`) REFERENCES `bptxn` (`objid`),
  CONSTRAINT `FK_changetradenamelist_business` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `changetradenamelist` */

/*Table structure for table `citizenship` */

DROP TABLE IF EXISTS `citizenship`;

CREATE TABLE `citizenship` (
  `objid` varchar(100) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `citizenship` */

/*Table structure for table `collectionsetting` */

DROP TABLE IF EXISTS `collectionsetting`;

CREATE TABLE `collectionsetting` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(10) NOT NULL,
  `info` text NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `collectionsetting` */

/*Table structure for table `collectiontype` */

DROP TABLE IF EXISTS `collectiontype`;

CREATE TABLE `collectiontype` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `appcode` varchar(25) NOT NULL,
  `payorrequired` int(11) NOT NULL,
  `afid` varchar(50) NOT NULL,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `afid` (`name`,`afid`),
  KEY `FK_collectiontype` (`afid`),
  KEY `ix_collectiontype_afid` (`afid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `collectiontype` */

/*Table structure for table `consolidation` */

DROP TABLE IF EXISTS `consolidation`;

CREATE TABLE `consolidation` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `docstate` varchar(25) NOT NULL,
  `ry` int(11) NOT NULL,
  `txntype` varchar(5) NOT NULL,
  `autonumber` int(11) NOT NULL,
  `issuedate` date NOT NULL,
  `effectivityyear` int(11) NOT NULL,
  `effectivityqtr` int(11) NOT NULL,
  `memoranda` text,
  `consolidatedlandcount` int(11) NOT NULL,
  `affectedrpucount` int(11) NOT NULL,
  `appraisedby` varchar(50) default NULL,
  `appraisedbytitle` varchar(50) default NULL,
  `dtappraised` date default NULL,
  `recommendedby` varchar(50) default NULL,
  `recommendedbytitle` varchar(50) default NULL,
  `dtrecommended` date default NULL,
  `approvedby` varchar(50) default NULL,
  `approvedbytitle` varchar(50) default NULL,
  `dtapproved` date default NULL,
  `newtdno` varchar(25) default NULL,
  `newpin` varchar(25) default NULL,
  `newtitletype` varchar(10) default NULL,
  `newtitleno` varchar(50) default NULL,
  `newtitledate` date default NULL,
  `areasqm` decimal(16,6) default NULL,
  `areaha` decimal(16,6) default NULL,
  `newtaxpayerid` varchar(50) default NULL,
  `newtaxpayerno` varchar(25) default NULL,
  `newtaxpayername` varchar(500) default NULL,
  `newtaxpayeraddress` varchar(100) default NULL,
  `rp` text NOT NULL,
  `rpu` text NOT NULL,
  `newfaasid` varchar(50) default NULL,
  `extended` text,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `consolidation` */

/*Table structure for table `consolidationaffectedrpu` */

DROP TABLE IF EXISTS `consolidationaffectedrpu`;

CREATE TABLE `consolidationaffectedrpu` (
  `objid` varchar(50) NOT NULL,
  `consolidationid` varchar(50) NOT NULL,
  `rputype` varchar(10) NOT NULL,
  `landfaasid` varchar(50) NOT NULL,
  `prevfaasid` varchar(50) NOT NULL,
  `prevtdno` varchar(25) NOT NULL,
  `prevfullpin` varchar(25) NOT NULL,
  `newtdno` varchar(25) default NULL,
  `newpin` varchar(25) default NULL,
  `newsuffix` int(11) default NULL,
  `memoranda` text,
  `newfaasid` varchar(50) default NULL,
  `extended` text,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `consolidationaffectedrpu` */

/*Table structure for table `consolidationland` */

DROP TABLE IF EXISTS `consolidationland`;

CREATE TABLE `consolidationland` (
  `objid` varchar(50) NOT NULL,
  `consolidationid` varchar(50) NOT NULL,
  `tdno` varchar(25) NOT NULL,
  `pin` varchar(25) NOT NULL,
  `taxpayerid` varchar(50) NOT NULL,
  `taxpayername` text NOT NULL,
  `mv` decimal(12,2) NOT NULL,
  `av` decimal(12,2) NOT NULL,
  `areasqm` decimal(16,6) NOT NULL,
  `areaha` decimal(16,6) NOT NULL,
  `landfaasid` varchar(50) NOT NULL,
  `extended` text,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `consolidationland` */

/*Table structure for table `country` */

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `code` varchar(5) NOT NULL,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `country` */

/*Table structure for table `craaf` */

DROP TABLE IF EXISTS `craaf`;

CREATE TABLE `craaf` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(10) NOT NULL,
  `afinventoryid` varchar(50) default NULL,
  `afinventorycreditid` varchar(50) default NULL,
  `craafyear` int(11) NOT NULL,
  `craafmonth` int(11) NOT NULL,
  `collectorid` varchar(50) default NULL,
  `collectorname` varchar(150) default NULL,
  `collectortitle` varchar(50) default NULL,
  `afid` varchar(50) NOT NULL,
  `beginqty` int(11) default NULL,
  `beginfrom` varchar(50) default NULL,
  `beginto` varchar(50) default NULL,
  `receivedqty` int(11) default NULL,
  `receivedfrom` varchar(50) default NULL,
  `receivedto` varchar(50) default NULL,
  `issuedqty` int(11) default NULL,
  `issuedfrom` varchar(50) default NULL,
  `issuedto` varchar(50) default NULL,
  `canceledqty` int(11) default NULL,
  `canceledfrom` varchar(50) default NULL,
  `canceledto` varchar(50) default NULL,
  `cancelreason` varchar(150) default NULL,
  `endingqty` int(11) default NULL,
  `endingfrom` varchar(50) default NULL,
  `endingto` varchar(50) default NULL,
  `stubno` varchar(30) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `craaf` */

/*Table structure for table `craafcredit` */

DROP TABLE IF EXISTS `craafcredit`;

CREATE TABLE `craafcredit` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(10) NOT NULL,
  `craafid` varchar(50) NOT NULL,
  `reftype` varchar(50) NOT NULL,
  `refno` varchar(50) NOT NULL,
  `refdate` varchar(25) NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `craafcredit` */

/*Table structure for table `deposit` */

DROP TABLE IF EXISTS `deposit`;

CREATE TABLE `deposit` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(25) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `docstate` varchar(20) NOT NULL,
  `txnno` varchar(10) NOT NULL,
  `txndate` date NOT NULL,
  `dtposted` datetime NOT NULL,
  `depositedbyid` varchar(50) NOT NULL,
  `depositedbyname` varchar(50) NOT NULL,
  `depositedbytitle` varchar(25) NOT NULL,
  `cash` decimal(12,2) NOT NULL,
  `noncash` decimal(12,2) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `fundsummaries` text NOT NULL,
  `liquidations` text NOT NULL,
  `fundtotals` text NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_deposit_txnno` (`txnno`),
  KEY `ix_deposit_docstate` (`docstate`),
  KEY `ix_deposit_depositedbyname` (`depositedbyname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `deposit` */

/*Table structure for table `docno_generator` */

DROP TABLE IF EXISTS `docno_generator`;

CREATE TABLE `docno_generator` (
  `name` varchar(50) NOT NULL,
  `prefix` varchar(50) NOT NULL,
  `lastnum` int(11) default NULL,
  PRIMARY KEY  (`name`,`prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `docno_generator` */

/*Table structure for table `entity` */

DROP TABLE IF EXISTS `entity`;

CREATE TABLE `entity` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(100) NOT NULL,
  `schemaversion` varchar(10) NOT NULL,
  `entityno` varchar(10) NOT NULL,
  `entityname` varchar(500) NOT NULL,
  `entityaddress` varchar(100) NOT NULL,
  `mailingaddress` varchar(100) default NULL,
  `entitytype` varchar(25) NOT NULL,
  `info` text NOT NULL,
  `sys_lastupdate` varchar(25) default NULL,
  `sys_lastupdateby` varchar(50) default NULL,
  `remarks` varchar(100) default NULL,
  `contactno` varchar(20) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ux_entity_no` (`entityno`),
  KEY `ix_entity_name` (`entityname`),
  KEY `ix_entity_entityname` (`entityname`),
  KEY `ix_entity_entityno` (`entityno`),
  KEY `ix_entity_entitytype` (`entitytype`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `entity` */

/*Table structure for table `entitymember` */

DROP TABLE IF EXISTS `entitymember`;

CREATE TABLE `entitymember` (
  `objid` varchar(50) NOT NULL,
  `entityid` varchar(50) NOT NULL,
  `itemno` int(11) NOT NULL,
  `prefix` varchar(25) default NULL,
  `taxpayerid` varchar(50) NOT NULL,
  `taxpayername` varchar(1000) NOT NULL,
  `taxpayeraddress` varchar(100) NOT NULL,
  `suffix` varchar(25) default NULL,
  `remarks` varchar(100) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `entitymember` */

/*Table structure for table `examiner` */

DROP TABLE IF EXISTS `examiner`;

CREATE TABLE `examiner` (
  `objid` varchar(50) NOT NULL,
  `schemaName` varchar(50) NOT NULL,
  `schemaVersion` varchar(10) NOT NULL,
  `uid` varchar(50) NOT NULL,
  `municipalities` varchar(1000) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `examiner` */

/*Table structure for table `exemptiontype` */

DROP TABLE IF EXISTS `exemptiontype`;

CREATE TABLE `exemptiontype` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `exemptcode` varchar(10) NOT NULL,
  `exemptdesc` varchar(100) NOT NULL,
  `orderno` int(11) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Data for the table `exemptiontype` */

/*Table structure for table `faas` */

DROP TABLE IF EXISTS `faas`;

CREATE TABLE `faas` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(25) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `docstate` varchar(25) NOT NULL,
  `transmittalid` varchar(50) default NULL,
  `transmitted` int(11) default NULL,
  `info` text NOT NULL,
  `rp` text NOT NULL,
  `rpu` text NOT NULL,
  `previousfaases` text NOT NULL,
  `extended` text,
  `message` text,
  `sys_dtapproved` datetime default NULL,
  `ledgerid` varchar(50) default NULL,
  `attachments` text,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `faas` */

/*Table structure for table `faasannotation` */

DROP TABLE IF EXISTS `faasannotation`;

CREATE TABLE `faasannotation` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `docstate` varchar(25) NOT NULL,
  `doctype` varchar(50) NOT NULL,
  `opener` varchar(25) NOT NULL,
  `docno` varchar(15) NOT NULL,
  `fileno` varchar(30) NOT NULL,
  `faasid` varchar(50) NOT NULL,
  `tdno` varchar(25) NOT NULL,
  `fullpin` varchar(25) NOT NULL,
  `cadastrallotno` varchar(200) NOT NULL,
  `surveyno` varchar(50) default NULL,
  `blockno` varchar(50) default NULL,
  `ownername` varchar(1000) NOT NULL,
  `submittedby` varchar(50) default NULL,
  `submittedbytitle` varchar(50) default NULL,
  `dtsubmitted` date default NULL,
  `signedby` varchar(50) default NULL,
  `signedbytitle` varchar(50) default NULL,
  `dtsigned` date default NULL,
  `approvedby` varchar(50) default NULL,
  `approvedbytitle` varchar(50) default NULL,
  `dtapproved` date default NULL,
  `memoranda` varchar(1000) default NULL,
  `orno` varchar(10) NOT NULL,
  `ordate` date NOT NULL,
  `oramount` decimal(12,2) NOT NULL,
  `details` varchar(250) default NULL,
  `extended` text NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `faasannotation` */

/*Table structure for table `faasannotationtype` */

DROP TABLE IF EXISTS `faasannotationtype`;

CREATE TABLE `faasannotationtype` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `annotationtypecode` varchar(10) NOT NULL,
  `annotationtype` varchar(100) NOT NULL,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `annotationtypecode` (`annotationtypecode`),
  UNIQUE KEY `annotationtype` (`annotationtype`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `faasannotationtype` */

/*Table structure for table `faasattachment` */

DROP TABLE IF EXISTS `faasattachment`;

CREATE TABLE `faasattachment` (
  `objid` varchar(50) NOT NULL,
  `faasid` varchar(50) NOT NULL,
  `docstate` varchar(25) NOT NULL,
  `type` varchar(100) default NULL,
  `filename` varchar(250) default NULL,
  `directory` varchar(250) default NULL,
  `refno` varchar(50) default NULL,
  `refdate` date default NULL,
  `remarks` text,
  `message` varchar(250) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `faasattachment` */

/*Table structure for table `faaslist` */

DROP TABLE IF EXISTS `faaslist`;

CREATE TABLE `faaslist` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `docstate` varchar(25) NOT NULL,
  `datacapture` int(11) NOT NULL,
  `autonumber` int(11) NOT NULL,
  `claimno` varchar(25) default NULL,
  `backtaxyrs` int(11) NOT NULL,
  `landfaasid` varchar(50) default NULL,
  `landfaastaxpayerid` varchar(50) default NULL,
  `txntype` varchar(5) NOT NULL,
  `tdno` varchar(25) default NULL,
  `prevtdno` varchar(200) default NULL,
  `issuedate` date NOT NULL,
  `effectivityyear` int(11) NOT NULL,
  `effectivityqtr` int(11) NOT NULL,
  `titleno` varchar(50) default NULL,
  `titletype` varchar(10) default NULL,
  `titledate` date default NULL,
  `prevtaxpayerid` varchar(50) default NULL,
  `taxpayerid` varchar(50) NOT NULL,
  `taxpayerno` varchar(25) NOT NULL,
  `taxpayername` varchar(500) NOT NULL,
  `taxpayeraddress` varchar(100) NOT NULL,
  `administratorid` varchar(50) default NULL,
  `administratorno` varchar(25) default NULL,
  `administratorname` varchar(100) default NULL,
  `administratoraddress` varchar(100) default NULL,
  `appraisedby` varchar(75) NOT NULL,
  `appraisedbytitle` varchar(30) NOT NULL,
  `recommendedby` varchar(75) default NULL,
  `recommendedbytitle` varchar(30) default NULL,
  `approvedby` varchar(75) NOT NULL,
  `approvedbytitle` varchar(30) NOT NULL,
  `rputype` varchar(10) NOT NULL,
  `ry` int(11) NOT NULL,
  `fullpin` varchar(30) NOT NULL,
  `classid` varchar(50) NOT NULL,
  `classcode` varchar(5) NOT NULL,
  `taxable` int(11) NOT NULL,
  `totalareasqm` decimal(18,6) NOT NULL,
  `totalareaha` decimal(18,6) NOT NULL,
  `totalmv` decimal(14,2) NOT NULL,
  `totalav` decimal(14,2) NOT NULL,
  `pintype` varchar(5) NOT NULL,
  `pin` varchar(30) NOT NULL,
  `provcityindex` varchar(5) NOT NULL,
  `munidistrictindex` varchar(5) NOT NULL,
  `barangayindex` varchar(5) NOT NULL,
  `provcity` varchar(50) NOT NULL,
  `munidistrict` varchar(50) NOT NULL,
  `barangay` varchar(50) NOT NULL,
  `cadastrallotno` varchar(200) NOT NULL,
  `blockno` varchar(25) default NULL,
  `surveyno` varchar(200) default NULL,
  `cancelreason` varchar(25) default NULL,
  `canceldate` date default NULL,
  `cancelledbytdnos` varchar(250) default NULL,
  `ledgerid` varchar(50) default NULL,
  `barangayid` varchar(50) default NULL,
  `ownername` varchar(500) NOT NULL,
  `owneraddress` varchar(100) NOT NULL,
  `txntimestamp` varchar(25) NOT NULL,
  `section` varchar(3) NOT NULL,
  `parcel` varchar(3) NOT NULL,
  `memoranda` varchar(1000) NOT NULL,
  `exemptid` varchar(50) default NULL,
  `exemptcode` varchar(10) default NULL,
  `annotated` int(11) NOT NULL,
  `restriction` varchar(30) default NULL,
  `message` text,
  PRIMARY KEY  (`objid`),
  KEY `ix_brgy_state_section_taxable` (`barangayid`,`docstate`,`section`,`taxable`),
  KEY `ix_faaslist_barangayid_docstate` (`barangayid`,`docstate`),
  KEY `ix_txntimestamp_docstate` (`txntimestamp`,`docstate`),
  KEY `FK_faaslist` (`taxpayerid`),
  KEY `ix_faaslist_annotated` (`annotated`),
  KEY `ix_faaslist_prevtdno_ry` (`prevtdno`,`ry`),
  KEY `ix_faaslist_prevtdno` (`prevtdno`),
  KEY `ix_faaslist_rydocstate` (`ry`,`docstate`),
  KEY `ix_faaslist_timestamp_docstate_taxable` (`txntimestamp`,`docstate`,`taxable`),
  KEY `ix_faaslist_pin_rputype` (`rputype`,`pin`),
  CONSTRAINT `FK_faaslist` FOREIGN KEY (`taxpayerid`) REFERENCES `entity` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `faaslist` */

/*Table structure for table `filter` */

DROP TABLE IF EXISTS `filter`;

CREATE TABLE `filter` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `refname` varchar(100) NOT NULL,
  `info` text NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `name` (`name`,`refname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `filter` */

/*Table structure for table `form60setup` */

DROP TABLE IF EXISTS `form60setup`;

CREATE TABLE `form60setup` (
  `objid` varchar(50) NOT NULL,
  `items` text NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `form60setup` */

/*Table structure for table `fund` */

DROP TABLE IF EXISTS `fund`;

CREATE TABLE `fund` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `docstate` varchar(10) NOT NULL,
  `fund` varchar(50) NOT NULL,
  `subfund` varchar(100) NOT NULL,
  `fundname` varchar(150) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `fund` */

/*Table structure for table `incomeaccount` */

DROP TABLE IF EXISTS `incomeaccount`;

CREATE TABLE `incomeaccount` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `docstate` varchar(25) NOT NULL,
  `acctno` varchar(25) default NULL,
  `accttitle` varchar(150) NOT NULL,
  `acctcode` varchar(50) default NULL,
  `defaultvalue` decimal(12,2) NOT NULL,
  `systype` varchar(25) default NULL,
  `ngasid` varchar(50) default NULL,
  `ngastitle` varchar(100) default NULL,
  `ngassubacctid` varchar(50) default NULL,
  `ngassubaccttitle` varchar(100) default NULL,
  `sreid` varchar(50) default NULL,
  `sretitle` varchar(100) default NULL,
  `sresubacctid` varchar(50) default NULL,
  `sresubaccttitle` varchar(100) default NULL,
  `fundid` varchar(50) default NULL,
  `fundname` varchar(150) default NULL,
  `amounttype` varchar(25) default NULL,
  `groupid` varchar(100) default NULL,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `ix_incomeacct_title` (`accttitle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `incomeaccount` */

/*Table structure for table `incomeaccountgroup` */

DROP TABLE IF EXISTS `incomeaccountgroup`;

CREATE TABLE `incomeaccountgroup` (
  `objid` varchar(100) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `incomeaccountgroup` */

/*Table structure for table `iraf` */

DROP TABLE IF EXISTS `iraf`;

CREATE TABLE `iraf` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(10) NOT NULL,
  `docstate` varchar(25) NOT NULL,
  `txnno` varchar(50) NOT NULL,
  `txndate` timestamp NULL default NULL,
  `preparedby` varchar(100) default NULL,
  `preparedbytitle` varchar(100) default NULL,
  `info` text NOT NULL,
  `requesteditems` text NOT NULL,
  `rcvitems` text,
  `rivid` varchar(50) default NULL,
  `rivno` varchar(50) default NULL,
  `rivrequestedby` varchar(100) default NULL,
  `rivrequestedbytitle` varchar(100) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `iraf` */

/*Table structure for table `iraf_list` */

DROP TABLE IF EXISTS `iraf_list`;

CREATE TABLE `iraf_list` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(10) NOT NULL,
  `state` varchar(25) NOT NULL,
  `docno` varchar(25) default NULL,
  `docdate` date default NULL,
  `preparedby` varchar(50) NOT NULL,
  `rivno` varchar(25) NOT NULL,
  `rivdate` date NOT NULL,
  `rivrequester` varchar(50) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `iraf_list` */

/*Table structure for table `jobposition` */

DROP TABLE IF EXISTS `jobposition`;

CREATE TABLE `jobposition` (
  `objid` varchar(50) NOT NULL,
  `code` varchar(20) default NULL,
  `title` varchar(50) default NULL,
  `jobgroup` varchar(10) default NULL,
  `roleclass` varchar(50) default NULL,
  `role` varchar(50) default NULL,
  `excluded` mediumtext,
  `orgunitid` varchar(50) default NULL,
  `assigneeid` varchar(50) default NULL,
  `jobstatus` char(1) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_jobposition` (`orgunitid`),
  KEY `FK_jobposition_roleclass` (`roleclass`),
  KEY `FK_jobposition_role` (`role`),
  KEY `FK_jobposition_personnel` (`assigneeid`),
  CONSTRAINT `FK_jobposition` FOREIGN KEY (`orgunitid`) REFERENCES `orgunit` (`objid`),
  CONSTRAINT `FK_jobposition_assignee` FOREIGN KEY (`assigneeid`) REFERENCES `personnel` (`objid`),
  CONSTRAINT `FK_jobposition_role` FOREIGN KEY (`role`) REFERENCES `role` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `jobposition` */

insert  into `jobposition`(`objid`,`code`,`title`,`jobgroup`,`roleclass`,`role`,`excluded`,`orgunitid`,`assigneeid`,`jobstatus`) values ('ADMIN','ADMIN','ADMIN',NULL,'ADMIN','ADMIN_DEFAULT',NULL,'HR','ADMIN','R');

/*Table structure for table `jobposition_tag` */

DROP TABLE IF EXISTS `jobposition_tag`;

CREATE TABLE `jobposition_tag` (
  `jobid` varchar(50) NOT NULL,
  `tagid` varchar(50) NOT NULL,
  PRIMARY KEY  (`jobid`,`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `jobposition_tag` */

/*Table structure for table `kindofbuilding` */

DROP TABLE IF EXISTS `kindofbuilding`;

CREATE TABLE `kindofbuilding` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(10) NOT NULL,
  `bldgcode` varchar(10) NOT NULL,
  `bldgkind` varchar(100) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `kindofbuilding` */

/*Table structure for table `landactualuseadjustment` */

DROP TABLE IF EXISTS `landactualuseadjustment`;

CREATE TABLE `landactualuseadjustment` (
  `objid` varchar(50) NOT NULL,
  `adjustmentcode` varchar(10) NOT NULL,
  `adjustmentname` varchar(100) NOT NULL,
  `unit` varchar(50) default NULL,
  `appliedto` varchar(100) default NULL,
  `classifications` text,
  `expression` varchar(500) NOT NULL,
  `landrysettingid` varchar(50) NOT NULL,
  `previd` varchar(50) default NULL,
  `classids` varchar(500) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `landactualuseadjustment` */

/*Table structure for table `landadjustment` */

DROP TABLE IF EXISTS `landadjustment`;

CREATE TABLE `landadjustment` (
  `objid` varchar(50) NOT NULL,
  `adjustmentcode` varchar(10) NOT NULL,
  `adjustmentname` varchar(100) NOT NULL,
  `classids` text,
  `classifications` text,
  `expression` varchar(1000) NOT NULL,
  `landrysettingid` varchar(50) NOT NULL,
  `appliedto` varchar(150) NOT NULL,
  `previd` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `landadjustment` */

/*Table structure for table `landassesslevel` */

DROP TABLE IF EXISTS `landassesslevel`;

CREATE TABLE `landassesslevel` (
  `objid` varchar(50) NOT NULL,
  `classcode` varchar(10) NOT NULL,
  `classname` varchar(100) NOT NULL,
  `fixrate` tinyint(4) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `previd` varchar(50) default NULL,
  `landrysettingid` varchar(50) NOT NULL,
  `ranges` text,
  PRIMARY KEY  (`objid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `landassesslevel` */

/*Table structure for table `landrysetting` */

DROP TABLE IF EXISTS `landrysetting`;

CREATE TABLE `landrysetting` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(10) NOT NULL,
  `ry` int(11) NOT NULL,
  `previd` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `landrysetting` */

/*Table structure for table `lcuv` */

DROP TABLE IF EXISTS `lcuv`;

CREATE TABLE `lcuv` (
  `objid` varchar(50) NOT NULL,
  `classcode` varchar(10) NOT NULL,
  `classname` varchar(100) NOT NULL,
  `landrysettingid` varchar(50) NOT NULL,
  `previd` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `lcuv` */

/*Table structure for table `lcuvspecificclass` */

DROP TABLE IF EXISTS `lcuvspecificclass`;

CREATE TABLE `lcuvspecificclass` (
  `objid` varchar(50) NOT NULL,
  `classcode` varchar(10) NOT NULL,
  `classname` varchar(100) NOT NULL,
  `areatype` varchar(10) NOT NULL,
  `lcuvid` varchar(50) NOT NULL,
  `previd` varchar(50) default NULL,
  `landrysettingid` varchar(50) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `lcuvspecificclass` */

/*Table structure for table `lcuvstripping` */

DROP TABLE IF EXISTS `lcuvstripping`;

CREATE TABLE `lcuvstripping` (
  `objid` varchar(50) NOT NULL,
  `striplevel` int(11) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `lcuvid` varchar(50) NOT NULL,
  `previd` varchar(50) default NULL,
  `landrysettingid` varchar(50) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `lcuvstripping` */

/*Table structure for table `lcuvsubclass` */

DROP TABLE IF EXISTS `lcuvsubclass`;

CREATE TABLE `lcuvsubclass` (
  `objid` varchar(50) NOT NULL,
  `subclasscode` varchar(50) NOT NULL,
  `subclassname` varchar(50) NOT NULL,
  `unitvalue` decimal(10,2) NOT NULL,
  `specificclassid` varchar(50) NOT NULL,
  `previd` varchar(50) default NULL,
  `landrysettingid` varchar(50) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `lcuvsubclass` */

/*Table structure for table `lgu` */

DROP TABLE IF EXISTS `lgu`;

CREATE TABLE `lgu` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `docstate` varchar(10) NOT NULL,
  `lgutype` varchar(25) NOT NULL,
  `indexno` varchar(4) NOT NULL,
  `pin` varchar(25) NOT NULL,
  `lguname` varchar(50) NOT NULL,
  `formalname` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `lgu` */

/*Table structure for table `liquidation` */

DROP TABLE IF EXISTS `liquidation`;

CREATE TABLE `liquidation` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(20) NOT NULL,
  `docstate` varchar(20) NOT NULL,
  `dtposted` date NOT NULL,
  `info` text NOT NULL,
  `depositid` varchar(50) default NULL,
  `dtdeposited` date default NULL,
  `rcds` text,
  `opener` varchar(50) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `liquidation` */

/*Table structure for table `liquidationlist` */

DROP TABLE IF EXISTS `liquidationlist`;

CREATE TABLE `liquidationlist` (
  `objid` varchar(50) NOT NULL,
  `docstate` varchar(50) NOT NULL,
  `txnno` varchar(20) NOT NULL,
  `txndate` date NOT NULL,
  `iyear` int(11) NOT NULL,
  `iqtr` int(11) NOT NULL,
  `imonth` int(11) NOT NULL,
  `iday` int(11) NOT NULL,
  `txntimestamp` varchar(15) NOT NULL,
  `liquidatingofficerid` varchar(50) NOT NULL,
  `liquidatingofficername` varchar(100) NOT NULL,
  `liquidatingofficertitle` varchar(100) NOT NULL,
  `amount` decimal(10,2) default NULL,
  `totalcash` decimal(10,2) default NULL,
  `totalotherpayment` decimal(10,2) default NULL,
  `depositid` varchar(50) default NULL,
  `dtdeposited` date default NULL,
  `depositedbyid` varchar(50) default NULL,
  `depositedbyname` varchar(100) default NULL,
  `depositedbytitle` varchar(50) default NULL,
  `opener` varchar(50) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_liquidationlist_period` (`iyear`,`iqtr`,`imonth`),
  CONSTRAINT `FK_liquidation` FOREIGN KEY (`objid`) REFERENCES `liquidation` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `liquidationlist` */

/*Table structure for table `liquidationrcd` */

DROP TABLE IF EXISTS `liquidationrcd`;

CREATE TABLE `liquidationrcd` (
  `objid` varchar(50) NOT NULL,
  `docstate` varchar(20) NOT NULL,
  `schemaname` varchar(25) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `liquidationid` varchar(50) NOT NULL,
  `liquidationno` varchar(25) NOT NULL,
  `liquidationdate` date NOT NULL,
  `lqofficerid` varchar(50) NOT NULL,
  `lqofficername` varchar(100) NOT NULL,
  `lqofficertitle` varchar(50) NOT NULL,
  `fundid` varchar(50) NOT NULL,
  `fundname` varchar(100) NOT NULL,
  `cashierid` varchar(50) NOT NULL,
  `cashiername` varchar(100) NOT NULL,
  `cashiertitle` varchar(50) NOT NULL,
  `cash` decimal(14,2) NOT NULL,
  `noncash` decimal(14,2) NOT NULL,
  `amount` decimal(14,2) NOT NULL,
  `denominations` text NOT NULL,
  `noncashpayments` text NOT NULL,
  `depositid` varchar(50) default NULL,
  `dtdeposited` date default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_liquidationrcd` (`liquidationid`),
  KEY `FK_liquidationrcd_fund` (`fundid`),
  KEY `lqofficerid` (`lqofficerid`),
  KEY `ix_liquidationrcd_cashierid` (`cashierid`),
  CONSTRAINT `FK_liquidationrcd` FOREIGN KEY (`liquidationid`) REFERENCES `liquidation` (`objid`),
  CONSTRAINT `FK_liquidationrcd_fund` FOREIGN KEY (`fundid`) REFERENCES `fund` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `liquidationrcd` */

/*Table structure for table `lob` */

DROP TABLE IF EXISTS `lob`;

CREATE TABLE `lob` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(25) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `docstate` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `classificationid` varchar(50) NOT NULL,
  `classification` varchar(50) NOT NULL,
  `attributes` text,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `ux_lob_name` (`name`),
  KEY `FK_lob` (`classificationid`),
  CONSTRAINT `FK_lob` FOREIGN KEY (`classificationid`) REFERENCES `lobclassification` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `lob` */

/*Table structure for table `lobattribute` */

DROP TABLE IF EXISTS `lobattribute`;

CREATE TABLE `lobattribute` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `lobattribute` */

/*Table structure for table `lobclassification` */

DROP TABLE IF EXISTS `lobclassification`;

CREATE TABLE `lobclassification` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(25) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `remarks` varchar(100) default NULL,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `ux_lobclassification_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `lobclassification` */

/*Table structure for table `machassesslevel` */

DROP TABLE IF EXISTS `machassesslevel`;

CREATE TABLE `machassesslevel` (
  `objid` varchar(50) NOT NULL,
  `machrysettingid` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `fixrate` int(11) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `previd` varchar(50) default NULL,
  `ranges` text,
  PRIMARY KEY  (`objid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `machassesslevel` */

/*Table structure for table `machforex` */

DROP TABLE IF EXISTS `machforex`;

CREATE TABLE `machforex` (
  `objid` varchar(50) NOT NULL,
  `machrysettingid` varchar(50) NOT NULL,
  `iyear` int(10) NOT NULL,
  `forex` decimal(10,6) NOT NULL,
  `previd` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `machforex` */

/*Table structure for table `machines` */

DROP TABLE IF EXISTS `machines`;

CREATE TABLE `machines` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(10) NOT NULL,
  `machinecode` varchar(10) NOT NULL,
  `machinedesc` varchar(100) NOT NULL,
  `economiclife` int(11) NOT NULL,
  `residualrate` decimal(10,2) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Data for the table `machines` */

/*Table structure for table `machrysetting` */

DROP TABLE IF EXISTS `machrysetting`;

CREATE TABLE `machrysetting` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `ry` int(11) NOT NULL,
  `previd` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `machrysetting` */

/*Table structure for table `materials` */

DROP TABLE IF EXISTS `materials`;

CREATE TABLE `materials` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(10) NOT NULL,
  `materialcode` varchar(10) NOT NULL,
  `materialdesc` varchar(100) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Data for the table `materials` */

/*Table structure for table `miscassesslevel` */

DROP TABLE IF EXISTS `miscassesslevel`;

CREATE TABLE `miscassesslevel` (
  `objid` varchar(50) NOT NULL,
  `miscrysettingid` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `fixrate` int(11) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `previd` varchar(50) default NULL,
  `ranges` text,
  PRIMARY KEY  (`objid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `miscassesslevel` */

/*Table structure for table `miscitems` */

DROP TABLE IF EXISTS `miscitems`;

CREATE TABLE `miscitems` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(10) NOT NULL,
  `misccode` varchar(10) NOT NULL,
  `miscdesc` varchar(100) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Data for the table `miscitems` */

/*Table structure for table `miscitemvalue` */

DROP TABLE IF EXISTS `miscitemvalue`;

CREATE TABLE `miscitemvalue` (
  `objid` varchar(50) NOT NULL,
  `miscrysettingid` varchar(50) NOT NULL,
  `miscitemid` varchar(50) NOT NULL,
  `miscitemcode` varchar(10) NOT NULL,
  `miscitemname` varchar(100) NOT NULL,
  `expr` varchar(100) NOT NULL,
  `previd` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `miscitemvalue` */

/*Table structure for table `miscrysetting` */

DROP TABLE IF EXISTS `miscrysetting`;

CREATE TABLE `miscrysetting` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `ry` int(11) NOT NULL,
  `previd` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `miscrysetting` */

/*Table structure for table `municipal_taxpayer` */

DROP TABLE IF EXISTS `municipal_taxpayer`;

CREATE TABLE `municipal_taxpayer` (
  `objid` varchar(50) NOT NULL,
  `lgu` varchar(50) NOT NULL,
  `taxpayerNo` varchar(15) default NULL,
  `name` varchar(500) NOT NULL,
  `address` varchar(100) NOT NULL,
  `mailAddress` varchar(100) default NULL,
  `provTaxpayerId` varchar(50) default NULL,
  `provTaxpayerNo` varchar(25) default NULL,
  `provTaxpayerName` varchar(500) default NULL,
  `provTaxpayerAddress` varchar(100) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `municipal_taxpayer` */

/*Table structure for table `noticeofassessment` */

DROP TABLE IF EXISTS `noticeofassessment`;

CREATE TABLE `noticeofassessment` (
  `objid` varchar(50) NOT NULL,
  `docstate` varchar(25) NOT NULL,
  `docno` varchar(25) NOT NULL,
  `issuedate` date NOT NULL,
  `preparedby` varchar(50) NOT NULL,
  `taxpayername` varchar(1000) NOT NULL,
  `taxpayeraddress` varchar(100) NOT NULL,
  `preparedbytitle` varchar(50) NOT NULL,
  `approvedby` varchar(50) NOT NULL,
  `approvedbytitle` varchar(50) NOT NULL,
  `lgutype` varchar(25) NOT NULL,
  `parentlguname` varchar(50) NOT NULL,
  `lguname` varchar(50) NOT NULL,
  `dtdelivered` date default NULL,
  `receivedby` varchar(50) default NULL,
  `remarks` varchar(200) default NULL,
  `items` text,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `noticeofassessment` */

/*Table structure for table `orgtype` */

DROP TABLE IF EXISTS `orgtype`;

CREATE TABLE `orgtype` (
  `name` varchar(50) NOT NULL,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `orgtype` */

insert  into `orgtype`(`name`) values ('ADMIN_UNIT');
insert  into `orgtype`(`name`) values ('BARANGAY');

/*Table structure for table `orgunit` */

DROP TABLE IF EXISTS `orgunit`;

CREATE TABLE `orgunit` (
  `objid` varchar(50) NOT NULL,
  `code` varchar(50) default NULL,
  `title` varchar(255) default NULL,
  `orgtype` varchar(50) default NULL,
  `parentid` varchar(50) default NULL,
  `system` smallint(6) default NULL,
  `reftype` varchar(50) default NULL,
  `refid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_orgunit` (`orgtype`),
  CONSTRAINT `FK_orgunit` FOREIGN KEY (`orgtype`) REFERENCES `orgtype` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `orgunit` */

insert  into `orgunit`(`objid`,`code`,`title`,`orgtype`,`parentid`,`system`,`reftype`,`refid`) values ('142-01-0009','CODCOD','BARANGAY CODCOD','BARANGAY',NULL,NULL,'BARANGAY','142-01-0009');
insert  into `orgunit`(`objid`,`code`,`title`,`orgtype`,`parentid`,`system`,`reftype`,`refid`) values ('AC','AC','ACCOUNTING DEPARTMENT','ADMIN_UNIT',NULL,1,NULL,NULL);
insert  into `orgunit`(`objid`,`code`,`title`,`orgtype`,`parentid`,`system`,`reftype`,`refid`) values ('AO','AO','ASSESSOR\'S OFFICE','ADMIN_UNIT',NULL,1,NULL,NULL);
insert  into `orgunit`(`objid`,`code`,`title`,`orgtype`,`parentid`,`system`,`reftype`,`refid`) values ('BPLO','BPLO','BUSINESS PERMIT LICENSING OFFICE','ADMIN_UNIT',NULL,1,NULL,NULL);
insert  into `orgunit`(`objid`,`code`,`title`,`orgtype`,`parentid`,`system`,`reftype`,`refid`) values ('HR','HR','HR DEPARTMENT','ADMIN_UNIT',NULL,1,NULL,NULL);
insert  into `orgunit`(`objid`,`code`,`title`,`orgtype`,`parentid`,`system`,`reftype`,`refid`) values ('IT','IT','IT DEPARTMENT','ADMIN_UNIT',NULL,1,NULL,NULL);
insert  into `orgunit`(`objid`,`code`,`title`,`orgtype`,`parentid`,`system`,`reftype`,`refid`) values ('TR','TR','TREASURY DEPARTMENT','ADMIN_UNIT',NULL,1,NULL,NULL);

/*Table structure for table `paymentitem` */

DROP TABLE IF EXISTS `paymentitem`;

CREATE TABLE `paymentitem` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) NOT NULL,
  `paytype` varchar(25) NOT NULL,
  `particulars` varchar(200) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `extended` text,
  `liquidationid` varchar(50) default NULL,
  `liquidationrcdid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_paymentitem_rctid` (`receiptid`),
  KEY `ix_paymentitem_rctid_paytype` (`receiptid`,`paytype`),
  KEY `ix_paymentitem_receiptid` (`receiptid`),
  KEY `ix_paymentitem_liquidationid` (`liquidationid`),
  KEY `ix_paymentitem_liquidationrcdid` (`liquidationrcdid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `paymentitem` */

/*Table structure for table `personnel` */

DROP TABLE IF EXISTS `personnel`;

CREATE TABLE `personnel` (
  `objid` varchar(50) NOT NULL,
  `staffno` varchar(50) NOT NULL,
  `firstname` varchar(50) default NULL,
  `lastname` varchar(50) default NULL,
  `middlename` varchar(50) default NULL,
  `gender` char(1) default NULL,
  `birthdate` date default NULL,
  `birthplace` varchar(100) default NULL,
  `civilstatus` varchar(20) default NULL,
  `religion` varchar(20) default NULL,
  `citizenship` varchar(20) default NULL,
  `email` varchar(255) default NULL,
  `contactinfo` mediumtext,
  `primaryaddress` mediumtext,
  `secondaryaddress` mediumtext,
  `spouseinfo` mediumtext,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `staffno` (`staffno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `personnel` */

insert  into `personnel`(`objid`,`staffno`,`firstname`,`lastname`,`middlename`,`gender`,`birthdate`,`birthplace`,`civilstatus`,`religion`,`citizenship`,`email`,`contactinfo`,`primaryaddress`,`secondaryaddress`,`spouseinfo`) values ('admin','00000000','admin','admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `pin` */

DROP TABLE IF EXISTS `pin`;

CREATE TABLE `pin` (
  `pin` varchar(30) NOT NULL,
  `claimno` varchar(10) NOT NULL,
  `docstate` varchar(25) NOT NULL,
  PRIMARY KEY  (`pin`,`claimno`),
  UNIQUE KEY `ux_pin_pinclaimno` (`pin`,`claimno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pin` */

/*Table structure for table `plantsandtrees` */

DROP TABLE IF EXISTS `plantsandtrees`;

CREATE TABLE `plantsandtrees` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(10) NOT NULL,
  `planttreecode` varchar(20) NOT NULL,
  `planttreedesc` varchar(100) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Data for the table `plantsandtrees` */

/*Table structure for table `planttreerysetting` */

DROP TABLE IF EXISTS `planttreerysetting`;

CREATE TABLE `planttreerysetting` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `ry` int(11) NOT NULL,
  `applyagriadjustment` int(11) NOT NULL,
  `previd` varchar(50) default NULL,
  `assesslevels` text NOT NULL,
  `planttreeunits` text NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `planttreerysetting` */

/*Table structure for table `planttreeunitvalue` */

DROP TABLE IF EXISTS `planttreeunitvalue`;

CREATE TABLE `planttreeunitvalue` (
  `objid` varchar(50) NOT NULL,
  `planttreerysettingid` varchar(50) NOT NULL,
  `planttreeid` varchar(50) NOT NULL,
  `planttreecode` varchar(10) NOT NULL,
  `planttreename` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(25) NOT NULL,
  `unitvalue` decimal(10,2) NOT NULL,
  `previd` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `planttreeunitvalue` */

/*Table structure for table `postcapture` */

DROP TABLE IF EXISTS `postcapture`;

CREATE TABLE `postcapture` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `docstate` varchar(25) NOT NULL,
  `dtposted` date NOT NULL,
  `collectorid` varchar(50) NOT NULL,
  `collectorname` varchar(75) NOT NULL,
  `collectortitle` varchar(25) NOT NULL,
  `postedbyid` varchar(50) NOT NULL,
  `postedbyname` varchar(75) NOT NULL,
  `postedbytitle` varchar(25) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `summaries` text NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `postcapture` */

/*Table structure for table `profession` */

DROP TABLE IF EXISTS `profession`;

CREATE TABLE `profession` (
  `objid` varchar(100) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `profession` */

/*Table structure for table `propertyclassification` */

DROP TABLE IF EXISTS `propertyclassification`;

CREATE TABLE `propertyclassification` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `propertycode` varchar(10) NOT NULL,
  `propertydesc` varchar(100) NOT NULL,
  `special` tinyint(4) NOT NULL,
  `orderno` int(11) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Data for the table `propertyclassification` */

/*Table structure for table `propertypayer` */

DROP TABLE IF EXISTS `propertypayer`;

CREATE TABLE `propertypayer` (
  `objid` varchar(50) NOT NULL,
  `taxpayerid` varchar(50) NOT NULL,
  `taxpayername` varchar(100) NOT NULL,
  `taxpayeraddress` varchar(150) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `propertypayer` */

/*Table structure for table `propertypayeritem` */

DROP TABLE IF EXISTS `propertypayeritem`;

CREATE TABLE `propertypayeritem` (
  `objid` varchar(50) NOT NULL,
  `propertypayerid` varchar(50) NOT NULL,
  `ledgerid` varchar(50) NOT NULL,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `ux_propertypayerid_ledgerid` (`propertypayerid`,`ledgerid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `propertypayeritem` */

/*Table structure for table `province_taxpayer` */

DROP TABLE IF EXISTS `province_taxpayer`;

CREATE TABLE `province_taxpayer` (
  `objid` varchar(50) NOT NULL,
  `lgu` varchar(50) NOT NULL,
  `taxpayerNo` varchar(15) default NULL,
  `name` varchar(500) NOT NULL,
  `address` varchar(100) NOT NULL,
  `mailAddress` varchar(100) default NULL,
  `mappings` text,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `province_taxpayer` */

/*Table structure for table `reassignedlgu` */

DROP TABLE IF EXISTS `reassignedlgu`;

CREATE TABLE `reassignedlgu` (
  `objid` varchar(50) NOT NULL,
  `schemaName` varchar(50) NOT NULL,
  `schemaVersion` varchar(5) NOT NULL,
  `state` varchar(25) NOT NULL,
  `assignedFromId` varchar(50) NOT NULL,
  `assignedFrom` varchar(100) NOT NULL,
  `assignedToId` varchar(50) NOT NULL,
  `assignedTo` varchar(100) NOT NULL,
  `validUntil` date NOT NULL,
  `reason` varchar(200) NOT NULL,
  `municipalities` varchar(2500) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `reassignedlgu` */

/*Table structure for table `receipt` */

DROP TABLE IF EXISTS `receipt`;

CREATE TABLE `receipt` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(100) NOT NULL,
  `schemaversion` varchar(25) NOT NULL,
  `docstate` varchar(25) NOT NULL,
  `doctype` varchar(50) NOT NULL,
  `opener` varchar(50) NOT NULL,
  `collectorid` varchar(50) NOT NULL,
  `remittanceid` varchar(50) default NULL,
  `remittanceno` varchar(25) default NULL,
  `remittancedate` date default NULL,
  `info` text NOT NULL,
  `items` text NOT NULL,
  `payments` text NOT NULL,
  `extended` text,
  `voided` int(11) NOT NULL,
  `voidreason` varchar(50) default NULL,
  `capturedbyid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_receipt_remid` (`remittanceid`),
  KEY `ix_receipt_remno` (`remittanceno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `receipt` */

/*Table structure for table `receiptitem` */

DROP TABLE IF EXISTS `receiptitem`;

CREATE TABLE `receiptitem` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) NOT NULL,
  `acctid` varchar(50) NOT NULL,
  `acctno` varchar(25) default NULL,
  `accttitle` varchar(150) NOT NULL,
  `fundid` varchar(50) NOT NULL,
  `fundname` varchar(75) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `remarks` varchar(100) default NULL,
  `extended` text,
  `refid` varchar(50) default NULL,
  `liquidationrcdid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_receiptitem_rctid` (`receiptid`),
  KEY `ix_receiptitem_acctid` (`acctid`),
  KEY `ix_receiptitem_accttitle` (`accttitle`),
  KEY `ix_receiptitem_liquidationrcdid` (`liquidationrcdid`),
  CONSTRAINT `FK_receiptitem` FOREIGN KEY (`acctid`) REFERENCES `incomeaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `receiptitem` */

/*Table structure for table `receiptlist` */

DROP TABLE IF EXISTS `receiptlist`;

CREATE TABLE `receiptlist` (
  `objid` varchar(50) NOT NULL,
  `docstate` varchar(25) NOT NULL,
  `doctype` varchar(25) NOT NULL,
  `opener` varchar(50) NOT NULL,
  `remittanceid` varchar(50) default NULL,
  `remittanceno` varchar(25) default NULL,
  `remittancedate` date default NULL,
  `txndate` date NOT NULL,
  `dtposted` datetime NOT NULL,
  `iyear` int(11) NOT NULL,
  `iqtr` int(11) NOT NULL,
  `imonth` int(11) NOT NULL,
  `iday` int(11) NOT NULL,
  `mode` varchar(25) NOT NULL,
  `afid` varchar(50) NOT NULL,
  `afcontrolid` varchar(50) NOT NULL,
  `serialno` varchar(25) default NULL,
  `stubno` varchar(25) NOT NULL,
  `collectiontypeid` varchar(50) NOT NULL,
  `collectiontype` varchar(50) NOT NULL,
  `collectorid` varchar(50) NOT NULL,
  `collectorname` varchar(100) NOT NULL,
  `collectortitle` varchar(50) NOT NULL,
  `payorid` varchar(50) default NULL,
  `payorname` varchar(500) NOT NULL,
  `payoraddress` varchar(200) default NULL,
  `paidby` varchar(500) NOT NULL,
  `paidbyaddress` varchar(200) default NULL,
  `amount` decimal(10,2) NOT NULL,
  `cash` decimal(10,2) NOT NULL,
  `otherpayment` decimal(10,2) NOT NULL,
  `voided` int(11) NOT NULL,
  `voidreason` varchar(100) default NULL,
  `postcaptureid` varchar(50) default NULL,
  `capturedbyid` varchar(50) default NULL,
  `capturedbyname` varchar(100) default NULL,
  `capturedbytitle` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_receiptlist_docstatecolid` (`collectorid`,`docstate`),
  KEY `ix_receiptlist_remid` (`remittanceid`),
  KEY `ix_receiptlist_remno` (`remittanceno`),
  KEY `ix_receiptlist_iyear` (`iyear`),
  KEY `ix_receiptlist_iqtr` (`iyear`,`iqtr`),
  KEY `ix_receiptlist_imonth` (`iyear`,`imonth`),
  KEY `ix_receiptlist_iday` (`iyear`,`imonth`,`iday`),
  KEY `ix_receiptlist_serialno` (`serialno`),
  KEY `ix_receiptlist_stubno` (`stubno`),
  KEY `ix_receiptlist_collectorname` (`collectorname`),
  KEY `ix_receiptlist_payorname` (`payorname`),
  KEY `ix_receiptlist_colidvoided` (`collectorid`,`voided`),
  KEY `ix_receiptlist_doctype_voided` (`doctype`,`voided`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `receiptlist` */

/*Table structure for table `remittance` */

DROP TABLE IF EXISTS `remittance`;

CREATE TABLE `remittance` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(20) NOT NULL,
  `info` text NOT NULL,
  `docstate` varchar(20) NOT NULL,
  `dtposted` date NOT NULL,
  `liquidationid` varchar(50) default NULL,
  `liquidationno` varchar(20) default NULL,
  `liquidationdate` date default NULL,
  `liquidatingofficerid` varchar(50) NOT NULL,
  `collectorid` varchar(50) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `remittance` */

/*Table structure for table `remittancelist` */

DROP TABLE IF EXISTS `remittancelist`;

CREATE TABLE `remittancelist` (
  `objid` varchar(50) NOT NULL,
  `docstate` varchar(20) NOT NULL,
  `txnno` varchar(20) NOT NULL,
  `txndate` date NOT NULL,
  `collectorname` varchar(50) NOT NULL,
  `amount` decimal(10,2) default NULL,
  `collectorid` varchar(50) NOT NULL,
  `collectortitle` varchar(50) default NULL,
  `totalcash` decimal(10,2) default NULL,
  `totalotherpayment` decimal(10,2) default NULL,
  `liquidationid` varchar(50) default NULL,
  `txntimestamp` varchar(10) default NULL,
  `liquidationno` varchar(15) default NULL,
  `liquidationdate` date default NULL,
  `liquidatingofficerid` varchar(50) default NULL,
  `liquidatingofficername` varchar(50) default NULL,
  `liquidatingofficertitle` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_remittancelist_liquidationid` (`liquidationid`),
  KEY `ix_remittance_liquidationid` (`liquidationid`),
  CONSTRAINT `FK_remittancelist` FOREIGN KEY (`objid`) REFERENCES `remittance` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `remittancelist` */

/*Table structure for table `remittedform` */

DROP TABLE IF EXISTS `remittedform`;

CREATE TABLE `remittedform` (
  `objid` varchar(50) NOT NULL,
  `afcontrolid` varchar(50) NOT NULL,
  `afid` varchar(50) NOT NULL,
  `receivedfrom` varchar(50) default NULL,
  `receivedto` varchar(50) default NULL,
  `receivedqty` int(11) default NULL,
  `beginfrom` varchar(50) default NULL,
  `beginto` varchar(50) default NULL,
  `beginqty` int(11) default NULL,
  `issuedfrom` varchar(50) default NULL,
  `issuedto` varchar(50) default NULL,
  `issuedqty` int(11) default NULL,
  `endingfrom` varchar(50) default NULL,
  `endingto` varchar(50) default NULL,
  `endingqty` int(11) default NULL,
  `remittanceid` varchar(50) NOT NULL,
  `stubno` varchar(20) NOT NULL,
  `aftype` varchar(10) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_remittance` (`remittanceid`),
  KEY `FK_afcontrol` (`afcontrolid`),
  KEY `FK_af` (`afid`),
  CONSTRAINT `FK_af` FOREIGN KEY (`afid`) REFERENCES `af` (`objid`),
  CONSTRAINT `FK_afcontrol` FOREIGN KEY (`afcontrolid`) REFERENCES `afcontrol` (`objid`),
  CONSTRAINT `FK_remittance` FOREIGN KEY (`remittanceid`) REFERENCES `remittance` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `remittedform` */

/*Table structure for table `requirements` */

DROP TABLE IF EXISTS `requirements`;

CREATE TABLE `requirements` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(10) NOT NULL,
  `reqcode` varchar(20) NOT NULL,
  `reqname` varchar(100) NOT NULL,
  `reqdesc` varchar(1000) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Data for the table `requirements` */

/*Table structure for table `revenue` */

DROP TABLE IF EXISTS `revenue`;

CREATE TABLE `revenue` (
  `objid` varchar(50) NOT NULL,
  `docstate` varchar(25) NOT NULL,
  `remittanceid` varchar(50) NOT NULL,
  `remittanceno` varchar(20) NOT NULL,
  `remittancedate` datetime NOT NULL,
  `remittancetimestamp` varchar(12) NOT NULL,
  `liquidationid` varchar(50) default NULL,
  `liquidationno` varchar(20) default NULL,
  `liquidationdate` datetime default NULL,
  `liquidationtimestamp` varchar(12) default NULL,
  `depositid` varchar(50) default NULL,
  `depositno` varchar(20) default NULL,
  `depositdate` datetime default NULL,
  `deposittimestamp` varchar(12) default NULL,
  `collectorid` varchar(50) NOT NULL,
  `collectorname` varchar(70) NOT NULL,
  `collectortitle` varchar(50) NOT NULL,
  `receipttype` varchar(50) NOT NULL,
  `receiptid` varchar(50) NOT NULL,
  `receiptdate` datetime NOT NULL,
  `receiptamount` decimal(14,2) NOT NULL,
  `receiptitemid` varchar(50) NOT NULL,
  `afid` varchar(10) NOT NULL,
  `afcontrolid` varchar(50) NOT NULL,
  `stubno` varchar(15) default NULL,
  `serialno` varchar(50) default NULL,
  `payorname` varchar(500) default NULL,
  `payoraddress` varchar(150) default NULL,
  `acctid` varchar(50) NOT NULL,
  `acctno` varchar(50) default NULL,
  `accttitle` varchar(250) NOT NULL,
  `fundid` varchar(50) NOT NULL,
  `fundname` varchar(50) NOT NULL,
  `ngasid` varchar(50) default '',
  `sreid` varchar(50) default '',
  `amount` decimal(14,2) default NULL,
  `voided` int(11) NOT NULL,
  `liquidationrcdid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_revenue_liquidation` (`liquidationid`),
  KEY `FK_revenue_remittance` (`remittanceid`),
  KEY `FK_revenue_deposit` (`depositid`),
  KEY `FK_revenue_incomeaccount` (`acctid`),
  KEY `FK_revenue_ngas` (`ngasid`),
  KEY `FK_revenue_sre` (`sreid`),
  KEY `FK_revenue_receipt` (`receiptid`),
  KEY `FK_revenue_af` (`afid`),
  KEY `FK_revenue_afcontrol` (`afcontrolid`),
  KEY `ix_revenue_liquidationtimestamp_voided` (`liquidationtimestamp`,`voided`),
  KEY `ix_revenue_liquidationtimestamp` (`liquidationtimestamp`),
  KEY `ix_revenue_liquidationrcdid` (`liquidationrcdid`),
  CONSTRAINT `FK_revenue_af` FOREIGN KEY (`afid`) REFERENCES `af` (`objid`),
  CONSTRAINT `FK_revenue_afcontrol` FOREIGN KEY (`afcontrolid`) REFERENCES `afcontrol` (`objid`),
  CONSTRAINT `FK_revenue_deposit` FOREIGN KEY (`depositid`) REFERENCES `deposit` (`objid`),
  CONSTRAINT `FK_revenue_incomeaccount` FOREIGN KEY (`acctid`) REFERENCES `incomeaccount` (`objid`),
  CONSTRAINT `FK_revenue_liquidation` FOREIGN KEY (`liquidationid`) REFERENCES `liquidation` (`objid`),
  CONSTRAINT `FK_revenue_ngas` FOREIGN KEY (`ngasid`) REFERENCES `account` (`objid`),
  CONSTRAINT `FK_revenue_remittance` FOREIGN KEY (`remittanceid`) REFERENCES `remittance` (`objid`),
  CONSTRAINT `FK_revenue_sre` FOREIGN KEY (`sreid`) REFERENCES `account` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `revenue` */

/*Table structure for table `riv` */

DROP TABLE IF EXISTS `riv`;

CREATE TABLE `riv` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `docstate` varchar(25) default NULL,
  `rivtype` varchar(255) default NULL,
  `txnno` varchar(25) default NULL,
  `txndate` date default NULL,
  `requestedby` varchar(75) NOT NULL,
  `requestedbytitle` varchar(50) NOT NULL,
  `info` text NOT NULL,
  `items` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `riv` */

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `name` varchar(50) NOT NULL,
  `description` varchar(50) default NULL,
  `roleclass` varchar(20) NOT NULL,
  `included` mediumtext,
  `system` smallint(6) default '0',
  PRIMARY KEY  (`name`,`roleclass`),
  KEY `FK_role` (`roleclass`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `role` */

insert  into `role`(`name`,`description`,`roleclass`,`included`,`system`) values ('ACCOUNTING_DEFAULT','ACCOUNTING_DEFAULT','ACCOUNTING','[\"tc2:account\\\\..*\",\"tc2:bank\\\\..*\",\"tc2:bankacct\\\\..*\",\"tc2:collectionsetting\\\\..*\",\"tc2:collectiontype\\\\..*\",\"tc2:fund\\\\..*\",\"tc2:incomeacct\\\\..*\",\"tc2:incomeacctgroup\\\\..*\",\"tc2:tcmanagement.open\",\"tc2:tcreport.incomeaccount\"]',1);
insert  into `role`(`name`,`description`,`roleclass`,`included`,`system`) values ('ADMIN_DEFAULT','ADMIN_DEFAULT','ADMIN','[\".*\"]',1);
insert  into `role`(`name`,`description`,`roleclass`,`included`,`system`) values ('AFO','AFO','TREASURY','[\"tc2:af\\\\..*\",\"tc2:afcontrol\\\\..*\",\"tc2:afinventory\\\\..*\",\"tc2:iraf\\\\..*\",\"tc2:riv_lgu\\\\..*\",\"tc2:riv\\\\..*\"]',0);
insert  into `role`(`name`,`description`,`roleclass`,`included`,`system`) values ('ASSESSOR','ASSESSOR','RPT','[\"etracs2-entity:.*\",\"rpt2:rpttransaction\\\\..*\",\"rpt2:consolidationmgt\\\\..*\",\"rpt2:datacapture\\\\..*\",\"rpt2:transfer\\\\..*\",\"rpt2:reassessment\\\\..*\",\"rpt2:correction\\\\..*\",\"rpt2:newdiscovery\\\\..*\",\"rpt2:multipleclaim\\\\..*\",\"rpt2:cancelfaasmgt\\\\..*\",\"rpt2:cancelfaas\\\\..*\",\"rpt2:faasmgt\\\\..*\",\"rpt2:faas\\\\..*\",\"rpt2:subdivision\\\\..*\",\"rpt2:subdivisionmgt\\\\..*\",\"rpt2:truecopy\\\\..*\",\"rpt2:rptcertification_list\\\\..*\",\"rpt2:rptcertifications\\\\..*\",\"rpt2:noproperty\\\\..*\",\"rpt2:landholding\\\\..*\",\"rpt2:multipleproperty\\\\..*\",\"rpt2:noimprovement\\\\..*\",\"rpt2:noimprovementbytdno\\\\..*\",\"rpt2:latestexistproperty\\\\..*\",\"rpt2:withimproveland\\\\..*\",\"rpt2:wimprovebytdno\\\\..*\",\"rpt2:rptreport\\\\..*\",\"rpt2:rptreportmgmt\\\\..*\",\"rpt2:rptmanagement\\\\..*\",\"rpt2:rysetting\\\\..*\",\"rpt2:propertyclassification\\\\..*\",\"rpt2:exemptiontypes\\\\..*\",\"rpt2:kindofbldg\\\\..*\",\"rpt2:materials\\\\..*\",\"rpt2:structures\\\\..*\",\"rpt2:structuretemplates\\\\..*\",\"rpt2:machines\\\\..*\",\"rpt2:plantstrees\\\\..*\",\"rpt2:miscitems\\\\..*\",\"rpt2:rptofficers\\\\..*\",\"rpt2:canceltdreasons\\\\..*\",\"rpt2:txnrequirements\\\\..*\",\"rpt2:rptparameters\\\\..*\",\"rpt2:rptsetting\\\\..*\",\"rpt2:annotationmgmt\\\\..*\",\"rpt2:annotation\\\\..*\",\"rpt2:cancelannotationmgmt\\\\..*\",\"rpt2:cancelannotation\\\\..*\",\"rpt2:mortgage\\\\..*\",\"rpt2:bailbond\\\\..*\",\"rpt2:other\\\\..*\"]',0);
insert  into `role`(`name`,`description`,`roleclass`,`included`,`system`) values ('ASSESSOR_CERTIFICATION','ASSESSOR_CERTIFICATION','RPT','[\"rpt2:truecopy\\\\..*\",\"rpt2:rptcertification_list\\\\..*\",\"rpt2:rptcertifications\\\\..*\",\"rpt2:noproperty\\\\..*\",\"rpt2:landholding\\\\..*\",\"rpt2:multipleproperty\\\\..*\",\"rpt2:noimprovement\\\\..*\",\"rpt2:noimprovementbytdno\\\\..*\",\"rpt2:latestexistproperty\\\\..*\",\"rpt2:withimproveland\\\\..*\",\"rpt2:wimprovebytdno\\\\..*\"]',NULL);
insert  into `role`(`name`,`description`,`roleclass`,`included`,`system`) values ('ASSESSOR_REPORTS','ASSESSOR_REPORTS','RPT','[\"rpt2:rptreport\\\\..*\",\"rpt2:rptreportmgmt\\\\..*\"]',NULL);
insert  into `role`(`name`,`description`,`roleclass`,`included`,`system`) values ('BP_ADMIN','BP_ADMIN','BP','[\"bp2:bpadmin\\\\..*\",\"bp2:bpbillingrules\\\\..*\",\"bp2:bpassessmentrule\\\\..*\",\"bp2:bpbilling\\\\..*\",\"bp2:bpmanagement\\\\..*\",\"bp2:bplicensing\\\\..*\",\"bp2:bptransaction\\\\..*\",\"bp2:bpreportmgmt\\\\..*\",\"bp2:bpreport\\\\..*\",\"bp2:bppermit\\\\..*\",\"etracs2common:rule\\\\..*\"]',NULL);
insert  into `role`(`name`,`description`,`roleclass`,`included`,`system`) values ('BP_LICENSING','BP_LICENSING','BP','[\"bp2:bpbillingrules\\\\..*\",\"bp2:bpbilling\\\\..*\",\"bp2:bpmanagement\\\\..*\",\"bp2:bplicensing\\\\..*\",\"bp2:bptransaction\\\\..*\",\"bp2:bpreportmgmt\\\\..*\",\"bp2:bpreport\\\\..*\",\"bp2:bppermit\\\\..*\",\"etracs2-entity:.*\"]',NULL);
insert  into `role`(`name`,`description`,`roleclass`,`included`,`system`) values ('BP_PERMIT','BP_PERMIT','BP','[\"bp2:bpmanagement\\\\..*\",\"bp2:bplicensing\\\\..*\",\"bp2:bptransaction\\\\..*\",\"bp2:bpreportmgmt\\\\..*\",\"bp2:bpreport\\\\..*\",\"bp2:bppermit\\\\..*\",\"etracs2-entity:.*\"]',NULL);
insert  into `role`(`name`,`description`,`roleclass`,`included`,`system`) values ('CASHIER','CASHIER','TREASURY','[\"tc2:bank\\\\..*\",\"tc2:bankacct\\\\..*\",\"tc2:fund\\\\..*\",\"tc2:deposit\\\\..*\",\"tc2:treasurymgmt_fund\\\\..*\"]',NULL);
insert  into `role`(`name`,`description`,`roleclass`,`included`,`system`) values ('COLLECTOR','COLLECTOR','TREASURY','[\"bp2:collection_bp\\\\..*\",\"ctc2:.*\",\"etracs2common:entity\\\\..*\",\"etracs2common:individual\\\\..*\",\"etracs2common:juridical\\\\..*\",\"etracs2common:multiple\\\\..*\",\"rpt2:landtax\\\\..*\",\"tc2:collectionsetting\\\\..*\",\"tc2:collectiontype\\\\..*\",\"tc2:fund\\\\..*\",\"tc2:incomeacct\\\\..*\",\"tc2:incomeacctgroup\\\\..*\",\"tc2:tcmanagement\\\\..*\",\"tc2:afcontrol\\\\..*\",\"tc2:collection\\\\..*\",\"tc2:remittance\\\\..*\",\"tc2:receipt\\\\..*\",\"tc2:batchcapturemgmt\\\\..*\",\"tc2:batchcapture\\\\..*\",\"tc2:collection_burial\\\\..*\",\"tc2:collection_cashticket\\\\..*\",\"tc2:collection_cattleownership\\\\..*\",\"tc2:collection_cattletransfer\\\\..*\",\"tc2:collection_general\\\\..*\",\"tc2:collection_marriage\\\\..*\",\"tc2:postcapturereceipt\\\\..*\",\"tc2:tcreport\\\\..*\",\"tc2:collection_slaughterpermit\\\\..*\",\"tc2:treasurymgmt_abstract\\\\..*\",\"tc2:treasurymgmt_afmonitoring\\\\..*\",\"tc2:treasurymgmt_collection\\\\..*\",\"tc2:treasurymgmt_fund\\\\..*\",\"tc2:treasurymgmt_liquidation\\\\..*\",\"tc2:treasurymgmt_remittance\\\\..*\",\"tc2:riv_lgu\\\\..*\",\"tc2:riv\\\\..*\"]',NULL);
insert  into `role`(`name`,`description`,`roleclass`,`included`,`system`) values ('FACULTY_DEFAULT','FACULTY_DEFAULT','FACULTY','[ \'.*\' ]',1);
insert  into `role`(`name`,`description`,`roleclass`,`included`,`system`) values ('IT_DEFAULT','IT_DEFAULT','IT','[ \'.*\' ]',1);
insert  into `role`(`name`,`description`,`roleclass`,`included`,`system`) values ('LANDTAX','LANDTAX','RPT','[\"etracs2-entity:.*\",\"etracs2common:rule\\\\..*\",\"rpt2:truecopy\\\\..*\",\"rpt2:rptcertification_list\\\\..*\",\"rpt2:rptcertifications\\\\..*\",\"rpt2:noproperty\\\\..*\",\"rpt2:landholding\\\\..*\",\"rpt2:multipleproperty\\\\..*\",\"rpt2:noimprovement\\\\..*\",\"rpt2:noimprovementbytdno\\\\..*\",\"rpt2:latestexistproperty\\\\..*\",\"rpt2:withimproveland\\\\..*\",\"rpt2:wimprovebytdno\\\\..*\",\"rpt2:rptreport\\\\..*\",\"rpt2:rptreportmgmt\\\\..*\",\"rpt2:rptbilling\\\\..*\",\"rpt2:rptledger\\\\..*\",\"rpt2:propertypayer\\\\..*\",\"rpt2:rptbillingrule\\\\..*\",\"rpt2:landtax\\\\..*\",\"rpt2:rptmanagement\\\\..*\",\"rpt2:rptparameters\\\\..*\",\"rpt2:rptsetting\\\\..*\"]',NULL);
insert  into `role`(`name`,`description`,`roleclass`,`included`,`system`) values ('LIQUIDATING_OFFICER','Liquidating officer role.','TREASURY','[\"tc2:fund\\\\..*\",\"tc2:tcmanagement\\\\..*\",\"tc2:tcreport\\\\..*\",\"tc2:liquidation\\\\..*\",\"tc2:treasurymgmt_liquidation\\\\..*\"]',NULL);
insert  into `role`(`name`,`description`,`roleclass`,`included`,`system`) values ('RPT_ADMIN','RPT_ADMIN','RPT','[\"etracs2-entity:.*\",\"rpt2:.*\"]',NULL);
insert  into `role`(`name`,`description`,`roleclass`,`included`,`system`) values ('RPT_APPRAISER','RPT_APPRAISER','RPT','[\"etracs2-entity:.*\",\"rpt2:rpttransaction\\\\..*\",\"rpt2:consolidation\\\\..*\",\"rpt2:consolidationmgt\\\\..*\",\"rpt2:datacapture\\\\.(create)\",\"rpt2:transfer\\\\..*\",\"rpt2:reassessment\\\\..*\",\"rpt2:correction\\\\..*\",\"rpt2:newdiscovery\\\\..*\",\"rpt2:multipleclaim\\\\..*\",\"rpt2:cancelfaasmgt\\\\..*\",\"rpt2:cancelfaas\\\\..*\",\"rpt2:faasmgt\\\\..*\",\"rpt2:faas\\\\..*\",\"rpt2:subdivision\\\\..*\",\"rpt2:subdivisionmgt\\\\..*\",\"rpt2:truecopy\\\\..*\"]',0);
insert  into `role`(`name`,`description`,`roleclass`,`included`,`system`) values ('RULE_AUTHOR','RULE_AUTHOR','BP','[\"bp-rule-mgmt:.*\",\"bp2:bpadmin\\\\..*\",\"bp2:bpassessmentrule\\\\..*\",\"bp2:bpbilling\\\\..*\",\"bp2:bpbillingrules\\\\..*\",\"bp2:bplicensing\\\\..*\",\"bp2:bpmanagement\\\\..*\",\"bp2:bpreportmgmt\\\\..*\"]',NULL);
insert  into `role`(`name`,`description`,`roleclass`,`included`,`system`) values ('SUBCOLLECTOR','SUBCOLLECTOR','TREASURY','[\"bp2:collection_bp\\\\..*\",\"etracs2common:entity\\\\..*\",\"etracs2common:individual\\\\..*\",\"etracs2common:juridical\\\\..*\",\"etracs2common:multiple\\\\..*\",\"rpt2:landtax\\\\..*\",\"tc2:collection\\\\.(create_capture)\",\"tc2:receipt\\\\..*\",\"tc2:batchcapturemgmt\\\\..*\",\"tc2:batchcapture\\\\..*\",\"tc2:collection_burial\\\\..*\",\"tc2:collection_cashticket\\\\..*\",\"tc2:collection_cattleownership\\\\..*\",\"tc2:collection_cattletransfer\\\\..*\",\"tc2:collection_general\\\\..*\",\"tc2:collection_marriage\\\\..*\",\"tc2:postcapturereceipt\\\\..*\",\"tc2:collection_slaughterpermit\\\\..*\"]',NULL);
insert  into `role`(`name`,`description`,`roleclass`,`included`,`system`) values ('TEST','test','TREASURY','[\"bp2:.*\"]',NULL);
insert  into `role`(`name`,`description`,`roleclass`,`included`,`system`) values ('TREASURY_DEFAULT','TREASURY_DEFAULT','TREASURY','[\".*\"]',1);

/*Table structure for table `rptcertification` */

DROP TABLE IF EXISTS `rptcertification`;

CREATE TABLE `rptcertification` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(30) default '',
  `schemaversion` varchar(30) default '',
  `taxpayerid` varchar(50) default NULL,
  `taxpayername` varchar(300) default NULL,
  `taxpayeraddress` varchar(100) default NULL,
  `requestedby` varchar(50) default NULL,
  `purpose` varchar(100) default NULL,
  `certifiedby` varchar(100) default NULL,
  `certifiedbytitle` varchar(100) default NULL,
  `byauthority` varchar(100) default NULL,
  `official` tinyint(1) default NULL,
  `orno` varchar(30) default NULL,
  `ordate` date default NULL,
  `oramount` decimal(10,2) default NULL,
  `stampamount` decimal(10,2) default NULL,
  `items` text,
  `opener` varchar(20) default NULL,
  `extended` text,
  `docno` varchar(25) NOT NULL,
  `title` varchar(50) NOT NULL,
  `tdno` varchar(25) default NULL,
  `faasid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `rptcertification` */

/*Table structure for table `rptledger` */

DROP TABLE IF EXISTS `rptledger`;

CREATE TABLE `rptledger` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(25) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `docstate` varchar(25) NOT NULL,
  `fullpin` varchar(30) NOT NULL,
  `claimno` varchar(25) NOT NULL,
  `faasid` varchar(50) NOT NULL,
  `rputype` varchar(15) NOT NULL,
  `classid` varchar(50) NOT NULL,
  `classcode` varchar(10) NOT NULL,
  `actualuseid` varchar(50) default NULL,
  `actualusecode` varchar(10) default NULL,
  `tdno` varchar(30) NOT NULL,
  `prevtdno` varchar(300) default NULL,
  `cadastrallotno` varchar(200) NOT NULL,
  `blockno` varchar(25) default NULL,
  `barangay` varchar(75) NOT NULL,
  `txntype` varchar(5) NOT NULL,
  `taxable` int(11) NOT NULL,
  `assessedvalue` decimal(14,2) NOT NULL,
  `taxpayerid` varchar(50) NOT NULL,
  `taxpayerno` varchar(25) NOT NULL,
  `taxpayername` varchar(500) NOT NULL,
  `taxpayeraddress` varchar(100) NOT NULL,
  `administratorid` varchar(50) default NULL,
  `administratorno` varchar(25) default NULL,
  `administratorname` varchar(100) default NULL,
  `administratoraddress` varchar(100) default NULL,
  `lastyearpaid` int(11) NOT NULL,
  `lastqtrpaid` int(11) NOT NULL,
  `partialbasic` decimal(10,2) NOT NULL,
  `partialsef` decimal(10,2) NOT NULL,
  `firstqtrpaidontime` int(11) NOT NULL,
  `partialbasicint` decimal(12,2) NOT NULL,
  `partialsefint` decimal(12,2) NOT NULL,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `ux_rptledger_fullpin` (`fullpin`,`claimno`),
  KEY `ix_rptledger_docstate` (`docstate`),
  KEY `ix_rptledger_tdnostate` (`tdno`,`docstate`),
  KEY `ix_rptledger_prevtdnostate` (`prevtdno`,`docstate`),
  KEY `ix_rptledger_lotstate` (`cadastrallotno`,`docstate`),
  KEY `ix_rptledger_brgystate` (`barangay`,`docstate`),
  KEY `ix_rptledger_tpaynostate` (`taxpayerno`,`docstate`),
  KEY `ix_rptledger_namestate` (`taxpayername`,`docstate`),
  KEY `ix_rptledger_faasid` (`faasid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `rptledger` */

/*Table structure for table `rptledgeritem` */

DROP TABLE IF EXISTS `rptledgeritem`;

CREATE TABLE `rptledgeritem` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `docstate` varchar(25) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `faasid` varchar(50) default NULL,
  `tdno` varchar(30) NOT NULL,
  `txntype` varchar(5) NOT NULL,
  `classid` varchar(50) NOT NULL,
  `classcode` varchar(5) NOT NULL,
  `actualuseid` varchar(50) default NULL,
  `actualusecode` varchar(5) default NULL,
  `taxable` int(11) NOT NULL,
  `backtax` int(11) NOT NULL,
  `fromyear` int(11) NOT NULL,
  `toyear` int(11) NOT NULL,
  `assessedvalue` decimal(14,2) NOT NULL,
  `systemcreated` int(11) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_rptledger_parentid` (`parentid`),
  KEY `ix_rptledger_tdno` (`tdno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `rptledgeritem` */

/*Table structure for table `rptparameters` */

DROP TABLE IF EXISTS `rptparameters`;

CREATE TABLE `rptparameters` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(10) NOT NULL,
  `paramname` varchar(100) NOT NULL,
  `paramcaption` varchar(100) NOT NULL,
  `paramdesc` varchar(1000) default NULL,
  `paramtype` varchar(20) NOT NULL,
  `parammin` decimal(10,2) default NULL,
  `parammax` decimal(10,2) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Data for the table `rptparameters` */

/*Table structure for table `rptpayment` */

DROP TABLE IF EXISTS `rptpayment`;

CREATE TABLE `rptpayment` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `opener` varchar(50) NOT NULL,
  `mode` varchar(10) NOT NULL,
  `dtposted` datetime NOT NULL,
  `receiptid` varchar(50) default NULL,
  `receiptdate` date NOT NULL,
  `receiptno` varchar(25) NOT NULL,
  `collectorid` varchar(50) default NULL,
  `collectorname` varchar(50) default NULL,
  `collectortitle` varchar(50) default NULL,
  `capturedby` varchar(30) default NULL,
  `particulars` varchar(50) default NULL,
  `voided` int(11) NOT NULL,
  `period` varchar(50) default NULL,
  `revtype` varchar(15) default NULL,
  `fromyear` int(11) NOT NULL,
  `fromqtr` int(11) NOT NULL,
  `toyear` int(11) NOT NULL,
  `toqtr` int(11) NOT NULL,
  `basic` decimal(14,2) NOT NULL,
  `basicint` decimal(14,2) NOT NULL,
  `basicdisc` decimal(14,2) NOT NULL,
  `basicpartial` decimal(14,2) NOT NULL,
  `sef` decimal(14,2) NOT NULL,
  `sefint` decimal(14,2) NOT NULL,
  `sefdisc` decimal(14,2) NOT NULL,
  `sefpartial` decimal(14,2) NOT NULL,
  `collectingagency` varchar(100) default NULL,
  `collectingagencyid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `rptpayment` */

/*Table structure for table `rptpaymentdetail` */

DROP TABLE IF EXISTS `rptpaymentdetail`;

CREATE TABLE `rptpaymentdetail` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) NOT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `qtr` int(11) NOT NULL,
  `basic` decimal(14,2) NOT NULL,
  `basicint` decimal(14,2) NOT NULL,
  `basicdisc` decimal(14,2) NOT NULL,
  `basicpartial` decimal(14,2) NOT NULL,
  `sef` decimal(14,2) NOT NULL,
  `sefint` decimal(14,2) NOT NULL,
  `sefdisc` decimal(14,2) NOT NULL,
  `sefpartial` decimal(14,2) NOT NULL,
  `revtype` varchar(15) default NULL,
  `rptledgeritemid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `rptpaymentdetail` */

/*Table structure for table `rptpaymentmanual` */

DROP TABLE IF EXISTS `rptpaymentmanual`;

CREATE TABLE `rptpaymentmanual` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `receiptid` varchar(50) NOT NULL,
  `taxpayername` varchar(1000) NOT NULL,
  `taxpayeraddress` varchar(100) NOT NULL,
  `tdno` varchar(30) NOT NULL,
  `fullpin` varchar(25) default NULL,
  `cadastrallotno` varchar(100) NOT NULL,
  `barangay` varchar(50) default NULL,
  `classcode` varchar(10) default NULL,
  `rputype` varchar(15) default NULL,
  `assessedvalue` decimal(16,2) NOT NULL,
  `period` varchar(30) default NULL,
  `fromyear` int(11) NOT NULL,
  `fromqtr` int(11) NOT NULL,
  `toyear` int(11) NOT NULL,
  `toqtr` int(11) NOT NULL,
  `basic` decimal(14,2) NOT NULL,
  `basicdisc` decimal(14,2) NOT NULL,
  `basicint` decimal(14,2) NOT NULL,
  `basicprev` decimal(14,2) NOT NULL,
  `basicprevint` decimal(14,2) NOT NULL,
  `basicprior` decimal(14,2) NOT NULL,
  `basicpriorint` decimal(14,2) NOT NULL,
  `sef` decimal(14,2) NOT NULL,
  `sefdisc` decimal(14,2) NOT NULL,
  `sefint` decimal(14,2) NOT NULL,
  `sefprev` decimal(14,2) NOT NULL,
  `sefprevint` decimal(14,2) NOT NULL,
  `sefprior` decimal(14,2) NOT NULL,
  `sefpriorint` decimal(14,2) NOT NULL,
  `basicgross` decimal(16,2) NOT NULL,
  `basicnet` decimal(16,2) NOT NULL,
  `basicdp` decimal(16,2) NOT NULL,
  `sefgross` decimal(16,2) NOT NULL,
  `sefnet` decimal(16,2) NOT NULL,
  `sefdp` decimal(16,2) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `municity` varchar(200) NOT NULL,
  `municityid` varchar(50) NOT NULL,
  `municityname` varchar(100) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_rptpaymentmanual_receiptid` (`receiptid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `rptpaymentmanual` */

/*Table structure for table `rptsetting` */

DROP TABLE IF EXISTS `rptsetting`;

CREATE TABLE `rptsetting` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `ry` int(11) NOT NULL,
  `ordinanceno` varchar(30) default NULL,
  `ordinancedate` varchar(20) default NULL,
  `roundadjmarketvalue` int(1) NOT NULL,
  `allowlandcancellation` int(1) NOT NULL,
  `usenewtdprintout` int(1) NOT NULL,
  `landreportbasedonactualuse` int(1) NOT NULL,
  `allowtransferwithbalance` int(1) NOT NULL,
  `allowcorrectionwithbalance` int(1) NOT NULL,
  `allowdepreciationwithbalance` int(1) NOT NULL,
  `allowchangetaxabilitywithbalance` int(1) NOT NULL,
  `allowsubdivisionwithbalance` int(1) NOT NULL,
  `allowconsolidationwithbalance` int(1) NOT NULL,
  `allowreclasswithbalance` int(1) NOT NULL,
  `approvedmvbelow` decimal(10,2) default NULL,
  `agriculturalid` varchar(50) default NULL,
  `agriculturaltitle` varchar(100) default NULL,
  `adjustplanttree` int(1) NOT NULL,
  `propertyclassifications` text,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Data for the table `rptsetting` */

/*Table structure for table `session_history` */

DROP TABLE IF EXISTS `session_history`;

CREATE TABLE `session_history` (
  `sessionid` varchar(50) NOT NULL,
  `timein` datetime default NULL,
  `uid` varchar(50) default NULL,
  `timeout` datetime default NULL,
  `status` varchar(255) default NULL,
  PRIMARY KEY  (`sessionid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `session_history` */

/*Table structure for table `structures` */

DROP TABLE IF EXISTS `structures`;

CREATE TABLE `structures` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(10) NOT NULL,
  `structurecode` varchar(10) NOT NULL,
  `structuredesc` varchar(100) NOT NULL,
  `materials` text,
  `indexno` int(11) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Data for the table `structures` */

/*Table structure for table `structuretemplate` */

DROP TABLE IF EXISTS `structuretemplate`;

CREATE TABLE `structuretemplate` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(10) NOT NULL,
  `templatecode` varchar(10) NOT NULL,
  `structures` text,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Data for the table `structuretemplate` */

/*Table structure for table `subdivision` */

DROP TABLE IF EXISTS `subdivision`;

CREATE TABLE `subdivision` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `docstate` varchar(25) NOT NULL,
  `ry` int(11) NOT NULL,
  `txntype` varchar(5) NOT NULL,
  `autonumber` int(11) NOT NULL,
  `issuedate` date NOT NULL,
  `effectivityyear` int(11) NOT NULL,
  `effectivityqtr` int(11) NOT NULL,
  `memoranda` text NOT NULL,
  `motherfaasid` varchar(50) NOT NULL,
  `mothertdno` varchar(25) NOT NULL,
  `motherpin` varchar(25) NOT NULL,
  `motherclasscode` varchar(10) NOT NULL,
  `mothertaxpayername` varchar(500) NOT NULL,
  `mothercadastrallotno` varchar(100) NOT NULL,
  `mothersurveyno` varchar(50) default NULL,
  `mothermv` decimal(14,2) NOT NULL,
  `motherav` decimal(14,2) NOT NULL,
  `motherareasqm` decimal(16,6) NOT NULL,
  `motherareaha` decimal(16,6) NOT NULL,
  `subdivisioncount` int(11) NOT NULL,
  `affectedrpucount` int(11) NOT NULL,
  `appraisedby` varchar(50) default NULL,
  `appraisedbytitle` varchar(50) default NULL,
  `dtappraised` date default NULL,
  `recommendedby` varchar(50) default NULL,
  `recommendedbytitle` varchar(50) default NULL,
  `dtrecommended` date default NULL,
  `approvedby` varchar(50) default NULL,
  `approvedbytitle` varchar(50) default NULL,
  `dtapproved` date default NULL,
  `extended` text,
  `docno` varchar(10) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `subdivision` */

/*Table structure for table `subdivisionaffectedrpu` */

DROP TABLE IF EXISTS `subdivisionaffectedrpu`;

CREATE TABLE `subdivisionaffectedrpu` (
  `objid` varchar(50) NOT NULL,
  `subdivisionid` varchar(50) NOT NULL,
  `itemno` varchar(5) default NULL,
  `rputype` varchar(10) NOT NULL,
  `prevfaasid` varchar(50) NOT NULL,
  `prevtdno` varchar(25) NOT NULL,
  `prevfullpin` varchar(25) NOT NULL,
  `newtdno` varchar(25) default NULL,
  `subdivisionlandid` varchar(50) default NULL,
  `newpin` varchar(25) default NULL,
  `newsuffix` int(11) default NULL,
  `memoranda` text,
  `newfaasid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `subdivisionaffectedrpu` */

/*Table structure for table `subdivisionland` */

DROP TABLE IF EXISTS `subdivisionland`;

CREATE TABLE `subdivisionland` (
  `objid` varchar(50) NOT NULL,
  `subdivisionid` varchar(50) NOT NULL,
  `newtdno` varchar(25) default NULL,
  `newpin` varchar(25) NOT NULL,
  `newtitletype` varchar(25) default NULL,
  `newtitleno` varchar(50) default NULL,
  `newtitledate` date default NULL,
  `areasqm` decimal(16,6) NOT NULL,
  `areaha` decimal(16,6) NOT NULL,
  `memoranda` text NOT NULL,
  `taxpayerid` varchar(50) default NULL,
  `taxpayerno` varchar(25) default NULL,
  `taxpayername` varchar(500) default NULL,
  `taxpayeraddress` varchar(100) default NULL,
  `rp` text NOT NULL,
  `rpu` text NOT NULL,
  `newfaasid` varchar(50) default NULL,
  `extended` text,
  `itemno` varchar(10) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `subdivisionland` */

/*Table structure for table `sys_inbox` */

DROP TABLE IF EXISTS `sys_inbox`;

CREATE TABLE `sys_inbox` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `fromlguindex` varchar(10) NOT NULL,
  `fromlguname` varchar(50) NOT NULL,
  `tolguindex` varchar(20) NOT NULL,
  `tolguname` varchar(50) NOT NULL,
  `dtsent` datetime NOT NULL,
  `sentby` varchar(50) NOT NULL,
  `sentbytitle` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `data` text NOT NULL,
  `message` text,
  `refid` varchar(50) NOT NULL,
  `stacktrace` text,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_inbox` */

/*Table structure for table `sys_outbox` */

DROP TABLE IF EXISTS `sys_outbox`;

CREATE TABLE `sys_outbox` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `fromlguindex` varchar(20) NOT NULL,
  `fromlguname` varchar(50) NOT NULL,
  `tolguindex` varchar(20) NOT NULL,
  `tolguname` varchar(50) NOT NULL,
  `dtsent` datetime NOT NULL,
  `sentby` varchar(50) NOT NULL,
  `sentbytitle` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `data` text NOT NULL,
  `message` text,
  `refid` varchar(50) NOT NULL,
  `stacktrace` text,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_outbox` */

/*Table structure for table `sys_processedinbox` */

DROP TABLE IF EXISTS `sys_processedinbox`;

CREATE TABLE `sys_processedinbox` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `fromlguindex` varchar(10) NOT NULL,
  `fromlguname` varchar(50) NOT NULL,
  `tolguindex` varchar(20) NOT NULL,
  `tolguname` varchar(50) NOT NULL,
  `dtsent` datetime NOT NULL,
  `sentby` varchar(50) NOT NULL,
  `sentbytitle` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `data` text NOT NULL,
  `message` text,
  `refid` varchar(50) NOT NULL,
  `stacktrace` text,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_processedinbox` */

/*Table structure for table `sys_processedoutbox` */

DROP TABLE IF EXISTS `sys_processedoutbox`;

CREATE TABLE `sys_processedoutbox` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `fromlguindex` varchar(20) NOT NULL,
  `fromlguname` varchar(50) NOT NULL,
  `tolguindex` varchar(20) NOT NULL,
  `tolguname` varchar(50) NOT NULL,
  `dtsent` datetime NOT NULL,
  `sentby` varchar(50) NOT NULL,
  `sentbytitle` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `data` text NOT NULL,
  `message` text,
  `refid` varchar(50) NOT NULL,
  `stacktrace` text,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_processedoutbox` */

/*Table structure for table `terminal` */

DROP TABLE IF EXISTS `terminal`;

CREATE TABLE `terminal` (
  `terminalid` varchar(50) NOT NULL,
  `macaddress` varchar(50) default NULL,
  `dtregistered` datetime default NULL,
  `registeredby` varchar(50) default NULL,
  `info` text,
  `state` int(11) default NULL,
  PRIMARY KEY  (`terminalid`),
  UNIQUE KEY `macaddress_unique` (`macaddress`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `terminal` */

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `objid` varchar(10) NOT NULL,
  `val1` varchar(10) NOT NULL,
  `val2` varchar(10) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `test` */

/*Table structure for table `timezone` */

DROP TABLE IF EXISTS `timezone`;

CREATE TABLE `timezone` (
  `timezone` varchar(50) NOT NULL default '',
  `country` varchar(5) default NULL,
  PRIMARY KEY  (`timezone`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `timezone` */

/*Table structure for table `truecopy` */

DROP TABLE IF EXISTS `truecopy`;

CREATE TABLE `truecopy` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(10) NOT NULL,
  `txnno` varchar(50) default NULL,
  `issuedate` varchar(20) NOT NULL,
  `requestedby` varchar(100) NOT NULL,
  `requestedbyaddress` varchar(150) NOT NULL,
  `orno` varchar(50) NOT NULL,
  `ordate` varchar(50) NOT NULL,
  `oramount` decimal(10,2) NOT NULL,
  `purpose` varchar(500) NOT NULL,
  `issuedby` varchar(100) default NULL,
  `issuedtitle` varchar(50) default NULL,
  `certifiedby` varchar(100) NOT NULL,
  `certifiedbytitle` varchar(50) NOT NULL,
  `authority` varchar(100) NOT NULL,
  `faasid` varchar(50) NOT NULL,
  `tdno` varchar(50) NOT NULL,
  `faasinfo` text NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Data for the table `truecopy` */

/*Table structure for table `txninfo` */

DROP TABLE IF EXISTS `txninfo`;

CREATE TABLE `txninfo` (
  `objid` varchar(50) NOT NULL,
  `lastupdate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `lastupdateby` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `txninfo` */

/*Table structure for table `txnlog` */

DROP TABLE IF EXISTS `txnlog`;

CREATE TABLE `txnlog` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `versionno` varchar(5) NOT NULL,
  `ref` varchar(100) NOT NULL,
  `refid` varchar(500) NOT NULL,
  `txndate` datetime NOT NULL,
  `action` varchar(50) NOT NULL,
  `userid` varchar(50) NOT NULL,
  `remarks` varchar(500) default NULL,
  `diff` text,
  PRIMARY KEY  (`objid`),
  KEY `ix_txnlog_refid` (`refid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `txnlog` */

/*Table structure for table `txnreference` */

DROP TABLE IF EXISTS `txnreference`;

CREATE TABLE `txnreference` (
  `objid` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `refname` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `txndate` date default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `txnreference` */

/*Table structure for table `txnrequirements` */

DROP TABLE IF EXISTS `txnrequirements`;

CREATE TABLE `txnrequirements` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(10) NOT NULL,
  `txntypeid` varchar(50) NOT NULL,
  `txntype` varchar(100) NOT NULL,
  `requirements` text,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Data for the table `txnrequirements` */

/*Table structure for table `txntypes` */

DROP TABLE IF EXISTS `txntypes`;

CREATE TABLE `txntypes` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(10) NOT NULL,
  `txntype` varchar(100) NOT NULL,
  `used` smallint(6) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `txntypes` */

/*Table structure for table `useraccount` */

DROP TABLE IF EXISTS `useraccount`;

CREATE TABLE `useraccount` (
  `objid` varchar(50) NOT NULL,
  `uid` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL default '',
  `usertype` varchar(50) default NULL,
  `firstname` varchar(50) default NULL,
  `lastname` varchar(50) default NULL,
  `middlename` varchar(50) default NULL,
  `email` varchar(100) default NULL,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `username` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Data for the table `useraccount` */

insert  into `useraccount`(`objid`,`uid`,`pwd`,`usertype`,`firstname`,`lastname`,`middlename`,`email`) values ('admin','admin','02290d335d44fac6a4d6b3766f0bed51','personnel','admin','admin',NULL,NULL);

/*Table structure for table `variable` */

DROP TABLE IF EXISTS `variable`;

CREATE TABLE `variable` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(20) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `datatype` varchar(20) NOT NULL,
  `caption` varchar(50) NOT NULL,
  `description` varchar(100) default NULL,
  `arrayvalues` text,
  `printtopermit` int(11) default NULL,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `ux_variable_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `variable` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
