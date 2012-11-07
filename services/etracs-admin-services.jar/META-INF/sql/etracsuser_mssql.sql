[getList]
 SELECT 
  p.objid, p.lastname, p.firstname, p.middlename, u.uid,
  j.title AS jobtitle, 
  p.lastname + ', ' + p.firstname + ' ' + isnull(p.middlename,'') as name,
  (
    p.firstname + ' ' +
	(case isnull(p.middlename,'') when '' then '' else p.middlename + ' ' end) + 
	p.lastname
  ) as formalname
 FROM personnel p
 INNER JOIN jobposition j ON j.assigneeid = p.objid
 INNER JOIN useraccount u ON u.objid = p.objid
 ORDER BY p.lastname,p.firstname,p.middlename
 

[findByUid]
 SELECT 
  p.objid, p.lastname, p.firstname, p.middlename, u.uid,
  j.title AS jobtitle, 
  p.lastname + ', ' + p.firstname + ' ' + isnull(p.middlename,'') as name,
  (
    p.firstname + ' ' + 
	(case isnull(p.middlename,'') when '' then '' else p.middlename + ' ' end) +
	p.lastname
  ) as formalname
 FROM personnel p
 INNER JOIN jobposition j ON j.assigneeid = p.objid
 INNER JOIN useraccount u ON u.objid = p.objid
 WHERE u.uid LIKE $P{uid}
 ORDER BY p.lastname,p.firstname,p.middlename



[findByLastName]
  SELECT 
  p.objid, p.lastname, p.firstname, p.middlename, u.uid,
  j.title AS jobtitle, 
  p.lastname + ', ' + p.firstname + ' ' + isnull(p.middlename,'') as name,
  (
    p.firstname + ' ' +
	(case isnull(p.middlename,'') when '' then '' else p.middlename + ' ' end) +
	p.lastname
  ) as formalname
 FROM personnel p
 INNER JOIN jobposition j ON j.assigneeid = p.objid
 INNER JOIN useraccount u ON u.objid = p.objid
 WHERE p.lastname LIKE $P{lastname} 
 ORDER BY p.lastname,p.firstname,p.middlename


[findById]
  SELECT 
  p.objid, p.lastname, p.firstname, p.middlename, u.uid,
  j.title AS jobtitle, 
  p.lastname + ', ' + p.firstname + ' ' + isnull(p.middlename,'') as name,
  (
    p.firstname + ' ' +
	(case isnull(p.middlename,'') when '' then '' else p.middlename + ' ' end) +
	p.lastname
  ) as formalname
 FROM personnel p
 INNER JOIN jobposition j ON j.assigneeid = p.objid
 INNER JOIN useraccount u ON u.objid = p.objid
 WHERE p.objid = $P{objid} 
 ORDER BY p.lastname,p.firstname,p.middlename



[getUserByTagid]
 SELECT 
  p.objid, p.lastname, p.firstname, p.middlename,
  j.title AS jobtitle, 
  p.lastname + ', ' + p.firstname + ' ' + isnull(p.middlename,'') as name,
  (
    p.firstname + ' ' +
	(case isnull(p.middlename,'') when '' then '' else p.middlename + ' ' end) +
	p.lastname
  ) as formalname
 FROM personnel p
 INNER JOIN jobposition j ON j.assigneeid = p.objid
 WHERE p.objid = $P{objid}
   AND j.objid IN (
    SELECT jobpositionid FROM jobposition_role WHERE sysrole = $P{tagid}
   )
 ORDER BY p.lastname,p.firstname,p.middlename
 


[getUsersByTagid]
 SELECT 
  p.objid, p.lastname, p.firstname, p.middlename,
  j.title AS jobtitle, 
  p.lastname + ', ' + p.firstname + ' ' + isnull(p.middlename,'') as name,
  (
    p.firstname + ' ' +
	(case isnull(p.middlename,'') when '' then '' else p.middlename + ' ' end) +
	p.lastname
  ) as formalname
 FROM personnel p
 INNER JOIN jobposition j ON j.assigneeid = p.objid
 WHERE j.objid IN (
          SELECT jobpositionid FROM jobposition_role WHERE sysrole = $P{tagid}
       )
 ORDER BY p.lastname,p.firstname,p.middlename


[getPersonnelInfo]
SELECT * 
FROM personnel p  
WHERE p.objid = $P{objid}	 



