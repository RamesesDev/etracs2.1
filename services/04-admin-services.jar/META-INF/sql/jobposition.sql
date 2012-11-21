[list]
select jp.*, concat(p.lastname, ',' , p.firstname) as assignee 
from ( 
  select * 
  from jobposition  
  ${condition} 
) jp 
left join personnel p on jp.assigneeid = p.objid  
order by p.lastname, p.firstname 

[unassigned-list]
select jp.* 
from ( 
  select * 
  from jobposition  
  ${condition} 
) jp 
where jp.assigneeid is null 

[roles]
select jpr.*, ur.excluded from jobposition_role jpr inner join role ur on jpr.role = ur.role where jpr.jobpositionid = $P{jobpositionid}

[remove-roles]
delete from jobposition_role where jobpositionid = $P{jobpositionid}

[role-permissions-byuser]
select  jpr.sysrole, r.excluded, jpr.disallowed, jpr.domain  
from jobposition_role jpr 
inner join jobposition jp on jpr.jobpositionid=jp.objid 
inner join role r on jpr.role = r.role 
where jp.assigneeid = $P{assigneeid}
