create table `rule_package` (
	`ruleset` varchar (150),
	`rulegroup` varchar (150),
	`packagename` varchar (765),
	`orderindex` double ,
	`type` varchar (30),
	`content` blob ,
	`lastmodified` datetime 
); 
insert into `rule_package` (`ruleset`, `rulegroup`, `packagename`, `orderindex`, `type`, `content`, `lastmodified`) values('ctcassessment','','ctc.assessment.facts','0','facts','package ctc.assessment.facts\r\n\r\ndeclare IndividualFact\r\n	profession:	String\r\n	citizenship:	String\r\n	gender:		String\r\n	civilstatus:	String\r\n	seniorcitizen:  Boolean\r\n	annualsalary:	Double\r\n	businessgross:	Double\r\n	propertyincome: Double\r\nend\r\n\r\ndeclare CorporateFact\r\n	orgtype:	String\r\n	realpropertyav:	Double\r\n	businessgross:	Double\r\nend\r\n\r\ndeclare CTCFact\r\n	barangayid:	String\r\n	year:       Integer\r\n	qtr:        Integer\r\n	month:      Integer\r\n    day:        Integer\r\nend\r\n',NULL);

insert into rule_sets (name) select 'ctcassessment';