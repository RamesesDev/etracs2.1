[list]
select
	name,
	title,
	description,
	version,
	filename,
	lastmodified,
	permissions,
	type
from sys_module
order by type desc


[custom-list]
select
	name,
	title,
	description,
	version,
	filename,
	lastmodified,
	permissions
from sys_module
where type='custom'


[get-module-version]
select version from sys_module where name = $P{name}


[get-jarfile-by-filename]
select jarfile from sys_module where filename=$P{filename}



[remove-roleclass-entry]
delete from sys_roleclass_module where module = $P{name}


[get-module-permissions-by-roleclass]
 select 
   name, permissions 
 from sys_module 
 where name in (
   select module from sys_roleclass_module where roleclass = $P{roleclass}
 )


