SET FOREIGN_KEY_CHECKS=0;

/*==================================================================
** Subdivision
==================================================================*/
ALTER TABLE dev_etracs.subdivision
ADD CONSTRAINT FK_subdivision_faaslist FOREIGN KEY(motherfaasid) 
REFERENCES dev_etracs.faaslist(objid)
;

ALTER TABLE dev_etracs.subdivisionaffectedrpu
ADD CONSTRAINT FK_subdivisionaffectedrpu_subdivision FOREIGN KEY(subdivisionid) 
REFERENCES dev_etracs.subdivision(objid)
;

ALTER TABLE dev_etracs.subdivisionaffectedrpu
ADD CONSTRAINT FK_subdivisionaffectedrpu_faaslist_prevfaasid FOREIGN KEY(prevfaasid) 
REFERENCES dev_etracs.faaslist(objid)
;

ALTER TABLE dev_etracs.subdivisionaffectedrpu
ADD CONSTRAINT FK_subdivisionaffectedrpu_faaslist_newfaasid FOREIGN KEY(newfaasid) 
REFERENCES dev_etracs.faaslist(objid)
;

ALTER TABLE dev_etracs.subdivisionland
ADD CONSTRAINT FK_subdivisionland_subdivision FOREIGN KEY(subdivisionid) 
REFERENCES dev_etracs.subdivision(objid)
;

ALTER TABLE dev_etracs.subdivisionland
ADD CONSTRAINT FK_subdivisionland_faaslist FOREIGN KEY(newfaasid) 
REFERENCES dev_etracs.faaslist(objid)
;


/*==================================================================
** RPTPayment
==================================================================*/
ALTER TABLE dev_etracs.rptpayment  
ADD CONSTRAINT FK_rptpayment_rptledger FOREIGN KEY(rptledgerid) 
REFERENCES dev_etracs.rptledger(objid)
;

ALTER TABLE dev_etracs.rptpayment  
ADD CONSTRAINT FK_rptpayment_receiptlist FOREIGN KEY(receiptid) 
REFERENCES dev_etracs.receiptlist(objid)
;

ALTER TABLE dev_etracs.rptpayment 
ADD CONSTRAINT FK_rptpayment_personnel FOREIGN KEY(collectorid) 
REFERENCES dev_etracs.personnel(objid)
;

ALTER TABLE dev_etracs.rptpaymentdetail 
ADD CONSTRAINT FK_rptpaymentdetail_receiptlist FOREIGN KEY(receiptid) 
REFERENCES dev_etracs.receiptlist(objid)
;

ALTER TABLE dev_etracs.rptpaymentdetail  
ADD CONSTRAINT FK_rptpaymentdetail_rptledger FOREIGN KEY(rptledgerid) 
REFERENCES dev_etracs.rptledger(objid)
;




/*==================================================================
** RPTLedger
==================================================================*/
ALTER TABLE dev_etracs.rptledger
ADD CONSTRAINT FK_rptledger_faaslist FOREIGN KEY(faasid) 
REFERENCES dev_etracs.faaslist(objid)
;

ALTER TABLE dev_etracs.rptledger
ADD CONSTRAINT FK_rptledger_propertyclassification FOREIGN KEY(classid) 
REFERENCES dev_etracs.propertyclassification(objid)
;

ALTER TABLE dev_etracs.rptledger
ADD CONSTRAINT FK_rptledger_entity FOREIGN KEY(taxpayerid) 
REFERENCES dev_etracs.entity(objid)
;


ALTER TABLE dev_etracs.rptledgeritem
ADD CONSTRAINT FK_rptledgeritem_rptledger FOREIGN KEY(parentid) 
REFERENCES dev_etracs.rptledger(objid)
;



/*==================================================================
** RealPropertyUpdate
==================================================================*/
ALTER TABLE dev_etracs.realpropertyupdate
ADD CONSTRAINT FK_realpropertyupdate_realproperty FOREIGN KEY(realpropertyid) 
REFERENCES dev_etracs.realproperty(objid)
;


/*==================================================================
** NoticeOfDelinquency
==================================================================*/
ALTER TABLE dev_etracs.noticeofdelinquency
ADD CONSTRAINT FK_noticeofdelinquency_rptledger FOREIGN KEY(ledgerid) 
REFERENCES dev_etracs.rptledger(objid)
;


/*==================================================================
** FAASTitleUpdate
==================================================================*/
ALTER TABLE dev_etracs.faastitleupdate
ADD CONSTRAINT FK_faastitleupdate_faaslist FOREIGN KEY(faasid) 
REFERENCES dev_etracs.faaslist(objid)
;


/*==================================================================
** FAASAttachment
==================================================================*/
ALTER TABLE dev_etracs.faasattachment
ADD CONSTRAINT FK_faasattachment_faaslist FOREIGN KEY(faasid) 
REFERENCES dev_etracs.faaslist(objid)
;

/*==================================================================
** FAASAnnotation
==================================================================*/
ALTER TABLE dev_etracs.faasannotation
ADD CONSTRAINT FK_faasannotation_faaslist FOREIGN KEY(faasid) 
REFERENCES dev_etracs.faaslist(objid)
;


/*==================================================================
** EntityMember
==================================================================*/
ALTER TABLE dev_etracs.entitymember
ADD CONSTRAINT FK_entitymember_entity FOREIGN KEY(entityid) 
REFERENCES dev_etracs.entity(objid)
;

ALTER TABLE dev_etracs.entitymember
ADD CONSTRAINT FK_entitymember_entity_taxpayerid FOREIGN KEY(taxpayerid) 
REFERENCES dev_etracs.entity(objid)
;



/*==================================================================
** Consolidation
==================================================================*/
ALTER TABLE dev_etracs.consolidation
ADD CONSTRAINT FK_consolidation_entity FOREIGN KEY(newtaxpayerid) 
REFERENCES dev_etracs.entity(objid)
;

ALTER TABLE dev_etracs.consolidation
ADD CONSTRAINT FK_consolidation_faaslist FOREIGN KEY(newfaasid) 
REFERENCES dev_etracs.faaslist(objid)
;

ALTER TABLE dev_etracs.consolidationaffectedrpu
ADD CONSTRAINT FK_consolidationaffectedrpu_consolidation FOREIGN KEY(consolidationid) 
REFERENCES dev_etracs.consolidation(objid)
;


ALTER TABLE dev_etracs.consolidationaffectedrpu
ADD CONSTRAINT FK_consolidationaffectedrpu_faaslist FOREIGN KEY(landfaasid) 
REFERENCES dev_etracs.faaslist(objid)
;


ALTER TABLE dev_etracs.consolidationaffectedrpu
ADD CONSTRAINT FK_consolidationaffectedrpu_faaslist FOREIGN KEY(landfaasid) 
REFERENCES dev_etracs.faaslist(objid)
;

ALTER TABLE dev_etracs.consolidationaffectedrpu
ADD CONSTRAINT FK_consolidationaffectedrpu_faaslist_prevfaasid FOREIGN KEY(prevfaasid) 
REFERENCES dev_etracs.faaslist(objid)
;

ALTER TABLE dev_etracs.consolidationaffectedrpu
ADD CONSTRAINT FK_consolidationaffectedrpu_faaslist_newfaasid FOREIGN KEY(newfaasid) 
REFERENCES dev_etracs.faaslist(objid)
;

ALTER TABLE dev_etracs.consolidationland
ADD CONSTRAINT FK_consolidationland_consolidation FOREIGN KEY(consolidationid) 
REFERENCES dev_etracs.consolidation(objid)
;


ALTER TABLE dev_etracs.consolidationland
ADD CONSTRAINT FK_consolidationland_entity FOREIGN KEY(taxpayerid) 
REFERENCES dev_etracs.entity(objid)
;


ALTER TABLE dev_etracs.consolidationland
ADD CONSTRAINT FK_consolidationland_faaslist FOREIGN KEY(landfaasid) 
REFERENCES dev_etracs.faaslist(objid)
;


/*==================================================================
** CAncelFAAS
==================================================================*/
ALTER TABLE dev_etracs.cancelfaas
ADD CONSTRAINT FK_cancelfaas_faaslist FOREIGN KEY(faasid) 
REFERENCES dev_etracs.faaslist(objid)
;

ALTER TABLE dev_etracs.cancelfaas
ADD CONSTRAINT FK_cancelfaas_cancelreason FOREIGN KEY(cancelreasonid) 
REFERENCES dev_etracs.canceltdreason(objid)
;

/*==================================================================
** CancelAnnotation
==================================================================*/
ALTER TABLE dev_etracs.cancelannotation
ADD CONSTRAINT FK_cancelannotation_faaslist FOREIGN KEY(faasid) 
REFERENCES dev_etracs.faaslist(objid)
;

ALTER TABLE dev_etracs.cancelannotation
ADD CONSTRAINT FK_cancelannotation_faasannotation FOREIGN KEY(annotationid) 
REFERENCES dev_etracs.faasannotation(objid)
;



/*==================================================================
** TrueCopy
==================================================================*/
ALTER TABLE dev_etracs.truecopy
ADD CONSTRAINT FK_truecopy_faaslist FOREIGN KEY(faasid) 
REFERENCES dev_etracs.faaslist(objid)
;


/*==================================================================
** PlantTreeRYSetting
==================================================================*/
ALTER TABLE dev_etracs.planttreeunitvalue
ADD CONSTRAINT FK_planttreeunitvalue_planttreerysetting FOREIGN KEY(planttreerysettingid) 
REFERENCES dev_etracs.planttreerysetting(objid)
;

ALTER TABLE dev_etracs.planttreeunitvalue
ADD CONSTRAINT FK_planttreeunitvalue_planttree FOREIGN KEY(planttreeid) 
REFERENCES dev_etracs.plantsandtrees(objid)
;



/*==================================================================
** MiscRYSetting
==================================================================*/
ALTER TABLE dev_etracs.miscassesslevel 
ADD CONSTRAINT FK_miscassesslevel_miscrysetting FOREIGN KEY(miscrysettingid) 
REFERENCES dev_etracs.miscrysetting(objid)
;

ALTER TABLE dev_etracs.miscitemvalue
ADD CONSTRAINT FK_miscitemvalue_miscrysetting FOREIGN KEY(miscrysettingid) 
REFERENCES dev_etracs.miscrysetting(objid)
;

ALTER TABLE dev_etracs.miscitemvalue
ADD CONSTRAINT FK_miscitemvalue_miscitems FOREIGN KEY(miscitemid) 
REFERENCES dev_etracs.miscitems(objid)
;



/*==================================================================
** MachRYSetting
==================================================================*/
ALTER TABLE dev_etracs.machassesslevel 
ADD CONSTRAINT FK_machassesslevel_machrysetting FOREIGN KEY(machrysettingid) 
REFERENCES dev_etracs.machrysetting(objid)
;

ALTER TABLE dev_etracs.machforex
ADD CONSTRAINT FK_machforex_machrysetting FOREIGN KEY(machrysettingid) 
REFERENCES dev_etracs.machrysetting(objid)
;




/*==================================================================
** BldgRYSetting
==================================================================*/
ALTER TABLE dev_etracs.bldgassesslevel  
ADD CONSTRAINT FK_bldgassesslevel_bldgrysetting FOREIGN KEY(bldgrysettingid) 
REFERENCES dev_etracs.bldgrysetting(objid)
;

ALTER TABLE dev_etracs.bldgtype  
ADD CONSTRAINT FK_bldgtype_bldgrysetting FOREIGN KEY(bldgrysettingid) 
REFERENCES dev_etracs.bldgrysetting(objid)
;


ALTER TABLE dev_etracs.bldgkindbucc 
ADD CONSTRAINT FK_bldgkindbucc_bldgrysetting FOREIGN KEY(bldgrysettingid) 
REFERENCES dev_etracs.bldgrysetting(objid)
;

ALTER TABLE dev_etracs.bldgkindbucc 
ADD CONSTRAINT FK_bldgkindbucc_bldgtype FOREIGN KEY(bldgtypeid) 
REFERENCES dev_etracs.bldgtype(objid)
;

ALTER TABLE dev_etracs.bldgkindbucc 
ADD CONSTRAINT FK_bldgkindbucc_kindofbuilding FOREIGN KEY(bldgkindid) 
REFERENCES dev_etracs.kindofbuilding(objid)
;

ALTER TABLE dev_etracs.bldgadditionalitem 
ADD CONSTRAINT FK_bldgadditionalitem_bldgrysetting FOREIGN KEY(bldgrysettingid) 
REFERENCES dev_etracs.bldgrysetting(objid)
;



/*==================================================================
** LandRYSetting
==================================================================*/
ALTER TABLE dev_etracs.landadjustment  
ADD CONSTRAINT FK_landadjustment_landrysetting FOREIGN KEY(landrysettingid) 
REFERENCES dev_etracs.landrysetting(objid)
;

ALTER TABLE dev_etracs.lcuvsubclass  
ADD CONSTRAINT FK_lcuvsubclass_lcuvspecificclass FOREIGN KEY(specificclassid) 
REFERENCES dev_etracs.lcuvspecificclass(objid)
;

ALTER TABLE dev_etracs.lcuvsubclass  
ADD CONSTRAINT FK_lcuvsubclass_landrysetting FOREIGN KEY(landrysettingid) 
REFERENCES dev_etracs.landrysetting(objid)
;

ALTER TABLE dev_etracs.lcuvspecificclass  
ADD CONSTRAINT FK_lcuvspecificclass_lcuv FOREIGN KEY(lcuvid) 
REFERENCES dev_etracs.lcuv(objid)
;

ALTER TABLE dev_etracs.lcuvspecificclass  
ADD CONSTRAINT FK_lcuvspecificclass_landrysetting FOREIGN KEY(landrysettingid) 
REFERENCES dev_etracs.landrysetting(objid)
;

ALTER TABLE dev_etracs.landassesslevel  
ADD CONSTRAINT FK_landassesslevel_landrysetting FOREIGN KEY(landrysettingid) 
REFERENCES dev_etracs.landrysetting(objid)
;

ALTER TABLE dev_etracs.landassesslevel  
ADD CONSTRAINT FK_landassesslevel_propertyclassification FOREIGN KEY(parentid) 
REFERENCES dev_etracs.propertyclassification(objid)
;


/*==================================================================
** FAAS 
==================================================================*/
ALTER TABLE dev_etracs.faaslist  
ADD CONSTRAINT FK_faaslist_faas FOREIGN KEY(objid) REFERENCES dev_etracs.faas(objid)
;

ALTER TABLE dev_etracs.faaslist  
ADD CONSTRAINT FK_faaslist_entity FOREIGN KEY(taxpayerid) REFERENCES dev_etracs.entity(objid)
;


SET FOREIGN_KEY_CHECKS=1;