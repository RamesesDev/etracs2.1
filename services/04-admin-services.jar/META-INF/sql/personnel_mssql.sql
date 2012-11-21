[list]
select p.*, case when (select 1 from useraccount u where u.objid=p.objid) is null then 0 else 1 end as canlogin 
from ( 
  select objid,staffno,lastname,firstname 
  from personnel 
  ${condition} 
) p  
order by p.lastname, p.firstname, p.staffno 

[getPersonnelPositions]
select code, title, objid  
from jobposition 
where assigneeid=$P{objid}
