delete from lguname_system..rule_package where packagename = 'bp.billing.facts'
go



INSERT INTO lguname_system..rule_package( ruleset, rulegroup, packagename, TYPE, content )
SELECT 'bpbilling', '', 'bp.billing.facts', 'facts', N'package bp.billing.facts

declare CurrentYearFact
	year  : Integer
	qtr   : Integer
	month : Integer
	day   : Integer
end

declare BPLedgerFact
	ledgerid      : String
	yearstarted   : Integer
	lastyearpaid  : Integer
	lastqtrpaid   : Integer
end

declare TaxFeeFact
	ledgerid  : String
	appid     : String 
	assessmenttype : String
	taxfeeid  : String 
	lobid     : String
	lobname   : String
	rulename  : String
	year      : Integer
	qtr       : Integer
	monthsfromjan : Integer
	monthsfromqtr : Integer
	daysfromjan : Integer
	daysfromqtr : Integer
	acctid    : String
	accttitle : String
	amount    : Double
	surchargeacctid : String 
	surchargeaccttitle : String 
	surcharge   : Double 
	interestacctid : String	
	interestaccttitle : String 
	interest  : Double
	discount  : Double
	expr      : String 
	varlist   : java.util.Map
	applysurcharge	: Boolean
	applydiscount	: Boolean
end
   
'
go

update lguname_system..sys_module set
	permissions = '[ [ action:''changedepreciation.create''   ,title:''Change Depreciation Transaction'' ], [ action:''changetaxability.create''   ,title:''Change Taxability Transaction'' ], [ action:''rpttransaction.open''   ,title:''OPEN RPT Transaction'' ], [ action:''consolidation.view''    ,title:''View Consolidation'' ], [ action:''consolidation.update''   ,title:''Update Consolidation'' ], [ action:''consolidation.edit''    ,title:''Edit Consolidation'' ], [ action:''consolidation.submit''   ,title:''Submit Consolidation'' ], [ action:''consolidation.remove''   ,title:''Remove Consolidation'' ], [ action:''consolidation.updateland''    ,title:''Update Land Consolidation'' ], [ action:''consolidation.disapprove''    ,title:''Disapprove Consolidation'' ], [ action:''consolidation.approve''     ,title:''Approve Consolidation'' ], [ action:''consolidation.disapproveByProvince''  ,title:''Disapprove by Province Consolidation'' ], [ action:''consolidation.approveByProvince'' ,title:''Approve By Province Consolidation'' ], [ action:''consolidation.submitToProvince''  ,title:''Disapprove by Province Consolidation'' ],   [ action:''consolidationmgt.view''   ,title:''View Consolidation Management'' ], [ action:''consolidationmgt.create''  ,title:''Create Consolidation Management'' ], [ action:''consolidationmgt.view''   ,title:''Approve Consolidation Management'' ],  [ action:''datacapture.create''   ,title:''Create FAAS Data Capture'' ], [ action:''transfer.create''   ,title:''Create Transfer of Ownership'' ], [ action:''reassessment.create''  ,title:''Create Reassessment'' ], [ action:''correction.create''   ,title:''Create Correction of Entry'' ], [ action:''newdiscovery.create''  ,title:''Create New Discovery'' ], [ action:''multipleclaim.create''  ,title:''Create Multiple Claim'' ],  [ action:''cancelfaasmgt.view''  ,title:''View Cancel FAAS Management'' ], [ action:''cancelfaasmgt.create'' ,title:''Create Cancel FAAS Management'' ],  [ action:''cancelfaasmgt.open''  ,title:''Open Cancel FAAS Management'' ], [ action:''cancelfaas.create''  ,title:''Create Cancel FAAS'' ], [ action:''cancelfaas.edit''  ,title:''Edit Cancel FAAS'' ], [ action:''cancelfaas.open''  ,title:''Open Cancel FAAS'' ], [ action:''cancelfaas.submit''  ,title:''Submit Cancel FAAS for approval'' ], [ action:''cancelfaas.delete''  ,title:''Delete Cancel FAAS'' ], [ action:''cancelfaas.approve''  ,title:''Approve Cancel FAAS'' ], [ action:''faasmgt.view''  ,title:''View FAAS Management'' ], [ action:''faasmgt.create''  ,title:''Create FAAS Management'' ], [ action:''faas.create''   ,title:''Create FAAS'' ], [ action:''faas.open''   ,title:''Open FAAS'' ], [ action:''faas.submit''   ,title:''Submit FAAS for approval'' ], [ action:''faas.delete''   ,title:''Delete FAAS'' ], [ action:''faas.disapprove''  ,title:''Dispprove FAAS'' ], [ action:''faas.approve''  ,title:''Approve FAAS'' ], [ action:''faas.submittoprovince'' ,title:''Submit to Province FAAS'' ], [ action:''faas.disapprove''  ,title:''Disapprove FAAS'' ], [ action:''faas.approvebyprovince'' ,title:''Approve By Province FAAS'' ], [ action:''faasreport.view''  ,title:''View FAAS Report'' ],  [ action:''subdivisionmgt.view''  ,title:''View Subdivision Management'' ], [ action:''subdivisionmgt.open''  ,title:''Open Subdivision Management'' ], [ action:''subdivisionmgt.create'' ,title:''Create Subdivision Management'' ],  [ action:''subdivision.view''   ,title:''View Subdivision'' ], [ action:''subdivision.open''   ,title:''View Subdivision'' ], [ action:''subdivision.create''  ,title:''Create Subdivision'' ], [ action:''subdivision.update''    ,title:''Update Subdivision'' ], [ action:''subdivision.submit''    ,title:''Submit Subdivision'' ], [ action:''subdivision.remove''    ,title:''Remove Subdivision'' ], [ action:''subdivision.disapprove''     ,title:''Disapprove Subdivision'' ], [ action:''subdivision.approve''     ,title:''Approve Subdivision'' ], [ action:''subdivision.submitToProvince''   ,title:''Submit to Province Subdivision'' ], [ action:''subdivision.disapproveByProvince''  ,title:''Disapprove By Province Subdivision'' ], [ action:''subdivision.approveByProvince''   ,title:''Appry By Province Subdivision'' ],  [ action:''truecopy.view''   ,title:''View Certified True Copy'' ], [ action:''truecopy.create''   ,title:''Create Certified True Copy'' ], [ action:''truecopy.viewReport''  ,title:''View Report Certified True Copy'' ], [ action:''rpttransaction.view''  ,title:''View Real Property Transactions''],  [ action: ''rptcertification_list.view'', title: ''RPT Certifications List View'' ],  [ action: ''rptcertifications.open'', title: ''RPT Certifications Open'' ],  [ action: ''noproperty.open'',  title: ''RPT Certifications No Property Open'' ], [ action: ''noproperty.view'',  title: ''RPT Certifications No Property View'' ], [ action: ''noproperty.create'',  title: ''RPT Certifications No Property Create'' ],  [ action: ''landholding.open'',   title: ''RPT Certifications Land Holding Open'' ], [ action: ''landholding.view'',   title: ''RPT Certifications Land Holding View'' ], [ action: ''landholding.create'',  title: ''RPT Certifications Land Holding Create'' ],  [ action: ''multipleproperty.open'',   title: ''RPT Certifications Multiple Property Open'' ], [ action: ''multipleproperty.view'',   title: ''RPT Certifications Multiple Property View'' ], [ action: ''multipleproperty.create'',  title: ''RPT Certifications Multiple Property Create'' ],  [ action: ''noimprovement.open'',  title: ''RPT Certifications No Improvement Open'' ], [ action: ''noimprovement.view'',  title: ''RPT Certifications No Improvement View'' ], [ action: ''noimprovement.create'',  title: ''RPT Certifications No Improvement Create'' ],  [ action: ''noimprovementbytdno.open'',   title: ''RPT Certifications No Improvement By TD No Open'' ], [ action: ''noimprovementbytdno.view'',   title: ''RPT Certifications No Improvement By TD No View'' ], [ action: ''noimprovementbytdno.create'',  title: ''RPT Certifications No Improvement By TD No Create'' ],  [ action: ''latestexistproperty.open'',   title: ''RPT Certifications Latest Exist Property Open'' ], [ action: ''latestexistproperty.view'',   title: ''RPT Certifications Latest Exist Property View'' ], [ action: ''latestexistproperty.create'',  title: ''RPT Certifications Latest Exist Property Create'' ],  [ action: ''wimprovebytdno.open'',  title: ''RPT Certifications With Improvement By TD No Open'' ], [ action: ''wimprovebytdno.view'',  title: ''RPT Certifications With Improvement By TD No View'' ], [ action: ''wimprovebytdno.create'',  title: ''RPT Certifications With Improvement By TD No Create'' ],    [ action: ''noencumbrance.open'',  title: ''Open No Encumbrance Certification'' ], [ action: ''noencumbrance.view'',  title: ''View No Encumbrance Certification'' ], [ action: ''noencumbrance.create'',  title: ''Create No Encumbrance Certification'' ],    [ action: ''ownership.open'',  title: ''Open Ownership Certification'' ], [ action: ''ownership.view'',  title: ''View Ownership Certification'' ], [ action: ''ownership.create'',  title: ''Create Ownership Certification'' ], [ action:''rptreport.notice''  ,title:''Generate Notice of Assessment'' ], [ action:''rptreport.assessmentroll''    ,title:''Generate Assessment Roll'' ], [ action:''rptreportmgmt.open''  ,title:''Open Report Management'' ], [ action:''rptreport.tmcr''  ,title:''Generate TMCR Report'' ], [ action:''rptreport.orf''    ,title:''Generate Ownership Record Form'' ],  [ action:''rptreport.jat''   ,title:''Generate Journal of Assessment Transaction'' ], [ action:''rptreport.accomplishmentrpa'' ,title:''Generate Accomplishment Report on Real Property Assessment''], [ action:''rptreport.comparativeav'' ,title:''Generate Comparative Data On Assessed Value'' ], [ action:''rptreport.comparativerpucount'',title:''Generate Comparative Data on RPU Count'' ], [ action:''rptreport.comparativemv'' ,title:''Generate Comparative Data on Market Value'' ], [ action:''rptreport.annotationlisting'' ,title:''Generate Annotation Listing'' ], [action:''rptreport.masterlist''  ,title:''Generate Master List of Real Property''], [ action:''rptreport.reportonrpa'' ,title:''Report on Real Property Assessment'' ], [ action:''rptbilling.generate''  ,title:''Generate Real Property Billing'' ], [ action:''rptbilling.printbill'' ,title:''Print Real Property Billing'' ], [ action:''rptbilling.previewbill'' ,title:''Preview Real Property Billing'' ], [ action:''rptledger.view''  ,title:''View RPT Ledger'' ],  [ action:''rptledger.open''  ,title:''Open RPT Ledger'' ],  [ action:''rptledger.approve''  ,title:''Approve RPT Ledger'' ], [ action:''rptledger.capturepayment''    ,title:''Capture RPT Ledger Payment'' ], [ action:''rptledger.printbill''  ,title:''Print RPT Bill'' ], [ action:''rptledger.previewbill'' ,title:''Preview RPT Bill'' ], [ action:''rptledger.noticeofdelinquency''  ,title:''Generate Realty Tax Notice of Delinquency'' ], [ action:''propertypayer.view''  ,title:''View Property Payers'' ], [ action:''propertypayer.create'' ,title:''Create Property Payer'' ], [ action:''propertypayer.delete'' ,title:''Delete Property Payer'' ], [ action:''rptbillingrule.view''  ,title:''View RPT Billing Rules'' ], [ action:''rptbillingrule.create'' ,title:''Create RPT Billing Rule'' ], [ action:''rptbillingrule.delete'' ,title:''Delete RPT Billing Rule'' ], [action:''landtax.abstractrptcollection'' ,title:''Generate Abstract of Realty Tax Collection'' ], [action:''landtax.brgyshare''   ,title:''Generate Barangay Share'' ], [ action:''landtax.rptdelinquency'' ,title:''Generate Realty Tax Delinquency Listing'' ], [ action:''landtax.rptc''  ,title:''Real Property Tax Collection'' ], [action:''rptmanagement.open''   ,title:''Open RPT Master Management''], [action:''rysetting.view'',   ,title:''View General Revision Year Setting''],  [action:''propertyclassification.view''  ,title:''View Property Classifications'' ], [action:''propertyclassification.create'' ,title:''Create Property Classification'' ] , [action:''propertyclassification.edit''  ,title:''Edit Property Classification'' ] , [action:''propertyclassification.delete'' ,title:''Delete Property Classification'' ] , [action:''exemptiontypes.view''   ,title:''View Exemption Types'' ] , [action:''exemptiontypes.create''  ,title:''Create Exemption Types'' ] , [action:''exemptiontypes.edit''   ,title:''Edit Exemption Types'' ] , [action:''exemptiontypes.delete''  ,title:''Delete Exemption Types'' ] ,  [action:''kindofbldg.view''   ,title:''View Kind of Building'' ] , [action:''kindofbldg.create''   ,title:''Create Kind of Building'' ] , [action:''kindofbldg.edit''   ,title:''Edit Kind of Building'' ] , [action:''kindofbldg.delete''   ,title:''Delete Kind of Building'' ] , [action:''materials.view''   ,title:''View Materials'' ] , [action:''materials.create''   ,title:''Create Materials'' ] , [action:''materials.edit''   ,title:''Edit Materials'' ] , [action:''materials.delete''   ,title:''Delete Materials'' ] , [action:''structures.view''   ,title:''View Structures'' ] , [action:''structures.create''   ,title:''Create Structures'' ] , [action:''structures.edit''   ,title:''Edit Structures'' ] , [action:''structures.delete''   ,title:''Delete Structures'' ] , [action:''structuretemplates.view''  ,title:''View Structure Templates'' ] , [action:''structuretemplates.edit''  ,title:''Edit Structure Templates'' ] , [action:''machines.view''   ,title:''View Machines'' ] , [action:''machines.create''   ,title:''Create Machines'' ] , [action:''machines.edit''   ,title:''Edit Machines'' ] , [action:''machines.delete''   ,title:''Delete Machines'' ] ,  [action:''plantstrees.view''   ,title:''View Plants and Trees'' ] , [action:''plantstrees.create''   ,title:''Create Plants and Trees'' ] , [action:''plantstrees.edit''   ,title:''Edit Plants and Trees'' ] , [action:''plantstrees.delete''   ,title:''Delete Plants and Trees'' ] ,  [action:''miscitems.view''   ,title:''View Miscellaneous Items'' ] , [action:''miscitems.create''   ,title:''Create Miscellaneous Items'' ] , [action:''miscitems.edit''   ,title:''Edit Miscellaneous Items'' ] , [action:''miscitems.delete''   ,title:''Delete Miscellaneous Items'' ] , [action:''rptofficers.view''   ,title:''View RPT OFFICERS'' ] , [action:''rptofficers.create''   ,title:''Create RPT OFFICERS'' ] , [action:''rptofficers.edit''   ,title:''Edit RPT OFFICERS'' ] , [action:''rptofficers.delete''   ,title:''Delete RPT OFFICERS'' ] , [action:''canceltdreasons.view''   ,title:''View Cancel TD Reasons'' ] , [action:''canceltdreasons.create''  ,title:''Create Cancel TD Reasons'' ] , [action:''canceltdreasons.edit''   ,title:''Edit Cancel TD Reasons'' ] , [action:''canceltdreasons.delete''  ,title:''Delete Cancel TD Reasons'' ] , [action:''txnrequirements.view''   ,title:''View Transaction Requirements'' ] , [action:''txnrequirements.create''  ,title:''Create Transaction Requirements'' ] , [action:''txnrequirements.edit''   ,title:''Edit Transaction Requirements'' ] , [action:''txnrequirements.delete''  ,title:''Delete Transaction Requirements'' ] , [action:''rptparameters.view''   ,title:''View RPT Parameters'' ] , [action:''rptparameters.create''   ,title:''Create RPT Parameters'' ] , [action:''rptparameters.edit''   ,title:''Edit RPT Parameters'' ] , [action:''rptparameters.delete''   ,title:''Delete RPT Parameters'' ] , [action:''rptsetting.view''   ,title:''View RPT Settings'' ] , [action:''rptsetting.save''   ,title:''Save RPT Settings'' ] ,  [action:''annotationmgmt.view''  ,title:''Manage Annotations'' ], [action:''annotation.view''  ,title:''View Annotation'' ], [action:''annotation.delete''  ,title:''Delete Annotation'' ], [action:''annotation.submit''  ,title:''Submit Annotation for Approval'' ], [action:''annotation.approve''  ,title:''Approve Annotation'' ], [action:''cancelannotationmgmt.view'' ,title:''Manage Cancelled Annotations'' ], [action:''cancelannotation.open'' ,title:''Open Cancel Annotation'' ], [action:''cancelannotation.create'' ,title:''Create Cancel Annotation'' ], [action:''cancelannotation.view'' ,title:''View Cancel Annotation'' ], [action:''cancelannotation.delete'' ,title:''Delete Cancel Annotation'' ], [action:''cancelannotation.submit'' ,title:''Submit Cancel Annotation for Approval'' ], [action:''cancelannotation.approve'' ,title:''Approve Cancel Annotation'' ], [action:''mortgage.create''  ,title:''Create Mortgage Annotation'' ], [action:''bailbond.create''  ,title:''Create BailBond Annotation'' ], [action:''other.create''   ,title:''Create Other Annotation'' ], [action:''landtax.rptclearance''  ,title:''Realty Tax Clearance''],  [action:''rptreceipt.batch'', title:''Batch Realty Tax Collection''], [action:''titleupdate.create''  ,title:''Update Title Information''], [action:''titleupdate.open''  ,title:''Open Title Information''], [action:''titleupdate.edit''  ,title:''Edit Title Information''], [action:''titleupdate.approve''  ,title:''Approve Title Information''], [action:''titleupdate.view''  ,title:''View Title Update Listing''],  [action:''realpropertyupdate.create'' ,title:''Create Real Property Update Information'' ], [action:''realpropertyupdate.open'' ,title:''Open Real Property Update Information'' ], [action:''realpropertyupdate.edit'' ,title:''Edit Real Property Update Information'' ], [action:''realpropertyupdate.approve'' ,title:''Approve Real Property Update Information'' ], [action:''realpropertyupdate.view'' ,title:''View Real Property Update Listing'' ],  [action:''fortransmittalmgmt.view'' ,title:''For Transmittal Management'' ], [action:''rpt_transmittal_mgmt.view'' ,title:''Manage FAAS Transmittals''] , [action:''rpt_transmittal.create'' ,title:''Create FAAS Transmittal''] , [action:''rpt_transmittal.open''  ,title:''Open FAAS Transmittal''] , [action:''rpt_transmittal.print'' ,title:''Print FAAS Transmittal''], [action:''rpt_transmittal.export'' ,title:''Export FAAS Transmittal''], [action:''rpt_transmittal_import_mgmt.view''  ,title:''Manage Import FAAS Transmittals'' ], [action:''rpt_transmittal_import.create''  ,title:''Import FAAS Transmittal''], [action:''rpt_transmittal_import.open''  ,title:''View Imported FAAS Transmittal''], [action:''rptcompromise.view''  ,title:''Manage Compromise Agreemtns''], [action:''rptcompromise.create''  ,title:''Create Compromise Agreement'' ], [action:''rptcompromise.edit''  ,title:''Edit Compromise Agreement'' ], [action:''rptcompromise.open''  ,title:''Open Compromise Agreement''], [action:''rptcompromise.submit''  ,title:''Submit Compromise Agreement''], [action:''rptcompromise.submitforapproval'' ,title:''Submit For Approval Compromise Agreement''], [action:''rptcompromise.approve'' ,title:''Approve Compromise Agreement''], [action:''rptcompromise.delete''  ,title:''Delete Compromise Agreement''], [action:''rptcompromise.print''  ,title:''Print Compromise Agreement''], [action:''rptcompromise.preview'' ,title:''Preview Compromise Agreement''], [action:''rptutil.modifypin'', title:''Access Modify PIN Utility''],]'
where name = 'rpt2'
go	


ALTER TABLE lguname_etracs..rptsetting add allowreassessmentwithbalance int null
go

update lguname_etracs..rptsetting set allowreassessmentwithbalance = 0 where allowreassessmentwithbalance is null
go

ALTER TABLE lguname_etracs..rptsetting add allowchangedepreciationwithbalance int null
go

update lguname_etracs..rptsetting set allowchangedepreciationwithbalance = 0
go


update lguname_system..sys_module set permissions = '[   [ action:''account.view'',           title:''View Chart of Account'' ],   [ action:''account.addcategory'',    title:''Add Account Category'' ],   [ action:''account.addglacct'',      title:''Add GL Account'' ],   [ action:''account.addsubacct'',     title:''Add Sub-Account'' ],   [ action:''account.edit'',     title:''Edit Account Information'' ],   [ action:''account.delete'',   title:''Delete Account Information'' ],     [ action:''bank.view'',     title:''View Bank Information'' ],   [ action:''bank.create'',   title:''Create Bank'' ],   [ action:''bank.edit'',     title:''Edit Bank'' ],   [ action:''bank.delete'',   title:''Delete Bank'' ],     [ action:''bankacct.view'',     title:''View Bank Account Information'' ],   [ action:''bankacct.create'',   title:''Create Bank Account'' ],   [ action:''bankacct.edit'',     title:''Edit Bank Account'' ],   [ action:''bankacct.delete'',   title:''Delete Bank Account'' ],   [ action:''bankacct.approve'',  title:''Approve Bank Account'' ],     [ action:''collectionsetting.manage'', title:''Manage Collection Setting'' ],   [ action:''collectiontype.viewlist'',  title:''View Collection Type Listing'' ],   [ action:''collectiontype.create'',    title:''Create Collection Type'' ],   [ action:''collectiontype.edit'',      title:''Edit Collection Type'' ],   [ action:''collectiontype.delete'',    title:''Delete Collection Type'' ],     [ action:''fund.viewlist'',  title:''View Fund Listing'' ],   [ action:''fund.create'',    title:''Create Fund'' ],   [ action:''fund.edit'',      title:''Edit Fund'' ],   [ action:''fund.delete'',    title:''Delete Fund'' ],   [ action:''fund.approve'',   title:''Approve Fund'' ],     [ action:''incomeacct.viewlist'',  title:''View Income Account Listing'' ],   [ action:''incomeacct.create'',    title:''Create Income Account'' ],   [ action:''incomeacct.edit'',      title:''Edit Income Account'' ],   [ action:''incomeacct.delete'',    title:''Delete Income Account'' ],   [ action:''incomeacct.approve'',   title:''Approve Income Account'' ],     [ action:''incomeacctgroup.viewlist'',  title:''View Income Account Group Listing'' ],   [ action:''incomeacctgroup.create'',    title:''Create Income Account Group'' ],   [ action:''incomeacctgroup.delete'',    title:''Delete Income Account Group'' ],      [ action:''tcmanagement.open'' ,title:''Manage TC Master Files'' ],        [ action:''af.viewlist'',  title:''View Accountable Form Listing'' ],   [ action:''af.create'',    title:''Create Accountable Form'' ],   [ action:''af.edit'',      title:''Edit Accountable Form'' ],   [ action:''af.delete'',    title:''Delete Accountable Form'' ],   [ action:''af.approve'',   title:''Approve Accountable Form'' ],     [ action:''afcontrol.changemode'',  title:''AF Control Change Mode'' ],   [ action:''afcontrol.activate'',    title:''Activate AF Control'' ],   [ action:''afcontrol.transfer'' ,title:''Transfer AF Control'' ],   [ action:''afcontrol.adjustqty'' ,title:''Adjust AF Control Quantity (NonSerial)'' ],       [ action:''riv_lgu.create'', title:''Create LGU RIV'' ],   [ action:''riv.create'',    title:''Create RIV'' ],   [ action:''riv.salecreate'',title:''Create RIV (SALE)'' ],   [action:''riv.collector'', title:''Create RIV (Collector)''],   [ action:''riv.edit'',      title:''Edit RIV'' ],   [ action:''riv.delete'',    title:''Delete RIV'' ],   [ action:''riv.approve'',   title:''Approve RIV'' ],   [ action:''riv.preview'',   title:''Preview RIV'' ],      [ action:''iraf.viewlist'',  title:''View IRAF Listing'' ],   [ action:''iraf.create'',    title:''Create IRAF'' ],   [ action:''iraf.edit'',      title:''Edit IRAF'' ],   [ action:''iraf.delete'',    title:''Delete IRAF'' ],   [ action:''iraf.approve'',   title:''Approve IRAF'' ],     [ action:''afinventory.view'', title:''View AF Inventory Information'' ],       [ action:''deposit.viewlist'',   title:''View Deposit Listing'' ],   [ action:''deposit.view'',       title:''View Deposit Information'' ],   [ action:''deposit.create'',     title:''Create Deposit Information'' ],   [ action:''deposit.close'',      title:''Close Deposit Information'' ],   [ action:''deposit.addnoncash'', title:''Add Non-Cash Payments for Deposit'' ],   [ action:''deposit.addexternalnoncash'',     title:''Add External Non-Cash for Deposit'' ],     [ action:''collection.create_online'',   title:''Create Online Collection''],   [ action:''collection.create_offline'',  title:''Create Offline Collection''],      [ action:''remittance.create'',          title:''Create Remittance'' ],   [ action:''remittance.submit'',          title:''Submit Remittance'' ],   [ action:''remittance.viewlist'',        title:''View Remittance Listing'' ],   [action:''remittance.import'',  title:''Import Remittance''],     [ action:''receipt.viewissued'',    title:''View Issued Receipt Listing'' ],   [ action:''receipt.inquire'',       title:''Inquire Receipt Information'' ],     [ action:''afcontrol.activate'',  title:''Activate AF Control'' ],   [ action:''afcontrol.assignto'',  title:''Assign AF Control'' ],       [action:''batchcapturemgmt.view'' ,title:''View Batch Capture Management''],    [action:''batchcapture.create''  ,title:''Create Batch Capture'' ],   [action:''batchcapture.open''  ,title:''Open Batch Capture'' ],    [action:''batchcapture.view''  ,title:''View Batch Capture'' ],   [action:''batchcapture.delete''  ,title:''Delete Batch Capture'' ],   [action:''batchcapture.post''  ,title:''Post Batch Capture'' ],     [ action:''collection_burial.create'',  title:''Create Burial Permit Fee Collection'' ],   [ action:''collection_burial.edit'',    title:''Edit Burial Permit Fee Collection'' ],   [ action:''collection_burial.print'',   title:''Print Burial Permit Fee Collection'' ],   [ action:''collection_burial.void'',    title:''Void Burial Permit Fee Collection'' ],   [ action:''collection_burial.inquire'', title:''Inquire Burial Permit Fee Collection'' ],     [ action:''collection_cashticket.create'',  title:''Create Cash Ticket Collection'' ],   [ action:''collection_cashticket.delete'',  title:''Delete Cash Ticket Collection'' ],   [ action:''collection_cashticket.inquire'', title:''Inquire Cash Ticket  Collection'' ],     [ action:''collection_cattleownership.create'',  title:''Create Large Cattle Ownership Collection'' ],   [ action:''collection_cattleownership.edit'',    title:''Edit Large Cattle Ownership Collection'' ],   [ action:''collection_cattleownership.print'',   title:''Print Large Cattle Ownership Collection'' ],   [ action:''collection_cattleownership.void'',    title:''Void Large Cattle Ownership Collection'' ],   [ action:''collection_cattleownership.inquiry'', title:''Inquire Large Cattle Ownership  Collection'' ],     [ action:''collection_cattletransfer.create'',  title:''Create Large Cattle Transfer Collection'' ],   [ action:''collection_cattletransfer.edit'',    title:''Edit Large Cattle Transfer Collection'' ],   [ action:''collection_cattletransfer.print'',   title:''Print Large Cattle Transfer Collection'' ],   [ action:''collection_cattletransfer.void'',    title:''Void Large Cattle Transfer Collection'' ],   [ action:''collection_cattletransfer.inquiry'', title:''Inquire Large Cattle Transfer  Collection'' ],     [ action:''collection_general.create'',  title:''Create General Collection'' ],   [ action:''collection_general.edit'',    title:''Edit General Collection'' ],   [ action:''collection_general.print'',   title:''Print General Collection'' ],   [ action:''collection_general.void'',    title:''Void General Collection'' ],   [ action:''collection_general.inquire'', title:''Inquire General Collection'' ],     [ action:''collection_marriage.create'',  title:''Create Marriage License Fee Collection'' ],   [ action:''collection_marriage.edit'',    title:''Edit Marriage License Fee Collection'' ],   [ action:''collection_marriage.print'',   title:''Print Marriage License Fee Collection'' ],   [ action:''collection_marriage.void'',    title:''Void Marriage License Fee Collection'' ],   [ action:''collection_marriage.inquiry'', title:''Inquire Marriage License Fee  Collection'' ],     [action:''postcapturereceipt.create'',   title:''Create Post Capture Receipt''],   [action:''postcapturereceipt.post'',     title:''Submit Post Capture Receipt''],       [action:''tcreport.abstractofcollection'' ,title:''Generate Abstract of Collection Report''],   [action:''tcreport.abstractofcollectionbychart'' ,title:''Generate Abstract of Colleciton By Chart of Account'' ],   [action:''tcreport.incomeaccount''   ,title:''Income Account Report''],   [action:''tcreport.craaf''    ,title:''CRAAF Report''],   [action:''tcreport.statementofrevenue''  ,title:''Generate Statement of Revenue''],    [action:''tcreport.reportofcollection''  ,title:''Report of Collection'' ],   [action:''tcreport.reportofcollection2''  ,title:''Report of Collection 2'' ],     [action:''collection_slaughterpermit.inquiry''  ,title:''Inquire Slaughter Permit'' ],   [action:''collection_slaughterpermit.create''  ,title:''Create Slaughter Permit''],   [action:''collection_slaughterpermit.print''  ,title:''Print Slaughter Permit'' ],   [action:''collection_slaughterpermit.void''  ,title:''Void Slaughter Permit'' ],   [action:''collection_slaughterpermit.edit''  ,title:''Edit Slaughter Permit'' ],       [ action:''liquidation.create'', title:''Create Liquidation'' ],   [ action:''liquidationmulti.create'', title:''Create Multi-Cashier Liquidation''],   [ action:''liquidation.submit'', title:''Submit Liquidation'' ],   [ action:''liquidation.viewlist'', title:''View Liquidation Listing'' ]     [ action:''collection.create_capture'' ,title:''Create Capture Collection''],   [ action:''receipt.viewissued''  ,title:''View Issued Receipt Listing'' ],   [ action:''afcontrol.activate''  ,title:''Activate AF Control'' ],   [ action:''postcapturereceipt.create'' ,title:''Create Post Capture Receipt''],   [ action:''postcapturereceipt.post'' ,title:''Submit Post Capture Receipt''],   [ action:''postcapturereceipt.viewlist'' ,title:''View Post Capture Listing'' ],     [ action:''bpadmin.setting''  ,title:''Manage BP Setting'' ],     [action:''treasurymgmt.view'',                title:''View Treasury Management''],   [action:''treasurymgmt_abstract.view'',       title:''View Treasury Management (Abstract of Collection)''],   [action:''treasurymgmt_afmonitoring.view'',   title:''View Treasury Management (AF Monitoring)''],   [action:''treasurymgmt_collection.view'',     title:''View Treasury Management (Collection Summary)''],   [action:''treasurymgmt_fund.view'',           title:''View Treasury Management (Fund Summary)''],   [action:''treasurymgmt_liquidation.view'',    title:''View Treasury Management (Liquidation Detail)''],   [action:''treasurymgmt_remittance.view'',     title:''View Treasury Management (Remittance Monitoring)''],   [action:''treasurymgmt_liquidation.view'',    title:''View Undeposited Liquidation Summary'' ],      [action:''form60.setup''  ,title:''Setup Form 60 Report''],      [action:''collectiongroup.view''  ,title:''View Collection Groups'' ],   [action:''collectiongroup.create'' ,title:''Create Collection Group'' ],   [action:''collectiongroup.edit''  ,title:''Edit Collection Group'' ],   [action:''collectiongroup.delete'' ,title:''Delete Collection Group'' ],  [ action:''remittance_subcollector.create'',          title:''Create Subcollector Remittance'' ],   [ action:''remittance_subcollector.submit'',          title:''Submit Subcollector Remittance'' ],   [ action:''remittance_subcollector.viewlist'',        title:''View Subcollector Remittance Listing'' ],  ]' where name ='tc2' 

create table lguname_etracs..remittance_subcollector (
	objid varchar(50) NOT NULL,
	schemaname varchar(50) NOT NULL,
	schemaversion varchar(5) NOT NULL,
	docstate varchar(20) NOT NULL,
	txnno varchar(20) NOT NULL,
	txndate date NOT NULL,
	collectorname varchar(50) NOT NULL,
	amount decimal(10, 2) NULL,
	collectorid varchar(50) NOT NULL,
	collectortitle varchar(50) NULL,
	totalcash decimal(10, 2) NULL,
	totalotherpayment decimal(10, 2) NULL,
	remittanceid varchar(50) NULL,
	remittanceno varchar(15) NULL,
	remittancedate date NULL,
	remittanceofficerid varchar(50) NULL,
	remittanceofficername varchar(50) NULL,
	remittanceofficertitle varchar(50) NULL,
	info text NULL,
	PRIMARY KEY  (objid)
);

alter table lguname_etracs..receiptlist add sc_remittanceid varchar(50) null;


/* FAAS Attachment */
ALTER TABLE lguname_etracs..faasattachment ADD absolutefilename varchar(300) NULL
go



/* SubFund with Required Bank Account fund support */
ALTER TABLE lguname_etracs..fund ADD bankacctrequired INT NULL
go

UPDATE lguname_etracs..fund SET bankacctrequired = 1 
go 


ALTER TABLE lguname_etracs..receiptlist ADD totalpayment DECIMAL(16,2)
go
ALTER TABLE lguname_etracs..receiptlist ADD remarks VARCHAR(200)
go
ALTER TABLE lguname_etracs..receiptlist ADD series INT
go
ALTER TABLE lguname_etracs..receiptlist ADD extended TEXT
go
	
UPDATE rl SET
		rl.extended = r.extended,
		rl.totalpayment = rl.amount 
FROM lguname_etracs..receiptlist rl, lguname_etracs..receipt r
WHERE rl.objid = r.objid
go
		
ALTER TABLE lguname_etracs..paymentitem ADD extended TEXT
go
	
	
ALTER TABLE lguname_etracs..receiptlist DROP FK_receiptlist_receipt
go

ALTER TABLE lguname_etracs..receiptitem DROP FK_receiptitem_receipt
go

ALTER TABLE lguname_etracs..receiptitem  
	ADD CONSTRAINT FK_receiptitem_receiptlist FOREIGN KEY (receiptid) REFERENCES lguname_etracs..receiptlist(objid)
go	

ALTER TABLE lguname_etracs..paymentitem DROP CONSTRAINT FK_paymentitem_receipt
go
ALTER TABLE lguname_etracs..paymentitem 
	ADD CONSTRAINT FK_paymentitem_receiptlist FOREIGN KEY(receiptid) REFERENCES lguname_etracs..receiptlist(objid)
go	


ALTER TABLE lguname_etracs..afcontrol ADD assignedtoid VARCHAR(50) NULL
go
ALTER TABLE lguname_etracs..afcontrol ADD assignedtoname VARCHAR(100) NULL
go
ALTER TABLE lguname_etracs..afcontrol ADD assignedtotitle VARCHAR(50) NULL
go
	
UPDATE lguname_etracs..afcontrol SET 
	assignedtoid = collectorid,
	assignedtoname = collectorname,
	assignedtotitle = collectortitle
go	
	
	
ALTER TABLE lguname_etracs..batchcapture ADD collectortitle VARCHAR(50)
go
ALTER TABLE lguname_etracs..batchcapture ADD encodedbytitle VARCHAR(50)
go

UPDATE b SET
	b.encodedbytitle = j.title 
FROM lguname_etracs..batchcapture b, lguname_etracs..jobposition j	
WHERE b.encodedbyid = j.assigneeid
go


UPDATE b SET
	b.collectortitle = j.title 
FROM lguname_etracs..batchcapture b, lguname_etracs..jobposition j 	
WHERE b.collectorid = j.assigneeid
GO

UPDATE lguname_etracs..receiptlist SET 
	capturedbyid = collectorid,
	capturedbyname = collectorname,
	capturedbytitle = collectorname
WHERE capturedbyid IS NULL or capturedbyname is null
go

UPDATE lguname_system..sys_roleclass SET 
	tags='[''AFO'', ''COLLECTOR'', ''SUBCOLLECTOR'', ''LIQUIDATING_OFFICER'', ''CASHIER'', ]'
WHERE name = 'TREASURY'
go 






/* =========================================================
** DENORMALIZE REMITTANCE SUPPORT 
============================================================ */

alter table lguname_etracs..remittancelist add dtposted date null
go

update lguname_etracs..remittancelist set dtposted = txndate
go

alter table lguname_etracs..remittancelist alter column dtposted date not null
go

alter table lguname_etracs..remittancelist add denominations varchar(600) null
go


ALTER TABLE lguname_etracs..remittancelist DROP FK_remittancelist_remittance
go 

ALTER TABLE lguname_etracs..receiptlist DROP FK_receiptlist_remittance
go 


ALTER TABLE lguname_etracs..remittedform DROP FK_remittedform_remittance
go 


/*-- rename remittance related tables --*/

use lguname_etracs
go

sp_rename remittance, xremittance
go

sp_rename remittancelist, remittance
go




ALTER TABLE lguname_etracs..receiptlist
	add constraint FK_receiptlist_remittance foreign key (remittanceid) references lguname_etracs..remittance(objid)
go 


ALTER TABLE lguname_etracs..remittedform
	add constraint FK_remittedform_remittance foreign key (remittanceid) references lguname_etracs..remittance(objid)
go 



/* =================================================================== 
** Normalize Liquidation  
=================================================================== */
alter table lguname_etracs..liquidationlist add dtposted date
go 

update lguname_etracs..liquidationlist set dtposted = txndate
go

alter table lguname_etracs..liquidationlist alter column dtposted date not null 
go 


alter table lguname_etracs..liquidationlist add denominations varchar(600)
go 

update lguname_etracs..liquidationlist set denominations = '[]' 
go 


alter table lguname_etracs..liquidationlist drop FK_liquidationlist_deposit
go
alter table lguname_etracs..liquidationlist drop FK_liquidationlist_liquidation
go
alter table lguname_etracs..liquidationlist drop FK_liquidationlist_personnel
go
alter table lguname_etracs..liquidationlist drop FK_liquidationlist_personnel_depositedbyid
go




-- Rename related tables 
use lguname_etracs
go

sp_rename liquidation, xliquidation
go

sp_rename liquidationlist, liquidation 
go



alter table lguname_etracs..liquidation
	add constraint FK_liquidation_deposit foreign key(depositid) references lguname_etracs..deposit(objid)
go

alter table lguname_etracs..liquidation
	add constraint FK_liquidation_personnel foreign key(liquidatingofficerid) references lguname_etracs..personnel(objid)
go

alter table lguname_etracs..liquidation 
	add constraint FK_liquidation_personnel_depositedbyid foreign key(depositedbyid) references lguname_etracs..personnel(objid)
go





alter table lguname_etracs..remittance drop FK_remittancelist_liquidation
go
alter table lguname_etracs..remittance drop FK_remittancelist_personnel
go
alter table lguname_etracs..remittance drop FK_remittancelist_personnel_lqid
go



alter table lguname_etracs..remittance 
	add constraint FK_remittance_liquidation foreign key(liquidationid) 
	references lguname_etracs.liquidation( objid )
go

alter table lguname_etracs..remittance 
	add constraint FK_remittance_personnel foreign key(collectorid) 
	references lguname_etracs..personnel( objid )

go

alter table lguname_etracs..remittance 
	add constraint FK_remittance_personnel_lqid foreign key(liquidatingofficerid) 
	references lguname_etracs..personnel( objid )
go



insert into lguname_system..sys_module(name, title, permissions)
values('rpt2-reports', 'RPT Reports', '[[action:"rptreport.pdaprpta100", title:"Generate PDAP-RPTA 100 Report",]]')
go

insert into lguname_system..sys_roleclass_module
values('RPT', 'rpt2-reports')
go





alter table lguname_etracs..rptpaymentmanual add basicadv decimal(16,2)
go

alter table lguname_etracs..rptpaymentmanual add basicadvdisc decimal(16,2)
go

alter table lguname_etracs..rptpaymentmanual add sefadv decimal(16,2)
go

alter table lguname_etracs..rptpaymentmanual add sefadvdisc decimal(16,2)
go

update lguname_etracs..rptpaymentmanual set 
	basicadv = 0.0, basicadvdisc = 0.0, 
	sefadv = 0.0, sefadvdisc = 0.0
go	


alter table lguname_etracs..rptledger add municityname varchar(50)
go



CREATE TABLE lguname_system..sys_role (
  name varchar(50) NOT NULL ,
  domain varchar(50) NOT NULL,
  PRIMARY KEY  (name,domain)
) 
GO


CREATE TABLE lguname_system..sys_role_permission (
  sysrole varchar(50) NOT NULL,
  domain varchar(50) NOT NULL,
  [key] varchar(50) NOT NULL,
  title varchar(50) default NULL,
  module varchar(50) default NULL,
  PRIMARY KEY  (sysrole,domain,[key])
) 
GO

ALTER TABLE lguname_system..sys_role_permission
	ADD CONSTRAINT FK_sys_role_permission_sys_role FOREIGN KEY (sysrole, domain) REFERENCES sys_role (name, domain)
go
