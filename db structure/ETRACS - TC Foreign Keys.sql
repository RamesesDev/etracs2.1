SET FOREIGN_KEY_CHECKS=0;

/*==================================================================
** Revenue
==================================================================*/
ALTER TABLE dev_etracs.revenue 
ADD CONSTRAINT FK_revenue_receiptitem FOREIGN KEY(objid) 
REFERENCES dev_etracs.receiptitem(objid)
;

ALTER TABLE dev_etracs.revenue 
ADD CONSTRAINT FK_revenue_remittancelist FOREIGN KEY(remittanceid) 
REFERENCES dev_etracs.remittancelist(objid)
;

ALTER TABLE dev_etracs.revenue 
ADD CONSTRAINT FK_revenue_liquidationlist FOREIGN KEY(liquidationid) 
REFERENCES dev_etracs.liquidationlist(objid)
;

ALTER TABLE dev_etracs.revenue 
ADD CONSTRAINT FK_revenue_liquidationlist FOREIGN KEY(liquidationid) 
REFERENCES dev_etracs.liquidationlist(objid)
;

ALTER TABLE dev_etracs.revenue 
ADD CONSTRAINT FK_revenue_deposit FOREIGN KEY(depositid) 
REFERENCES dev_etracs.deposit(objid)
;


ALTER TABLE dev_etracs.revenue 
ADD CONSTRAINT FK_revenue_personnel_collectorid FOREIGN KEY(collectorid) 
REFERENCES dev_etracs.personnel(objid)
;

ALTER TABLE dev_etracs.revenue 
ADD CONSTRAINT FK_revenue_receiptlist FOREIGN KEY(receiptid ) 
REFERENCES dev_etracs.receiptlist(objid)
;

ALTER TABLE dev_etracs.revenue CHANGE COLUMN afid afid VARCHAR(50) NOT NULL;

ALTER TABLE dev_etracs.revenue 
ADD CONSTRAINT FK_revenue_af FOREIGN KEY(afid) 
REFERENCES dev_etracs.af(objid)
;

ALTER TABLE dev_etracs.revenue  
ADD CONSTRAINT FK_revenue_afcontrol FOREIGN KEY(afcontrolid) 
REFERENCES dev_etracs.afcontrol(objid)
;

ALTER TABLE dev_etracs.revenue  
ADD CONSTRAINT FK_revenue_incomeaccount FOREIGN KEY(acctid) 
REFERENCES dev_etracs.incomeaccount(objid)
;

ALTER TABLE dev_etracs.revenue 
ADD CONSTRAINT FK_revenue_incomeaccount FOREIGN KEY(acctid) 
REFERENCES dev_etracs.incomeaccount(objid)
;

ALTER TABLE dev_etracs.revenue 
ADD CONSTRAINT FK_revenue_fund FOREIGN KEY(fundid) 
REFERENCES dev_etracs.fund(objid)
;


ALTER TABLE dev_etracs.revenue 
ADD CONSTRAINT FK_revenue_liquidationrcd FOREIGN KEY(liquidationrcdid) 
REFERENCES dev_etracs.liquidationrcd(objid)
;

/*==================================================================
** PostCapture
==================================================================*/
ALTER TABLE dev_etracs.postcapture
ADD CONSTRAINT FK_postcapture_personnel FOREIGN KEY(collectorid) 
REFERENCES dev_etracs.personnel(objid)
;


/*==================================================================
** BatchCapture
==================================================================*/
ALTER TABLE dev_etracs.batchcapture
ADD CONSTRAINT FK_batchcapture_personnel FOREIGN KEY(collectorid) 
REFERENCES dev_etracs.personnel(objid)
;


/*==================================================================
** LiquidationList
==================================================================*/
ALTER TABLE dev_etracs.liquidationlist 
ADD CONSTRAINT FK_liquidationlist_liquidation FOREIGN KEY(objid) 
REFERENCES dev_etracs.liquidation(objid)
;


ALTER TABLE dev_etracs.liquidationlist 
ADD CONSTRAINT FK_liquidationlist_personnel FOREIGN KEY(liquidatingofficerid) 
REFERENCES dev_etracs.personnel(objid)
;

ALTER TABLE dev_etracs.liquidationlist 
ADD CONSTRAINT FK_liquidationlist_deposit FOREIGN KEY(depositid) 
REFERENCES dev_etracs.deposit(objid)
;


ALTER TABLE dev_etracs.liquidationlist 
ADD CONSTRAINT FK_liquidationlist_personnel_depositedbyid FOREIGN KEY(depositedbyid) 
REFERENCES dev_etracs.personnel(objid)
;

/*==================================================================
** RemittedForm
==================================================================*/
ALTER TABLE dev_etracs.remittedform
ADD CONSTRAINT FK_remittedform_remittance FOREIGN KEY(remittanceid) 
REFERENCES dev_etracs.remittance(objid)
;

ALTER TABLE dev_etracs.remittedform  
ADD CONSTRAINT FK_remittedform_afcontrol FOREIGN KEY(afcontrolid) 
REFERENCES dev_etracs.afcontrol(objid)
;

ALTER TABLE dev_etracs.remittedform 
ADD CONSTRAINT FK_remittedform_af FOREIGN KEY(afid) 
REFERENCES dev_etracs.af(objid)
;


/*==================================================================
** Remittance
==================================================================*/
ALTER TABLE dev_etracs.remittancelist
ADD CONSTRAINT FK_remittancelist_remittance FOREIGN KEY(objid) 
REFERENCES dev_etracs.remittance(objid)
;

ALTER TABLE dev_etracs.remittancelist
ADD CONSTRAINT FK_remittancelist_personnel FOREIGN KEY(collectorid) 
REFERENCES dev_etracs.personnel(objid)
;

ALTER TABLE dev_etracs.remittancelist
ADD CONSTRAINT FK_remittancelist_liquidationlist FOREIGN KEY(liquidationid) 
REFERENCES dev_etracs.liquidationlist(objid)
;

ALTER TABLE dev_etracs.remittancelist
ADD CONSTRAINT FK_remittancelist_personnel_lqid FOREIGN KEY(liquidatingofficerid) 
REFERENCES dev_etracs.personnel(objid)
;

/*==================================================================
** PaymentItem
==================================================================*/
ALTER TABLE dev_etracs.paymentitem 
ADD CONSTRAINT FK_paymentitem_receipt FOREIGN KEY(receiptid) 
REFERENCES dev_etracs.receipt(objid)
;

ALTER TABLE dev_etracs.paymentitem 
ADD CONSTRAINT FK_paymentitem_liquidationlist FOREIGN KEY(liquidationid) 
REFERENCES dev_etracs.liquidationlist(objid)
;

ALTER TABLE dev_etracs.paymentitem 
ADD CONSTRAINT FK_paymentitem_liquidationrcd FOREIGN KEY(liquidationrcdid) 
REFERENCES dev_etracs.liquidationrcd(objid)
;


/*==================================================================
** ReceiptItem
==================================================================*/
ALTER TABLE dev_etracs.receiptitem   
ADD CONSTRAINT FK_receiptitem_receipt FOREIGN KEY(receiptid) 
REFERENCES dev_etracs.receipt(objid)
;

ALTER TABLE dev_etracs.receiptitem 
ADD CONSTRAINT FK_receiptitem_incomeaccount FOREIGN KEY(acctid) 
REFERENCES dev_etracs.incomeaccount(objid)
;

ALTER TABLE dev_etracs.receiptitem 
ADD CONSTRAINT FK_receiptitem_fund FOREIGN KEY(fundid) 
REFERENCES dev_etracs.fund(objid)
;

ALTER TABLE dev_etracs.receiptitem 
ADD CONSTRAINT FK_receiptitem_liquidationrcd FOREIGN KEY(liquidationrcdid) 
REFERENCES dev_etracs.liquidationrcd(objid)
;



/*==================================================================
** ReceiptList
==================================================================*/
ALTER TABLE dev_etracs.receiptlist 
ADD CONSTRAINT FK_receiptlist_receipt FOREIGN KEY(objid) 
REFERENCES dev_etracs.receipt(objid)
;


ALTER TABLE dev_etracs.receiptlist  
ADD CONSTRAINT FK_receiptlist_af FOREIGN KEY(afid) 
REFERENCES dev_etracs.af(objid)
;

ALTER TABLE dev_etracs.receiptlist  
ADD CONSTRAINT FK_receiptlist_afcontrol FOREIGN KEY(afcontrolid) 
REFERENCES dev_etracs.afcontrol(objid)
;

ALTER TABLE dev_etracs.receiptlist  
ADD CONSTRAINT FK_receiptlist_personnel FOREIGN KEY(collectorid) 
REFERENCES dev_etracs.personnel(objid)
;


ALTER TABLE dev_etracs.receiptlist  
ADD CONSTRAINT FK_receiptlist_entity FOREIGN KEY(payorid) 
REFERENCES dev_etracs.entity(objid)
;

ALTER TABLE dev_etracs.receiptlist  
ADD CONSTRAINT FK_receiptlist_remittance FOREIGN KEY(remittanceid) 
REFERENCES dev_etracs.remittance(objid)
;

ALTER TABLE dev_etracs.receiptlist  
ADD CONSTRAINT FK_receiptlist_collectiontype FOREIGN KEY(collectiontypeid) 
REFERENCES dev_etracs.collectiontype(objid)
;

ALTER TABLE dev_etracs.receiptlist  
ADD CONSTRAINT FK_receiptlist_postcapture FOREIGN KEY(postcaptureid) 
REFERENCES dev_etracs.postcapture(objid)
;



/*==================================================================
** AFInventoryCredit
==================================================================*/
ALTER TABLE dev_etracs.afinventorycredit
ADD CONSTRAINT FK_afinventorycredit_afinventory FOREIGN KEY(afinventoryid) 
REFERENCES dev_etracs.afinventory(objid)
;

ALTER TABLE dev_etracs.afinventorycredit
ADD CONSTRAINT FK_afinventorycredit_af FOREIGN KEY(afid) 
REFERENCES dev_etracs.af(objid)
;



/*==================================================================
** AFControl
==================================================================*/
alter table dev_etracs.afcontrol change column afinventorycreditid afinventorycreditid  varchar(50) null
go

ALTER TABLE dev_etracs.afcontrol
ADD CONSTRAINT FK_afcontrol_af FOREIGN KEY(afid) 
REFERENCES dev_etracs.af(objid)
;

ALTER TABLE dev_etracs.afcontrol
ADD CONSTRAINT FK_afcontrol_personnel FOREIGN KEY(collectorid) 
REFERENCES dev_etracs.personnel(objid)
;

ALTER TABLE dev_etracs.afcontrol
ADD CONSTRAINT FK_afcontrol_afinventorycredit FOREIGN KEY(afinventorycreditid) 
REFERENCES dev_etracs.afinventorycredit(objid)
;


/*==================================================================
** CollectinGroup_IncomeAccount
==================================================================*/
ALTER TABLE dev_etracs.collectiongroup_incomeaccount
ADD CONSTRAINT FK_collgroup_incomeaccount_collgroup FOREIGN KEY(groupid) 
REFERENCES dev_etracs.collectiongroup(objid)
;

ALTER TABLE dev_etracs.collectiongroup_incomeaccount
ADD CONSTRAINT FK_collgroup_incomeaccount_incomeacct FOREIGN KEY(incomeaccountid) 
REFERENCES dev_etracs.incomeaccount(objid)
;


/*==================================================================
** IncomeAccount
==================================================================*/
ALTER TABLE dev_etracs.incomeaccount 
ADD CONSTRAINT FK_incomeaccount_account_ngasid FOREIGN KEY(ngasid) 
REFERENCES dev_etracs.account(objid)
;

ALTER TABLE dev_etracs.incomeaccount
ADD CONSTRAINT FK_incomeaccount_account_ngassubacctid FOREIGN KEY(ngassubacctid) 
REFERENCES dev_etracs.account(objid)
;

ALTER TABLE dev_etracs.incomeaccount
ADD CONSTRAINT FK_incomeaccount_account_sreid FOREIGN KEY(sreid) 
REFERENCES dev_etracs.account(objid)
;

ALTER TABLE dev_etracs.incomeaccount
ADD CONSTRAINT FK_incomeaccount_account_sresubacctid FOREIGN KEY(sresubacctid) 
REFERENCES dev_etracs.account(objid)
;

ALTER TABLE dev_etracs.incomeaccount
ADD CONSTRAINT FK_incomeaccount_fund FOREIGN KEY(fundid) 
REFERENCES dev_etracs.fund(objid)
;


ALTER TABLE dev_etracs.incomeaccount
ADD CONSTRAINT FK_incomeaccount_incomeaccountgroup FOREIGN KEY(groupid) 
REFERENCES dev_etracs.incomeaccountgroup(objid)
;

/*==================================================================
** BankAccount
==================================================================*/
ALTER TABLE dev_etracs.bankaccount
ADD CONSTRAINT FK_bankaccount_bank FOREIGN KEY(bankid) 
REFERENCES dev_etracs.bank(objid)
;


SET FOREIGN_KEY_CHECKS=1;