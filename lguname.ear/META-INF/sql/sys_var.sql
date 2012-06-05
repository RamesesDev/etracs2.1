[get]
select value, datatype from sys_var where name=? 

[set]
update sys_var set value=? where name=? 

[list]
select * from sys_var 
where category=? 
order by name 

[category]
select distinct category from sys_var where not(category is null) order by category 