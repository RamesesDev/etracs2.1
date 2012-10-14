[list]
SELECT jp.*, CONCAT(p.lastname, ', ', p.firstname, ' ',IFNULL(p.`middlename`,'') ) AS assignee 
FROM jobposition jp
	LEFT JOIN personnel p ON jp.assigneeid = p.objid  
WHERE ${condition} 	
ORDER BY p.lastname, p.firstname 

[get-job-permissions]
 select 
	j.excluded, r.included
 from 
  jobposition j
 inner join role r on r.name = j.role
 where j.objid = $P{jobid}

[role-permission]
select jp.excluded, r.included, jp.objid, r.name, r.roleclass  
from jobposition jp 
inner join role r on jp.role=r.name 
where jp.objid = $P{jobpositionid} 

[user-job-position-list]
select jp.objid,jp.code,jp.title,jp.orgunitid,jp.roleclass,jp.role, jp.excluded, r.included, jp.jobstatus 
from jobposition jp 
inner join role r on jp.role=r.name 
where jp.assigneeid=$P{userid} 
order by jp.jobstatus desc

[get-tags]
 select jt.jobid, jt.tagid
 from jobposition_tag jt 
 where jt.jobid = $P{jobid}
 
[remove-tags]
 delete from jobposition_tag where jobid = $P{jobid}

 
 
 