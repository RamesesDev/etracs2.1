use ligao_etracs;


alter table changeaddresslist add CONSTRAINT "FK_changeaddresslist" FOREIGN KEY ("objid") REFERENCES "bptxn" ("objid");
alter table changeaddresslist add CONSTRAINT "FK_changeaddresslist_business" FOREIGN KEY ("businessid") REFERENCES "business" ("objid");

alter table changeadminlist add CONSTRAINT "FK_changeadminlist" FOREIGN KEY ("objid") REFERENCES "bptxn" ("objid");
alter table changeadminlist add CONSTRAINT "FK_changeadminlist_business" FOREIGN KEY ("businessid") REFERENCES "business" ("objid");
alter table changeadminlist add CONSTRAINT "FK_changeadminlist_newadmin" FOREIGN KEY ("newadminid") REFERENCES "entity" ("objid");
alter table changeadminlist add CONSTRAINT "FK_changeadminlist_prevadmin" FOREIGN KEY ("prevadminid") REFERENCES "entity" ("objid");

alter table changepermitteelist add CONSTRAINT "FK_changepermitteelist" FOREIGN KEY ("objid") REFERENCES "bptxn" ("objid");
alter table changepermitteelist add CONSTRAINT "FK_changepermitteelist_business" FOREIGN KEY ("businessid") REFERENCES "business" ("objid");
alter table changepermitteelist add CONSTRAINT "FK_changepermitteelist_newtaxpayer" FOREIGN KEY ("newtaxpayerid") REFERENCES "entity" ("objid");
alter table changepermitteelist add CONSTRAINT "FK_changepermitteelist_prevtaxpayer" FOREIGN KEY ("prevtaxpayerid") REFERENCES "entity" ("objid");

alter table changetradenamelist add CONSTRAINT "FK_changetradenamelist" FOREIGN KEY ("objid") REFERENCES "bptxn" ("objid");
alter table changetradenamelist add CONSTRAINT "FK_changetradenamelist_business" FOREIGN KEY ("businessid") REFERENCES "business" ("objid");


alter table faaslist add CONSTRAINT "FK_faaslist" FOREIGN KEY ("taxpayerid") REFERENCES "entity" ("objid");


alter table jobposition add CONSTRAINT "FK_jobposition" FOREIGN KEY ("orgunitid") REFERENCES "orgunit" ("objid");
alter table jobposition add CONSTRAINT "FK_jobposition_assignee" FOREIGN KEY ("assigneeid") REFERENCES "personnel" ("objid");
alter table jobposition add CONSTRAINT "FK_jobposition_role" FOREIGN KEY ("role") REFERENCES "role" ("name");
  
alter table liquidation add CONSTRAINT "FK_liquidation" FOREIGN KEY ("objid") REFERENCES "liquidation" ("objid");

alter table liquidationrcd add CONSTRAINT "FK_liquidationrcd" FOREIGN KEY ("liquidationid") REFERENCES "liquidation" ("objid");
alter table liquidationrcd add CONSTRAINT "FK_liquidationrcd_fund" FOREIGN KEY ("fundid") REFERENCES "fund" ("objid");


alter table lob add CONSTRAINT "FK_lob" FOREIGN KEY ("classificationid") REFERENCES "lobclassification" ("objid");


alter table orgunit add CONSTRAINT "FK_orgunit" FOREIGN KEY ("orgtype") REFERENCES "orgtype" ("name");


alter table receiptitem add CONSTRAINT "FK_receiptitem" FOREIGN KEY ("acctid") REFERENCES "incomeaccount" ("objid");


alter table remittancelist add CONSTRAINT "FK_remittancelist" FOREIGN KEY ("objid") REFERENCES "remittance" ("objid");

alter table remittedform add CONSTRAINT "FK_remittedform_af" FOREIGN KEY ("afid") REFERENCES "af" ("objid");
alter table remittedform add CONSTRAINT "FK_remittedform_afcontrol" FOREIGN KEY ("afcontrolid") REFERENCES "afcontrol" ("objid");
alter table remittedform add CONSTRAINT "FK_remittedform_remittance" FOREIGN KEY ("remittanceid") REFERENCES "remittance" ("objid");

alter table revenue add CONSTRAINT "FK_revenue_af" FOREIGN KEY ("afid") REFERENCES "af" ("objid");
alter table revenue add CONSTRAINT "FK_revenue_afcontrol" FOREIGN KEY ("afcontrolid") REFERENCES "afcontrol" ("objid");
alter table revenue add CONSTRAINT "FK_revenue_deposit" FOREIGN KEY ("depositid") REFERENCES "deposit" ("objid");
alter table revenue add CONSTRAINT "FK_revenue_incomeaccount" FOREIGN KEY ("acctid") REFERENCES "incomeaccount" ("objid");
alter table revenue add CONSTRAINT "FK_revenue_liquidation" FOREIGN KEY ("liquidationid") REFERENCES "liquidation" ("objid");
alter table revenue add CONSTRAINT "FK_revenue_ngas" FOREIGN KEY ("ngasid") REFERENCES "account" ("objid");
alter table revenue add CONSTRAINT "FK_revenue_remittance" FOREIGN KEY ("remittanceid") REFERENCES "remittance" ("objid");
alter table revenue add CONSTRAINT "FK_revenue_sre" FOREIGN KEY ("sreid") REFERENCES "account" ("objid");




