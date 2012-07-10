[list]
select
	name,
	title,
	description,
	version,
	filename,
	lastmodified,
	permissions
from sys_module


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


[get-module-permissions-by-roleclass]
 select 
   name, permissions 
 from sys_module 
 where name in (
   select module from sys_roleclass_module where roleclass = $P{roleclass}
 )


