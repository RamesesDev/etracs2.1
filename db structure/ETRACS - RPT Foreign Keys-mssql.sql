/*==================================================================
** Subdivision
==================================================================*/
ALTER TABLE bayawan_etracs..subdivision
ADD CONSTRAINT FK_subdivision_faaslist FOREIGN KEY(motherfaasid) 
REFERENCES bayawan_etracs..faaslist(objid)
go 

ALTER TABLE bayawan_etracs..subdivisionaffectedrpu
ADD CONSTRAINT FK_subdivisionaffectedrpu_subdivision FOREIGN KEY(subdivisionid) 
REFERENCES bayawan_etracs..subdivision(objid)
go 

ALTER TABLE bayawan_etracs..subdivisionaffectedrpu
ADD CONSTRAINT FK_subdivisionaffectedrpu_faaslist_prevfaasid FOREIGN KEY(prevfaasid) 
REFERENCES bayawan_etracs..faaslist(objid)
go 

ALTER TABLE bayawan_etracs..subdivisionaffectedrpu
ADD CONSTRAINT FK_subdivisionaffectedrpu_faaslist_newfaasid FOREIGN KEY(newfaasid) 
REFERENCES bayawan_etracs..faaslist(objid)
go 

ALTER TABLE bayawan_etracs..subdivisionland
ADD CONSTRAINT FK_subdivisionland_subdivision FOREIGN KEY(subdivisionid) 
REFERENCES bayawan_etracs..subdivision(objid)
go 

ALTER TABLE bayawan_etracs..subdivisionland
ADD CONSTRAINT FK_subdivisionland_faaslist FOREIGN KEY(newfaasid) 
REFERENCES bayawan_etracs..faaslist(objid)
go 


/*==================================================================
** RPTPayment
==================================================================*/
ALTER TABLE bayawan_etracs..rptpayment WITH NOCHECK
ADD CONSTRAINT FK_rptpayment_rptledger FOREIGN KEY(rptledgerid) 
REFERENCES bayawan_etracs..rptledger(objid)
go 

ALTER TABLE bayawan_etracs..rptpayment WITH NOCHECK
ADD CONSTRAINT FK_rptpayment_receiptlist FOREIGN KEY(receiptid) 
REFERENCES bayawan_etracs..receiptlist(objid)
go 

ALTER TABLE bayawan_etracs..rptpayment 
ADD CONSTRAINT FK_rptpayment_personnel FOREIGN KEY(collectorid) 
REFERENCES bayawan_etracs..personnel(objid)
go 

ALTER TABLE bayawan_etracs..rptpaymentdetail 
ADD CONSTRAINT FK_rptpaymentdetail_receiptlist FOREIGN KEY(receiptid) 
REFERENCES bayawan_etracs..receiptlist(objid)
go 

ALTER TABLE bayawan_etracs..rptpaymentdetail WITH NOCHECK
ADD CONSTRAINT FK_rptpaymentdetail_rptledger FOREIGN KEY(rptledgerid) 
REFERENCES bayawan_etracs..rptledger(objid)
go 




/*==================================================================
** RPTLedger
==================================================================*/
ALTER TABLE bayawan_etracs..rptledger
ADD CONSTRAINT FK_rptledger_faaslist FOREIGN KEY(faasid) 
REFERENCES bayawan_etracs..faaslist(objid)
go 

ALTER TABLE bayawan_etracs..rptledger
ADD CONSTRAINT FK_rptledger_propertyclassification FOREIGN KEY(classid) 
REFERENCES bayawan_etracs..propertyclassification(objid)
go 

ALTER TABLE bayawan_etracs..rptledger
ADD CONSTRAINT FK_rptledger_entity FOREIGN KEY(taxpayerid) 
REFERENCES bayawan_etracs..entity(objid)
go 


ALTER TABLE bayawan_etracs..rptledgeritem
ADD CONSTRAINT FK_rptledgeritem_rptledger FOREIGN KEY(parentid) 
REFERENCES bayawan_etracs..rptledger(objid)
go 



/*==================================================================
** RealPropertyUpdate
==================================================================*/
ALTER TABLE bayawan_etracs..realpropertyupdate
ADD CONSTRAINT FK_realpropertyupdate_realproperty FOREIGN KEY(realpropertyid) 
REFERENCES bayawan_etracs..realproperty(objid)
go 


/*==================================================================
** NoticeOfDelinquency
==================================================================*/
ALTER TABLE bayawan_etracs..noticeofdelinquency
ADD CONSTRAINT FK_noticeofdelinquency_rptledger FOREIGN KEY(ledgerid) 
REFERENCES bayawan_etracs..rptledger(objid)
go 


/*==================================================================
** FAASTitleUpdate
==================================================================*/
ALTER TABLE bayawan_etracs..faastitleupdate
ADD CONSTRAINT FK_faastitleupdate_faaslist FOREIGN KEY(faasid) 
REFERENCES bayawan_etracs..faaslist(objid)
go 


/*==================================================================
** FAASAttachment
==================================================================*/
ALTER TABLE bayawan_etracs..faasattachment
ADD CONSTRAINT FK_faasattachment_faaslist FOREIGN KEY(faasid) 
REFERENCES bayawan_etracs..faaslist(objid)
go 

/*==================================================================
** FAASAnnotation
==================================================================*/
ALTER TABLE bayawan_etracs..faasannotation
ADD CONSTRAINT FK_faasannotation_faaslist FOREIGN KEY(faasid) 
REFERENCES bayawan_etracs..faaslist(objid)
go 


/*==================================================================
** EntityMember
==================================================================*/
ALTER TABLE bayawan_etracs..entitymember
ADD CONSTRAINT FK_entitymember_entity FOREIGN KEY(entityid) 
REFERENCES bayawan_etracs..entity(objid)
go 

ALTER TABLE bayawan_etracs..entitymember
ADD CONSTRAINT FK_entitymember_entity_taxpayerid FOREIGN KEY(taxpayerid) 
REFERENCES bayawan_etracs..entity(objid)
go 



/*==================================================================
** Consolidation
==================================================================*/
ALTER TABLE bayawan_etracs..consolidation
ADD CONSTRAINT FK_consolidation_entity FOREIGN KEY(newtaxpayerid) 
REFERENCES bayawan_etracs..entity(objid)
go 

ALTER TABLE bayawan_etracs..consolidation
ADD CONSTRAINT FK_consolidation_faaslist FOREIGN KEY(newfaasid) 
REFERENCES bayawan_etracs..faaslist(objid)
go 

ALTER TABLE bayawan_etracs..consolidationaffectedrpu
ADD CONSTRAINT FK_consolidationaffectedrpu_consolidation FOREIGN KEY(consolidationid) 
REFERENCES bayawan_etracs..consolidation(objid)
go 


ALTER TABLE bayawan_etracs..consolidationaffectedrpu
ADD CONSTRAINT FK_consolidationaffectedrpu_faaslist FOREIGN KEY(landfaasid) 
REFERENCES bayawan_etracs..faaslist(objid)
go 


ALTER TABLE bayawan_etracs..consolidationaffectedrpu
ADD CONSTRAINT FK_consolidationaffectedrpu_faaslist FOREIGN KEY(landfaasid) 
REFERENCES bayawan_etracs..faaslist(objid)
go 

ALTER TABLE bayawan_etracs..consolidationaffectedrpu
ADD CONSTRAINT FK_consolidationaffectedrpu_faaslist_prevfaasid FOREIGN KEY(prevfaasid) 
REFERENCES bayawan_etracs..faaslist(objid)
go 

ALTER TABLE bayawan_etracs..consolidationaffectedrpu
ADD CONSTRAINT FK_consolidationaffectedrpu_faaslist_newfaasid FOREIGN KEY(newfaasid) 
REFERENCES bayawan_etracs..faaslist(objid)
go 

ALTER TABLE bayawan_etracs..consolidationland
ADD CONSTRAINT FK_consolidationland_consolidation FOREIGN KEY(consolidationid) 
REFERENCES bayawan_etracs..consolidation(objid)
go 


ALTER TABLE bayawan_etracs..consolidationland
ADD CONSTRAINT FK_consolidationland_entity FOREIGN KEY(taxpayerid) 
REFERENCES bayawan_etracs..entity(objid)
go 


ALTER TABLE bayawan_etracs..consolidationland
ADD CONSTRAINT FK_consolidationland_faaslist FOREIGN KEY(landfaasid) 
REFERENCES bayawan_etracs..faaslist(objid)
go 


/*==================================================================
** CAncelFAAS
==================================================================*/
ALTER TABLE bayawan_etracs..cancelfaas
ADD CONSTRAINT FK_cancelfaas_faaslist FOREIGN KEY(faasid) 
REFERENCES bayawan_etracs..faaslist(objid)
go 

ALTER TABLE bayawan_etracs..cancelfaas
ADD CONSTRAINT FK_cancelfaas_cancelreason FOREIGN KEY(cancelreasonid) 
REFERENCES bayawan_etracs..canceltdreason(objid)
go 

/*==================================================================
** CancelAnnotation
==================================================================*/
ALTER TABLE bayawan_etracs..cancelannotation
ADD CONSTRAINT FK_cancelannotation_faaslist FOREIGN KEY(faasid) 
REFERENCES bayawan_etracs..faaslist(objid)
go 

ALTER TABLE bayawan_etracs..cancelannotation
ADD CONSTRAINT FK_cancelannotation_faasannotation FOREIGN KEY(annotationid) 
REFERENCES bayawan_etracs..faasannotation(objid)
go 



/*==================================================================
** TrueCopy
==================================================================*/
ALTER TABLE bayawan_etracs..truecopy
ADD CONSTRAINT FK_truecopy_faaslist FOREIGN KEY(faasid) 
REFERENCES bayawan_etracs..faaslist(objid)
go 


/*==================================================================
** PlantTreeRYSetting
==================================================================*/
ALTER TABLE bayawan_etracs..planttreeunitvalue
ADD CONSTRAINT FK_planttreeunitvalue_planttreerysetting FOREIGN KEY(planttreerysettingid) 
REFERENCES bayawan_etracs..planttreerysetting(objid)
go 

ALTER TABLE bayawan_etracs..planttreeunitvalue
ADD CONSTRAINT FK_planttreeunitvalue_planttree FOREIGN KEY(planttreeid) 
REFERENCES bayawan_etracs..plantsandtrees(objid)
go 



/*==================================================================
** MiscRYSetting
==================================================================*/
ALTER TABLE bayawan_etracs..miscassesslevel 
ADD CONSTRAINT FK_miscassesslevel_miscrysetting FOREIGN KEY(miscrysettingid) 
REFERENCES bayawan_etracs..miscrysetting(objid)
go 

ALTER TABLE bayawan_etracs..miscitemvalue
ADD CONSTRAINT FK_miscitemvalue_miscrysetting FOREIGN KEY(miscrysettingid) 
REFERENCES bayawan_etracs..miscrysetting(objid)
go 

ALTER TABLE bayawan_etracs..miscitemvalue
ADD CONSTRAINT FK_miscitemvalue_miscitems FOREIGN KEY(miscitemid) 
REFERENCES bayawan_etracs..miscitems(objid)
go 



/*==================================================================
** MachRYSetting
==================================================================*/
ALTER TABLE bayawan_etracs..machassesslevel 
ADD CONSTRAINT FK_machassesslevel_machrysetting FOREIGN KEY(machrysettingid) 
REFERENCES bayawan_etracs..machrysetting(objid)
go 

ALTER TABLE bayawan_etracs..machforex
ADD CONSTRAINT FK_machforex_machrysetting FOREIGN KEY(machrysettingid) 
REFERENCES bayawan_etracs..machrysetting(objid)
go 




/*==================================================================
** BldgRYSetting
==================================================================*/
ALTER TABLE bayawan_etracs..bldgassesslevel WITH NOCHECK
ADD CONSTRAINT FK_bldgassesslevel_bldgrysetting FOREIGN KEY(bldgrysettingid) 
REFERENCES bayawan_etracs..bldgrysetting(objid)
go 

ALTER TABLE bayawan_etracs..bldgtype WITH NOCHECK
ADD CONSTRAINT FK_bldgtype_bldgrysetting FOREIGN KEY(bldgrysettingid) 
REFERENCES bayawan_etracs..bldgrysetting(objid)
go 


ALTER TABLE bayawan_etracs..bldgkindbucc 
ADD CONSTRAINT FK_bldgkindbucc_bldgrysetting FOREIGN KEY(bldgrysettingid) 
REFERENCES bayawan_etracs..bldgrysetting(objid)
go 

ALTER TABLE bayawan_etracs..bldgkindbucc 
ADD CONSTRAINT FK_bldgkindbucc_bldgtype FOREIGN KEY(bldgtypeid) 
REFERENCES bayawan_etracs..bldgtype(objid)
go 

ALTER TABLE bayawan_etracs..bldgkindbucc 
ADD CONSTRAINT FK_bldgkindbucc_kindofbuilding FOREIGN KEY(bldgkindid) 
REFERENCES bayawan_etracs..kindofbuilding(objid)
go 

ALTER TABLE bayawan_etracs..bldgadditionalitem 
ADD CONSTRAINT FK_bldgadditionalitem_bldgrysetting FOREIGN KEY(bldgrysettingid) 
REFERENCES bayawan_etracs..bldgrysetting(objid)
go 



/*==================================================================
** LandRYSetting
==================================================================*/
ALTER TABLE bayawan_etracs..landadjustment WITH NOCHECK
ADD CONSTRAINT FK_landadjustment_landrysetting FOREIGN KEY(landrysettingid) 
REFERENCES bayawan_etracs..landrysetting(objid)
go 

ALTER TABLE bayawan_etracs..lcuvsubclass WITH NOCHECK
ADD CONSTRAINT FK_lcuvsubclass_lcuvspecificclass FOREIGN KEY(specificclassid) 
REFERENCES bayawan_etracs..lcuvspecificclass(objid)
go 

ALTER TABLE bayawan_etracs..lcuvsubclass WITH NOCHECK
ADD CONSTRAINT FK_lcuvsubclass_landrysetting FOREIGN KEY(landrysettingid) 
REFERENCES bayawan_etracs..landrysetting(objid)
go 

ALTER TABLE bayawan_etracs..lcuvspecificclass WITH NOCHECK
ADD CONSTRAINT FK_lcuvspecificclass_lcuv FOREIGN KEY(lcuvid) 
REFERENCES bayawan_etracs..lcuv(objid)
go 

ALTER TABLE bayawan_etracs..lcuvspecificclass WITH NOCHECK
ADD CONSTRAINT FK_lcuvspecificclass_landrysetting FOREIGN KEY(landrysettingid) 
REFERENCES bayawan_etracs..landrysetting(objid)
go 

ALTER TABLE bayawan_etracs..landassesslevel WITH NOCHECK
ADD CONSTRAINT FK_landassesslevel_landrysetting FOREIGN KEY(landrysettingid) 
REFERENCES bayawan_etracs..landrysetting(objid)
go 

ALTER TABLE bayawan_etracs..landassesslevel WITH NOCHECK
ADD CONSTRAINT FK_landassesslevel_propertyclassification FOREIGN KEY(parentid) 
REFERENCES bayawan_etracs..propertyclassification(objid)
go 


/*==================================================================
** FAAS 
==================================================================*/
ALTER TABLE bayawan_etracs..faaslist WITH NOCHECK
ADD CONSTRAINT FK_faaslist_faas FOREIGN KEY(objid) REFERENCES bayawan_etracs..faas(objid)
go 

ALTER TABLE bayawan_etracs..faaslist WITH NOCHECK
ADD CONSTRAINT FK_faaslist_entity FOREIGN KEY(taxpayerid) REFERENCES bayawan_etracs..entity(objid)
go 

