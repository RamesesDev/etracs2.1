[list-rulenames]
select name,rulegroup from rule_sets

[list-by-type]
select packagename,content from rule_package 
where ruleset=$P{name} and type=$P{type} 
and ( rulegroup is null or rulegroup='' or rulegroup=$P{rulegroup} ) 
order by orderindex


[remove-rule-set]
delete from rule_sets where name = $P{ruleset} and rulegroup = $P{rulegroup}

[add-rule-set]
insert into rule_sets (name, rulegroup ) 
values ($P{ruleset}, $P{rulegroup})


[add-rule-package]
insert into rule_package (ruleset, rulegroup, packagename, orderindex, type, content ) 
values ($P{ruleset}, $P{rulegroup}, $P{packagename}, 0, 'rules', $P{content} )

[remove-rule-package]
delete from rule_package 
where ruleset=$P{ruleset} 
and packagename=$P{packagename} 
and rulegroup=$P{rulegroup}

[get-facts]
select * from rule_package 
where ruleset=$P{ruleset} 
and `type`='facts' 