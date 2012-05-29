[get-list]
 select * from collectiongroup order by name


[get-list-byname]
 select * from collectiongroup where name like $P{searchText} order by name


[get-items]
 select * from (
	 select cia.groupid, cia.incomeaccountid, ia.accttitle 
	 from collectiongroup_incomeaccount cia
	 inner join incomeaccount ia on ia.objid = cia.incomeaccountid
	 where cia.groupid = $P{objid}
 ) t
 order by accttitle


[remove-all-items]
 delete from collectiongroup_incomeaccount where groupid = $P{objid}
 
 
[get-incomeaccounts]
 select i.objid, i.acctno, i.acctcode, i.accttitle, i.fundid, i.fundname, i.defaultvalue, i.amounttype  
 from collectiongroup_incomeaccount cia 
 inner join  incomeaccount i on i.objid = cia.incomeaccountid and docstate = 'APPROVED' 
 where cia.groupid = $P{objid} 
 order by i.accttitle

 
 
 