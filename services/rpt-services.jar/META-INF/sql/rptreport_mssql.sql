[getRPTSetting]  
SELECT * FROM rptsetting 

[getBarangayList]
SELECT objid, lguname AS barangay FROM lgu 
WHERE lgutype = 'BARANGAY'
ORDER BY lguname 

[getClassificationList] 
SELECT objid, objid AS classid, propertydesc AS classname, special   
FROM propertyclassification  ORDER BY orderno  

[getExemptionList]
SELECT objid, objid AS exemptid, exemptdesc AS classname, 0 AS special 
FROM exemptiontype ORDER BY orderno  
 
[getDelinquentLedger] 
SELECT  
	objid, tdno,  
	taxpayerid, taxpayername, taxpayeraddress   
FROM rptledger  
WHERE barangay = $P{barangay} 
  AND docstate = 'APPROVED' AND taxable = 1  
  AND ( lastyearpaid < $P{currentyr} OR (lastyearpaid = $P{currentyr} AND lastqtrpaid < 4 ) )  
  AND undercompromised = 0 
ORDER BY taxpayername, tdno     
 

[getNoticeItemsByTaxpayerId]
SELECT 
	objid, tdno, fullpin, barangay, classcode, 
	totalareasqm, totalareaha, totalmv, totalav, 
	cadastrallotno, txntype, rputype, effectivityyear
FROM faaslist 
WHERE taxpayerid = $P{taxpayerid}
  AND docstate = 'CURRENT' 
ORDER BY fullpin   
  
[getNoticeItemsByFaasid]
SELECT 
	objid, tdno, fullpin, barangay, classcode, 
	totalareasqm, totalareaha, totalmv, totalav, 
	cadastrallotno, txntype, rputype, effectivityyear  
FROM faaslist 
WHERE objid = $P{objid} 
  AND docstate = 'CURRENT'  
ORDER BY fullpin   
  
  
[getNoticeList]
SELECT 
	objid, docstate, docno, issuedate, 
	taxpayername, taxpayeraddress, 
	preparedby, approvedby, 
	receivedby, dtdelivered, remarks 
FROM noticeofassessment 
ORDER BY objid DESC 

[getAssessmentRollTaxable]
SELECT
	ry, section,  
	provcity AS parentlguname, provcityindex AS parentlguindex,   
	munidistrict AS lguname, munidistrictindex AS lguindex,  
	barangay, barangayindex, 
	ownername, owneraddress, tdno, effectivityyear, 
	cadastrallotno, classcode, rputype, totalav, 
	fullpin, 
	prevtdno, memoranda, barangayid 
FROM faaslist   
WHERE barangayid = $P{barangayid} 
  AND docstate = 'CURRENT'  
  AND section LIKE $P{section} 
  AND taxable = 1 
ORDER BY fullpin   
  
[getAssessmentRollExempt]
SELECT
	ry, section,  
	provcity AS parentlguname, provcityindex AS parentlguindex,   
	munidistrict AS lguname, munidistrictindex AS lguindex,  
	barangay, barangayindex, 
	ownername, owneraddress, tdno, effectivityyear, 
	cadastrallotno, classcode, rputype, totalav, 
	fullpin,  
	memoranda, barangayid, exemptcode AS legalbasis  
FROM faaslist   
WHERE barangayid = $P{barangayid} 
  AND docstate = 'CURRENT'   
  AND section LIKE $P{section}  
  AND taxable = 0  
ORDER BY fullpin     


[getTmcrList]
SELECT
	barangay, cadastrallotno, classcode, docstate,  
	fullpin, 
	memoranda, ownername, owneraddress, rputype, section, surveyno, 
	tdno, titleno, totalareasqm, totalareasqm, totalav, totalmv 
FROM faaslist   
WHERE barangayid = $P{barangayid} 
  AND docstate IN ('CURRENT', 'CANCELLED')
  AND section LIKE $P{section} 
ORDER BY fullpin   

  
[getORF]  
SELECT
	barangay, cadastrallotno, classcode, 
	fullpin, 
	prevtdno, taxpayeraddress, taxpayername, tdno, 
	totalareasqm, totalareaha, totalav, txntype 
FROM faaslist   
WHERE taxpayerid = $P{taxpayerid} 
  AND docstate = 'CURRENT'  
ORDER BY fullpin   


[getJAT]
SELECT 
	barangay, issuedate, tdno, fullpin, 
	txntype, ownername, rputype, classcode, 
	totalareaha, totalmv, totalav, docstate 
FROM faaslist  
WHERE barangayid = $P{barangayid} 
 AND docstate IN ( 'CURRENT', 'CANCELLED' ) 
ORDER BY issuedate, tdno

[getAnnotationListing]
SELECT  
	fl.tdno, fl.titleno, fl.titledate, fl.titletype, fl.ownername, fl.owneraddress, 
	fl.fullpin, fl.cadastrallotno, fl.rputype, fl.barangay, fl.classcode, fl.totalmv, fl.totalav, 
	fl.totalareaha,	fl.totalareasqm, UPPER(fa.doctype) as annotationtype, fa.memoranda 
FROM faaslist fl 
	INNER JOIN faasannotation fa ON fl.objid = fa.faasid  
WHERE fl.annotated = 1  
  AND fl.docstate = 'CURRENT'  
  AND fa.docstate = 'APPROVED'  
${orderby} 

#----------------------------------------------------------------------
#
# Report on Real Property Assessments  
#
#----------------------------------------------------------------------
[getReportOnRPATaxable]
SELECT 
	pc.objid AS classid,
	pc.orderno, 
	pc.propertydesc AS classname, 
	CONVERT(int, COUNT( 1) ) AS rpucount, 
	SUM( fl.totalareasqm ) AS areasqm, 
	SUM( fl.totalareaha) AS areaha,

	SUM( CASE WHEN rputype = 'land' THEN fl.totalmv ELSE 0.0 END ) AS landmv,
	SUM( CASE WHEN rputype = 'bldg' AND fl.totalmv <= 150000 THEN fl.totalmv ELSE 0.0 END ) AS bldgmv150less,
	SUM( CASE WHEN rputype = 'bldg' AND fl.totalmv > 150000 THEN fl.totalmv ELSE 0.0 END ) AS bldgmvover150,
	SUM( CASE WHEN rputype = 'mach' THEN fl.totalmv ELSE 0.0 END ) AS machmv,
	SUM( CASE WHEN rputype NOT IN( 'land', 'bldg', 'mach') THEN fl.totalmv ELSE 0.0 END ) AS othermv, 
	SUM( fl.totalmv ) AS totalmv,
	
	SUM( CASE WHEN rputype = 'land' THEN fl.totalav ELSE 0.0 END ) AS landav,
	SUM( CASE WHEN rputype = 'bldg' AND fl.totalav <= 150000 THEN fl.totalav ELSE 0.0 END ) AS bldgav150less,
	SUM( CASE WHEN rputype = 'bldg' AND fl.totalav > 150000 THEN fl.totalav ELSE 0.0 END ) AS bldgavover150,
	SUM( CASE WHEN rputype = 'mach' THEN fl.totalav ELSE 0.0 END ) AS machav,
	SUM( CASE WHEN rputype NOT IN( 'land', 'bldg', 'mach') THEN fl.totalav ELSE 0.0 END ) AS otherav, 
	SUM( fl.totalav ) AS totalav,
	
	SUM( CASE WHEN fl.restriction = 'CARP' THEN fl.totalav ELSE 0.0 END ) AS carpav,
	SUM( CASE WHEN fl.restriction = 'UNDER_LITIGATION' THEN fl.totalav ELSE 0.0 END ) AS litigationav,
	SUM( CASE WHEN fl.restriction = 'OTHER' THEN fl.totalav ELSE 0.0 END ) AS otherrestrictionav,
	SUM( CASE WHEN fl.restriction IS NOT NULL THEN fl.totalav ELSE 0.0 END ) AS totalrestriction 

FROM faaslist fl 
	INNER JOIN propertyclassification pc ON fl.classid = pc.objid 
WHERE fl.txntimestamp <= $P{txntimestamp} 
  AND fl.docstate = 'CURRENT' 
  AND fl.taxable = 1 
GROUP BY pc.objid, pc.orderno, pc.propertydesc  
ORDER BY pc.orderno  

[getReportOnRPAExempt]
SELECT 
	et.objid AS classid,
	et.orderno, 
	et.exemptdesc AS classname, 
	CONVERT(int, COUNT( 1 )) AS rpucount,
	SUM( fl.totalareasqm ) AS areasqm, 
	SUM( fl.totalareaha) AS areaha,

	SUM( CASE WHEN rputype = 'land' THEN fl.totalmv ELSE 0.0 END ) AS landmv,
	SUM( CASE WHEN rputype = 'bldg' AND fl.totalmv <= 150000 THEN fl.totalmv ELSE 0.0 END ) AS bldgmv150less,
	SUM( CASE WHEN rputype = 'bldg' AND fl.totalmv > 150000 THEN fl.totalmv ELSE 0.0 END ) AS bldgmvover150,
	SUM( CASE WHEN rputype = 'mach' THEN fl.totalmv ELSE 0.0 END ) AS machmv,
	SUM( CASE WHEN rputype NOT IN( 'land', 'bldg', 'mach') THEN fl.totalmv ELSE 0.0 END ) AS othermv, 
	SUM( fl.totalmv ) AS totalmv,
	
	SUM( CASE WHEN rputype = 'land' THEN fl.totalav ELSE 0.0 END ) AS landav,
	SUM( CASE WHEN rputype = 'bldg' AND fl.totalav <= 150000 THEN fl.totalav ELSE 0.0 END ) AS bldgav150less,
	SUM( CASE WHEN rputype = 'bldg' AND fl.totalav > 150000 THEN fl.totalav ELSE 0.0 END ) AS bldgavover150,
	SUM( CASE WHEN rputype = 'mach' THEN fl.totalav ELSE 0.0 END ) AS machav,
	SUM( CASE WHEN rputype NOT IN( 'land', 'bldg', 'mach') THEN fl.totalav ELSE 0.0 END ) AS otherav, 
	SUM( fl.totalav ) AS totalav,
	
	SUM( CASE WHEN fl.restriction = 'CARP' THEN fl.totalav ELSE 0.0 END ) AS carpav,
	SUM( CASE WHEN fl.restriction = 'UNDER_LITIGATION' THEN fl.totalav ELSE 0.0 END ) AS litigationav,
	SUM( CASE WHEN fl.restriction = 'OTHER' THEN fl.totalav ELSE 0.0 END ) AS otherrestrictionav,
	SUM( CASE WHEN fl.restriction IS NOT NULL THEN fl.totalav ELSE 0.0 END ) AS totalrestriction 

FROM faaslist fl 
	INNER JOIN exemptiontype et ON fl.exemptid = et.objid  
WHERE fl.txntimestamp <= $P{txntimestamp} 
  AND fl.docstate = 'CURRENT' 
  AND fl.taxable = 0 
GROUP BY et.objid, et.orderno,  et.exemptdesc  
ORDER BY et.orderno  




#----------------------------------------------------------------------
#
# Real Property Assessment Accomplishment Report 
#
#----------------------------------------------------------------------
[getPreceedingRPAAccomplishment]
SELECT  
	l.objid AS barangayid, 
	l.lguname AS barangay, 
	SUM( CASE WHEN f.taxable = 1 THEN 1 ELSE 0 END ) AS preceedingtaxablecount, 
	SUM( CASE WHEN f.taxable = 1 THEN f.totalav ELSE 0 END ) AS preceedingtaxableav, 
	SUM( CASE WHEN f.taxable = 0 THEN 1 ELSE 0 END ) AS preceedingexemptcount, 
	SUM( CASE WHEN f.taxable = 0 THEN f.totalav ELSE 0 END ) AS preceedingexemptav 
FROM faaslist f 
	LEFT JOIN lgu l ON l.objid = f.barangayid 
WHERE f.txntimestamp < $P{currenttimestamp} 
  AND f.docstate = 'CURRENT' 
  AND l.parentid LIKE $P{lguindex} 
GROUP BY l.objid, l.lguname  
ORDER BY MIN(l.indexno)

[getCurrentRPAAccomplishment]
SELECT  
	l.objid AS barangayid, 
	l.lguname AS barangay, 
	SUM( ISNULL(CASE WHEN f.taxable = 1 THEN 1 ELSE 0 END,0) ) AS currenttaxablecount, 
	SUM( CASE WHEN f.taxable = 1 THEN f.totalav ELSE 0 END ) AS currenttaxableav, 
	SUM( CASE WHEN f.taxable = 0 THEN 1 ELSE 0 END ) AS currentexemptcount, 
	SUM( CASE WHEN f.taxable = 0 THEN f.totalav ELSE 0 END ) AS currentexemptav 
FROM faaslist f 
	LEFT JOIN lgu l ON l.objid = f.barangayid 
WHERE f.txntimestamp LIKE $P{currenttimestamp} 
  AND f.docstate = 'CURRENT' 
  AND l.parentid LIKE $P{lguindex}  
GROUP BY l.objid, l.lguname  
ORDER BY MIN(l.indexno)

[getCancelledRPAAccomplishment]
SELECT  
	l.objid AS barangayid, 
	l.lguname AS barangay, 
	SUM( CASE WHEN f.taxable = 1 THEN 1 ELSE 0 END ) AS cancelledtaxablecount, 
	SUM( CASE WHEN f.taxable = 1 THEN f.totalav ELSE 0 END ) AS cancelledtaxableav, 
	SUM( CASE WHEN f.taxable = 0 THEN 1 ELSE 0 END ) AS cancelledexemptcount, 
	SUM( CASE WHEN f.taxable = 0 THEN f.totalav ELSE 0 END ) AS cancelledexemptav 
FROM faaslist f 
	LEFT JOIN lgu l ON l.objid = f.barangayid 
WHERE f.txntimestamp LIKE $P{currenttimestamp}  
  AND f.docstate = 'CANCELLED' 
  AND l.parentid LIKE $P{lguindex} 
GROUP BY l.objid, l.lguname  
ORDER BY MIN(l.indexno) 	 

[getEndingRPAAccomplishment]
SELECT  
	l.objid AS barangayid, 
	l.lguname AS barangay, 
	SUM( CASE WHEN f.taxable = 1 THEN 1 ELSE 0 END ) AS endingtaxablecount, 
	SUM( CASE WHEN f.taxable = 1 THEN f.totalav ELSE 0 END ) AS endingtaxableav, 
	SUM( CASE WHEN f.taxable = 0 THEN 1 ELSE 0 END ) AS endingexemptcount, 
	SUM( CASE WHEN f.taxable = 0 THEN f.totalav ELSE 0 END ) AS endingexemptav 
FROM faaslist f 
	LEFT JOIN lgu l ON l.objid = f.barangayid  
WHERE f.txntimestamp < $P{endingtimestamp} 
  AND f.docstate = 'CURRENT' 
  AND l.parentid LIKE $P{lguindex} 
GROUP BY l.objid, l.lguname  
ORDER BY MIN(l.indexno) 	 



#----------------------------------------------------------------------
#
# COMPARATIVE DATA ON AV
#
#----------------------------------------------------------------------
[getPreceedingComparativeAV]
SELECT
	'TAXABLE' AS taxability, 
	c.objid AS classid, 
	c.propertydesc AS classname, 
	c.special AS special, 
	SUM( CASE WHEN f.rputype = 'land' THEN totalav ELSE 0.0 END ) AS preceedinglandav, 
	SUM( CASE WHEN f.rputype <> 'land' THEN totalav ELSE 0.0 END ) AS preceedingimpav, 
	SUM( f.totalav ) AS preceedingtotal 
FROM faaslist f 
	INNER JOIN propertyclassification c ON f.classid = c.objid  
WHERE f.txntimestamp < $P{currenttimestamp}   
  AND f.docstate = 'CURRENT'  
  AND f.taxable = 1 
GROUP BY c.objid, c.propertydesc, c.special 
ORDER BY MIN(c.orderno) 


[getCurrentComparativeAV]
SELECT 
	'TAXABLE' AS taxability, 
	c.objid AS classid, 
	c.propertydesc AS classname, 
	c.special AS special, 
	SUM( CASE WHEN f.rputype = 'land' THEN totalav ELSE 0.0 END ) AS currentlandav, 
	SUM( CASE WHEN f.rputype <> 'land' THEN totalav ELSE 0.0 END ) AS currentimpav, 
	SUM( f.totalav ) AS currenttotal 
FROM faaslist f 
	INNER JOIN propertyclassification c ON f.classid = c.objid  
WHERE f.txntimestamp LIKE $P{currenttimestamp}    
  AND f.docstate = 'CURRENT'  
  AND f.taxable = 1 
GROUP BY c.objid, c.propertydesc, c.special 
ORDER BY MIN(c.orderno) 


[getCancelledComparativeAV]
SELECT 
	'TAXABLE' AS taxability, 
	c.objid AS classid, 
	c.propertydesc AS classname, 
	c.special AS special, 
	SUM( CASE WHEN f.rputype = 'land' THEN totalav ELSE 0.0 END ) AS cancelledlandav, 
	SUM( CASE WHEN f.rputype <> 'land' THEN totalav ELSE 0.0 END ) AS cancelledimpav,  
	SUM( f.totalav ) AS cancelledtotal  
FROM faaslist f 
	INNER JOIN propertyclassification c ON f.classid = c.objid  
WHERE f.txntimestamp LIKE $P{currenttimestamp}    
  AND f.docstate = 'CANCELLED'  
  AND f.taxable = 1 
GROUP BY c.objid, c.propertydesc, c.special 
ORDER BY MIN(c.orderno) 


[getEndingComparativeAV]
SELECT  
	'TAXABLE' AS taxability, 
	c.objid AS classid, 
	c.propertydesc AS classname, 
	c.special AS special, 
	SUM( CASE WHEN f.rputype = 'land' THEN totalav ELSE 0.0 END ) AS endinglandav, 
	SUM( CASE WHEN f.rputype <> 'land' THEN totalav ELSE 0.0 END ) AS endingimpav, 
	SUM( f.totalav ) AS endingtotal 
FROM faaslist f 
	INNER JOIN propertyclassification c ON f.classid = c.objid  
WHERE f.txntimestamp < $P{endingtimestamp}   
  AND f.docstate = 'CURRENT'   
  AND f.taxable = 1 
GROUP BY c.objid, c.propertydesc, c.special 
ORDER BY MIN(c.orderno) 



[getPreceedingComparativeAVExempt]
SELECT 
	'EXEMPT' AS taxability,  
	e.objid AS classid,  
	e.exemptdesc AS classname,  
	0 AS special,  
	SUM( CASE WHEN f.rputype = 'land' THEN totalav ELSE 0.0 END ) AS preceedinglandav,  
	SUM( CASE WHEN f.rputype <> 'land' THEN totalav ELSE 0.0 END ) AS preceedingimpav,  
	SUM( f.totalav ) AS preceedingtotal  
FROM faaslist f  
	INNER JOIN exemptiontype e ON f.exemptid = e.objid   
WHERE f.txntimestamp < $P{currenttimestamp}    
  AND f.docstate = 'CURRENT'   
  AND f.taxable = 0 
GROUP BY e.objid, e.exemptdesc 
ORDER BY MIN(e.orderno)  

[getCurrentComparativeAVExempt]
SELECT 
	'EXEMPT' AS taxability,  
	e.objid AS classid,  
	e.exemptdesc AS classname,  
	0 AS special,  
	SUM( CASE WHEN f.rputype = 'land' THEN totalav ELSE 0.0 END ) AS currentlandav,  
	SUM( CASE WHEN f.rputype <> 'land' THEN totalav ELSE 0.0 END ) AS currentimpav,  
	SUM( f.totalav ) AS currenttotal  
FROM faaslist f  
	INNER JOIN exemptiontype e ON f.exemptid = e.objid   
WHERE f.txntimestamp LIKE $P{currenttimestamp}    
  AND f.docstate = 'CURRENT'   
  AND f.taxable = 0 
GROUP BY e.objid, e.exemptdesc 
ORDER BY MIN(e.orderno)  


[getCancelledComparativeAVExempt]
SELECT 
	'EXEMPT' AS taxability,  
	e.objid AS classid,  
	e.exemptdesc AS classname,  
	0 AS special,  
	SUM( CASE WHEN f.rputype = 'land' THEN totalav ELSE 0.0 END ) AS cancelledlandav,  
	SUM( CASE WHEN f.rputype <> 'land' THEN totalav ELSE 0.0 END ) AS cancelledimpav,  
	SUM( f.totalav ) AS cancelledtotal  
FROM faaslist f  
	INNER JOIN exemptiontype e ON f.exemptid = e.objid   
WHERE f.txntimestamp LIKE $P{currenttimestamp}    
  AND f.docstate = 'CANCELLED'   
  AND f.taxable = 0 
GROUP BY e.objid, e.exemptdesc 
ORDER BY MIN(e.orderno)  


[getEndingComparativeAVExempt]
SELECT 
	'EXEMPT' AS taxability,  
	e.objid AS classid,  
	e.exemptdesc AS classname,  
	0 AS special,  
	SUM( CASE WHEN f.rputype = 'land' THEN totalav ELSE 0.0 END ) AS endinglandav,  
	SUM( CASE WHEN f.rputype <> 'land' THEN totalav ELSE 0.0 END ) AS endingimpav,  
	SUM( f.totalav ) AS endingtotal  
FROM faaslist f  
	INNER JOIN exemptiontype e ON f.exemptid = e.objid   
WHERE f.txntimestamp < $P{endingtimestamp}    
  AND f.docstate = 'CURRENT'   
  AND f.taxable = 0 
GROUP BY e.objid, e.exemptdesc 
ORDER BY MIN(e.orderno)  




#----------------------------------------------------------------------
#
# COMPARATIVE DATA ON NUMBER OF RPU
#
#----------------------------------------------------------------------
[getPreceedingComparativeRpuCount]
SELECT
	'TAXABLE' AS taxability, 
	c.objid AS classid, 
	c.propertydesc AS classname, 
	c.special AS special, 
	SUM( CASE WHEN f.rputype = 'land' THEN 1.0 ELSE 0.0 END ) AS preceedinglandcount, 
	SUM( CASE WHEN f.rputype <> 'land' THEN 1.0 ELSE 0.0 END ) AS preceedingimpcount, 
	SUM( 1.0 ) AS preceedingtotal 
FROM faaslist f 
	INNER JOIN propertyclassification c ON f.classid = c.objid  
WHERE f.txntimestamp < $P{currenttimestamp}   
  AND f.docstate = 'CURRENT'  
  AND f.taxable = 1 
GROUP BY c.objid, c.propertydesc, c.special 
ORDER BY MIN(c.orderno) 


[getNewDiscoveryComparativeRpuCount]
SELECT
	'TAXABLE' AS taxability, 
	c.objid AS classid, 
	c.propertydesc AS classname, 
	c.special AS special, 
	SUM( CASE WHEN f.rputype = 'land' THEN 1.0 ELSE 0.0 END ) AS newdiscoverylandcount, 
	SUM( CASE WHEN f.rputype <> 'land' THEN 1.0 ELSE 0.0 END ) AS newdiscoveryimpcount, 
	SUM( 1 ) AS newdiscoverytotal  
FROM faaslist f 
	INNER JOIN propertyclassification c ON f.classid = c.objid  
WHERE f.txntimestamp LIKE $P{currenttimestamp}    
  AND f.docstate = 'CURRENT'  
  AND f.taxable = 1 
  AND f.txntype = 'ND' 
GROUP BY c.objid, c.propertydesc, c.special 
ORDER BY MIN(c.orderno) 


[getCancelledComparativeRpuCount]
SELECT
	'TAXABLE' AS taxability, 
	c.objid AS classid, 
	c.propertydesc AS classname, 
	c.special AS special, 
	SUM( CASE WHEN f.rputype = 'land' THEN 1.0 ELSE 0.0 END ) AS cancelledlandcount, 
	SUM( CASE WHEN f.rputype <> 'land' THEN 1.0 ELSE 0.0 END ) AS cancelledimpcount,  
	SUM( 1 ) AS cancelledtotal  
FROM faaslist f 
	INNER JOIN propertyclassification c ON f.classid = c.objid   
WHERE f.txntimestamp LIKE $P{currenttimestamp}    
  AND f.docstate = 'CANCELLED'  
  AND f.taxable = 1 
GROUP BY c.objid, c.propertydesc, c.special 
ORDER BY MIN(c.orderno) 


[getEndingComparativeRpuCount]
SELECT
	'TAXABLE' AS taxability, 
	c.objid AS classid, 
	c.propertydesc AS classname, 
	c.special AS special, 
	SUM( CASE WHEN f.rputype = 'land' THEN 1.0 ELSE 0.0 END ) AS endinglandcount, 
	SUM( CASE WHEN f.rputype <> 'land' THEN 1.0 ELSE 0.0 END ) AS endingimpcount, 
	SUM( 1.0 ) AS endingtotal 
FROM faaslist f 
	INNER JOIN propertyclassification c ON f.classid = c.objid  
WHERE f.txntimestamp < $P{endingtimestamp}   
  AND f.docstate = 'CURRENT'   
  AND f.taxable = 1 
GROUP BY c.objid, c.propertydesc, c.special 
ORDER BY MIN(c.orderno) 



[getPreceedingComparativeRpuCountExempt]
SELECT 
	'EXEMPT' AS taxability,  
	e.objid AS classid,  
	e.exemptdesc AS classname,  
	0 AS special,  
	SUM( CASE WHEN f.rputype = 'land' THEN 1.0 ELSE 0.0 END ) AS preceedinglandcount,  
	SUM( CASE WHEN f.rputype <> 'land' THEN 1.0 ELSE 0.0 END ) AS preceedingimpcount,  
	SUM( 1.0 ) AS preceedingtotal     
FROM faaslist f  
	INNER JOIN exemptiontype e ON f.exemptid = e.objid   
WHERE f.txntimestamp < $P{currenttimestamp}    
  AND f.docstate = 'CURRENT'   
  AND f.taxable = 0 
GROUP BY e.objid, e.exemptdesc 
ORDER BY MIN(e.orderno)  

[getNewDiscoveryComparativeRpuCountExempt]
SELECT 
	'EXEMPT' AS taxability,  
	e.objid AS classid,  
	e.exemptdesc AS classname,  
	0 AS special,  
	SUM( CASE WHEN f.rputype = 'land' THEN 1.0 ELSE 0.0 END ) AS newdiscoverylandcount,   
	SUM( CASE WHEN f.rputype <> 'land' THEN 1.0 ELSE 0.0 END ) AS newdiscoveryimpcount,  
	SUM( 1.0 ) AS newdiscoverytotal     
FROM faaslist f  
	INNER JOIN exemptiontype e ON f.exemptid = e.objid   
WHERE f.txntimestamp LIKE $P{currenttimestamp}    
  AND f.docstate = 'CURRENT'   
  AND f.txntype = 'ND' 
  AND f.taxable = 0 
GROUP BY e.objid, e.exemptdesc 
ORDER BY MIN(e.orderno)  


[getCancelledComparativeRpuCountExempt]
SELECT 
	'EXEMPT' AS taxability,  
	e.objid AS classid,  
	e.exemptdesc AS classname,  
	0 AS special,  
	SUM( CASE WHEN f.rputype = 'land' THEN 1.0 ELSE 0.0 END ) AS cancelledlandcount,  
	SUM( CASE WHEN f.rputype <> 'land' THEN 1.0 ELSE 0.0 END ) AS cancelledimpcount,  
	SUM( 1.0 ) AS cancelledtotal     
FROM faaslist f  
	INNER JOIN exemptiontype e ON f.exemptid = e.objid   
WHERE f.txntimestamp LIKE $P{currenttimestamp}    
  AND f.docstate = 'CANCELLED'   
  AND f.taxable = 0 
GROUP BY e.objid, e.exemptdesc 
ORDER BY MIN(e.orderno)  


[getEndingComparativeRpuCountExempt]
SELECT 
	'EXEMPT' AS taxability,  
	e.objid AS classid,  
	e.exemptdesc AS classname,  
	0 AS special,  
	SUM( CASE WHEN f.rputype = 'land' THEN 1.0 ELSE 0.0 END ) AS endinglandcount,  
	SUM( CASE WHEN f.rputype <> 'land' THEN 1.0 ELSE 0.0 END ) AS endingimpcount,  
	SUM( 1.0 ) AS endingtotal     
FROM faaslist f  
	INNER JOIN exemptiontype e ON f.exemptid = e.objid   
WHERE f.txntimestamp < $P{endingtimestamp}    
  AND f.docstate = 'CURRENT'   
  AND f.taxable = 0 
GROUP BY e.objid, e.exemptdesc 
ORDER BY MIN(e.orderno)  






#----------------------------------------------------------------------
#
# COMPARATIVE DATA ON MV
#
#----------------------------------------------------------------------
[getStartComparativeMV]
SELECT
	'TAXABLE' AS taxability, 
	c.objid AS classid, 
	c.propertydesc AS classname, 
	c.special AS special, 
	SUM( CASE WHEN f.rputype = 'land' THEN totalmv ELSE 0.0 END ) AS startlandmv, 
	SUM( CASE WHEN f.rputype <> 'land' THEN totalmv ELSE 0.0 END ) AS startimpmv, 
	SUM( f.totalmv ) AS starttotal  
FROM faaslist f  
	INNER JOIN propertyclassification c ON f.classid = c.objid   
WHERE f.txntimestamp < $P{currenttimestamp}  
  AND f.docstate = 'CURRENT'   
  AND f.taxable = 1  
GROUP BY c.objid, c.propertydesc, c.special  
ORDER BY MIN(c.orderno)  

[getEndComparativeMV]
SELECT 
	'TAXABLE' AS taxability,  
	c.objid AS classid,  
	c.propertydesc AS classname,  
	c.special AS special,  
	SUM( CASE WHEN f.rputype = 'land' THEN totalmv ELSE 0.0 END ) AS endlandmv,  
	SUM( CASE WHEN f.rputype <> 'land' THEN totalmv ELSE 0.0 END ) AS endimpmv,  
	SUM( f.totalmv ) AS endtotal 
FROM faaslist f  
	INNER JOIN propertyclassification c ON f.classid = c.objid   
WHERE f.txntimestamp < $P{endingtimestamp}  
  AND f.docstate = 'CURRENT'   
  AND f.taxable = 1  
GROUP BY c.objid, c.propertydesc, c.special  
ORDER BY MIN(c.orderno)  


[getStartComparativeMVExempt]
SELECT 
	'EXEMPT' AS taxability,  
	e.objid AS classid,  
	e.exemptdesc AS classname,  
	0 AS special,  
	SUM( CASE WHEN f.rputype = 'land' THEN totalmv ELSE 0.0 END ) AS startlandmv,  
	SUM( CASE WHEN f.rputype <> 'land' THEN totalmv ELSE 0.0 END ) AS startimpmv,  
	SUM( f.totalmv ) AS starttotal  
FROM faaslist f  
	INNER JOIN exemptiontype e ON f.exemptid = e.objid    
WHERE f.txntimestamp < $P{currenttimestamp}  
  AND f.docstate = 'CURRENT'   
  AND f.taxable = 0   
GROUP BY e.objid, e.exemptdesc 
ORDER BY MIN(e.orderno)  



[getEndComparativeMVExempt]
SELECT 
	'EXEMPT' AS taxability,  
	e.objid AS classid,  
	e.exemptdesc AS classname,  
	0 AS special,  
	SUM( CASE WHEN f.rputype = 'land' THEN totalmv ELSE 0.0 END ) AS endlandmv,  
	SUM( CASE WHEN f.rputype <> 'land' THEN totalmv ELSE 0.0 END ) AS endimpmv,  
	SUM( f.totalmv ) AS endtotal  
FROM faaslist f  
	INNER JOIN exemptiontype e ON f.exemptid = e.objid    
WHERE f.txntimestamp < $P{endingtimestamp}  
  AND f.docstate = 'CURRENT'   
  AND f.taxable = 0   
GROUP BY e.objid, e.exemptdesc 
ORDER BY MIN(e.orderno)  

[getMasterList]
SELECT t.* FROM (   
	SELECT 
		docstate, ownername, fullpin, tdno, titleno, cadastrallotno,  
		rputype, classcode, totalareaha, totalareasqm, totalmv, totalav, effectivityyear, 
		prevtdno, prevowner, prevmv, prevav, 
		null as cancelledbytdnos, null as cancelreason, canceldate 
	FROM faaslist 
	WHERE docstate = 'CURRENT'  
		${classidfilter}
	  

	UNION 

	SELECT 
		docstate, ownername, fullpin, tdno, titleno, cadastrallotno,   
		rputype, classcode, totalareaha, totalareasqm, totalmv, totalav, effectivityyear,  
		prevtdno, prevowner, prevmv, prevav, 
		cancelledbytdnos, cancelreason, canceldate 
	FROM faaslist  
	WHERE docstate = 'CANCELLED'   
	  AND YEAR(canceldate) = $P{currentyear}  
	  ${classidfilter}
) t 
${orderby} 

[getRDAP-RPTA-100]
SELECT 
	l.pin, 
	l.indexno, 
	SUM( CASE WHEN fl.rputype = 'land' AND fl.taxable = 1 THEN 1.0 ELSE 0 END ) AS landtaxablecount,
	SUM( CASE WHEN fl.rputype = 'land' AND fl.taxable = 0 THEN 1.0 ELSE 0 END ) AS landexemptcount,
	SUM( CASE WHEN fl.rputype = 'land' AND fl.taxable = 1 THEN fl.totalareaha ELSE 0 END ) AS landareataxable,
	SUM( CASE WHEN fl.rputype = 'land' AND fl.taxable = 0 THEN fl.totalareaha ELSE 0 END ) AS landareaexempt,
	SUM( fl.totalareaha ) AS landareatotal,
	SUM( CASE WHEN fl.taxable = 1 THEN 1 ELSE 0 END ) AS tdtaxablecount,
	SUM( CASE WHEN fl.taxable = 0 THEN 1 ELSE 0 END ) AS tdexemptcount,
	COUNT( 1 ) AS tdcount,
	SUM( CASE WHEN fl.rputype = 'land' THEN fl.totalav ELSE 0 END ) AS landavtotal,
	SUM( CASE WHEN fl.rputype <> 'land' THEN fl.totalav ELSE 0 END ) AS improvavtotal,
	SUM( fl.totalav ) AS avtotal,
	SUM( CASE WHEN fl.taxable = 1 THEN fl.totalav ELSE 0 END ) AS avtaxable,
	SUM( CASE WHEN fl.taxable = 0 THEN fl.totalav ELSE 0 END ) AS avexempt
FROM lgu l 
	LEFT JOIN faaslist fl ON fl.barangayid = l.objid 
	 
WHERE l.lgutype = 'BARANGAY' 
  AND fl.objid IS NULL 
   OR (fl.docstate = 'CURRENT' 	AND fl.txntimestamp <= $P{txntimestamp})
GROUP BY l.pin, l.indexno
ORDER BY l.pin  


