[find-landfaas]
select objid from faaslist where objid = $P{landfaasid} and rputype = 'land'


[find-by-landfaasid]
select objid from realproperty where landfaasid=$P{landfaasid} 
 
 
 
 