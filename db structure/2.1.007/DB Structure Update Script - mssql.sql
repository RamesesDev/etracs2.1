alter table lguname_etracs..rptcompromise_credit 
drop FK_rptcompromise_credit
go 

alter table lguname_etracs..rptcompromise_credit
add paidby varchar(100)
go

alter table lguname_etracs..rptcompromise_credit
add paidbyaddress varchar(100)
go

alter table lguname_etracs..rptcompromise_credit
add mode varchar(25)
go


alter table lguname_etracs..subdivisionland add administratorname varchar(500)
go
alter table lguname_etracs..subdivisionland add administratoraddress varchar(500)
go






alter table lguname_etracs..noticeofassessment 	add ry int not null;
alter table lguname_etracs..noticeofassessment 	add extended text;
	
	
CREATE TABLE lguname_etracs..rptcompromise (                                                                       
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
               
create index ix_ledgerid on lguname_etracs..rptcompromise(ledgerid);
create index ix_faasid on lguname_etracs..rptcompromise(faasid);
                                


CREATE TABLE lguname_etracs..rptcompromise_list (                                                                       
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
                    
create index ix_faasid on lguname_etracs..rptcompromise_list(faasid);
create index ix_ledgerid on lguname_etracs..rptcompromise_list(ledgerid);
                                         



CREATE TABLE lguname_etracs..rptcompromise_installment (                                                                                       
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
                           
create index ix_rptcompromiseid on lguname_etracs..rptcompromise_installment(rptcompromiseid);
create index ix_ledgerid on lguname_etracs..rptcompromise_installment(ledgerid);
                                                        

CREATE TABLE lguname_etracs..rptcompromise_item (                                                                                       
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

create index ix_faasid on lguname_etracs..rptcompromise_item(faasid);
create index ix_ledgerid on lguname_etracs..rptcompromise_item(ledgerid);
create index ix_rptcompromiseid on lguname_etracs..rptcompromise_item(rptcompromiseid);
                      
                      

CREATE TABLE lguname_etracs..rptcompromise_credit (                                                                                               
                        objid varchar(50) NOT NULL,                                                                                                     
                        receiptid varchar(50) NOT NULL,                                                                                                 
                        ledgerid varchar(50) NOT NULL,                                                                                                  
                        rptcompromiseid varchar(50) NOT NULL,                                                                                           
                        installmentid varchar(50) default NULL,                                                                                         
                        itemid varchar(50) default NULL,                                                                                                
                        collectorname varchar(100) NOT NULL,                                                                                            
                        collectortitle varchar(50) NOT NULL,                                                                                            
                        orno varchar(15) NOT NULL,                                                                                                      
                        ordate date NOT NULL,                                                                                                           
                        amount decimal(18,2) NOT NULL,                                                                                                  
                        voided int NOT NULL,                                                                                                        
                        PRIMARY KEY  (objid),                                                                                                           
                        CONSTRAINT FK_rptcompromise_credit FOREIGN KEY (receiptid) REFERENCES receipt (objid),                                    
                        CONSTRAINT FK_rptcompromise_credit_installment FOREIGN KEY (installmentid) REFERENCES rptcompromise_installment (objid),  
                        CONSTRAINT FK_rptcompromise_credit_rptcompromise FOREIGN KEY (rptcompromiseid) REFERENCES rptcompromise (objid),          
                        CONSTRAINT FK_rptcompromise_credit_rptledger FOREIGN KEY (ledgerid) REFERENCES rptledger (objid)                          
                      ) ;
                      
create index ix_ledgerid on lguname_etracs..rptcompromise_credit(ledgerid);
create index ix_rptcompromiseid on lguname_etracs..rptcompromise_credit(rptcompromiseid);
create index ix_installmentid on lguname_etracs..rptcompromise_credit(installmentid);
create index ix_receiptid on lguname_etracs..rptcompromise_credit(receiptid);
                                              



alter table lguname_etracs..landrysetting add appliedto varchar(150);
alter table lguname_etracs..bldgrysetting add appliedto varchar(150);
alter table lguname_etracs..machrysetting add appliedto varchar(150);
alter table lguname_etracs..planttreerysetting add appliedto varchar(150);
alter table lguname_etracs..miscrysetting add appliedto varchar(150);

/*
update lguname_etracs..landrysetting set appliedto = 'BAYAWAN';
update lguname_etracs..bldgrysetting set appliedto = 'BAYAWAN';
update lguname_etracs..machrysetting set appliedto = 'BAYAWAN';
update lguname_etracs..planttreerysetting set appliedto = 'BAYAWAN';
update lguname_etracs..miscrysetting set appliedto = 'BAYAWAN';


insert into lguname_etracs..rysetting_lgu 
select objid, '218', 'BAYAWAN', 'land' from lguname_etracs..landrysetting;

insert into lguname_etracs..rysetting_lgu 
select objid, '218', 'BAYAWAN', 'bldg' from lguname_etracs..bldgrysetting;

insert into lguname_etracs..rysetting_lgu 
select objid, '218', 'BAYAWAN', 'mach' from lguname_etracs..machrysetting;

insert into lguname_etracs..rysetting_lgu 
select objid, '218', 'BAYAWAN', 'misc' from lguname_etracs..miscrysetting;

insert into lguname_etracs..rysetting_lgu 
select objid, '218', 'BAYAWAN', 'planttree' from lguname_etracs..planttreerysetting;

*/




ALTER TABLE lguname_etracs..rptledger ADD undercompromised int null;

UPDATE lguname_etracs..rptledger SET undercompromised = 0 WHERE undercompromised IS NULL; 




insert into lguname_system..sys_var (name, value, category ) values('rpt_advance_payment_collected_as_trust', '0', 'LANDTAX');


alter table lguname_etracs..faaslist add prevowner varchar(1000);
alter table lguname_etracs..faaslist add prevpin varchar(250);
alter table lguname_etracs..faaslist add prevmv decimal(16,2);
alter table lguname_etracs..faaslist add prevav decimal(16,2);
alter table lguname_etracs..faaslist add lguid varchar(50);
alter table lguname_etracs..faaslist add lguname varchar(50);



CREATE TABLE lguname_etracs..landrpuitem(
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



CREATE TABLE lguname_etracs.[dbo].[realproperty](
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

CREATE TABLE lguname_etracs..fortransmittal (
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

CREATE INDEX ix_fortransmittal_module ON lguname_etracs..fortransmittal(module);


CREATE TABLE lguname_etracs..noticeofdelinquency (
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

CREATE INDEX ix_ledger on lguname_etracs..noticeofdelinquency( ledgerid );
CREATE INDEX ix_tdno on lguname_etracs..noticeofdelinquency( tdno );
CREATE INDEX ix_taxpayername on lguname_etracs..noticeofdelinquency( taxpayername );
CREATE INDEX ix_cadastrallotno on lguname_etracs..noticeofdelinquency( cadastrallotno );


alter table lguname_etracs..lgu add oldindexno varchar(5)
go

update lguname_etracs..lgu set oldindexno = SUBSTRING(indexno, 2,3)  where lgutype = 'barangay'
go

