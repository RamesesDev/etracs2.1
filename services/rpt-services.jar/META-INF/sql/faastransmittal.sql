[getList]
SELECT * 
FROM faastransmittal 
ORDER BY txnno DESC
 
[getImportedTransmittalList]
SELECT * 
FROM faastransmittalimport 
ORDER BY transmittalno DESC 

[getFaasForTransmittal]
SELECT  *
FROM faaslist  
WHERE fortransmittal = 1 
  AND transmittalid IS NULL 
  AND docstate = $P{docstate} 
  

[getTransmittalItems]
SELECT  fl.*
FROM faaslist fl
	INNER JOIN faastransmittal_item ti ON fl.objid = ti.faasid 
WHERE ti.objid = $P{transmittalid}

[getImportedTransmittalItems]
SELECT  fl.*
FROM faaslist fl
	INNER JOIN faastransmittalimport_item ti ON fl.objid = ti.faasid 
WHERE ti.objid = $P{transmittalid}
  
  
[updateFaasTransmittalId]  
UPDATE faas SET 
	transmittalid = $P{transmittalid} 
WHERE fortransmittal = 1 
  AND transmittalid IS NULL 
  AND objid = $P{faasid} 
  
[updateFaasListTransmittalId]  
UPDATE faaslist SET 
	transmittalid = $P{transmittalid} 
WHERE fortransmittal = 1 
  AND transmittalid IS NULL 
  AND objid = $P{faasid} 

[getTransmittedLedgers]  
SELECT rl.* 
FROM rptledger rl 
	INNER JOIN faaslist fl ON rl.faasid = fl.objid 
WHERE fl.transmittalid = $P{transmittalid}	 

[getTransmittedLedgerItems]  
SELECT rli.* 
FROM rptledgeritem rli 
	INNER JOIN faaslist fl ON rli.faasid = fl.objid 
WHERE fl.transmittalid = $P{transmittalid}	 

[getTransmittedEntities]
SELECT  e.*
FROM faaslist  fl
	INNER JOIN entity e ON fl.taxpayerid = e.objid 
WHERE fl.transmittalid = $P{transmittalid}	 



[getFasTransmittalImportById]
SELECT * FROM faastransmittalimport WHERE objid = $P{objid} 

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


