set foreign_key_checks=0;

ALTER TABLE lguname_etracs.rptcompromise_credit 
DROP FOREIGN KEY FK_rptcompromise_credit;

ALTER TABLE lguname_etracs.rptcompromise_credit 
DROP INDEX FK_rptcompromise_credit;

ALTER TABLE lguname_etracs.rptcompromise_credit 
	ADD COLUMN paidby VARCHAR(100),
	ADD COLUMN paidbyaddress VARCHAR(100),
	ADD MODE VARCHAR(25);




ALTER TABLE lguname_etracs..subdivisionland ADD COLUMN administratorname VARCHAR(500);
ALTER TABLE lguname_etracs..subdivisionland ADD COLUMN administratoraddress VARCHAR(500);





alter table lguname_etracs.noticeofassessment 
	add column ry int not null,
	add column extended text ;
	

CREATE TABLE lguname_etracs.`disapprovedfaas` (             
	   `objid` varchar(50) NOT NULL,              
	   `faasid` varchar(50) NOT NULL,             
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
	   `fortransmittal` int(11) default NULL,     
	   PRIMARY KEY  (`objid`)                     
	 ) ENGINE=InnoDB DEFAULT CHARSET=utf8  ;
	 
	 
				 
CREATE TABLE lguname_etracs.`rysetting_lgu` (    
	 `objid` varchar(50) NOT NULL,       
	 `lguid` varchar(50) NOT NULL,       
	 `lguname` varchar(100) NOT NULL,    
	 `settingtype` varchar(15) NOT NULL, 
	 PRIMARY KEY  (`objid`,`lguid`)      
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8  ;
   
alter table lguname_etracs.landrysetting add  column appliedto text;
alter table lguname_etracs.bldgrysetting add  column appliedto text;
alter table lguname_etracs.machrysetting add  column appliedto text;
alter table lguname_etracs.planttreerysetting add  column appliedto text;
alter table lguname_etracs.miscrysetting add  column appliedto text;
	
update lguname_etracs.landrysetting set 
	appliedto = (select value from lguname_system.sys_var where name = 'lgu_name');

update lguname_etracs.bldgrysetting set 
	appliedto = (select value from lguname_system.sys_var where name = 'lgu_name');

update lguname_etracs.machrysetting set 
	appliedto = (select value from lguname_system.sys_var where name = 'lgu_name');

update lguname_etracs.miscrysetting set 
	appliedto = (select value from lguname_system.sys_var where name = 'lgu_name');

update lguname_etracs.machrysetting set 
	appliedto = (select value from lguname_system.sys_var where name = 'lgu_name');



insert into lguname_etracs.rysetting_lgu (objid, lguid, lguname, settingtype )
select
	objid, 
	(select value from lguname_system.sys_var where name = 'lgu_index') as lguid,
	(select value from lguname_system.sys_var where name = 'lgu_name') as lguname,
	'land' 
from lguname_etracs.landrysetting;

insert into lguname_etracs.rysetting_lgu (objid, lguid, lguname, settingtype )
select
	objid, 
	(select value from lguname_system.sys_var where name = 'lgu_index') as lguid,
	(select value from lguname_system.sys_var where name = 'lgu_name') as lguname,
	'bldg' 
from lguname_etracs.bldgrysetting;

insert into lguname_etracs.rysetting_lgu (objid, lguid, lguname, settingtype )
select
	objid, 
	(select value from lguname_system.sys_var where name = 'lgu_index') as lguid,
	(select value from lguname_system.sys_var where name = 'lgu_name') as lguname,
	'mach' 
from lguname_etracs.machrysetting;

insert into lguname_etracs.rysetting_lgu (objid, lguid, lguname, settingtype )
select
	objid, 
	(select value from lguname_system.sys_var where name = 'lgu_index') as lguid,
	(select value from lguname_system.sys_var where name = 'lgu_name') as lguname,
	'planttree' 
from lguname_etracs.planttreerysetting;


insert into lguname_etracs.rysetting_lgu (objid, lguid, lguname, settingtype )
select
	objid, 
	(select value from lguname_system.sys_var where name = 'lgu_index') as lguid,
	(select value from lguname_system.sys_var where name = 'lgu_name') as lguname,
	'misc' 
from lguname_etracs.miscrysetting;

	
	
   
/* add lguid and lguname in faas.extended */
/* add lguid and lguname in faaslist */
alter table lguname_etracs.faaslist 
	add column lguid varchar(50),
	add column lguname varchar(100);   
	

update lguname_etracs.faaslist fl set
	fl.lguid = (select value from lguname_system.sys_var where name = 'lgu_index'),
	fl.lguname = (select value from lguname_system.sys_var where name = 'lgu_name')
where fl.lguid is null; 	

update lguname_etracs.faas f set 
f.extended = replace(extended, 'lgutype:"municipality"', 
		  concat( 'lgutype:"municipality",',
			'lguid:"', (select value from lguname_system.sys_var where name = 'lgu_index'), '",',
			'lguname:"', (select value from lguname_system.sys_var where name = 'lgu_name'), '"'
		  ))
where f.extended like '%lgutype:"municipality"%';


update lguname_etracs.faas f set 
  f.extended = concat( 
	'[lgutype:"', (select value from lguname_system.sys_var where name = 'lgu_type'), '",',
	'lguid:"', (select value from lguname_system.sys_var where name = 'lgu_index'), '",',
	'lguname:"', (select value from lguname_system.sys_var where name = 'lgu_name'), '"]'
  )
where f.extended = '[:]';


update lguname_etracs.faas f set 
f.extended = replace(extended, 'txntimestamp:"', 
		  concat( 
			'lgutype:"', (select value from lguname_system.sys_var where name = 'lgu_type'), '",',
			'lguid:"', (select value from lguname_system.sys_var where name = 'lgu_index'), '",',
			'lguname:"', (select value from lguname_system.sys_var where name = 'lgu_name'), '",',
			'txntimestamp:"'
		  )
	    )
where f.extended not like '%lguid:"%';


	
	
	
alter table lguname_etracs.deposit add column fundtotals text;	




/*------------------------------------------------------------------
*
* TRANSMITTAL 
*
-------------------------------------------------------------------*/
CREATE TABLE lguname_etracs.`fortransmittal` (              
                  `objid` varchar(50) NOT NULL,              
                  `module` varchar(50) NOT NULL,             
                  `doctype` varchar(50) NOT NULL,            
                  `docno` varchar(50) NOT NULL,              
                  `postedbyid` varchar(50) NOT NULL,         
                  `postedby` varchar(100) NOT NULL,          
                  `postedbytitle` varchar(100) NOT NULL,     
                  `dtposted` datetime NOT NULL,              
                  PRIMARY KEY  (`objid`),                    
                  KEY `ix_fortransmittal_module` (`module`)  
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8;      

CREATE INDEX ix_fortransmittal_module on lguname_etracs.fortransmittal(module);


CREATE TABLE lguname_etracs.`rpttransmittal` (         
	  `objid` varchar(50) NOT NULL,         
	  `docstate` varchar(25) NOT NULL,      
	  `lguid` varchar(50) NOT NULL,         
	  `lguname` varchar(50) NOT NULL,       
	  `txnno` varchar(25) NOT NULL,         
	  `txndate` datetime NOT NULL,          
	  `createdby` varchar(50) NOT NULL,     
	  `icount` int(11) NOT NULL,            
	  PRIMARY KEY  (`objid`),               
	  KEY `lguid` (`lguid`),                
	  KEY `lguname` (`lguname`)             
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE lguname_etracs.`rpttransmittal_item` (          
	   `objid` varchar(50) NOT NULL,               
	   `module` varchar(50) NOT NULL,              
	   `doctype` varchar(50) NOT NULL,             
	   `docid` varchar(50) NOT NULL,               
	   `docno` varchar(50) NOT NULL,               
	   `postedbyid` varchar(50) NOT NULL,          
	   `postedby` varchar(100) NOT NULL,           
	   `postedbytitle` varchar(100) NOT NULL,      
	   `dtposted` datetime NOT NULL,               
	   PRIMARY KEY  (`objid`),                     
	   KEY `ix_fortransmittal_module` (`module`),  
	   KEY `docid` (`docid`),                      
	   KEY `docno` (`docno`)                       
	 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
					 
					 
CREATE TABLE lguname_etracs.`rpttransmittal_import_item` (   
	  `objid` varchar(50) NOT NULL,               
	  `module` varchar(50) NOT NULL,              
	  `doctype` varchar(50) NOT NULL,             
	  `docid` varchar(50) NOT NULL,               
	  `docno` varchar(50) NOT NULL,               
	  `postedbyid` varchar(50) NOT NULL,          
	  `postedby` varchar(100) NOT NULL,           
	  `postedbytitle` varchar(100) NOT NULL,      
	  `dtposted` datetime NOT NULL,               
	  PRIMARY KEY  (`objid`),                     
	  KEY `ix_fortransmittal_module` (`module`),  
	  KEY `docid` (`docid`),                      
	  KEY `docno` (`docno`)                       
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;			 

	
CREATE TABLE lguname_etracs.`rpttransmittal_import` (   
	 `objid` varchar(50) NOT NULL,          
	 `lguid` varchar(50) NOT NULL,          
	 `lguname` varchar(50) NOT NULL,        
	 `transmittalno` varchar(25) NOT NULL,  
	 `transmittaldate` datetime NOT NULL,   
	 `createdby` varchar(50) NOT NULL,      
	 `icount` int(11) NOT NULL,             
	 `importedby` varchar(50) NOT NULL,     
	 `dtimported` datetime NOT NULL,        
	 PRIMARY KEY  (`objid`),                
	 KEY `lguid` (`lguid`),                 
	 KEY `lguname` (`lguname`),             
	 KEY `transmittalno` (`transmittalno`)  
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8;   	

					   
					   
					    
CREATE TABLE lguname_etracs.noticeofdelinquency (            
	objid varchar(50) NOT NULL,                 
	ledgerid varchar(50) NOT NULL,              
	txnno varchar(15) NOT NULL,                 
	txndate datetime NOT NULL,                  
	tdno varchar(25) NOT NULL,                  
	taxpayername varchar(1000) NOT NULL,        
	taxpayeraddress varchar(150) NOT NULL,      
	rputype varchar(15) NOT NULL,               
	barangay varchar(50) NOT NULL,              
	cadastrallotno varchar(500) NOT NULL,       
	classcode varchar(10) NOT NULL,             
	classtitle varchar(50) default NULL,        
	assessedvalue decimal(18,2) NOT NULL,       
	delinquentamount decimal(18,2) NOT NULL,    
	currentamount decimal(18,2) NOT NULL,       
	total decimal(18,2) NOT NULL,               
	currentyear int(11) NOT NULL,               
	delinquentyrqtr varchar(10) NOT NULL,       
	PRIMARY KEY  (objid),                       
	KEY ledgerid (ledgerid),                  
	KEY tdno (tdno),                          
	KEY taxpayername (taxpayername(255)),     
	KEY cadastrallotno (cadastrallotno(255)),
	extended text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;      	 
	 
	 
alter table lguname_etracs.noticeofassessment 
	add column ry int not null,
	add column extended text ;
	
	
CREATE TABLE lguname_etracs.`rptcompromise` (                                                                       
                 `objid` varchar(50) NOT NULL,                                                                      
                 `docstate` varchar(25) NOT NULL,                                                                   
                 `txnno` varchar(10) default NULL,                                                                  
                 `txndate` date default NULL,                                                                       
                 `faasid` varchar(50) NOT NULL,                                                                     
                 `ledgerid` varchar(50) NOT NULL,                                                                   
                 `info` text NOT NULL,                                                                              
                 `signatories` text NOT NULL,                                                                       
                 `extended` text,                                                                                   
                 PRIMARY KEY  (`objid`),                                                                            
                 KEY `FK_rptcompromise_rptledger` (`ledgerid`),                                                     
                 KEY `FK_rptcompromise_faas` (`faasid`),                                                            
                 CONSTRAINT `FK_rptcompromise_faas` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`),             
                 CONSTRAINT `FK_rptcompromise_rptledger` FOREIGN KEY (`ledgerid`) REFERENCES `rptledger` (`objid`)  
               ) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;


CREATE TABLE lguname_etracs.`rptcompromise_list` (                                                                       
                      `objid` varchar(50) NOT NULL,                                                                           
                      `docstate` varchar(25) NOT NULL,                                                                        
                      `txnno` varchar(25) default NULL,                                                                       
                      `txndate` date default NULL,                                                                            
                      `faasid` varchar(50) NOT NULL,                                                                          
                      `ledgerid` varchar(50) NOT NULL,                                                                        
                      `enddate` date NOT NULL,                                                                                
                      `term` int(11) NOT NULL,                                                                                
                      `numofinstallment` decimal(18,2) NOT NULL,                                                              
                      `amount` decimal(18,2) NOT NULL,                                                                        
                      `amtpaid` decimal(18,2) NOT NULL,                                                                       
                      `downpaymentrate` decimal(10,4) NOT NULL,                                                               
                      `downpayment` decimal(18,2) NOT NULL,                                                                   
                      `amtforinstallment` decimal(18,2) NOT NULL,                                                             
                      `firstpartyname` varchar(150) NOT NULL,                                                                 
                      `firstpartytitle` varchar(50) NOT NULL,                                                                 
                      `secondpartyrepresentative` varchar(150) NOT NULL,                                                      
                      `secondpartyname` varchar(1000) NOT NULL,                                                               
                      `secondpartyaddress` varchar(150) NOT NULL,                                                             
                      `downpaymentrequired` int(11) NOT NULL,                                                                 
                      `cypaymentrequired` int(11) NOT NULL,                                                                   
                      `startyear` int(11) NOT NULL,                                                                           
                      `startqtr` int(11) NOT NULL,                                                                            
                      `endyear` int(11) NOT NULL,                                                                             
                      `endqtr` int(11) NOT NULL,                                                                              
                      PRIMARY KEY  (`objid`),                                                                                 
                      KEY `FK_rptcompromise_list_faas` (`faasid`),                                                            
                      KEY `FK_rptcompromise_list_rptledger` (`ledgerid`),                                                     
                      CONSTRAINT `FK_rptcompromise_list` FOREIGN KEY (`objid`) REFERENCES `rptcompromise` (`objid`),          
                      CONSTRAINT `FK_rptcompromise_list_faas` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`),             
                      CONSTRAINT `FK_rptcompromise_list_rptledger` FOREIGN KEY (`ledgerid`) REFERENCES `rptledger` (`objid`)  
                    ) ENGINE=InnoDB DEFAULT CHARSET=latin1    ;



CREATE TABLE lguname_etracs.`rptcompromise_installment` (                                                                                       
                             `objid` varchar(50) NOT NULL,                                                                                                  
                             `rptcompromiseid` varchar(50) NOT NULL,                                                                                        
                             `ledgerid` varchar(50) NOT NULL,                                                                                               
                             `installmentno` int(11) NOT NULL,                                                                                              
                             `duedate` date NOT NULL,                                                                                                       
                             `amount` decimal(18,2) NOT NULL,                                                                                               
                             `amtpaid` decimal(18,2) NOT NULL,                                                                                              
                             `fullypaid` int(11) NOT NULL,                                                                                                  
                             PRIMARY KEY  (`objid`),                                                                                                        
                             KEY `FK_rptcompromise_installment_rptcompromise` (`rptcompromiseid`),                                                          
                             KEY `FK_rptcompromise_installment_rptledger` (`ledgerid`),                                                                     
                             CONSTRAINT `FK_rptcompromise_installment_rptcompromise` FOREIGN KEY (`rptcompromiseid`) REFERENCES `rptcompromise` (`objid`),  
                             CONSTRAINT `FK_rptcompromise_installment_rptledger` FOREIGN KEY (`ledgerid`) REFERENCES `rptledger` (`objid`)                  
                           ) ENGINE=InnoDB DEFAULT CHARSET=latin1   ;

CREATE TABLE lguname_etracs.`rptcompromise_item` (                                                                                       
                      `objid` varchar(50) NOT NULL,                                                                                           
                      `rptcompromiseid` varchar(50) NOT NULL,                                                                                 
                      `iyear` int(11) NOT NULL,                                                                                               
                      `iqtr` int(11) NOT NULL,                                                                                                
                      `ledgerid` varchar(50) NOT NULL,                                                                                        
                      `faasid` varchar(50) NOT NULL,                                                                                          
                      `assessedvalue` decimal(18,2) NOT NULL,                                                                                 
                      `tdno` varchar(30) NOT NULL,                                                                                            
                      `classcode` varchar(10) NOT NULL,                                                                                       
                      `actualusecode` varchar(10) NOT NULL,                                                                                   
                      `basic` decimal(18,2) NOT NULL,                                                                                         
                      `basicpaid` decimal(18,2) NOT NULL,                                                                                     
                      `basicint` decimal(18,2) NOT NULL,                                                                                      
                      `basicintpaid` decimal(18,2) NOT NULL,                                                                                  
                      `sef` decimal(18,2) NOT NULL,                                                                                           
                      `sefpaid` decimal(18,2) NOT NULL,                                                                                       
                      `sefint` decimal(18,2) NOT NULL,                                                                                        
                      `sefintpaid` decimal(18,2) NOT NULL,                                                                                    
                      `total` decimal(18,2) default NULL,                                                                                     
                      `fullypaid` int(11) NOT NULL,                                                                                           
                      PRIMARY KEY  (`objid`),                                                                                                 
                      KEY `FK_rptcompromise_item_faas` (`faasid`),                                                                            
                      KEY `FK_rptcompromise_item_rptledger` (`ledgerid`),                                                                     
                      KEY `FK_rptcompromise_item_rptcompromise` (`rptcompromiseid`),                                                          
                      CONSTRAINT `FK_rptcompromise_item_faas` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`),                             
                      CONSTRAINT `FK_rptcompromise_item_rptcompromise` FOREIGN KEY (`rptcompromiseid`) REFERENCES `rptcompromise` (`objid`),  
                      CONSTRAINT `FK_rptcompromise_item_rptledger` FOREIGN KEY (`ledgerid`) REFERENCES `rptledger` (`objid`)                  
                    ) ENGINE=InnoDB DEFAULT CHARSET=latin1  ;



CREATE TABLE lguname_etracs.`rptcompromise_credit` (                                                                                               
                        `objid` varchar(50) NOT NULL,                                                                                                     
                        `receiptid` varchar(50) NOT NULL,                                                                                                 
                        `ledgerid` varchar(50) NOT NULL,                                                                                                  
                        `rptcompromiseid` varchar(50) NOT NULL,                                                                                           
                        `installmentid` varchar(50) default NULL,                                                                                         
                        `itemid` varchar(50) default NULL,                                                                                                
                        `collectorname` varchar(100) NOT NULL,                                                                                            
                        `collectortitle` varchar(50) NOT NULL,                                                                                            
                        `orno` varchar(15) NOT NULL,                                                                                                      
                        `ordate` date NOT NULL,                                                                                                           
                        `amount` decimal(18,2) NOT NULL,                                                                                                  
                        `voided` int(11) NOT NULL,                                                                                                        
                        PRIMARY KEY  (`objid`),                                                                                                           
                        KEY `FK_rptcompromise_credit_rptledger` (`ledgerid`),                                                                             
                        KEY `FK_rptcompromise_credit_rptcompromise` (`rptcompromiseid`),                                                                  
                        KEY `FK_rptcompromise_credit_installment` (`installmentid`),                                                                      
                        KEY `FK_rptcompromise_credit` (`receiptid`),                                                                                      
                        CONSTRAINT `FK_rptcompromise_credit` FOREIGN KEY (`receiptid`) REFERENCES `receipt` (`objid`),                                    
                        CONSTRAINT `FK_rptcompromise_credit_installment` FOREIGN KEY (`installmentid`) REFERENCES `rptcompromise_installment` (`objid`),  
                        CONSTRAINT `FK_rptcompromise_credit_rptcompromise` FOREIGN KEY (`rptcompromiseid`) REFERENCES `rptcompromise` (`objid`),          
                        CONSTRAINT `FK_rptcompromise_credit_rptledger` FOREIGN KEY (`ledgerid`) REFERENCES `rptledger` (`objid`)                          
                      ) ENGINE=InnoDB DEFAULT CHARSET=latin1   ;





ALTER TABLE lguname_etracs.rptledger ADD COLUMN undercompromised int null;
ALTER TABLE lguname_etracs.rptledger CHANGE COLUMN undercompromised undercompromised int null;

UPDATE lguname_etracs.rptledger SET undercompromised = 0 WHERE undercompromised IS NULL; 


insert into lguname_system.sys_var (name, value, category ) values('rpt_advance_payment_collected_as_trust', '0', 'LANDTAX');



set foreign_key_checks=1;					   	