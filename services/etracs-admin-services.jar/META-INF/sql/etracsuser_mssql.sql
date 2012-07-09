[getList]
 SELECT 
  p.objid, p.lastname, p.firstname, p.middlename, u.uid,
  j.title AS jobtitle, 
  p.lastname + ', ' + p.firstname + ' ' + isnull(p.middlename,'') as name,
  (
    p.firstname + ' ' +
	(case isnull(p.middlename,'') when '' then '' else p.middlename + ' ') end) + 
	p.lastname
  ) as formalname
 FROM personnel p
 INNER JOIN jobposition j ON j.assigneeid = p.objid
 INNER JOIN useraccount u ON u.objid = p.objid
 ORDER BY lastname,firstname,middlename



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
 ORDER BY lastname,firstname,middlename



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
 ORDER BY lastname,firstname,middlename


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
 ORDER BY lastname,firstname,middlename



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
    SELECT jobid FROM jobposition_tag WHERE tagid = $P{tagid}
   )
 ORDER BY lastname,firstname,middlename
 


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
          SELECT jobid FROM jobposition_tag WHERE tagid = $P{tagid}
       )
 ORDER BY lastname,firstname,middlename





