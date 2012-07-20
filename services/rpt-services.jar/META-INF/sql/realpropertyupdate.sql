[list]
 select * from realpropertyupdate
 
[list-by-pin]
 select * from realpropertyupdate where pin like $P{pin}
 
[list-by-pin-state]
 select * from realpropertyupdate where pin like $P{pin} and state = $P{state}


[realproperty-list]
 select fl.pin, fl.cadastrallotno, fl.blockno, fl.surveyno
 from faaslist fl 
 where fl.docstate <> 'CANCELLED' and fl.rputype = 'land'
 group by fl.pin


[realproperty-list-by-pin]
 select fl.pin, fl.cadastrallotno, fl.blockno, fl.surveyno
 from faaslist fl 
 where fl.docstate <> 'CANCELLED' and fl.fullpin = $P{pin} and fl.rputype = 'land'
 group by fl.pin


[get-info]
 select f.rp
 from faaslist fl 
 inner join faas f on f.objid = fl.objid
 where fl.docstate <> 'CANCELLED' and fl.pin = $P{pin}
 group by fl.pin



[get-affected-faas]
 select objid from faaslist where pin = $P{pin} and docstate <> 'CANCELLED'

[get-faas-rp]
 select rp from faas where objid=$P{objid}
 
 
[update-faas-rp]
 update faas set rp=$P{rp} where objid=$P{objid}
 

[update-faaslist-rp]
 update faaslist
 set 
	cadastrallotno=$P{cadastrallotno},
	blockno=$P{blockno},
	surveyno=$P{surveyno}
 where objid=$P{objid}
 

[update-rpt-ledger-rp]
 update rptledger
 set cadastrallotno=$P{cadastrallotno}, blockno=$P{blockno}
 where faasid=$P{objid}

 
 
 
 