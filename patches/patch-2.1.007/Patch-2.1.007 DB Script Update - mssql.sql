
alter table bayawan_etracs..noticeofassessment 	add ry int not null;
alter table bayawan_etracs..noticeofassessment 	add extended text;
	
	
CREATE TABLE bayawan_etracs..rptcompromise (                                                                       
                 objid varchar(50) NOT NULL,                                                                      
                 docstate varchar(25) NOT NULL,                                                                   
                 txnno varchar(10) default NULL,                                                                  
                 txndate date default NULL,                                                                       
                 faasid varchar(50) NOT NULL,                                                                     
                 ledgerid varchar(50) NOT NULL,                                                                   
                 info text NOT NULL,                                                                              
                 signatories text NOT NULL,                                                                       
                 extended text,                                                                                   
                 PRIMARY KEY  (objid),                                                                            
                 CONSTRAINT FK_rptcompromise_faas FOREIGN KEY (faasid) REFERENCES faas (objid),             
                 CONSTRAINT FK_rptcompromise_rptledger FOREIGN KEY (ledgerid) REFERENCES rptledger (objid)  
               );
               
create index ix_ledgerid on bayawan_etracs..rptcompromise(ledgerid);
create index ix_faasid on bayawan_etracs..rptcompromise(faasid);
                                


CREATE TABLE bayawan_etracs..rptcompromise_list (                                                                       
                      objid varchar(50) NOT NULL,                                                                           
                      docstate varchar(25) NOT NULL,                                                                        
                      txnno varchar(25) default NULL,                                                                       
                      txndate date default NULL,                                                                            
                      faasid varchar(50) NOT NULL,                                                                          
                      ledgerid varchar(50) NOT NULL,                                                                        
                      enddate date NOT NULL,                                                                                
                      term int NOT NULL,                                                                                
                      numofinstallment decimal(18,2) NOT NULL,                                                              
                      amount decimal(18,2) NOT NULL,                                                                        
                      amtpaid decimal(18,2) NOT NULL,                                                                       
                      downpaymentrate decimal(10,4) NOT NULL,                                                               
                      downpayment decimal(18,2) NOT NULL,                                                                   
                      amtforinstallment decimal(18,2) NOT NULL,                                                             
                      firstpartyname varchar(150) NOT NULL,                                                                 
                      firstpartytitle varchar(50) NOT NULL,                                                                 
                      secondpartyrepresentative varchar(150) NOT NULL,                                                      
                      secondpartyname varchar(1000) NOT NULL,                                                               
                      secondpartyaddress varchar(150) NOT NULL,                                                             
                      downpaymentrequired int NOT NULL,                                                                 
                      cypaymentrequired int NOT NULL,                                                                   
                      startyear int NOT NULL,                                                                           
                      startqtr int NOT NULL,                                                                            
                      endyear int NOT NULL,                                                                             
                      endqtr int NOT NULL,                                                                              
                      PRIMARY KEY  (objid),                                                                                 
                      CONSTRAINT FK_rptcompromise_list FOREIGN KEY (objid) REFERENCES rptcompromise (objid),          
                      CONSTRAINT FK_rptcompromise_list_faas FOREIGN KEY (faasid) REFERENCES faas (objid),             
                      CONSTRAINT FK_rptcompromise_list_rptledger FOREIGN KEY (ledgerid) REFERENCES rptledger (objid)  
                    ) ;
                    
create index ix_faasid on bayawan_etracs..rptcompromise_list(faasid);
create index ix_ledgerid on bayawan_etracs..rptcompromise_list(ledgerid);
                                         



CREATE TABLE bayawan_etracs..rptcompromise_installment (                                                                                       
                             objid varchar(50) NOT NULL,                                                                                                  
                             rptcompromiseid varchar(50) NOT NULL,                                                                                        
                             ledgerid varchar(50) NOT NULL,                                                                                               
                             installmentno int NOT NULL,                                                                                              
                             duedate date NOT NULL,                                                                                                       
                             amount decimal(18,2) NOT NULL,                                                                                               
                             amtpaid decimal(18,2) NOT NULL,                                                                                              
                             fullypaid int NOT NULL,                                                                                                  
                             PRIMARY KEY  (objid),                                                                                                        
                             CONSTRAINT FK_rptcompromise_installment_rptcompromise FOREIGN KEY (rptcompromiseid) REFERENCES rptcompromise (objid),  
                             CONSTRAINT FK_rptcompromise_installment_rptledger FOREIGN KEY (ledgerid) REFERENCES rptledger (objid)                  
                           );
                           
create index ix_rptcompromiseid on bayawan_etracs..rptcompromise_installment(rptcompromiseid);
create index ix_ledgerid on bayawan_etracs..rptcompromise_installment(ledgerid);
                                                        

CREATE TABLE bayawan_etracs..rptcompromise_item (                                                                                       
                      objid varchar(50) NOT NULL,                                                                                           
                      rptcompromiseid varchar(50) NOT NULL,                                                                                 
                      iyear int NOT NULL,                                                                                               
                      iqtr int NOT NULL,                                                                                                
                      ledgerid varchar(50) NOT NULL,                                                                                        
                      faasid varchar(50) NOT NULL,                                                                                          
                      assessedvalue decimal(18,2) NOT NULL,                                                                                 
                      tdno varchar(30) NOT NULL,                                                                                            
                      classcode varchar(10) NOT NULL,                                                                                       
                      actualusecode varchar(10) NOT NULL,                                                                                   
                      basic decimal(18,2) NOT NULL,                                                                                         
                      basicpaid decimal(18,2) NOT NULL,                                                                                     
                      basicint decimal(18,2) NOT NULL,                                                                                      
                      basicintpaid decimal(18,2) NOT NULL,                                                                                  
                      sef decimal(18,2) NOT NULL,                                                                                           
                      sefpaid decimal(18,2) NOT NULL,                                                                                       
                      sefint decimal(18,2) NOT NULL,                                                                                        
                      sefintpaid decimal(18,2) NOT NULL,                                                                                    
                      total decimal(18,2) default NULL,                                                                                     
                      fullypaid int NOT NULL,                                                                                           
                      PRIMARY KEY  (objid),                                                                                                 
                      CONSTRAINT FK_rptcompromise_item_faas FOREIGN KEY (faasid) REFERENCES faas (objid),                             
                      CONSTRAINT FK_rptcompromise_item_rptcompromise FOREIGN KEY (rptcompromiseid) REFERENCES rptcompromise (objid),  
                      CONSTRAINT FK_rptcompromise_item_rptledger FOREIGN KEY (ledgerid) REFERENCES rptledger (objid)                  
                    );

create index ix_faasid on bayawan_etracs..rptcompromise_item(faasid);
create index ix_ledgerid on bayawan_etracs..rptcompromise_item(ledgerid);
create index ix_rptcompromiseid on bayawan_etracs..rptcompromise_item(rptcompromiseid);
                      
                      


CREATE TABLE `rptcompromise_credit` (
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
  `paidby` varchar(100) default NULL,
  `paidbyaddress` varchar(100) default NULL,
  `mode` varchar(25) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_rptcompromise_credit_rptledger` (`ledgerid`),
  KEY `FK_rptcompromise_credit_rptcompromise` (`rptcompromiseid`),
  KEY `FK_rptcompromise_credit_installment` (`installmentid`),
  CONSTRAINT `FK_rptcompromise_credit_installment` FOREIGN KEY (`installmentid`) REFERENCES `rptcompromise_installment` (`objid`),
  CONSTRAINT `FK_rptcompromise_credit_rptcompromise` FOREIGN KEY (`rptcompromiseid`) REFERENCES `rptcompromise` (`objid`),
  CONSTRAINT `FK_rptcompromise_credit_rptledger` FOREIGN KEY (`ledgerid`) REFERENCES `rptledger` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

                      
create index ix_ledgerid on bayawan_etracs..rptcompromise_credit(ledgerid);
create index ix_rptcompromiseid on bayawan_etracs..rptcompromise_credit(rptcompromiseid);
create index ix_installmentid on bayawan_etracs..rptcompromise_credit(installmentid);
create index ix_receiptid on bayawan_etracs..rptcompromise_credit(receiptid);
                                              



alter table bayawan_etracs..landrysetting add appliedto varchar(150);
alter table bayawan_etracs..bldgrysetting add appliedto varchar(150);
alter table bayawan_etracs..machrysetting add appliedto varchar(150);
alter table bayawan_etracs..planttreerysetting add appliedto varchar(150);
alter table bayawan_etracs..miscrysetting add appliedto varchar(150);

update bayawan_etracs..landrysetting set appliedto = 'BAYAWAN';
update bayawan_etracs..bldgrysetting set appliedto = 'BAYAWAN';
update bayawan_etracs..machrysetting set appliedto = 'BAYAWAN';
update bayawan_etracs..planttreerysetting set appliedto = 'BAYAWAN';
update bayawan_etracs..miscrysetting set appliedto = 'BAYAWAN';


insert into bayawan_etracs..rysetting_lgu 
select objid, '218', 'BAYAWAN', 'land' from bayawan_etracs..landrysetting;

insert into bayawan_etracs..rysetting_lgu 
select objid, '218', 'BAYAWAN', 'bldg' from bayawan_etracs..bldgrysetting;

insert into bayawan_etracs..rysetting_lgu 
select objid, '218', 'BAYAWAN', 'mach' from bayawan_etracs..machrysetting;

insert into bayawan_etracs..rysetting_lgu 
select objid, '218', 'BAYAWAN', 'misc' from bayawan_etracs..miscrysetting;

insert into bayawan_etracs..rysetting_lgu 
select objid, '218', 'BAYAWAN', 'planttree' from bayawan_etracs..planttreerysetting;





ALTER TABLE bayawan_etracs..rptledger ADD undercompromised int not null;

UPDATE bayawan_etracs..rptledger SET undercompromised = 0 WHERE undercompromised IS NULL; 




insert into bayawan_system..sys_var (name, value, category ) values('rpt_advance_payment_collected_as_trust', '0', 'LANDTAX');


alter table bayawan_etracs..faaslist add prevowner varchar(1000);
alter table bayawan_etracs..faaslist add prevpin varchar(250);
alter table bayawan_etracs..faaslist add prevmv decimal(16,2);
alter table bayawan_etracs..faaslist add prevav decimal(16,2);
alter table bayawan_etracs..faaslist add lguid varchar(50);
alter table bayawan_etracs..faaslist add lguname varchar(50);



CREATE TABLE bayawan_etracs..landrpuitem(
	[objid] [varchar](50) NOT NULL,
	[faasid] [varchar](50) NOT NULL,
	[lcuvid] [varchar](50) NOT NULL,
	[lcuvcode] [varchar](10) NOT NULL,
	[lcuvname] [varchar](50) NOT NULL,
	[specificclassid] [varchar](50) NOT NULL,
	[specificclasscode] [varchar](25) NOT NULL,
	[specificclassname] [varchar](100) NOT NULL,
	[subclassid] [varchar](50) NOT NULL,
	[subclasscode] [varchar](25) NOT NULL,
	[subclassname] [varchar](100) NOT NULL,
	[assesslevelid] [varchar](50) NOT NULL,
	[assesslevelcode] [varchar](25) NOT NULL,
	[assesslevelname] [varchar](100) NOT NULL,
	[assesslevel] [decimal](10, 2) NOT NULL,
	[strippingid] [varchar](50) NULL,
	[striplevel] [varchar](50) NULL,
	[striprate] [decimal](10, 2) NULL,
	[area] [decimal](18, 6) NOT NULL,
	[areaha] [decimal](18, 6) NOT NULL,
	[areasqm] [decimal](18, 6) NOT NULL,
	[areatype] [varchar](5) NOT NULL,
	[basevalue] [decimal](18, 2) NOT NULL,
	[unitvalue] [decimal](18, 2) NOT NULL,
	[adjustment] [decimal](18, 2) NOT NULL,
	[landvalueadjustment] [decimal](18, 2) NOT NULL,
	[basemarketvalue] [decimal](18, 2) NOT NULL,
	[marketvalue] [decimal](18, 2) NOT NULL,
	[assessedvalue] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



CREATE TABLE bayawan_etracs.[dbo].[realproperty](
	[objid] [varchar](50) NOT NULL,
	[landfaasid] [varchar](50) NOT NULL,
	[provcity] [varchar](50) NOT NULL,
	[munidistrict] [varchar](50) NOT NULL,
	[barangay] [varchar](50) NOT NULL,
	[barangayid] [varchar](50) NOT NULL,
	[lgutype] [varchar](50) NULL,
	[pintype] [varchar](5) NULL,
	[pin] [varchar](30) NOT NULL,
	[provcityindex] [varchar](5) NOT NULL,
	[munidistrictindex] [varchar](5) NOT NULL,
	[barangayindex] [varchar](5) NOT NULL,
	[section] [varchar](3) NOT NULL,
	[parcel] [varchar](3) NOT NULL,
	[arpno] [varchar](30) NULL,
	[cadastrallotno] [varchar](255) NOT NULL,
	[blockno] [varchar](255) NULL,
	[surveyno] [varchar](30) NULL,
	[houseno] [varchar](25) NULL,
	[street] [varchar](100) NULL,
	[purok] [varchar](25) NULL,
	[attributes] [text] NULL,
	[north] [varchar](255) NOT NULL,
	[south] [varchar](255) NOT NULL,
	[east] [varchar](255) NOT NULL,
	[west] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

CREATE TABLE fortransmittal (
  objid varchar(50) NOT NULL,
  module varchar(50) NOT NULL,
  doctype varchar(50) NOT NULL,
  docno varchar(50) NOT NULL,
  postedbyid varchar(50) NOT NULL,
  postedby varchar(100) NOT NULL,
  postedbytitle varchar(100) NOT NULL,
  dtposted datetime NOT NULL,
  PRIMARY KEY  (objid),
) ;

CREATE INDEX ix_fortransmittal_module ON fortransmittal(module);


CREATE TABLE noticeofdelinquency (
  objid varchar(50) NOT NULL,
  ledgerid varchar(50) NOT NULL,
  txnno varchar(15) NOT NULL,
  txndate datetime NOT NULL,
  tdno varchar(25) NOT NULL,
  taxpayername varchar(500) NOT NULL,
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
  currentyear int  NOT NULL,
  delinquentyrqtr varchar(10) NOT NULL,
  extended text,
  PRIMARY KEY  (objid)
);

CREATE INDEX ix_ledger on noticeofdelinquency( ledgerid );
CREATE INDEX ix_tdno on noticeofdelinquency( tdno );
CREATE INDEX ix_taxpayername on noticeofdelinquency( taxpayername );
CREATE INDEX ix_cadastrallotno on noticeofdelinquency( cadastrallotno );





/*Data for the table bayawan_system..sys_module */

delete from bayawan_system..sys_roleclass_module ;
delete from bayawan_system..sys_roleclass;
delete from bayawan_system..sys_module;

insert  into bayawan_system..sys_module("name","title","description","version","filename","lastmodified","permissions") values ('bp-rule-mgmt','BP Rule Management',NULL,NULL,NULL,NULL,'[  [action:''bpbillingrule.view''		,title:''Author BP Billing Rules'' ],  [action:''bpassessmentrule.view''	,title:''Author Business Assessment Rules'' ],  [action:''bpruleanalyzer.view''		,title:''Business Assessment Rule Analyzer''],]');
insert  into bayawan_system..sys_module("name","title","description","version","filename","lastmodified","permissions") values ('bp2','BPLS',NULL,NULL,NULL,NULL,'[ [action:''bpadmin.setting'',                   title:''Manage Business Settings''], [action:''bpadmin.bprulevariable'',                   title:''Manage Business Variable''], [action:''bpadmin.lobattributes'',              title:''Manage LOB Attributes''], [action:''bpadmin.bpruleanalyzer'',              title:''Manage Rule Analyzer''], [action:''bpadmin.newrule'',                   title:''Create New Business Rule''], [action:''bpadmin.openrule'',                   title:''Open Business Rule''], [action:''bpadmin.deleterule'',                   title:''Delete Business Rule''],  [action:''bpadmin.lob'',                          title:''Create View and Update Line Of Business Transaction''], [action:''bpadmin.lobclassification'',            title:''Create View and Update Line Of Business Classification Transaction''],  [action:''bpbillingrule.view''			,title:''View BP Billing Rules'' ], [action:''bpbillingrule.create''		,title:''Create BP Billing Rule'' ], [action:''bpbillingrule.delete''		,title:''Delete BP Billing Rule'' ], [action:''bpassessmentrule.view''		,title:''View BP Assessment Rules'' ], [action:''bpassessmentrule.create''		,title:''Create BP Assessment Rule'' ], [action:''bpassessmentrule.delete''		,title:''Delete BP Assessment Rule'' ], [action:''bpbilling.generate'',                title:''Generate BP Billing''], [action:''bpmanagement.open''		,title:''Manage Master Files'' ],   [action:''bplicensing.newtransaction'',		title:''Create New Application Transaction''],  [action:''bplicensing.renewtransaction'',		title:''Create Renew Application Transaction''],  [action:''bplicensing.addlobtransaction'',		title:''Create Add Line of Business Application Transaction''],  [action:''bplicensing.retiretransaction'',		title:''Create Retire Application Transaction''],  [action:''bplicensing.capturenewtransaction'',		title:''Create Capture New Application Transaction''],  [action:''bplicensing.capturerenewtransaction'',		title:''Create Capture Renew Application Transaction''],    [action:''bplicensing.save'',                title:''Save Application Transaction''],  [action:''bplicensing.edit'',                title:''Edit Application Transaction''],  [action:''bplicensing.delete'',                title:''Delete Application Transaction''],  [action:''bplicensing.submit'',                title:''Submit Application Transaction''],    [action:''bplicensing.applicationlist'',       title:''View Application Listing''],  [action:''bplicensing.viewapplication'',         title:''View Business Application''],  [action:''bplicensing.viewassessment'',         title:''View Business Assessment''],  [action:''bplicensing.approve'',                title:''Approve Business Application''],  [action:''bplicensing.disapprove'',                title:''Disapprove Business Application''],  [action:''bplicensing.submitforreview'',                title:''Submit Business Application For Review''],  [action:''bplicensing.reassess'',                title:''Reassess Business Application For Review''],  [action:''bplicensing.assess'',                title:''Assess Business Application''],  [action:''bplicensing.cancelassessment'',                title:''Cancel Assessment''],  [action:''bpbilling.generate'',                title:''Generate BP Billing''],   [action:''bptransaction.view''		,title:''View Business Transactions''],[action:''bpadmin.changebusinessaddress'',        title:''Allow Change Business Address Transaction''], [action:''bpadmin.changepermittee'',              title:''Allow Change Permittee Transaction''], [action:''bpadmin.changetradename'',              title:''Allow Change Trade Name''], [action:''bpadmin.changeadministrator'',          title:''Change Business Administrator''],[action:''bpadmin.ledger'',                       title:''Manage Business Ledger''], [action:''bpreportmgmt.open''		,title:''View Report Management'' ], [action:''bpreport.delinquency''		,title:''Generate Delinquency Listing'' ], [action:''bpreport.masterlist''		,title:''Generate Taxpayer Masterlist'' ], [action:''bpreport.applisting''		,title:''Generate Application Listing'' ], [action:''bpreport.apploblisting''	,title:''Generate Application With LOB Listing'' ], [action:''bpreport.lobcountlisting''	,title:''Generate LOB Count Listing'' ], [action:''bpreport.bpcollectionreport'', title:''Generate Business Collection Report Listing'' ],  [action:''bpreport.lobtoplisting'',		title:''Generate Top N Businesses'' ], [action:''bpreport.loblisting''		,title:''Generate Line of Business Listing''],  [action:''bppermit.approvedapplications'',         title:''View Approved Business Applications''], [action:''bppermit.forreleasepermits'',         title:''View For Relased Permits''], [action:''bppermit.activepermits'',         title:''View Active Permits''],	 [action:''bppermit.release'',         title:''View Active Permits''], [action:''bppermit.retire'',          title:''View Retired Applications''], [action:''bppermit.forrenewapplications'',          title:''View Retired Applications''] [action:''collection_bp.create'',	 title:''Create Business Collection''], [action:''collection_bp.print'',	         title:''Print Business Collection''], [action:''collection_bp.edit'',	         title:''Edit Business Collection''], [action:''collection_bp.void'',	         title:''Void Business Collection''],]');
insert into bayawan_system..sys_module ("name", "title", "description", "version", "filename", "lastmodified", "permissions") values('ctc-rule-mgmt','CTC Rule Management',NULL,NULL,NULL,NULL,'[ 	[action: ''ctcassessmentrule.view'', title:''Manage CTC Rules''] ]');
insert into bayawan_system..sys_module ("name", "title", "description", "version", "filename", "lastmodified", "permissions") values('ctc2','CTC Collection',NULL,NULL,'ctc2',NULL,'[ 	[action: ''collection_ctc_individual.edit'',   title: ''Edit CTC Individual Collection''], 	[action: ''collection_ctc_individual.print'',  title: ''Print CTC Individual Collection''], 	[action: ''collection_ctc_individual.void'',   title: ''Void CTC Individual Collection''], 	[action: ''collection_ctc_individual.create'', title: ''Create CTC Individual Collection''],  	[action: ''collection_ctc_corporate.edit'',    title: ''Edit CTC Corporate Collection''], 	[action: ''collection_ctc_corporate.void'',    title: ''Void CTC Corporate Collection''], 	[action: ''collection_ctc_corporate.create'',  title: ''Create CTC Corporate Collection''], 	[action: ''collection_ctc_corporate.print'',   title: ''Print CTC Corporate Collection''], ]');
insert  into bayawan_system..sys_module("name","title","description","version","filename","lastmodified","permissions") values ('etracs2-admin','Admin',NULL,NULL,NULL,NULL,'[ [action:''etracsadmin.manage''  ,title:''Manage ETRACS User Accounts''], [action:''etracstask.manage''   ,title:''Manage Task''], [action:''etracstask.create''   ,title:''Create Task''], [action:''etracstask.delete''   ,title:''Delete Task''], [action:''etracstask.start''    ,title:''Start Task''], [action:''etracstask.suspend''  ,title:''Suspend Task''], [action:''etracstask.resume''   ,title:''Resume Task''],]');
insert  into bayawan_system..sys_module("name","title","description","version","filename","lastmodified","permissions") values ('etracs2-entity','Entity',NULL,NULL,NULL,NULL,'[ [action:''entity.manage''	,title:''Manage Entity''], [action:''entity.mapping''	,title:''Map Entity Data''], [action:''individual.create''	,title:''Create Individual''], [action:''individual.edit''	,title:''Edit Individual''], [action:''individual.delete''	,title:''Delete Individual''],	 [action:''juridical.create''	,title:''Create Juridical''], [action:''juridical.edit''	,title:''Edit Juridical''], [action:''juridical.delete''	,title:''Delete Juridical''],	 [action:''multiple.create''	,title:''Create Multiple Entity''], [action:''multiple.edit''	,title:''Edit Multiple Entity''], [action:''multiple.delete''	,title:''Delete Multiple Entity''],	]');
insert  into bayawan_system..sys_module("name","title","description","version","filename","lastmodified","permissions") values ('etracs2-prov','PASSO Management',NULL,NULL,NULL,NULL,'[]');
insert  into bayawan_system..sys_module("name","title","description","version","filename","lastmodified","permissions") values ('etracs2common','Shared',NULL,NULL,NULL,NULL,'[  [action:''entity.manage'',	title:''Manage Entity''],  [action:''individual.create'',    title:''Create Individual Entity''],  [action:''individual.edit'',    	title:''Edit Individual Entity''],  [action:''individual.delete'',    title:''Delete Individual Entity''],  [action:''juridical.create'',    	title:''Create Juridical Entity''],  [action:''juridical.edit'',    	title:''Edit Juridical Entity''],  [action:''juridical.delete'',    	title:''Delete Juridical Entity''],  [action:''multiple.create'',    	title:''Create Multiple Entity''],  [action:''multiple.edit'',    	title:''Edit Multiple Entity''],  [action:''multiple.delete'',    	title:''Delete Multiple Entity''],  [action:''rule.manage'',		title:''Manage Rules''],]');
insert into bayawan_system..sys_module ("name", "title", "description", "version", "filename", "lastmodified", "permissions") values('jobposition','Jobposition Management',NULL,NULL,NULL,NULL,'[ 	[action:''jobposition.viewList''] ]');
insert into bayawan_system..sys_module ("name", "title", "description", "version", "filename", "lastmodified", "permissions") values('orgunit','Org. Unit Management',NULL,NULL,'orgunit',NULL,'[ 	[action:''orgunit.viewList''], 	[action:''orgunit.create''], 	[action:''orgunit.read''], 	[action:''orgunit.update''], 	[action:''orgunit.delete''],  	[action:''controller1.create''], 	[action:''controller1.read''], 	[action:''controller1.update''], 	[action:''controller1.delete''], 	[action:''controller1.approve''], 	[action:''controller1.disapprove''],  	[action:''controller2.post''], 	[action:''controller2.submit''], 	[action:''controller2.approve''], 	[action:''controller2.disapprove''], ]');
insert into bayawan_system..sys_module ("name", "title", "description", "version", "filename", "lastmodified", "permissions") values('personnel','Personnel Management',NULL,NULL,'personnel',NULL,'[ 	[action: ''personnel.viewList''] ]');
insert  into bayawan_system..sys_module("name","title","description","version","filename","lastmodified","permissions") values ('prov2','PASSO',NULL,NULL,NULL,NULL,'[ [action:''rptledger.view''          ,title:''View RPT Ledger Information''], [action:''rptledger.view-payment''  ,title:''View RPT Payment''], [action:''rptledger.view-billing''  ,title:''Generate RPT Billing''], [action:\"province.view\"  ,title:\"View Province\"], [action:''province.edit''  ,title:''Edit Province Information''], [action:''activereassign.view'',   title:''Manage Active Re-Assigns''], [action:''examiner.view'',         title:''Manage Examiners''], [action:''examiner.new'',          title:''Create New Examiner''], [action:''examiner.edit'',         title:''Edit Examiner Information''], [action:''examinerreassign.view'', title:''Manage LGU Re-Assigns''], [action:''examinerreassign.create'', title:''Create new LGU Re-Assign''], [action:''examinerreassign.edit'',   title:''Edit LGU Re-Assign Information''], [action:''examinerreassign.approve'', title:''Approve LGU Re-Assign''], [action:''faas.view''             ,title:''View FAAS''], [action:''faas.view-forapproval'' ,title:''View for Approval FAAS''], [action:''faas.view-current''     ,title:''View Current FAAS''], [action:''faas.approve''          ,title:''Approve FAAS''], [action:''faas.disapprove''       ,title:''Disapprove FAAS''], [action:''faas.return''           ,title:''Return FAAS to Examiner''], [action:''faasinquiry.view''      ,title:''View FAAS Inquiry''], [action:''faasinquiry.history''   ,title:''View FAAS History''], [action:''entity.mapping'',    title:''Manage Entity Mapping'' ],  [action:''faas.view'',             title:''View FAAS''], [action:''faas.view-forreview'',   title:''View for Review FAAS''], [action:''faas.view-current'',     title:''View Current FAAS''], [action:''faas.submit'',           title:''Submit FAAS for Approval''], [action:''faas.disapprove'',       title:''Disapprove FAAS''], [action:''faas.assignpin'',        title:''Change PIN''], [action:''faas.exchangepin'',      title:''Exchange PIN''], [action:''transmittal.view-received''  ,title:''View Received Transmittals''], [action:''transmittal.view-submitted'' ,title:''View Submitted Transmittals''], [action:''transmittal.view-closed''    ,title:''View Closed Transmittals''], [action:''transmittal.open''       ,title:''View Transmittal''], [action:''transmittal.delete''     ,title:''Delete Transmittal''], [action:''transmittal.import''     ,title:''Import Transmittal''], [action:''transmittal.save''       ,title:''Save Transmittal''], [action:''transmittal.incomplete'' ,title:''Incomplete FAAS Information''], [action:''transmittal.submit''     ,title:''Submit Transmittal''], [action:''taxpayer.report''   ,title:''Taxpayer Listing Report''],]');
insert  into bayawan_system..sys_module("name","title","description","version","filename","lastmodified","permissions") values ('role','Role Management',NULL,NULL,NULL,NULL,'[	[action: \"role.viewList\"]]');
insert  into bayawan_system..sys_module("name","title","description","version","filename","lastmodified","permissions") values ('rpt-rule-mgmt','RPT Rule Management',NULL,NULL,NULL,NULL,'[  [action:''rptbillingrule.view''		,title:''Author RPT Billing Rules''],]');
insert  into bayawan_system..sys_module("name","title","description","version","filename","lastmodified","permissions") values ('rpt2','RPT Assessment',NULL,NULL,NULL,NULL,'[ [ action:''rpttransaction.open'' 		,title:''OPEN RPT Transaction'' ], [ action:''consolidation.view''  		,title:''View Consolidation'' ], [ action:''consolidation.update'' 		,title:''Update Consolidation'' ], [ action:''consolidation.edit''  		,title:''Edit Consolidation'' ], [ action:''consolidation.submit'' 		,title:''Submit Consolidation'' ], [ action:''consolidation.remove'' 		,title:''Remove Consolidation'' ], [ action:''consolidation.updateland'' 			,title:''Update Land Consolidation'' ], [ action:''consolidation.disapprove'' 			,title:''Disapprove Consolidation'' ], [ action:''consolidation.approve'' 				,title:''Approve Consolidation'' ], [ action:''consolidation.disapproveByProvince'' 	,title:''Disapprove by Province Consolidation'' ], [ action:''consolidation.approveByProvince''	,title:''Approve By Province Consolidation'' ], [ action:''consolidation.submitToProvince'' 	,title:''Disapprove by Province Consolidation'' ],   [ action:''consolidationmgt.view'' 		,title:''View Consolidation Management'' ], [ action:''consolidationmgt.create'' 	,title:''Create Consolidation Management'' ], [ action:''consolidationmgt.view'' 		,title:''Approve Consolidation Management'' ],  [ action:''datacapture.create'' 		,title:''Create FAAS Data Capture'' ], [ action:''transfer.create'' 		,title:''Create Transfer of Ownership'' ], [ action:''reassessment.create'' 	,title:''Create Reassessment'' ], [ action:''correction.create'' 		,title:''Create Correction of Entry'' ], [ action:''newdiscovery.create'' 	,title:''Create New Discovery'' ], [ action:''multipleclaim.create'' 	,title:''Create Multiple Claim'' ],  [ action:''cancelfaasmgt.view''		,title:''View Cancel FAAS Management'' ], [ action:''cancelfaasmgt.create''	,title:''Create Cancel FAAS Management'' ],  [ action:''cancelfaasmgt.open''		,title:''Open Cancel FAAS Management'' ], [ action:''cancelfaas.create''		,title:''Create Cancel FAAS'' ], [ action:''cancelfaas.edit''		,title:''Edit Cancel FAAS'' ], [ action:''cancelfaas.open''		,title:''Open Cancel FAAS'' ], [ action:''cancelfaas.submit''		,title:''Submit Cancel FAAS for approval'' ], [ action:''cancelfaas.delete''		,title:''Delete Cancel FAAS'' ], [ action:''cancelfaas.approve''		,title:''Approve Cancel FAAS'' ], [ action:''faasmgt.view''		,title:''View FAAS Management'' ], [ action:''faasmgt.create''		,title:''Create FAAS Management'' ], [ action:''faas.create''			,title:''Create FAAS'' ], [ action:''faas.open''			,title:''Open FAAS'' ], [ action:''faas.submit''			,title:''Submit FAAS for approval'' ], [ action:''faas.delete''			,title:''Delete FAAS'' ], [ action:''faas.disapprove''		,title:''Dispprove FAAS'' ], [ action:''faas.approve''		,title:''Approve FAAS'' ], [ action:''faas.submittoprovince''	,title:''Submit to Province FAAS'' ], [ action:''faas.disapprove''		,title:''Disapprove FAAS'' ], [ action:''faas.approvebyprovince''	,title:''Approve By Province FAAS'' ], [ action:''faasreport.view''		,title:''View FAAS Report'' ],  [ action:''subdivisionmgt.view''		,title:''View Subdivision Management'' ], [ action:''subdivisionmgt.open''		,title:''Open Subdivision Management'' ], [ action:''subdivisionmgt.create''	,title:''Create Subdivision Management'' ],  [ action:''subdivision.view'' 		,title:''View Subdivision'' ], [ action:''subdivision.open'' 		,title:''View Subdivision'' ], [ action:''subdivision.create''		,title:''Create Subdivision'' ], [ action:''subdivision.update'' 			,title:''Update Subdivision'' ], [ action:''subdivision.submit'' 			,title:''Submit Subdivision'' ], [ action:''subdivision.remove'' 			,title:''Remove Subdivision'' ], [ action:''subdivision.disapprove'' 				,title:''Disapprove Subdivision'' ], [ action:''subdivision.approve'' 				,title:''Approve Subdivision'' ], [ action:''subdivision.submitToProvince'' 		,title:''Submit to Province Subdivision'' ], [ action:''subdivision.disapproveByProvince'' 	,title:''Disapprove By Province Subdivision'' ], [ action:''subdivision.approveByProvince'' 		,title:''Appry By Province Subdivision'' ],  [ action:''truecopy.view''			,title:''View Certified True Copy'' ], [ action:''truecopy.create''			,title:''Create Certified True Copy'' ], [ action:''truecopy.viewReport''		,title:''View Report Certified True Copy'' ], [ action:''rpttransaction.view''		,title:''View Real Property Transactions''], 	[ action: ''rptcertification_list.view'', title: ''RPT Certifications List View'' ],		[ action: ''rptcertifications.open'', title: ''RPT Certifications Open'' ],		[ action: ''noproperty.open'', 	title: ''RPT Certifications No Property Open'' ],	[ action: ''noproperty.view'', 	title: ''RPT Certifications No Property View'' ],	[ action: ''noproperty.create'', 	title: ''RPT Certifications No Property Create'' ],		[ action: ''landholding.open'', 		title: ''RPT Certifications Land Holding Open'' ],	[ action: ''landholding.view'', 		title: ''RPT Certifications Land Holding View'' ],	[ action: ''landholding.create'', 	title: ''RPT Certifications Land Holding Create'' ],		[ action: ''multipleproperty.open'', 		title: ''RPT Certifications Multiple Property Open'' ],	[ action: ''multipleproperty.view'', 		title: ''RPT Certifications Multiple Property View'' ],	[ action: ''multipleproperty.create'', 	title: ''RPT Certifications Multiple Property Create'' ],		[ action: ''noimprovement.open'', 	title: ''RPT Certifications No Improvement Open'' ],	[ action: ''noimprovement.view'', 	title: ''RPT Certifications No Improvement View'' ],	[ action: ''noimprovement.create'', 	title: ''RPT Certifications No Improvement Create'' ],		[ action: ''noimprovementbytdno.open'', 		title: ''RPT Certifications No Improvement By TD No Open'' ],	[ action: ''noimprovementbytdno.view'', 		title: ''RPT Certifications No Improvement By TD No View'' ],	[ action: ''noimprovementbytdno.create'', 	title: ''RPT Certifications No Improvement By TD No Create'' ],		[ action: ''latestexistproperty.open'', 		title: ''RPT Certifications Latest Exist Property Open'' ],	[ action: ''latestexistproperty.view'', 		title: ''RPT Certifications Latest Exist Property View'' ],	[ action: ''latestexistproperty.create'', 	title: ''RPT Certifications Latest Exist Property Create'' ],		[ action: ''wimprovebytdno.open'', 	title: ''RPT Certifications With Improvement By TD No Open'' ],	[ action: ''wimprovebytdno.view'', 	title: ''RPT Certifications With Improvement By TD No View'' ],	[ action: ''wimprovebytdno.create'', 	title: ''RPT Certifications With Improvement By TD No Create'' ],    [ action: ''noencumbrance.open'', 	title: ''Open No Encumbrance Certification'' ],	[ action: ''noencumbrance.view'', 	title: ''View No Encumbrance Certification'' ],	[ action: ''noencumbrance.create'', 	title: ''Create No Encumbrance Certification'' ],    [ action: ''ownership.open'', 	title: ''Open Ownership Certification'' ],	[ action: ''ownership.view'', 	title: ''View Ownership Certification'' ],	[ action: ''ownership.create'', 	title: ''Create Ownership Certification'' ], [ action:''rptreport.notice''		,title:''Generate Notice of Assessment'' ], [ action:''rptreport.assessmentroll''    ,title:''Generate Assessment Roll'' ], [ action:''rptreportmgmt.open''		,title:''Open Report Management'' ], [ action:''rptreport.tmcr''		,title:''Generate TMCR Report'' ], [ action:''rptreport.orf''  		,title:''Generate Ownership Record Form'' ],  [ action:''rptreport.jat'' 		,title:''Generate Journal of Assessment Transaction'' ], [ action:''rptreport.accomplishmentrpa'' ,title:''Generate Accomplishment Report on Real Property Assessment''], [ action:''rptreport.comparativeav''	,title:''Generate Comparative Data On Assessed Value'' ], [ action:''rptreport.comparativerpucount'',title:''Generate Comparative Data on RPU Count'' ], [ action:''rptreport.comparativemv''	,title:''Generate Comparative Data on Market Value'' ], [ action:''rptreport.annotationlisting'' ,title:''Generate Annotation Listing'' ], [action:''rptreport.masterlist''		,title:''Generate Master List of Real Property''], [ action:''rptreport.reportonrpa''	,title:''Report on Real Property Assessment'' ], [ action:''rptbilling.generate''		,title:''Generate Real Property Billing'' ], [ action:''rptbilling.printbill''	,title:''Print Real Property Billing'' ], [ action:''rptbilling.previewbill''	,title:''Preview Real Property Billing'' ], [ action:''rptledger.view''		,title:''View RPT Ledger'' ],  [ action:''rptledger.open''		,title:''Open RPT Ledger'' ],  [ action:''rptledger.approve''		,title:''Approve RPT Ledger'' ], [ action:''rptledger.capturepayment''    ,title:''Capture RPT Ledger Payment'' ], [ action:''rptledger.printbill''		,title:''Print RPT Bill'' ], [ action:''rptledger.previewbill''	,title:''Preview RPT Bill'' ], [ action:''rptledger.noticeofdelinquency''  ,title:''Generate Realty Tax Notice of Delinquency'' ], [ action:''propertypayer.view''		,title:''View Property Payers'' ], [ action:''propertypayer.create''	,title:''Create Property Payer'' ], [ action:''propertypayer.delete''	,title:''Delete Property Payer'' ], [ action:''rptbillingrule.view''		,title:''View RPT Billing Rules'' ], [ action:''rptbillingrule.create''	,title:''Create RPT Billing Rule'' ], [ action:''rptbillingrule.delete''	,title:''Delete RPT Billing Rule'' ], [action:''landtax.abstractrptcollection''	,title:''Generate Abstract of Realty Tax Collection'' ], [action:''landtax.brgyshare''			,title:''Generate Barangay Share'' ], [ action:''landtax.rptdelinquency''	,title:''Generate Realty Tax Delinquency Listing'' ], [ action:''landtax.rptc''		,title:''Real Property Tax Collection'' ], [action:''rptmanagement.open''			,title:''Open RPT Master Management''], [action:''rysetting.view'',			,title:''View General Revision Year Setting''],	 [action:''propertyclassification.view''		,title:''View Property Classifications'' ], [action:''propertyclassification.create''	,title:''Create Property Classification'' ] , [action:''propertyclassification.edit''		,title:''Edit Property Classification'' ] , [action:''propertyclassification.delete''	,title:''Delete Property Classification'' ] , [action:''exemptiontypes.view''			,title:''View Exemption Types'' ] , [action:''exemptiontypes.create''		,title:''Create Exemption Types'' ] , [action:''exemptiontypes.edit''			,title:''Edit Exemption Types'' ] , [action:''exemptiontypes.delete''		,title:''Delete Exemption Types'' ] ,  [action:''kindofbldg.view''			,title:''View Kind of Building'' ] , [action:''kindofbldg.create''			,title:''Create Kind of Building'' ] , [action:''kindofbldg.edit''			,title:''Edit Kind of Building'' ] , [action:''kindofbldg.delete''			,title:''Delete Kind of Building'' ] , [action:''materials.view''			,title:''View Materials'' ] , [action:''materials.create''			,title:''Create Materials'' ] , [action:''materials.edit''			,title:''Edit Materials'' ] , [action:''materials.delete''			,title:''Delete Materials'' ] , [action:''structures.view''			,title:''View Structures'' ] , [action:''structures.create''			,title:''Create Structures'' ] , [action:''structures.edit''			,title:''Edit Structures'' ] , [action:''structures.delete''			,title:''Delete Structures'' ] , [action:''structuretemplates.view''		,title:''View Structure Templates'' ] , [action:''structuretemplates.edit''		,title:''Edit Structure Templates'' ] , [action:''machines.view''			,title:''View Machines'' ] , [action:''machines.create''			,title:''Create Machines'' ] , [action:''machines.edit''			,title:''Edit Machines'' ] , [action:''machines.delete''			,title:''Delete Machines'' ] ,  [action:''plantstrees.view''			,title:''View Plants and Trees'' ] , [action:''plantstrees.create''			,title:''Create Plants and Trees'' ] , [action:''plantstrees.edit''			,title:''Edit Plants and Trees'' ] , [action:''plantstrees.delete''			,title:''Delete Plants and Trees'' ] ,  [action:''miscitems.view''			,title:''View Miscellaneous Items'' ] , [action:''miscitems.create''			,title:''Create Miscellaneous Items'' ] , [action:''miscitems.edit''			,title:''Edit Miscellaneous Items'' ] , [action:''miscitems.delete''			,title:''Delete Miscellaneous Items'' ] , [action:''rptofficers.view''			,title:''View RPT OFFICERS'' ] , [action:''rptofficers.create''			,title:''Create RPT OFFICERS'' ] , [action:''rptofficers.edit''			,title:''Edit RPT OFFICERS'' ] , [action:''rptofficers.delete''			,title:''Delete RPT OFFICERS'' ] , [action:''canceltdreasons.view''			,title:''View Cancel TD Reasons'' ] , [action:''canceltdreasons.create''		,title:''Create Cancel TD Reasons'' ] , [action:''canceltdreasons.edit''			,title:''Edit Cancel TD Reasons'' ] , [action:''canceltdreasons.delete''		,title:''Delete Cancel TD Reasons'' ] , [action:''txnrequirements.view''			,title:''View Transaction Requirements'' ] , [action:''txnrequirements.create''		,title:''Create Transaction Requirements'' ] , [action:''txnrequirements.edit''			,title:''Edit Transaction Requirements'' ] , [action:''txnrequirements.delete''		,title:''Delete Transaction Requirements'' ] , [action:''rptparameters.view''			,title:''View RPT Parameters'' ] , [action:''rptparameters.create''			,title:''Create RPT Parameters'' ] , [action:''rptparameters.edit''			,title:''Edit RPT Parameters'' ] , [action:''rptparameters.delete''			,title:''Delete RPT Parameters'' ] , [action:''rptsetting.view''			,title:''View RPT Settings'' ] , [action:''rptsetting.save''			,title:''Save RPT Settings'' ] ,  [action:''annotationmgmt.view''		,title:''Manage Annotations'' ], [action:''annotation.view''		,title:''View Annotation'' ], [action:''annotation.delete''		,title:''Delete Annotation'' ], [action:''annotation.submit''		,title:''Submit Annotation for Approval'' ], [action:''annotation.approve''		,title:''Approve Annotation'' ], [action:''cancelannotationmgmt.view''	,title:''Manage Cancelled Annotations'' ], [action:''cancelannotation.open''	,title:''Open Cancel Annotation'' ], [action:''cancelannotation.create''	,title:''Create Cancel Annotation'' ], [action:''cancelannotation.view''	,title:''View Cancel Annotation'' ], [action:''cancelannotation.delete''	,title:''Delete Cancel Annotation'' ], [action:''cancelannotation.submit''	,title:''Submit Cancel Annotation for Approval'' ], [action:''cancelannotation.approve''	,title:''Approve Cancel Annotation'' ], [action:''mortgage.create''		,title:''Create Mortgage Annotation'' ], [action:''bailbond.create''		,title:''Create BailBond Annotation'' ], [action:''other.create''			,title:''Create Other Annotation'' ], [action:''landtax.rptclearance''		,title:''Realty Tax Clearance''],  [action:''rptreceipt.batch'',	title:''Batch Realty Tax Collection''], [action:''titleupdate.create''		,title:''Update Title Information''], [action:''titleupdate.open''		,title:''Open Title Information''], [action:''titleupdate.edit''		,title:''Edit Title Information''], [action:''titleupdate.approve''		,title:''Approve Title Information''], [action:''titleupdate.view''		,title:''View Title Update Listing''],  [action:''realpropertyupdate.create''	,title:''Create Real Property Update Information'' ], [action:''realpropertyupdate.open''	,title:''Open Real Property Update Information'' ], [action:''realpropertyupdate.edit''	,title:''Edit Real Property Update Information'' ], [action:''realpropertyupdate.approve''	,title:''Approve Real Property Update Information'' ], [action:''realpropertyupdate.view''	,title:''View Real Property Update Listing'' ],  [action:''fortransmittalmgmt.view''	,title:''For Transmittal Management'' ], [action:''rpt_transmittal_mgmt.view''	,title:''Manage FAAS Transmittals''] , [action:''rpt_transmittal.create''	,title:''Create FAAS Transmittal''] , [action:''rpt_transmittal.open''		,title:''Open FAAS Transmittal''] , [action:''rpt_transmittal.print''	,title:''Print FAAS Transmittal''], [action:''rpt_transmittal.export''	,title:''Export FAAS Transmittal''], [action:''rpt_transmittal_import_mgmt.view'' 	,title:''Manage Import FAAS Transmittals'' ], [action:''rpt_transmittal_import.create'' 	,title:''Import FAAS Transmittal''], [action:''rpt_transmittal_import.open''		,title:''View Imported FAAS Transmittal''], [action:''rptcompromise.view''		,title:''Manage Compromise Agreemtns''], [action:''rptcompromise.create''		,title:''Create Compromise Agreement'' ], [action:''rptcompromise.edit''		,title:''Edit Compromise Agreement'' ], [action:''rptcompromise.open''		,title:''Open Compromise Agreement''], [action:''rptcompromise.submit''		,title:''Submit Compromise Agreement''], [action:''rptcompromise.submitforapproval'' ,title:''Submit For Approval Compromise Agreement''], [action:''rptcompromise.approve''	,title:''Approve Compromise Agreement''], [action:''rptcompromise.delete''		,title:''Delete Compromise Agreement''], [action:''rptcompromise.print''		,title:''Print Compromise Agreement''], [action:''rptcompromise.preview''	,title:''Preview Compromise Agreement''], [action:''rptutil.modifypin'', title:''Access Modify PIN Utility''],]');
insert  into bayawan_system..sys_module("name","title","description","version","filename","lastmodified","permissions") values ('rule-mgmt','Rule Management',NULL,NULL,NULL,NULL,'[]');
insert  into bayawan_system..sys_module("name","title","description","version","filename","lastmodified","permissions") values ('tc2','Treasury/Collection',NULL,NULL,NULL,NULL,'[ [ action:''account.view'',           title:''View Chart of Account'' ], [ action:''account.addcategory'',    title:''Add Account Category'' ], [ action:''account.addglacct'',      title:''Add GL Account'' ], [ action:''account.addsubacct'',     title:''Add Sub-Account'' ], [ action:''account.edit'',     title:''Edit Account Information'' ], [ action:''account.delete'',   title:''Delete Account Information'' ], [ action:''bank.view'',     title:''View Bank Information'' ], [ action:''bank.create'',   title:''Create Bank'' ], [ action:''bank.edit'',     title:''Edit Bank'' ], [ action:''bank.delete'',   title:''Delete Bank'' ], [ action:''bankacct.view'',     title:''View Bank Account Information'' ], [ action:''bankacct.create'',   title:''Create Bank Account'' ], [ action:''bankacct.edit'',     title:''Edit Bank Account'' ], [ action:''bankacct.delete'',   title:''Delete Bank Account'' ], [ action:''bankacct.approve'',  title:''Approve Bank Account'' ], [ action:''collectionsetting.manage'', title:''Manage Collection Setting'' ], [ action:''collectiontype.viewlist'',  title:''View Collection Type Listing'' ], [ action:''collectiontype.create'',    title:''Create Collection Type'' ], [ action:''collectiontype.edit'',      title:''Edit Collection Type'' ], [ action:''collectiontype.delete'',    title:''Delete Collection Type'' ], [ action:''fund.viewlist'',  title:''View Fund Listing'' ], [ action:''fund.create'',    title:''Create Fund'' ], [ action:''fund.edit'',      title:''Edit Fund'' ], [ action:''fund.delete'',    title:''Delete Fund'' ], [ action:''fund.approve'',   title:''Approve Fund'' ], [ action:''incomeacct.viewlist'',  title:''View Income Account Listing'' ], [ action:''incomeacct.create'',    title:''Create Income Account'' ], [ action:''incomeacct.edit'',      title:''Edit Income Account'' ], [ action:''incomeacct.delete'',    title:''Delete Income Account'' ], [ action:''incomeacct.approve'',   title:''Approve Income Account'' ], [ action:''incomeacctgroup.viewlist'',  title:''View Income Account Group Listing'' ], [ action:''incomeacctgroup.create'',    title:''Create Income Account Group'' ], [ action:''incomeacctgroup.delete'',    title:''Delete Income Account Group'' ],  [ action:''tcmanagement.open''	,title:''Manage TC Master Files'' ],  [ action:''af.viewlist'',  title:''View Accountable Form Listing'' ], [ action:''af.create'',    title:''Create Accountable Form'' ], [ action:''af.edit'',      title:''Edit Accountable Form'' ], [ action:''af.delete'',    title:''Delete Accountable Form'' ], [ action:''af.approve'',   title:''Approve Accountable Form'' ], [ action:''afcontrol.changemode'',  title:''AF Control Change Mode'' ], [ action:''afcontrol.activate'',    title:''Activate AF Control'' ], [ action:''afcontrol.transfer''	,title:''Transfer AF Control'' ], [ action:''afcontrol.adjustqty'' ,title:''Adjust AF Control Quantity (NonSerial)'' ],   [ action:''riv_lgu.create'', title:''Create LGU RIV'' ], [ action:''riv.create'',    title:''Create RIV'' ], [ action:''riv.salecreate'',title:''Create RIV (SALE)'' ], [action:''riv.collector'', title:''Create RIV (Collector)''], [ action:''riv.edit'',      title:''Edit RIV'' ], [ action:''riv.delete'',    title:''Delete RIV'' ], [ action:''riv.approve'',   title:''Approve RIV'' ], [ action:''riv.preview'',   title:''Preview RIV'' ],  [ action:''iraf.viewlist'',  title:''View IRAF Listing'' ], [ action:''iraf.create'',    title:''Create IRAF'' ], [ action:''iraf.edit'',      title:''Edit IRAF'' ], [ action:''iraf.delete'',    title:''Delete IRAF'' ], [ action:''iraf.approve'',   title:''Approve IRAF'' ], [ action:''afinventory.view'', title:''View AF Inventory Information'' ], [ action:''deposit.viewlist'',   title:''View Deposit Listing'' ], [ action:''deposit.view'',       title:''View Deposit Information'' ], [ action:''deposit.create'',     title:''Create Deposit Information'' ], [ action:''deposit.close'',      title:''Close Deposit Information'' ], [ action:''deposit.addnoncash'', title:''Add Non-Cash Payments for Deposit'' ], [ action:''deposit.addexternalnoncash'',     title:''Add External Non-Cash for Deposit'' ], [ action:''collection.create_online'',   title:''Create Online Collection''], [ action:''collection.create_offline'',  title:''Create Offline Collection''],  [ action:''remittance.create'',          title:''Create Remittance'' ], [ action:''remittance.submit'',          title:''Submit Remittance'' ], [ action:''remittance.viewlist'',        title:''View Remittance Listing'' ], [action:''remittance.import'',		title:''Import Remittance''], [ action:''receipt.viewissued'',    title:''View Issued Receipt Listing'' ], [ action:''receipt.inquire'',       title:''Inquire Receipt Information'' ], [ action:''afcontrol.activate'',  title:''Activate AF Control'' ] [action:''batchcapturemgmt.view''	,title:''View Batch Capture Management''],  [action:''batchcapture.create''		,title:''Create Batch Capture'' ], [action:''batchcapture.open''		,title:''Open Batch Capture'' ],  [action:''batchcapture.view''		,title:''View Batch Capture'' ], [action:''batchcapture.delete''		,title:''Delete Batch Capture'' ], [action:''batchcapture.post''		,title:''Post Batch Capture'' ], [ action:''collection_burial.create'',  title:''Create Burial Permit Fee Collection'' ], [ action:''collection_burial.edit'',    title:''Edit Burial Permit Fee Collection'' ], [ action:''collection_burial.print'',   title:''Print Burial Permit Fee Collection'' ], [ action:''collection_burial.void'',    title:''Void Burial Permit Fee Collection'' ], [ action:''collection_burial.inquire'', title:''Inquire Burial Permit Fee Collection'' ], [ action:''collection_cashticket.create'',  title:''Create Cash Ticket Collection'' ], [ action:''collection_cashticket.delete'',  title:''Delete Cash Ticket Collection'' ], [ action:''collection_cashticket.inquire'', title:''Inquire Cash Ticket  Collection'' ], [ action:''collection_cattleownership.create'',  title:''Create Large Cattle Ownership Collection'' ], [ action:''collection_cattleownership.edit'',    title:''Edit Large Cattle Ownership Collection'' ], [ action:''collection_cattleownership.print'',   title:''Print Large Cattle Ownership Collection'' ], [ action:''collection_cattleownership.void'',    title:''Void Large Cattle Ownership Collection'' ], [ action:''collection_cattleownership.inquiry'', title:''Inquire Large Cattle Ownership  Collection'' ], [ action:''collection_cattletransfer.create'',  title:''Create Large Cattle Transfer Collection'' ], [ action:''collection_cattletransfer.edit'',    title:''Edit Large Cattle Transfer Collection'' ], [ action:''collection_cattletransfer.print'',   title:''Print Large Cattle Transfer Collection'' ], [ action:''collection_cattletransfer.void'',    title:''Void Large Cattle Transfer Collection'' ], [ action:''collection_cattletransfer.inquiry'', title:''Inquire Large Cattle Transfer  Collection'' ], [ action:''collection_general.create'',  title:''Create General Collection'' ], [ action:''collection_general.edit'',    title:''Edit General Collection'' ], [ action:''collection_general.print'',   title:''Print General Collection'' ], [ action:''collection_general.void'',    title:''Void General Collection'' ], [ action:''collection_general.inquire'', title:''Inquire General Collection'' ], [ action:''collection_marriage.create'',  title:''Create Marriage License Fee Collection'' ], [ action:''collection_marriage.edit'',    title:''Edit Marriage License Fee Collection'' ], [ action:''collection_marriage.print'',   title:''Print Marriage License Fee Collection'' ], [ action:''collection_marriage.void'',    title:''Void Marriage License Fee Collection'' ], [ action:''collection_marriage.inquiry'', title:''Inquire Marriage License Fee  Collection'' ], [action:''postcapturereceipt.create'',   title:''Create Post Capture Receipt''], [action:''postcapturereceipt.post'',     title:''Submit Post Capture Receipt''], [action:''tcreport.abstractofcollection''	,title:''Generate Abstract of Collection Report''], [action:''tcreport.abstractofcollectionbychart'' ,title:''Generate Abstract of Colleciton By Chart of Account'' ], [action:''tcreport.incomeaccount'' 		,title:''Income Account Report''], [action:''tcreport.craaf''		 	,title:''CRAAF Report''], [action:''tcreport.statementofrevenue''		,title:''Generate Statement of Revenue''],  [action:''tcreport.reportofcollection''		,title:''Report of Collection'' ], [action:''tcreport.reportofcollection2''		,title:''Report of Collection 2'' ], [action:''collection_slaughterpermit.inquiry''		,title:''Inquire Slaughter Permit'' ], [action:''collection_slaughterpermit.create''		,title:''Create Slaughter Permit''], [action:''collection_slaughterpermit.print''		,title:''Print Slaughter Permit'' ], [action:''collection_slaughterpermit.void''		,title:''Void Slaughter Permit'' ], [action:''collection_slaughterpermit.edit''		,title:''Edit Slaughter Permit'' ], [ action:''liquidation.create'', title:''Create Liquidation'' ], [ action:''liquidationmulti.create'', title:''Create Multi-Cashier Liquidation''], [ action:''liquidation.submit'', title:''Submit Liquidation'' ], [ action:''liquidation.viewlist'', title:''View Liquidation Listing'' ] [ action:''collection.create_capture''	,title:''Create Capture Collection''], [ action:''receipt.viewissued''		,title:''View Issued Receipt Listing'' ], [ action:''afcontrol.activate''		,title:''Activate AF Control'' ], [ action:''postcapturereceipt.create''	,title:''Create Post Capture Receipt''], [ action:''postcapturereceipt.post''	,title:''Submit Post Capture Receipt''], [ action:''postcapturereceipt.viewlist'' ,title:''View Post Capture Listing'' ], [ action:''bpadmin.setting''		,title:''Manage BP Setting'' ], [action:''treasurymgmt.view'',                title:''View Treasury Management''], [action:''treasurymgmt_abstract.view'',       title:''View Treasury Management (Abstract of Collection)''], [action:''treasurymgmt_afmonitoring.view'',   title:''View Treasury Management (AF Monitoring)''], [action:''treasurymgmt_collection.view'',     title:''View Treasury Management (Collection Summary)''], [action:''treasurymgmt_fund.view'',           title:''View Treasury Management (Fund Summary)''], [action:''treasurymgmt_liquidation.view'',    title:''View Treasury Management (Liquidation Detail)''], [action:''treasurymgmt_remittance.view'',     title:''View Treasury Management (Remittance Monitoring)''], [action:''treasurymgmt_liquidation.view'',    title:''View Undeposited Liquidation Summary'' ],  [action:''form60.setup''		,title:''Setup Form 60 Report''],  [action:''collectiongroup.view''		,title:''View Collection Groups'' ], [action:''collectiongroup.create''	,title:''Create Collection Group'' ], [action:''collectiongroup.edit''		,title:''Edit Collection Group'' ], [action:''collectiongroup.delete''	,title:''Delete Collection Group'' ],]');

/*Data for the table bayawan_system..sys_roleclass */

insert  into bayawan_system..sys_roleclass("name","description","rolelevel","tags") values ('ACCOUNTING','ACCOUNTING',1,NULL);
insert  into bayawan_system..sys_roleclass("name","description","rolelevel","tags") values ('ADMIN','ADMIN',1,NULL);
insert  into bayawan_system..sys_roleclass("name","description","rolelevel","tags") values ('BP','BUSINESS LICENSING',1,NULL);
insert  into bayawan_system..sys_roleclass("name","description","rolelevel","tags") values ('ENTITY','ENTITY',1,NULL);
insert  into bayawan_system..sys_roleclass("name","description","rolelevel","tags") values ('IT','IT',1,NULL);
insert  into bayawan_system..sys_roleclass("name","description","rolelevel","tags") values ('PASSO','PASSO',1,'[''APPROVER'', ''TAXMAPPER'']');
insert  into bayawan_system..sys_roleclass("name","description","rolelevel","tags") values ('RPT','RPT ASSESSMENT',1,'[''APPRAISER'', ''RECOMMENDER'', ''APPROVER'']');
insert  into bayawan_system..sys_roleclass("name","description","rolelevel","tags") values ('TREASURY','TREASURY',1,'[''AFO'', ''CASHIER'', ''COLLECTOR'', ''LIQUIDATING_OFFICER'']');

/*Data for the table bayawan_system..sys_roleclass_module */

insert  into bayawan_system..sys_roleclass_module("roleclass","module") values ('BP','bp-rule-mgmt');
insert  into bayawan_system..sys_roleclass_module("roleclass","module") values ('TREASURY','bp-rule-mgmt');
insert  into bayawan_system..sys_roleclass_module("roleclass","module") values ('BP','bp2');
insert  into bayawan_system..sys_roleclass_module("roleclass","module") values ('TREASURY','bp2');
insert  into bayawan_system..sys_roleclass_module("roleclass","module") values ('TREASURY','ctc2');
insert  into bayawan_system..sys_roleclass_module("roleclass","module") values ('ADMIN','etracs2-admin');
insert  into bayawan_system..sys_roleclass_module("roleclass","module") values ('PASSO','etracs2-admin');
insert  into bayawan_system..sys_roleclass_module("roleclass","module") values ('BP','etracs2-entity');
insert  into bayawan_system..sys_roleclass_module("roleclass","module") values ('ENTITY','etracs2-entity');
insert  into bayawan_system..sys_roleclass_module("roleclass","module") values ('RPT','etracs2-entity');
insert  into bayawan_system..sys_roleclass_module("roleclass","module") values ('TREASURY','etracs2-entity');
insert  into bayawan_system..sys_roleclass_module("roleclass","module") values ('BP','etracs2common');
insert  into bayawan_system..sys_roleclass_module("roleclass","module") values ('IT','etracs2common');
insert  into bayawan_system..sys_roleclass_module("roleclass","module") values ('RPT','etracs2common');
insert  into bayawan_system..sys_roleclass_module("roleclass","module") values ('TREASURY','etracs2common');
insert  into bayawan_system..sys_roleclass_module("roleclass","module") values ('ADMIN','jobposition');
insert  into bayawan_system..sys_roleclass_module("roleclass","module") values ('ADMIN','orgunit');
insert  into bayawan_system..sys_roleclass_module("roleclass","module") values ('ADMIN','personnel');
insert  into bayawan_system..sys_roleclass_module("roleclass","module") values ('PASSO','prov2');
insert  into bayawan_system..sys_roleclass_module("roleclass","module") values ('ADMIN','role');
insert  into bayawan_system..sys_roleclass_module("roleclass","module") values ('RPT','rpt-rule-mgmt');
insert  into bayawan_system..sys_roleclass_module("roleclass","module") values ('TREASURY','rpt-rule-mgmt');
insert  into bayawan_system..sys_roleclass_module("roleclass","module") values ('PASSO','rpt2');
insert  into bayawan_system..sys_roleclass_module("roleclass","module") values ('RPT','rpt2');
insert  into bayawan_system..sys_roleclass_module("roleclass","module") values ('TREASURY','rpt2');
insert  into bayawan_system..sys_roleclass_module("roleclass","module") values ('BP','rule-mgmt');
insert  into bayawan_system..sys_roleclass_module("roleclass","module") values ('RPT','rule-mgmt');
insert  into bayawan_system..sys_roleclass_module("roleclass","module") values ('TREASURY','rule-mgmt');
insert  into bayawan_system..sys_roleclass_module("roleclass","module") values ('ACCOUNTING','tc2');
insert  into bayawan_system..sys_roleclass_module("roleclass","module") values ('TREASURY','tc2');


