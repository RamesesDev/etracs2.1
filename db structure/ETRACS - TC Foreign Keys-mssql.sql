/*==================================================================
** Revenue
==================================================================*/
ALTER TABLE bayawan_etracs..revenue 
ADD CONSTRAINT FK_revenue_receiptitem FOREIGN KEY(objid) 
REFERENCES bayawan_etracs..receiptitem(objid)
go 

ALTER TABLE bayawan_etracs..revenue 
ADD CONSTRAINT FK_revenue_remittancelist FOREIGN KEY(remittanceid) 
REFERENCES bayawan_etracs..remittancelist(objid)
go 

ALTER TABLE bayawan_etracs..revenue 
ADD CONSTRAINT FK_revenue_liquidationlist FOREIGN KEY(liquidationid) 
REFERENCES bayawan_etracs..liquidationlist(objid)
go 

ALTER TABLE bayawan_etracs..revenue 
ADD CONSTRAINT FK_revenue_liquidationlist FOREIGN KEY(liquidationid) 
REFERENCES bayawan_etracs..liquidationlist(objid)
go 

ALTER TABLE bayawan_etracs..revenue 
ADD CONSTRAINT FK_revenue_deposit FOREIGN KEY(depositid) 
REFERENCES bayawan_etracs..deposit(objid)
go 


ALTER TABLE bayawan_etracs..revenue 
ADD CONSTRAINT FK_revenue_personnel_collectorid FOREIGN KEY(collectorid) 
REFERENCES bayawan_etracs..personnel(objid)
go 

ALTER TABLE bayawan_etracs..revenue 
ADD CONSTRAINT FK_revenue_receiptlist FOREIGN KEY(receiptid ) 
REFERENCES bayawan_etracs..receiptlist(objid)
go 

ALTER TABLE bayawan_etracs..revenue ALTER COLUMN afid VARCHAR(50) NOT NULL
go

ALTER TABLE bayawan_etracs..revenue 
ADD CONSTRAINT FK_revenue_af FOREIGN KEY(afid) 
REFERENCES bayawan_etracs..af(objid)
go 

ALTER TABLE bayawan_etracs..revenue WITH NOCHECK
ADD CONSTRAINT FK_revenue_afcontrol FOREIGN KEY(afcontrolid) 
REFERENCES bayawan_etracs..afcontrol(objid)
go 

ALTER TABLE bayawan_etracs..revenue WITH NOCHECK
ADD CONSTRAINT FK_revenue_incomeaccount FOREIGN KEY(acctid) 
REFERENCES bayawan_etracs..incomeaccount(objid)
go 

ALTER TABLE bayawan_etracs..revenue 
ADD CONSTRAINT FK_revenue_incomeaccount FOREIGN KEY(acctid) 
REFERENCES bayawan_etracs..incomeaccount(objid)
go 

ALTER TABLE bayawan_etracs..revenue 
ADD CONSTRAINT FK_revenue_fund FOREIGN KEY(fundid) 
REFERENCES bayawan_etracs..fund(objid)
go 


ALTER TABLE bayawan_etracs..revenue 
ADD CONSTRAINT FK_revenue_liquidationrcd FOREIGN KEY(liquidationrcdid) 
REFERENCES bayawan_etracs..liquidationrcd(objid)
go 

/*==================================================================
** PostCapture
==================================================================*/
ALTER TABLE bayawan_etracs..postcapture
ADD CONSTRAINT FK_postcapture_personnel FOREIGN KEY(collectorid) 
REFERENCES bayawan_etracs..personnel(objid)
go 


/*==================================================================
** BatchCapture
==================================================================*/
ALTER TABLE bayawan_etracs..batchcapture
ADD CONSTRAINT FK_batchcapture_personnel FOREIGN KEY(collectorid) 
REFERENCES bayawan_etracs..personnel(objid)
go 


/*==================================================================
** LiquidationList
==================================================================*/
ALTER TABLE bayawan_etracs..liquidationlist 
ADD CONSTRAINT FK_liquidationlist_liquidation FOREIGN KEY(objid) 
REFERENCES bayawan_etracs..liquidation(objid)
go 


ALTER TABLE bayawan_etracs..liquidationlist 
ADD CONSTRAINT FK_liquidationlist_personnel FOREIGN KEY(liquidatingofficerid) 
REFERENCES bayawan_etracs..personnel(objid)
go 

ALTER TABLE bayawan_etracs..liquidationlist 
ADD CONSTRAINT FK_liquidationlist_deposit FOREIGN KEY(depositid) 
REFERENCES bayawan_etracs..deposit(objid)
go 


ALTER TABLE bayawan_etracs..liquidationlist 
ADD CONSTRAINT FK_liquidationlist_personnel_depositedbyid FOREIGN KEY(depositedbyid) 
REFERENCES bayawan_etracs..personnel(objid)
go 

/*==================================================================
** RemittedForm
==================================================================*/
ALTER TABLE bayawan_etracs..remittedform
ADD CONSTRAINT FK_remittedform_remittance FOREIGN KEY(remittanceid) 
REFERENCES bayawan_etracs..remittance(objid)
go 

ALTER TABLE bayawan_etracs..remittedform WITH NOCHECK
ADD CONSTRAINT FK_remittedform_afcontrol FOREIGN KEY(afcontrolid) 
REFERENCES bayawan_etracs..afcontrol(objid)
go 

ALTER TABLE bayawan_etracs..remittedform 
ADD CONSTRAINT FK_remittedform_af FOREIGN KEY(afid) 
REFERENCES bayawan_etracs..af(objid)
go 


/*==================================================================
** Remittance
==================================================================*/
ALTER TABLE bayawan_etracs..remittancelist
ADD CONSTRAINT FK_remittancelist_remittance FOREIGN KEY(objid) 
REFERENCES bayawan_etracs..remittance(objid)
go 

ALTER TABLE bayawan_etracs..remittancelist
ADD CONSTRAINT FK_remittancelist_personnel FOREIGN KEY(collectorid) 
REFERENCES bayawan_etracs..personnel(objid)
go 

ALTER TABLE bayawan_etracs..remittancelist 
ADD CONSTRAINT FK_remittancelist_liquidation FOREIGN KEY(liquidationid) 
REFERENCES bayawan_etracs..liquidation(objid)
go 

ALTER TABLE bayawan_etracs..remittancelist
ADD CONSTRAINT FK_remittancelist_personnel_lqid FOREIGN KEY(liquidatingofficerid) 
REFERENCES bayawan_etracs..personnel(objid)
go 

/*==================================================================
** PaymentItem
==================================================================*/
ALTER TABLE bayawan_etracs..paymentitem 
ADD CONSTRAINT FK_paymentitem_receipt FOREIGN KEY(receiptid) 
REFERENCES bayawan_etracs..receipt(objid)
go 

ALTER TABLE bayawan_etracs..paymentitem 
ADD CONSTRAINT FK_paymentitem_liquidationlist FOREIGN KEY(liquidationid) 
REFERENCES bayawan_etracs..liquidationlist(objid)
go

ALTER TABLE bayawan_etracs..paymentitem 
ADD CONSTRAINT FK_paymentitem_liquidationrcd FOREIGN KEY(liquidationrcdid) 
REFERENCES bayawan_etracs..liquidationrcd(objid)
go


/*==================================================================
** ReceiptItem
==================================================================*/
ALTER TABLE bayawan_etracs..receiptitem WITH NOCHECK 
ADD CONSTRAINT FK_receiptitem_receipt FOREIGN KEY(receiptid) 
REFERENCES bayawan_etracs..receipt(objid)
go 

ALTER TABLE bayawan_etracs..receiptitem 
ADD CONSTRAINT FK_receiptitem_incomeaccount FOREIGN KEY(acctid) 
REFERENCES bayawan_etracs..incomeaccount(objid)
go 

ALTER TABLE bayawan_etracs..receiptitem 
ADD CONSTRAINT FK_receiptitem_fund FOREIGN KEY(fundid) 
REFERENCES bayawan_etracs..fund(objid)
go 

ALTER TABLE bayawan_etracs..receiptitem 
ADD CONSTRAINT FK_receiptitem_liquidationrcd FOREIGN KEY(liquidationrcdid) 
REFERENCES bayawan_etracs..liquidationrcd(objid)
go 



/*==================================================================
** ReceiptList
==================================================================*/
ALTER TABLE bayawan_etracs..receiptlist 
ADD CONSTRAINT FK_receiptlist_receipt FOREIGN KEY(objid) 
REFERENCES bayawan_etracs..receipt(objid)
go 


ALTER TABLE bayawan_etracs..receiptlist WITH NOCHECK
ADD CONSTRAINT FK_receiptlist_af FOREIGN KEY(afid) 
REFERENCES bayawan_etracs..af(objid)
go 

ALTER TABLE bayawan_etracs..receiptlist WITH NOCHECK
ADD CONSTRAINT FK_receiptlist_afcontrol FOREIGN KEY(afcontrolid) 
REFERENCES bayawan_etracs..afcontrol(objid)
go 

ALTER TABLE bayawan_etracs..receiptlist WITH NOCHECK
ADD CONSTRAINT FK_receiptlist_personnel FOREIGN KEY(collectorid) 
REFERENCES bayawan_etracs..personnel(objid)
go 


ALTER TABLE bayawan_etracs..receiptlist WITH NOCHECK
ADD CONSTRAINT FK_receiptlist_entity FOREIGN KEY(payorid) 
REFERENCES bayawan_etracs..entity(objid)
go 

ALTER TABLE bayawan_etracs..receiptlist WITH NOCHECK
ADD CONSTRAINT FK_receiptlist_remittance FOREIGN KEY(remittanceid) 
REFERENCES bayawan_etracs..remittance(objid)
go 

ALTER TABLE bayawan_etracs..receiptlist WITH NOCHECK
ADD CONSTRAINT FK_receiptlist_collectiontype FOREIGN KEY(collectiontypeid) 
REFERENCES bayawan_etracs..collectiontype(objid)
go 

ALTER TABLE bayawan_etracs..receiptlist WITH NOCHECK
ADD CONSTRAINT FK_receiptlist_postcapture FOREIGN KEY(postcaptureid) 
REFERENCES bayawan_etracs..postcapture(objid)
go 



/*==================================================================
** AFInventoryCredit
==================================================================*/
ALTER TABLE bayawan_etracs..afinventorycredit
ADD CONSTRAINT FK_afinventorycredit_afinventory FOREIGN KEY(afinventoryid) 
REFERENCES bayawan_etracs..afinventory(objid)
go 

ALTER TABLE bayawan_etracs..afinventorycredit
ADD CONSTRAINT FK_afinventorycredit_af FOREIGN KEY(afid) 
REFERENCES bayawan_etracs..af(objid)
go 



/*==================================================================
** AFControl
==================================================================*/
alter table bayawan_etracs.afcontrol alter column afinventorycreditid varchar(50) null
go

ALTER TABLE bayawan_etracs..afcontrol
ADD CONSTRAINT FK_afcontrol_af FOREIGN KEY(afid) 
REFERENCES bayawan_etracs..af(objid)
go 

ALTER TABLE bayawan_etracs..afcontrol
ADD CONSTRAINT FK_afcontrol_personnel FOREIGN KEY(collectorid) 
REFERENCES bayawan_etracs..personnel(objid)
go 

ALTER TABLE bayawan_etracs..afcontrol
ADD CONSTRAINT FK_afcontrol_afinventorycredit FOREIGN KEY(afinventorycreditid) 
REFERENCES bayawan_etracs..afinventorycredit(objid)
go 


/*==================================================================
** CollectinGroup_IncomeAccount
==================================================================*/
ALTER TABLE bayawan_etracs..collectiongroup_incomeaccount
ADD CONSTRAINT FK_collgroup_incomeaccount_collgroup FOREIGN KEY(groupid) 
REFERENCES bayawan_etracs..collectiongroup(objid)
go 

ALTER TABLE bayawan_etracs..collectiongroup_incomeaccount
ADD CONSTRAINT FK_collgroup_incomeaccount_incomeacct FOREIGN KEY(incomeaccountid) 
REFERENCES bayawan_etracs..incomeaccount(objid)
go 


/*==================================================================
** IncomeAccount
==================================================================*/
ALTER TABLE bayawan_etracs..incomeaccount 
ADD CONSTRAINT FK_incomeaccount_account_ngasid FOREIGN KEY(ngasid) 
REFERENCES bayawan_etracs..account(objid)
go 

ALTER TABLE bayawan_etracs..incomeaccount
ADD CONSTRAINT FK_incomeaccount_account_ngassubacctid FOREIGN KEY(ngassubacctid) 
REFERENCES bayawan_etracs..account(objid)
go 

ALTER TABLE bayawan_etracs..incomeaccount
ADD CONSTRAINT FK_incomeaccount_account_sreid FOREIGN KEY(sreid) 
REFERENCES bayawan_etracs..account(objid)
go 

ALTER TABLE bayawan_etracs..incomeaccount
ADD CONSTRAINT FK_incomeaccount_account_sresubacctid FOREIGN KEY(sresubacctid) 
REFERENCES bayawan_etracs..account(objid)
go 

ALTER TABLE bayawan_etracs..incomeaccount
ADD CONSTRAINT FK_incomeaccount_fund FOREIGN KEY(fundid) 
REFERENCES bayawan_etracs..fund(objid)
go 


ALTER TABLE bayawan_etracs..incomeaccount
ADD CONSTRAINT FK_incomeaccount_incomeaccountgroup FOREIGN KEY(groupid) 
REFERENCES bayawan_etracs..incomeaccountgroup(objid)
go 

/*==================================================================
** BankAccount
==================================================================*/
ALTER TABLE bayawan_etracs..bankaccount
ADD CONSTRAINT FK_bankaccount_bank FOREIGN KEY(bankid) 
REFERENCES bayawan_etracs..bank(objid)
go 

