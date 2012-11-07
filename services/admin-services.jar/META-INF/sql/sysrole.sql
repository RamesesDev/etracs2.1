[list]
select * from sys_role where domain=$P{domain}

[get-permissions]
select * from sys_role_permission where sysrole = $P{sysrole} and domain=$P{domain}

[domain-list]
select distinct domain from sys_role
