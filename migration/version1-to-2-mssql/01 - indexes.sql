use bayombong_etracs;

create index "ux_title_parentid" on account ("accttitle","parentid");

create index "ix_afcontrol_collectorid" on afcontrol ("collectorid");
create index "ix_afcontrol_collectorname" on afcontrol ("collectorname");
create index "ix_afcontrol_afid" on afcontrol ("afid");
create index "ix_afcontrol_colid_afid" on afcontrol ("collectorid","afid");
create index "ix_afcontrol_colafstatemode" on afcontrol ("collectorid","afid","docstate","mode");

create index "ix_batchcapture_state" on batchcapture ("docstate");
create index "ix_batchcapture_colname" on batchcapture ("collectorname");
create index "ix_batchcapture_encodedby" on batchcapture ("encodedby");

create index "ix_bpapplication_docstate" on bpapplication ("docstate");
create index "ix_bpapplication_businesid" on bpapplication ("businessid");
create index "ix_bpapplication_businesid_docstate" on bpapplication ("businessid","docstate");
create index "ix_bpapplication_txnno" on bpapplication ("txnno");
create index "ix_bpapplication_tradename" on bpapplication ("tradename");
create index "ix_bpapplication_barcode" on bpapplication ("barcode");

create index "ix_bpapplicationlisting_businessid" on bpapplicationlisting ("businessid");
create index "ix_bpapplicationlisting_tradename" on bpapplicationlisting ("tradename");
create index "ix_bpapplicationlisting_docstate" on bpapplicationlisting ("docstate");
create index "ix_bpapplicationlisting_txnno" on bpapplicationlisting ("txnno");
create index "ix_bpapplicationlisting_businesid_docstate" on bpapplicationlisting ("businessid","docstate");
create index "ix_bpapplicationlisting_tradenamedocstate" on bpapplicationlisting ("tradename","docstate");
create index "ix_bpapplicationlisting_taxpayernamedocstate" on bpapplicationlisting ("taxpayername","docstate");
create index "ix_bpapplicationlisting_bindocstate" on bpapplicationlisting ("bin","docstate");
create index "ix_bpapplicationlisting_txnnodocstate" on bpapplicationlisting ("txnno","docstate");
create index "ix_bpapplicationlisting_barcode" on bpapplicationlisting ("barcode");
create index "ix_bpapplicationlisting_sym" on bpapplicationlisting ("docstate","iyear","txnmode");

create index "ix_bploblisting_appid" on bploblisting ("applicationid");

create index "ix_bppayment_applicationid" on bppayment ("applicationid");
create index "ix_bppayment_txndate" on bppayment ("txndate");
create index "ix_bppayment_receiptid" on bppayment ("receiptid");

create index "ix_bppermit_businessid" on bppermit ("businessid");
create index "ix_bppermit_appid" on bppermit ("applicationid");

create index "ix_business_bin" on business ("bin");
-- create index "ix_business_taxpayername" on business ("taxpayername"(767));
create index "ix_business_taxpayerid" on business (taxpayerid);
create index "ix_business_adminname" on business ("adminname");
create index "ix_business_businessaddress" on business ("businessaddress");

create index "FK_changeaddresslist_business" on changeaddresslist ("businessid");
-- CONSTRAINT "FK_changeaddresslist" FOREIGN KEY ("objid") REFERENCES "bptxn" ("objid"),
-- CONSTRAINT "FK_changeaddresslist_business" FOREIGN KEY ("businessid") REFERENCES "business" ("objid")

create index "FK_changeadminlist_newadmin" on changeadminlist ("newadminid");
create index "FK_changeadminlist_prevadmin" on changeadminlist ("prevadminid");
create index "FK_changeadminlist_business" on changeadminlist ("businessid");
-- CONSTRAINT "FK_changeadminlist" FOREIGN KEY ("objid") REFERENCES "bptxn" ("objid"),
-- CONSTRAINT "FK_changeadminlist_business" FOREIGN KEY ("businessid") REFERENCES "business" ("objid"),
-- CONSTRAINT "FK_changeadminlist_newadmin" FOREIGN KEY ("newadminid") REFERENCES "entity" ("objid"),
-- CONSTRAINT "FK_changeadminlist_prevadmin" FOREIGN KEY ("prevadminid") REFERENCES "entity" ("objid")

create index "FK_changepermitteelist_newtaxpayer" on changepermitteelist ("newtaxpayerid");
create index "FK_changepermitteelist_prevtaxpayer" on changepermitteelist ("prevtaxpayerid");
create index "FK_changepermitteelist_business" on changepermitteelist ("businessid");
-- CONSTRAINT "FK_changepermitteelist" FOREIGN KEY ("objid") REFERENCES "bptxn" ("objid"),
-- CONSTRAINT "FK_changepermitteelist_business" FOREIGN KEY ("businessid") REFERENCES "business" ("objid"),
-- CONSTRAINT "FK_changepermitteelist_newtaxpayer" FOREIGN KEY ("newtaxpayerid") REFERENCES "entity" ("objid"),
-- CONSTRAINT "FK_changepermitteelist_prevtaxpayer" FOREIGN KEY ("prevtaxpayerid") REFERENCES "entity" ("objid")

create index "FK_changetradenamelist_business" on changetradenamelist ("businessid");
-- CONSTRAINT "FK_changetradenamelist" FOREIGN KEY ("objid") REFERENCES "bptxn" ("objid"),
-- CONSTRAINT "FK_changetradenamelist_business" FOREIGN KEY ("businessid") REFERENCES "business" ("objid")

-- create unique index "uix_afid" on collectiontype ("name","afid");
create index "FK_collectiontype" on collectiontype ("afid");
create index "ix_collectiontype_afid" on collectiontype ("afid");

create index "ix_deposit_txnno" on deposit ("txnno");
create index "ix_deposit_docstate" on deposit ("docstate");
create index "ix_deposit_depositedbyname" on deposit ("depositedbyname");

create index "ix_entity_no" on entity ("entityno");
-- create index "ix_entity_name" on entity ("entityname");
-- create index "ix_entity_entityname" on entity ("entityname");
create index "ix_entity_entityno" on entity ("entityno");
create index "ix_entity_entitytype" on entity ("entitytype");

create index "ix_brgy_state_section_taxable" on faaslist ("barangayid","docstate","section","taxable");
create index "ix_faaslist_barangayid_docstate" on faaslist ("barangayid","docstate");
create index "ix_txntimestamp_docstate" on faaslist ("txntimestamp","docstate");
create index "FK_faaslist" on faaslist ("taxpayerid");
create index "ix_faaslist_annotated" on faaslist ("annotated");
create index "ix_faaslist_prevtdno_ry" on faaslist ("prevtdno","ry");
create index "ix_faaslist_prevtdno" on faaslist ("prevtdno");
create index "ix_faaslist_rydocstate" on faaslist ("ry","docstate");
create index "ix_faaslist_timestamp_docstate_taxable" on faaslist ("txntimestamp","docstate","taxable");
create index "ix_faaslist_pin_rputype" on faaslist ("rputype","pin");
-- CONSTRAINT "FK_faaslist" FOREIGN KEY ("taxpayerid") REFERENCES "entity" ("objid")

create index "name" on filter ("name","refname");

create unique index "ix_incomeacct_title" on incomeaccount ("accttitle");

create index "ix_jobposition" on jobposition ("orgunitid");
create index "ix_jobposition_roleclass" on jobposition ("roleclass");
create index "ix_jobposition_role" on jobposition ("role");
create index "ix_jobposition_personnel" on jobposition ("assigneeid");
  -- CONSTRAINT "FK_jobposition" FOREIGN KEY ("orgunitid") REFERENCES "orgunit" ("objid"),
  -- CONSTRAINT "FK_jobposition_assignee" FOREIGN KEY ("assigneeid") REFERENCES "personnel" ("objid"),
  -- CONSTRAINT "FK_jobposition_role" FOREIGN KEY ("role") REFERENCES "role" ("name")
  
create index "ix_liquidationlist_period" on liquidationlist ("iyear","iqtr","imonth");
-- CONSTRAINT "FK_liquidation" FOREIGN KEY ("objid") REFERENCES "liquidation" ("objid")

create index "FK_liquidationrcd" on liquidationrcd ("liquidationid");
create index "FK_liquidationrcd_fund" on liquidationrcd ("fundid");
create index "lqofficerid" on liquidationrcd ("lqofficerid");
create index "ix_liquidationrcd_cashierid" on liquidationrcd ("cashierid");
-- CONSTRAINT "FK_liquidationrcd" FOREIGN KEY ("liquidationid") REFERENCES "liquidation" ("objid"),
-- CONSTRAINT "FK_liquidationrcd_fund" FOREIGN KEY ("fundid") REFERENCES "fund" ("objid")

-- create unique index "ux_lob_name" on lob ("name");
create index "ux_lob_name" on lob ("name");
create index "ix_lob" on lob ("classificationid");
-- CONSTRAINT "FK_lob" FOREIGN KEY ("classificationid") REFERENCES "lobclassification" ("objid")

create index "ux_lobclassification_name" on lobclassification ("name");

create index "ix_orgunit" on orgunit ("orgtype");
-- CONSTRAINT "FK_orgunit" FOREIGN KEY ("orgtype") REFERENCES "orgtype" ("name")

create index "ix_paymentitem_rctid" on paymentitem ("receiptid");
create index "ix_paymentitem_rctid_paytype" on paymentitem ("receiptid","paytype");
create index "ix_paymentitem_receiptid" on paymentitem ("receiptid");
create index "ix_paymentitem_liquidationid" on paymentitem ("liquidationid");
create index "ix_paymentitem_liquidationrcdid" on paymentitem ("liquidationrcdid");

create unique index "staffno" on personnel ("staffno");

create unique index "ux_pin_pinclaimno" on pin ("pin","claimno");

create unique index "ux_propertypayerid_ledgerid" on propertypayeritem ("propertypayerid","ledgerid");

create index "ix_receipt_remid" on receipt ("remittanceid");
create index "ix_receipt_remno" on receipt ("remittanceno");

create index "ix_receiptitem_rctid" on receiptitem ("receiptid");
create index "ix_receiptitem_acctid" on receiptitem ("acctid");
create index "ix_receiptitem_accttitle" on receiptitem ("accttitle");
create index "ix_receiptitem_liquidationrcdid" on receiptitem ("liquidationrcdid");
-- CONSTRAINT "FK_receiptitem" FOREIGN KEY ("acctid") REFERENCES "incomeaccount" ("objid")

create index "ix_receiptlist_docstatecolid" on receiptlist ("collectorid","docstate");
create index "ix_receiptlist_remid" on receiptlist ("remittanceid");
create index "ix_receiptlist_remno" on receiptlist ("remittanceno");
create index "ix_receiptlist_iyear" on receiptlist ("iyear");
create index "ix_receiptlist_iqtr" on receiptlist ("iyear","iqtr");
create index "ix_receiptlist_imonth" on receiptlist ("iyear","imonth");
create index "ix_receiptlist_iday" on receiptlist ("iyear","imonth","iday");
create index "ix_receiptlist_serialno" on receiptlist ("serialno");
create index "ix_receiptlist_stubno" on receiptlist ("stubno");
create index "ix_receiptlist_collectorname" on receiptlist ("collectorname");
create index "ix_receiptlist_payorname" on receiptlist ("payorname");
create index "ix_receiptlist_colidvoided" on receiptlist ("collectorid","voided");
create index "ix_receiptlist_doctype_voided" on receiptlist ("doctype","voided");

create index "ix_remittancelist_liquidationid" on remittancelist ("liquidationid");
create index "ix_liquidatingofficerid" on remittancelist ("liquidatingofficerid");
create index "ix_liquidatingofficerid_txndate" on remittancelist ("liquidatingofficerid","txndate");
-- CONSTRAINT "FK_remittancelist" FOREIGN KEY ("objid") REFERENCES "remittance" ("objid")

create index "ix_remittance" on remittedform ("remittanceid");
create index "ix_afcontrol" on remittedform ("afcontrolid");
create index "ix_af" on remittedform ("afid");
-- CONSTRAINT "FK_af" FOREIGN KEY ("afid") REFERENCES "af" ("objid"),
-- CONSTRAINT "FK_afcontrol" FOREIGN KEY ("afcontrolid") REFERENCES "afcontrol" ("objid"),
-- CONSTRAINT "FK_remittance" FOREIGN KEY ("remittanceid") REFERENCES "remittance" ("objid")

create index "ix_revenue_liquidation" on revenue ("liquidationid");
create index "ix_revenue_remittance" on revenue ("remittanceid");
create index "ix_revenue_deposit" on revenue ("depositid");
create index "ix_revenue_incomeaccount" on revenue ("acctid");
create index "ix_revenue_ngas" on revenue ("ngasid");
create index "ix_revenue_sre" on revenue ("sreid");
create index "ix_revenue_receipt" on revenue ("receiptid");
create index "ix_revenue_af" on revenue ("afid");
create index "ix_revenue_afcontrol" on revenue ("afcontrolid");
create index "ix_revenue_liquidationtimestamp_voided" on revenue ("liquidationtimestamp","voided");
create index "ix_revenue_liquidationtimestamp" on revenue ("liquidationtimestamp");
create index "ix_revenue_liquidationrcdid" on revenue ("liquidationrcdid");
-- CONSTRAINT "FK_revenue_af" FOREIGN KEY ("afid") REFERENCES "af" ("objid"),
-- CONSTRAINT "FK_revenue_afcontrol" FOREIGN KEY ("afcontrolid") REFERENCES "afcontrol" ("objid"),
-- CONSTRAINT "FK_revenue_deposit" FOREIGN KEY ("depositid") REFERENCES "deposit" ("objid"),
-- CONSTRAINT "FK_revenue_incomeaccount" FOREIGN KEY ("acctid") REFERENCES "incomeaccount" ("objid"),
-- CONSTRAINT "FK_revenue_liquidation" FOREIGN KEY ("liquidationid") REFERENCES "liquidation" ("objid"),
-- CONSTRAINT "FK_revenue_ngas" FOREIGN KEY ("ngasid") REFERENCES "account" ("objid"),
-- CONSTRAINT "FK_revenue_remittance" FOREIGN KEY ("remittanceid") REFERENCES "remittance" ("objid"),
-- CONSTRAINT "FK_revenue_sre" FOREIGN KEY ("sreid") REFERENCES "account" ("objid")


create index "ix_role" on "role" ("roleclass");

create unique index "ux_rptledger_fullpin" on rptledger ("fullpin","claimno");
create index "ix_rptledger_docstate" on rptledger ("docstate");
create index "ix_rptledger_tdnostate" on rptledger ("tdno","docstate");
create index "ix_rptledger_prevtdnostate" on rptledger ("prevtdno","docstate");
create index "ix_rptledger_lotstate" on rptledger ("cadastrallotno","docstate");
create index "ix_rptledger_brgystate" on rptledger ("barangay","docstate");
create index "ix_rptledger_tpaynostate" on rptledger ("taxpayerno","docstate");
create index "ix_rptledger_namestate" on rptledger ("taxpayername","docstate");
create index "ix_rptledger_faasid" on rptledger ("faasid");

create index "ix_rptledger_parentid" on rptledgeritem ("parentid");
create index "ix_rptledger_tdno" on rptledgeritem ("tdno");

create index "ix_rptpaymentmanual_receiptid" on rptpaymentmanual ("receiptid");

-- create unique index "macaddress_unique" on terminal ("macaddress");

create index "ix_txnlog_refid" on txnlog ("refid");

create unique index "username" on useraccount ("uid");

create unique index "ux_variable_name" on variable ("name");






