SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE lguname_etracs.subdivisionland 
	ADD COLUMN administratorname VARCHAR(200),
	ADD COLUMN administratoraddress VARCHAR(200);
	
ALTER TABLE lguname_etracs.afcontrol CHANGE COLUMN afinventorycreditid afinventorycreditid VARCHAR(50) NULL;

CREATE TABLE lguname_etracs.`personnel_txncode` (
  `personnelid` VARCHAR(50) NOT NULL,
  `txncode` VARCHAR(10) NOT NULL,
  PRIMARY KEY  (`personnelid`,`txncode`),
  CONSTRAINT `FK_personneltxncode_personnel` FOREIGN KEY (`personnelid`) REFERENCES `personnel` (`objid`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;



ALTER TABLE lguname_etracs.noticeofassessment 
	ADD COLUMN ry INT NOT NULL,
	ADD COLUMN EXTENDED TEXT ;
	
DROP TABLE IF EXISTS lguname_etracs.`rptcompromise`;

CREATE TABLE lguname_etracs.`rptcompromise` (                                                                       
                 `objid` VARCHAR(50) NOT NULL,                                                                      
                 `docstate` VARCHAR(25) NOT NULL,                                                                   
                 `txnno` VARCHAR(10) DEFAULT NULL,                                                                  
                 `txndate` DATE DEFAULT NULL,                                                                       
                 `faasid` VARCHAR(50) NOT NULL,                                                                     
                 `ledgerid` VARCHAR(50) NOT NULL,                                                                   
                 `info` TEXT NOT NULL,                                                                              
                 `signatories` TEXT NOT NULL,                                                                       
                 `extended` TEXT,                                                                                   
                 PRIMARY KEY  (`objid`),                                                                            
                 KEY `FK_rptcompromise_rptledger` (`ledgerid`),                                                     
                 KEY `FK_rptcompromise_faas` (`faasid`),                                                            
                 CONSTRAINT `FK_rptcompromise_faas` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`),             
                 CONSTRAINT `FK_rptcompromise_rptledger` FOREIGN KEY (`ledgerid`) REFERENCES `rptledger` (`objid`)  
               ) ENGINE=INNODB DEFAULT CHARSET=latin1 ;


DROP TABLE IF EXISTS lguname_etracs.`rptcompromise_list`;

CREATE TABLE lguname_etracs.`rptcompromise_list` (                                                                       
                      `objid` VARCHAR(50) NOT NULL,                                                                           
                      `docstate` VARCHAR(25) NOT NULL,                                                                        
                      `txnno` VARCHAR(25) DEFAULT NULL,                                                                       
                      `txndate` DATE DEFAULT NULL,                                                                            
                      `faasid` VARCHAR(50) NOT NULL,                                                                          
                      `ledgerid` VARCHAR(50) NOT NULL,                                                                        
                      `enddate` DATE NOT NULL,                                                                                
                      `term` INT(11) NOT NULL,                                                                                
                      `numofinstallment` DECIMAL(18,2) NOT NULL,                                                              
                      `amount` DECIMAL(18,2) NOT NULL,                                                                        
                      `amtpaid` DECIMAL(18,2) NOT NULL,                                                                       
                      `downpaymentrate` DECIMAL(10,4) NOT NULL,                                                               
                      `downpayment` DECIMAL(18,2) NOT NULL,                                                                   
                      `amtforinstallment` DECIMAL(18,2) NOT NULL,                                                             
                      `firstpartyname` VARCHAR(150) NOT NULL,                                                                 
                      `firstpartytitle` VARCHAR(50) NOT NULL,                                                                 
                      `secondpartyrepresentative` VARCHAR(150) NOT NULL,                                                      
                      `secondpartyname` VARCHAR(1000) NOT NULL,                                                               
                      `secondpartyaddress` VARCHAR(150) NOT NULL,                                                             
                      `downpaymentrequired` INT(11) NOT NULL,                                                                 
                      `cypaymentrequired` INT(11) NOT NULL,                                                                   
                      `startyear` INT(11) NOT NULL,                                                                           
                      `startqtr` INT(11) NOT NULL,                                                                            
                      `endyear` INT(11) NOT NULL,                                                                             
                      `endqtr` INT(11) NOT NULL,                                                                              
                      PRIMARY KEY  (`objid`),                                                                                 
                      KEY `FK_rptcompromise_list_faas` (`faasid`),                                                            
                      KEY `FK_rptcompromise_list_rptledger` (`ledgerid`),                                                     
                      CONSTRAINT `FK_rptcompromise_list` FOREIGN KEY (`objid`) REFERENCES `rptcompromise` (`objid`),          
                      CONSTRAINT `FK_rptcompromise_list_faas` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`),             
                      CONSTRAINT `FK_rptcompromise_list_rptledger` FOREIGN KEY (`ledgerid`) REFERENCES `rptledger` (`objid`)  
                    ) ENGINE=INNODB DEFAULT CHARSET=latin1    ;



DROP TABLE IF EXISTS lguname_etracs.`rptcompromise_installment`;

CREATE TABLE lguname_etracs.`rptcompromise_installment` (                                                                                       
                             `objid` VARCHAR(50) NOT NULL,                                                                                                  
                             `rptcompromiseid` VARCHAR(50) NOT NULL,                                                                                        
                             `ledgerid` VARCHAR(50) NOT NULL,                                                                                               
                             `installmentno` INT(11) NOT NULL,                                                                                              
                             `duedate` DATE NOT NULL,                                                                                                       
                             `amount` DECIMAL(18,2) NOT NULL,                                                                                               
                             `amtpaid` DECIMAL(18,2) NOT NULL,                                                                                              
                             `fullypaid` INT(11) NOT NULL,                                                                                                  
                             PRIMARY KEY  (`objid`),                                                                                                        
                             KEY `FK_rptcompromise_installment_rptcompromise` (`rptcompromiseid`),                                                          
                             KEY `FK_rptcompromise_installment_rptledger` (`ledgerid`),                                                                     
                             CONSTRAINT `FK_rptcompromise_installment_rptcompromise` FOREIGN KEY (`rptcompromiseid`) REFERENCES `rptcompromise` (`objid`),  
                             CONSTRAINT `FK_rptcompromise_installment_rptledger` FOREIGN KEY (`ledgerid`) REFERENCES `rptledger` (`objid`)                  
                           ) ENGINE=INNODB DEFAULT CHARSET=latin1   ;

DROP TABLE IF EXISTS lguname_etracs.`rptcompromise_item`;
						   
CREATE TABLE lguname_etracs.`rptcompromise_item` (                                                                                       
                      `objid` VARCHAR(50) NOT NULL,                                                                                           
                      `rptcompromiseid` VARCHAR(50) NOT NULL,                                                                                 
                      `iyear` INT(11) NOT NULL,                                                                                               
                      `iqtr` INT(11) NOT NULL,                                                                                                
                      `ledgerid` VARCHAR(50) NOT NULL,                                                                                        
                      `faasid` VARCHAR(50) NOT NULL,                                                                                          
                      `assessedvalue` DECIMAL(18,2) NOT NULL,                                                                                 
                      `tdno` VARCHAR(30) NOT NULL,                                                                                            
                      `classcode` VARCHAR(10) NOT NULL,                                                                                       
                      `actualusecode` VARCHAR(10) NOT NULL,                                                                                   
                      `basic` DECIMAL(18,2) NOT NULL,                                                                                         
                      `basicpaid` DECIMAL(18,2) NOT NULL,                                                                                     
                      `basicint` DECIMAL(18,2) NOT NULL,                                                                                      
                      `basicintpaid` DECIMAL(18,2) NOT NULL,                                                                                  
                      `sef` DECIMAL(18,2) NOT NULL,                                                                                           
                      `sefpaid` DECIMAL(18,2) NOT NULL,                                                                                       
                      `sefint` DECIMAL(18,2) NOT NULL,                                                                                        
                      `sefintpaid` DECIMAL(18,2) NOT NULL,                                                                                    
                      `total` DECIMAL(18,2) DEFAULT NULL,                                                                                     
                      `fullypaid` INT(11) NOT NULL,                                                                                           
                      PRIMARY KEY  (`objid`),                                                                                                 
                      KEY `FK_rptcompromise_item_faas` (`faasid`),                                                                            
                      KEY `FK_rptcompromise_item_rptledger` (`ledgerid`),                                                                     
                      KEY `FK_rptcompromise_item_rptcompromise` (`rptcompromiseid`),                                                          
                      CONSTRAINT `FK_rptcompromise_item_faas` FOREIGN KEY (`faasid`) REFERENCES `faas` (`objid`),                             
                      CONSTRAINT `FK_rptcompromise_item_rptcompromise` FOREIGN KEY (`rptcompromiseid`) REFERENCES `rptcompromise` (`objid`),  
                      CONSTRAINT `FK_rptcompromise_item_rptledger` FOREIGN KEY (`ledgerid`) REFERENCES `rptledger` (`objid`)                  
                    ) ENGINE=INNODB DEFAULT CHARSET=latin1  ;



DROP TABLE IF EXISTS lguname_etracs.`rptcompromise_credit`;

CREATE TABLE lguname_etracs.`rptcompromise_credit` (                                                                                               
                        `objid` VARCHAR(50) NOT NULL,                                                                                                     
                        `receiptid` VARCHAR(50) NOT NULL,                                                                                                 
                        `ledgerid` VARCHAR(50) NOT NULL,                                                                                                  
                        `rptcompromiseid` VARCHAR(50) NOT NULL,                                                                                           
                        `installmentid` VARCHAR(50) DEFAULT NULL,                                                                                         
                        `itemid` VARCHAR(50) DEFAULT NULL,                                                                                                
                        `collectorname` VARCHAR(100) NOT NULL,                                                                                            
                        `collectortitle` VARCHAR(50) NOT NULL,                                                                                            
                        `orno` VARCHAR(15) NOT NULL,                                                                                                      
                        `ordate` DATE NOT NULL,                                                                                                           
                        `amount` DECIMAL(18,2) NOT NULL,                                                                                                  
                        `voided` INT(11) NOT NULL,                                                                                                        
                        PRIMARY KEY  (`objid`),                                                                                                           
                        KEY `FK_rptcompromise_credit_rptledger` (`ledgerid`),                                                                             
                        KEY `FK_rptcompromise_credit_rptcompromise` (`rptcompromiseid`),                                                                  
                        KEY `FK_rptcompromise_credit_installment` (`installmentid`),                                                                      
                        KEY `FK_rptcompromise_credit` (`receiptid`),                                                                                      
                        CONSTRAINT `FK_rptcompromise_credit` FOREIGN KEY (`receiptid`) REFERENCES `receipt` (`objid`),                                    
                        CONSTRAINT `FK_rptcompromise_credit_installment` FOREIGN KEY (`installmentid`) REFERENCES `rptcompromise_installment` (`objid`),  
                        CONSTRAINT `FK_rptcompromise_credit_rptcompromise` FOREIGN KEY (`rptcompromiseid`) REFERENCES `rptcompromise` (`objid`),          
                        CONSTRAINT `FK_rptcompromise_credit_rptledger` FOREIGN KEY (`ledgerid`) REFERENCES `rptledger` (`objid`)                          
                      ) ENGINE=INNODB DEFAULT CHARSET=latin1   ;





ALTER TABLE lguname_etracs.rptledger ADD COLUMN undercompromised INT NOT NULL;

UPDATE lguname_etracs.rptledger SET undercompromised = 0 WHERE undercompromised IS NULL; 


SET FOREIGN_KEY_CHECKS=1;	