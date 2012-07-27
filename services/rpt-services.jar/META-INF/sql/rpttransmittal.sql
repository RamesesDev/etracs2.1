[getList]
SELECT * 
FROM rpttransmittal 
ORDER BY txnno DESC
 
[getItemsForTransmittal]
SELECT f.*, DATEDIFF( NOW(), f.dtposted ) AS numdays 
FROM fortransmittal f
WHERE f.module = 'rpt'  


[getTransmittalItems]
SELECT ri.*, DATEDIFF( NOW(), ri.dtposted ) AS numdays 
FROM rpttransmittal_item ri
WHERE ri.objid = $P{transmittalid}

[getTransmittedFaasIds]
SELECT fl.objid 
FROM faaslist fl 
	INNER JOIN rpttransmittal_item ti ON fl.objid = ti.docid 
WHERE ti.objid = $P{transmittalid} 

[getTransmittedFaasList]
SELECT fl.* 
FROM faaslist fl 
	INNER JOIN rpttransmittal_item ti ON fl.objid = ti.docid 
WHERE ti.objid = $P{transmittalid} 

[getTransmittedLedgers]  
SELECT rl.* 
FROM rptledger rl 
	INNER JOIN faaslist fl ON rl.faasid = fl.objid 
	INNER JOIN rpttransmittal_item ti ON fl.objid = ti.docid 
WHERE ti.objid = $P{transmittalid}	 

[getTransmittedLedgerItems]  
SELECT rli.* 
FROM rptledgeritem rli 
	INNER JOIN faaslist fl ON rli.faasid = fl.objid 
	INNER JOIN rpttransmittal_item ti ON fl.objid = ti.docid 
WHERE ti.objid = $P{transmittalid}	 

[getTransmittedEntities]
SELECT  e.*
FROM faaslist  fl
	INNER JOIN rpttransmittal_item ti ON fl.objid = ti.docid 
	INNER JOIN entity e ON fl.taxpayerid = e.objid 
WHERE ti.objid = $P{transmittalid}	 


[getImportedTransmittalList]
SELECT * 
FROM rpttransmittal_import 
ORDER BY transmittalno DESC 

[getImportedTransmittalItems]
SELECT  *
FROM rpttransmittal_import_item ti 
WHERE ti.objid = $P{transmittalid} 

[getImportTransmittalById]
SELECT objid 
FROM rpttransmittal_import 
WHERE objid = $P{objid}

[getImportedFaasList]
SELECT  fl.*
FROM faaslist fl
	INNER JOIN rpttransmittal_import_item ti ON fl.objid = ti.docid 
WHERE ti.objid = $P{transmittalid} 







[getFaasById]
SELECT objid FROM faas WHERE objid = $P{objid} 

[getLedgerById]
SELECT objid FROM rptledger WHERE objid = $P{objid} 

[getLedgerItemById]
SELECT objid FROM rptledgeritem WHERE objid = $P{objid} 

[getEntityById]
SELECT objid FROM entity WHERE objid = $P{objid} 


[insertPin]
INSERT INTO pin ( pin, claimno, docstate ) VALUES( $P{pin}, $P{claimno}, $P{docstate} )


[getPin]
SELECT * FROM pin WHERE pin = $P{pin} AND claimno = $P{claimno} 


