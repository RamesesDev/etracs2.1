[getPendingList] 
SELECT o.objid, o.txnno, o.tradename, o.businessaddress, o.docstate 
FROM bpapplication o 
WHERE o.docstate IN ('DRAFT','FOR_REVIEW','FOR_ASSESSMENT','FOR_APPROVAL') 
      ${filter} 
ORDER BY o.tradename

[getPendingListByTradename] 
SELECT o.objid, o.txnno, o.tradename, o.businessaddress, o.docstate 
FROM bpapplication o 
WHERE o.docstate IN ('DRAFT','FOR_REVIEW','FOR_ASSESSMENT','FOR_APPROVAL') 
  AND o.tradename LIKE $P{tradename} 
  ${filter} 
ORDER BY o.tradename 

[getPendingListByTxnno] 
SELECT o.objid, o.txnno, o.tradename, o.businessaddress, o.docstate 
FROM bpapplication o 
WHERE o.docstate IN ('DRAFT','FOR_REVIEW','FOR_ASSESSMENT','FOR_APPROVAL') 
  AND o.txnno LIKE $P{txnno} 
  ${filter} 
ORDER BY o.tradename


[getList]  
SELECT o.* FROM bpapplicationlisting o 
WHERE  o.docstate = $P{docstate} 
${filter}

[getListByPermitNo]  
SELECT o.* FROM bpapplicationlisting o 
WHERE o.txnno = $P{search} 
AND   o.docstate = $P{docstate} 
${filter}

[getListByTradeName]  
SELECT o.* FROM bpapplicationlisting o  
WHERE o.tradename LIKE $P{search}  
AND   o.docstate = $P{docstate} 
${filter}

[getListByBusinessName]  
SELECT o.* FROM bpapplicationlisting o  
WHERE o.tradename LIKE $P{search}  
AND   o.docstate = $P{docstate} 
${filter}

[getListByBusinessAddress]  
SELECT o.* FROM bpapplicationlisting o 
WHERE o.businessaddress LIKE $P{search}  
AND   o.docstate = $P{docstate} 
${filter}

[getListByTaxpayerName]  
SELECT o.* FROM bpapplicationlisting o 
WHERE o.taxpayername LIKE $P{search} 
AND   o.docstate = $P{docstate} 
${filter}

[getListByTaxpayerAddress]  
SELECT o.* FROM bpapplicationlisting o 
WHERE o.taxpayeraddress LIKE $P{search} 
AND   o.docstate = $P{docstate} 
${filter}

[getForRenewalList]  
SELECT o.* FROM bpapplicationlisting o 
WHERE   o.docstate = 'EXPIRED' 
${filter}

[getForRenewalListByPermitNo]  
SELECT o.* FROM bpapplicationlisting o 
WHERE o.txnno = $P{search} 
AND   o.docstate = 'EXPIRED'  
${filter}

[getForRenewalListByTradeName]  
SELECT o.* FROM bpapplicationlisting o  
WHERE o.tradename LIKE $P{search}  
AND   o.docstate = 'EXPIRED'  
${filter}

[getForRenewalListByBusinessAddress]  
SELECT o.* FROM bpapplicationlisting o 
WHERE o.businessaddress LIKE $P{search}  
AND   o.docstate = 'EXPIRED'  
${filter}

[getForRenewalListByTaxpayerName]  
SELECT o.* FROM bpapplicationlisting o 
WHERE o.taxpayername LIKE $P{search} 
AND   o.docstate = 'EXPIRED'  
${filter}

[getForRenewalListByTaxpayerAddress]  
SELECT o.* FROM bpapplicationlisting o 
WHERE o.taxpayeraddress LIKE $P{search} 
AND   o.docstate = 'EXPIRED'  
${filter}

[getRetiredList]  
SELECT o.* FROM bpapplicationlisting o 
WHERE  o.docstate = $P{docstate} 
AND   o.txntype in ('RETIRE','RETIRELOB') 
${filter}

[getRetiredListByPermitNo]  
SELECT o.* FROM bpapplicationlisting o 
WHERE o.txnno = $P{search} 
AND   o.docstate = $P{docstate} 
AND   o.txntype in ('RETIRE','RETIRELOB') 
${filter}

[getRetiredListByTradeName]  
SELECT o.* FROM bpapplicationlisting o  
WHERE o.tradename LIKE $P{search}  
AND   o.docstate = $P{docstate} 
AND   o.txntype in ('RETIRE','RETIRELOB') 
${filter}

[getRetiredListByBusinessAddress]  
SELECT o.* FROM bpapplicationlisting o 
WHERE o.businessaddress LIKE $P{search}  
AND   o.docstate = $P{docstate} 
AND   o.txntype in ('RETIRE','RETIRELOB') 
${filter}

[getRetiredListByTaxpayerName]  
SELECT o.* FROM bpapplicationlisting o 
WHERE o.taxpayername LIKE $P{search} 
AND   o.docstate = $P{docstate} 
AND   o.txntype in ('RETIRE','RETIRELOB') 
${filter}

[getRetiredListByTaxpayerAddress]  
SELECT o.* FROM bpapplicationlisting o 
WHERE o.taxpayeraddress LIKE $P{search} 
AND   o.docstate = $P{docstate} 
AND   o.txntype in ('RETIRE','RETIRELOB') 
${filter}


[findPermitByApplicationId] 
SELECT o.* FROM bppermit o 
WHERE o.applicationid = $P{applicationid} 



[getAppListInfo]
SELECT barangayname, ctcno FROM bpapplicationlisting WHERE objid = $P{objid}

[getTaxpayer]
SELECT * FROM entity where objid = $P{objid}


