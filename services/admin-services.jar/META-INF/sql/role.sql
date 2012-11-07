[list]
select *, (case when sysrole=role then 1 else system end) as system from role order by sysrole, role 

[list-by-domain]
select *, (case when sysrole=role then 1 else system end) as system from role where domain=$P{domain} order by role

[list-by-sysrole]
select *, (case when sysrole=role then 1 else system end) as system from role where domain=$P{domain} and sysrole=$P{sysrole}  order by role
