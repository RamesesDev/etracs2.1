[getList]
SELECT p.objid, p.staffno, p.lastname, p.firstname, 
	(SELECT MIN(title) FROM jobposition WHERE assigneeid = p.objid ) AS jobtitle, 
	CASE WHEN p.middlename IS NULL 
	THEN CONCAT(p.lastname, ', ', p.firstname) 
	ELSE  CONCAT(p.lastname, ', ', p.firstname, '  ', p.middlename) 
	END AS name 
FROM examiner ex, personnel p 
WHERE ex.objid = p.objid  
ORDER BY p.lastname, p.firstname 

[findById]
SELECT p.objid, p.staffno, p.lastname, p.firstname, 
	(SELECT MIN(title) FROM jobposition WHERE assigneeid = p.objid ) AS jobtitle, 
	CASE WHEN p.middlename IS NULL 
	THEN CONCAT(p.lastname, ', ', p.firstname) 
	ELSE  CONCAT(p.lastname, ', ', p.firstname, '  ', p.middlename) 
	END AS name 
FROM examiner ex, personnel p 
WHERE ex.objid = p.objid  
  AND ex.objid = $P{objid} 
ORDER BY p.lastname, p.firstname 

[findByLastName]
SELECT p.objid, p.staffno, p.lastname, p.firstname, 
	(SELECT MIN(title) FROM jobposition WHERE assigneeid = p.objid ) AS jobtitle, 
	CASE WHEN p.middlename IS NULL 
	THEN CONCAT(p.lastname, ', ', p.firstname) 
	ELSE  CONCAT(p.lastname, ', ', p.firstname, '  ', p.middlename) 
	END AS name 
FROM examiner ex, personnel p 
WHERE ex.objid = p.objid  
  AND p.lastname LIKE $P{lastname}  
ORDER BY p.lastname, p.firstname 



[getReassignList]
SELECT objid, state, assignedFrom, assignedTo, validUntil  
FROM reassignedlgu 
ORDER BY validUntil 

[getActiveReassignList]
SELECT objid, state, assignedFrom, assignedTo, validUntil, DATEDIFF(validUntil, NOW()) + 1 AS remainingDays  
FROM reassignedlgu 
WHERE state = 'ACTIVE'  
ORDER BY validUntil  


[getReassignListByFrom]
SELECT objid, state, assignedFrom, assignedTo, validUntil  
FROM reassignedlgu 
WHERE assignedFrom LIKE $P{assignedFrom}  
ORDER BY validUntil  

[getReassignListByTo]
SELECT objid, state, assignedFrom, assignedTo, validUntil  
FROM reassignedlgu 
WHERE assignedTo LIKE $P{assignedTo}  
ORDER BY validUntil 

[getClosedReassignList]
SELECT objid FROM reassignedlgu WHERE state = 'ACTIVE' AND validUntil < NOW()




