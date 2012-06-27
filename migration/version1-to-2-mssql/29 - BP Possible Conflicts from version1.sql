-- select all lob that has the same name
select objid, name from lob where name in (
 select name from lob group by name having count(name) > 1
)