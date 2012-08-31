[list]
 select * from faastitleupdate
 
[list-by-tdno]
 select * from faastitleupdate where tdno like $P{tdno}
 
[list-by-tdno-state]
 select * from faastitleupdate where tdno like $P{tdno} and state = $P{state}


[get-faas-info]
 select objid, info from faas where objid=$P{objid}
 
[update-faas]
 update faas set info=$P{info} where objid=$P{objid}

[update-faaslist]
 update faaslist
 set titleno = $P{titleno}, titledate = $P{titledate}
 where objid = $P{objid}