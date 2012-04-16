webdraft  CREATE TABLE `webdraft` (                   
	`objid` varchar(50) NOT NULL,             
	`description` varchar(100) default NULL,  
	`owner` varchar(50) default NULL,         
	`refid` varchar(50) default NULL,         
	`info` mediumtext,                        
	PRIMARY KEY  (`objid`)                    
) ENGINE=InnoDB DEFAULT CHARSET=latin1   