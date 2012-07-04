/**********************************************************************
*
* DATABASE NAMES TO BE REPLACED: bayombong_etracs, etracs_bayombong
*
***********************************************************************/


/**********************************************************************
*
* LGU
*
**********************************************************************/

insert into bayombong_etracs..lgu (
	"objid", 
	schemaname, 
	schemaversion, 
	docstate, 
	lgutype, 
	indexno, 
	pin, 
	lguname, 
	formalname, 
	parentid
)
select 
	"objid", 
	'lgu' as schemaname, 
	'1.0' as schemaversion, 
	'DRAFT' AS docstate, 
	type as lgutype, 
	indexno, 
	pin, 
	name as lguname, 
	formalname, 
	parentid
from etracs_bayombong..lgu; 



/**********************************************************************
*
* ACCOUNT
*
**********************************************************************/

delete from bayombong_etracs..account ;

insert into bayombong_etracs..account
	("objid", schemaname, schemaversion, fromyear, toyear, acctcode, accttitle, charttype, accttype, acctlevel)
values
	('NGAS', 'account:account', '1.0', 2011, 0, 'NGAS', 'NGAS', 'NGAS', 'CHART', 0),
	('SRE', 'account:account', '1.0', 2011, 0, 'SRE', 'SRE', 'SRE', 'SRE', 0);



insert into bayombong_etracs..account 
(	"objid", schemaname, 
	schemaversion, 
	fromyear, 
	toyear, 
	acctcode, 
	accttitle, 
	charttype, 
	accttype, 
	target, 
	acctlevel, 
	parentid, 
	rootid, 
	pathbyids, 
	pathbytitle
)
SELECT
	CASE 
		WHEN "objid" = 'NGAS2004' THEN 'NGAS' 
		WHEN "objid" = 'SIE' THEN 'SRE' 
		ELSE "objid" 
	END AS "objid", 
	'account:account' AS schemaname, 
	'1.0' AS schemaversion, 
	ISNULL(fromyear, 0), 
	toyear, 
	code AS acctcode, 
	upper(title) AS accttitle, 
	CASE WHEN charttype = 'NGAS' THEN 'NGAS' ELSE 'SRE' END AS charttype, 
	CASE WHEN dtype = 'GLAccount' THEN 'GLACCOUNT' ELSE 'CATEGORY' END AS laccttype, 
	0.0 AS target, 
	0 AS acctlevel, 
	CASE 
		WHEN parentid = 'NGAS2004' THEN 'NGAS' 
		WHEN parentid = 'SIE' THEN 'SRE' 
		ELSE parentid 
	END AS parentid, 
	CASE WHEN charttype = 'NGAS' THEN 'NGAS' ELSE 'SRE' END AS rootid, 
	'' AS pathbyids, 
	'' AS pathbytitle
FROM etracs_bayombong..account 
where parentid is not null;






/* *********************************************************************
*
* INCOME ACCOUNT
*
********************************************************************* */
alter table bayombong_etracs..incomeaccount alter column ngastitle varchar(255);
alter table bayombong_etracs..incomeaccount alter column sretitle varchar(255);

insert into bayombong_etracs..incomeaccount 
	("objid", schemaname, 
	schemaversion, 
	docstate, 
	acctno, 
	accttitle, 
	acctcode, 
	defaultvalue, 
	systype, 
	ngasid, 
	ngastitle, 
	ngassubacctid, 
	ngassubaccttitle, 
	sreid, 
	sretitle, 
	sresubacctid, 
	sresubaccttitle, 
	fundid, 
	fundname, 
	amounttype
	)
SELECT
	ia."objid" as objid, 
	'incomeacct:incomeacct' AS schemaname, 
	'1.0' AS schemaversion, 
	'APPROVED' AS docstate, 
	null AS acctno, 
	ia.title AS accttitle, 
	null AS acctcode, 
	ia.defaultvalue, 
	CASE 
		WHEN ia.type = 'RPT_BASIC_INT' THEN 'RPT_BASICINT'
		WHEN ia.type = 'RPT_BASIC_INTPREV' THEN 'RPT_BASICPREVINT'
		WHEN ia.type = 'RPT_BASIC_PREV' THEN 'RPT_BASICPREV'
		WHEN ia.type = 'RPT_SEF_INT' THEN 'RPT_SEFINT'
		WHEN ia.type = 'RPT_SEF_INTPREV' THEN 'RPT_SEFPREVINT'
		WHEN ia.type = 'RPT_SEF_PREV' THEN 'RPT_SEFPREV'
		ELSE ia.type
	END AS systype, 
	n."objid" AS ngasid, 
	n.title AS ngastitle, 
	null AS ngassubacctid, 
	null AS ngassubaccttitle, 
	s."objid" AS sreid, 
	s.title AS sretitle, 
	null AS sresubacctid, 
	null AS sresubaccttitle, 
	fund_name AS fundid, 
	fund_name AS fundname, 
	null AS amounttype
FROM etracs_bayombong..incomeaccount ia
	LEFT JOIN etracs_bayombong..account n ON ia.acctid = n."objid" 
	LEFT JOIN etracs_bayombong..account s ON ia.sieacctid = s."objid" 
WHERE state = 'APPROVED';




/**********************************************************************
*
* COLLECTION TYPE
*
**********************************************************************/

DELETE FROM bayombong_etracs..collectiontype ;

INSERT INTO bayombong_etracs..collectiontype 
	("objid", schemaname, schemaversion, name, appcode, 
	payorrequired, 
	afid
	)
SELECT
	"objid", 
	'collectiontype:collectiontype' AS schemaname, 
	'1.0' AS schemaversion, 
	name, 
	CASE 
		WHEN appcode = 'BP' THEN 'business_tax'
		WHEN appcode = 'BPFR' THEN 'burial_permit'
		WHEN appcode = 'LCO' THEN 'cattle_ownership'
		WHEN appcode = 'LCT' THEN 'cattle_transfer'
		WHEN appcode = 'MLFR' THEN 'marriage_license'
		WHEN appcode = 'RPT' THEN 'real_property'
		ELSE 'general_collection'
	END AS	appcode, 
	0 AS payorrequired, 
	af AS afid
FROM etracs_bayombong..collectiontype;



/**********************************************************************
*
* AFINVENTORY( post only controls with balance )
*
**********************************************************************/

insert into bayombong_etracs..afinventory 
(
	"objid", schemaname, schemaversion, docstate, irafid, irafno, 
	iraftype, 
	afid, 
	aftype, 
	afunit, 
	stubfrom, 
	stubto, 
	qtyonhand, 
	qtyissued, 
	prefix, 
	suffix, 
	startseries, 
	endseries, 
	issuedfrom, 
	issuedto, 
	dtposted, 
	aflength, 
	currentstub, 
	stubprefix, 
	startserialno
)
SELECT 
	a."objid", 
	'afcontrol:afcontrol' AS schemaname, 
	'1.0' AS schemaversion, 
	'CLOSED' AS docstate, 
	'' AS irafid, 
	'' AS irafno, 
	'LGU' AS iraftype, 
	af_objid as afid, 
	'serial' AS aftype, 
	'STUB' AS afunit, 
	0 AS stubfrom, 
	0 AS stubto, 
	1 AS qtyonhand, 
	1 AS qtyissued, 
	a.prefix, 
	a.suffix, 
	a.startseries, 
	a.endseries, 
	a.startseries AS issuedfrom, 
	a.endseries  AS issuedto, 
	a.dtissued AS dtposted, 
	7 AS aflength, 
	0 AS currentstub, 
	null AS stubprefix, 
	a.startseries AS startserialno
FROM etracs_bayombong..afcontrol a
WHERE a.dtype = 'SerialAFControl' 
  AND a.currentseries <= a.endseries; 	



	
/**********************************************************************
*
* AFINVENTORYCREDIT 
*
**********************************************************************/
INSERT INTO bayombong_etracs..afinventorycredit 
	("objid", schemaname, schemaversion, docstate, afinventoryid, 
	irafid, 
	iraftype, 
	afid, 
	aftype, 
	afunit, 
	prefix, 
	suffix, 
	startseries, 
	endseries, 
	stubfrom, 
	stubto, 
	qtyissued, 
	irafno, 
	stubno, 
	balance, 
	aflength
	)
SELECT 
	a."objid", 
	'afinventorycredit' AS schemaname, 
	'1.0' AS schemaversion, 
	'OPEN' AS docstate, 
	a."objid" AS afinventoryid, 
	'' AS irafid, 
	'COLLECTOR' AS iraftype, 
	a.af_objid as afid, 
	'serial' AS aftype, 
	'STUB' AS afunit, 
	a.prefix, 
	a.suffix, 
	a.startseries, 
	a.endseries, 
	0 AS stubfrom, 
	0 AS stubto, 
	a.totalQtyIssued AS qtyissued, 
	NULL as irafno, 
	0 AS stubno, 
	a.endseries - a.currentseries + 1 AS balance, 
	7 AS aflength
FROM etracs_bayombong..afcontrol a
WHERE dtype ='SerialAFControl' 
  and a.currentseries <= a.endseries ;
	


/**********************************************************************
*
* CRAAF INVENTORY  
*
**********************************************************************/

insert into bayombong_etracs..craaf 
	("objid", schemaname, schemaversion, afinventoryid, afinventorycreditid, 
	craafyear, 
	craafmonth, 
	collectorid, 
	collectorname, 
	collectortitle, 
	afid, 
	beginqty, 
	beginfrom, 
	beginto, 
	receivedqty, 
	receivedfrom, 
	receivedto, 
	issuedqty, 
	issuedfrom, 
	issuedto, 
	canceledqty, 
	canceledfrom, 
	canceledto, 
	cancelreason, 
	endingqty, 
	endingfrom, 
	endingto, 
	stubno
	)
SELECT
	a."objid", 
	'craaf:craaf' AS schemaname, 
	'1.0' AS schemaversion, 
	a."objid" AS afinventoryid, 
	null AS afinventorycreditid, 
	YEAR( a.dtissued ) AS craafyear, 
	MONTH( a.dtissued ) AS craafmonth, 
	a.collectorid as collectorid, 
	case when u.middlename is null 
		then u.lastname + ', ' + u.firstname 
		else u.lastname + ', ' + u.firstname + ' ' + u.middlename
	end as collectorname, 
	a.collectortitle, 
	a.af_objid as afid, 
	a.totalqtyreceived AS beginqty, 
	a.startseries AS beginfrom, 
	a.endseries AS beginto, 
	null AS receivedqty, 
	null AS receivedfrom, 
	null AS  receivedto, 
	50 AS issuedqty, 
	a.startseries As issuedfrom, 
	a.endseries AS issuedto, 
	null AS canceledqty, 
	null AS canceledfrom, 
	NULL AS canceledto, 
	NULL AS cancelreason, 
	0 AS endingqty, 
	NULL AS endingfrom, 
	NULL AS endingto, 
	a.stub AS stubno
FROM etracs_bayombong..afcontrol a 
	inner join etracs_bayombong..sys_user u on a.collectorid = u."objid" 
WHERE a.currentseries <= a.endseries ;





/**********************************************************************
*
* CRAAF INVENTORY  CREDIT
*
**********************************************************************/

insert into bayombong_etracs..craaf 
	("objid", schemaname, schemaversion, afinventoryid, afinventorycreditid, 
	craafyear, 
	craafmonth, 
	collectorid, 
	collectorname, 
	collectortitle, 
	afid, 
	beginqty, 
	beginfrom, 
	beginto, 
	receivedqty, 
	receivedfrom, 
	receivedto, 
	issuedqty, 
	issuedfrom, 
	issuedto, 
	canceledqty, 
	canceledfrom, 
	canceledto, 
	cancelreason, 
	endingqty, 
	endingfrom, 
	endingto, 
	stubno
	)
SELECT
	'I' + a."objid" AS "objid", 
	'craaf:craaf' AS schemaname, 
	'1.0' AS schemaversion, 
	NULL AS afinventoryid, 
	a."objid" AS afinventorycreditid, 
	YEAR( a.dtissued ) AS craafyear, 
	MONTH( a.dtissued ) AS craafmonth, 
	a.collectorid, 
	case when u.middlename is null 
		then u.lastname + ', ' + u.firstname
		else u.lastname + ', ' + u.firstname + ' ' + u.middlename 
	end as collectorname, 
	a.collectortitle, 
	a.af_objid as afid, 
	a.totalqtyreceived AS beginqty, 
	a.startseries AS beginfrom, 
	a.endseries AS beginto, 
	a.totalqtyreceived AS receivedqty, 
	a.startseries AS receivedfrom, 
	a.endseries AS  receivedto, 
	CASE WHEN a.currentseries = a.startseries THEN null ELSE a.currentseries - a.startseries END AS  issuedqty, 
	CASE WHEN a.currentseries = a.startseries THEN NULL ELSE a.startseries END As issuedfrom, 
	CASE WHEN a.currentseries = a.startseries THEN NULL ELSE a.currentseries - 1 END AS issuedto, 
	null AS canceledqty, 
	null AS canceledfrom, 
	NULL AS canceledto, 
	NULL AS cancelreason, 
	a.endseries - a.currentseries + 1 AS endingqty, 
	a.currentseries AS endingfrom, 
	a.endseries AS endingto, 
	a.stub AS stubno
FROM etracs_bayombong..afcontrol a
	inner join etracs_bayombong..sys_user u on a.collectorid = u."objid" 
WHERE a.dtype ='SerialAFControl' 
  and a.currentseries <= a.endseries ;





/**********************************************************************
*
* AFCONTROL 
*
**********************************************************************/

insert into bayombong_etracs..afcontrol 
(
	"objid", schemaname, schemaversion, docstate, active, 
	mode, 
	afinventorycreditid, 
	dtissued, 
	collectorid, 
	collectorname, 
	collectortitle, 
	stubno, 
	aftype, 
	afid, 
	qtyreceived, 
	startseries, 
	endseries, 
	currentseries, 
	beginseries, 
	beginqty, 
	qtyissued, 
	issuedfrom, 
	issuedto, 
	balance, 
	prefix, 
	suffix, 
	serieslength, 
	receiptformat, 
	cancelledseries, 
	txndate
	)
SELECT
	a."objid", 
	'afcontrol:afcontrol' AS schemaname, 
	'1.0' AS schemaversion, 
	'APPROVED' AS docstate, 
	0 AS active, 
	case 
		when a.mode = 0 then 'ONLINE' 
		when a.mode = 1 then 'OFFLINE' 
		else 'CAPTURE'
	end AS mode, 
	a."objid" AS afinventorycreditid, 
	a.dtissued AS dtissued, 
	a.collectorid as collectorid, 
	case when u.middlename is null 
		then u.lastname + ', ' + u.firstname
		else u.lastname + ', ' + u.firstname + ' ' + u.middlename
	end as collectorname, 
	a.collectortitle as collectortitle, 
	case when stub is null then '-' else stub end AS stubno, 
	'serial' as aftype, 
	a.af_objid as afid, 
	a.totalqtyreceived AS qtyreceived, 
	a.startseries, 
	a.endseries, 
	a.currentseries, 
	a.beginseries, 
	a.endseries - a.beginseries + 1 AS beginqty, 
	CASE WHEN a.totalqtyissued = 0 THEN null ELSE a.totalqtyissued END AS qtyissued,
	CASE WHEN a.totalqtyissued = 0 THEN null ELSE a.beginseries END AS issuedfrom,
	CASE WHEN a.totalqtyissued = 0 THEN null ELSE a.currentseries - 1 END AS issuedoto,
	a.totalQtyOnHand AS balance, 
	a.prefix, 
	a.suffix, 
	7 AS serieslength, 
	null AS receiptformat, 
	null as cancelledseries, 
	a.dtissued as txndate
FROM etracs_bayombong..afcontrol a
	inner join etracs_bayombong..sys_user u on a.collectorid = u."objid" 
WHERE a.dtype= 'SerialAFControl' 
  and a.currentseries <= a.endseries ;



/**********************************************************************
*
* RECEIPT  
*
**********************************************************************/
INSERT INTO bayombong_etracs..receipt 
	("objid", schemaname, schemaversion, docstate, doctype, 
	opener, 
	collectorid, 
	remittanceid, 
	remittanceno, 
	remittancedate, 
	info, 
	items, 
	payments, 
	extended, 
	voided, 
	voidreason
)	
SELECT
	r."objid", 
	'receipt:receipt' AS schemaname, 
	'1.0' AS schemaversion, 
	CASE WHEN r.remittanceid IS NOT NULL THEN 'CLOSED' ELSE 'OPEN' END AS docstate, 
	
	CASE WHEN r.dtype = 'BPReceipt' THEN 'BUSINESS_TAX'
	     WHEN r.dtype = 'CorporateCTCReceipt' THEN 'CTCC'
		 WHEN r.dtype = 'IndividualCTCReceipt' THEN 'CTCI'
		 WHEN r.dtype = 'LargeCattleOwnershipReceipt' THEN 'CATTLE_OWNERSHIP'
		 WHEN r.dtype = 'MiscReceipt' THEN 'MISC'
		 WHEN r.dtype = 'RPTReceipt' THEN 'RPT'
		 WHEN r.dtype = 'BurialPermitFeeReceipt' THEN 'BURIAL_PERMIT'
		 WHEN r.dtype = 'CashTicketReceipt' THEN 'CASHTICKET'
		 WHEN r.dtype = 'LargeCattleTransferReceipt' THEN 'CATTLE_TRANSFER'
		 WHEN r.dtype = 'MarriageLicenseFeeReceipt' THEN 'MARRIAGE'
	END as doctype, 
	
	CASE WHEN r.dtype = 'BPReceipt' THEN 'tc:business_tax'
	     WHEN r.dtype = 'CorporateCTCReceipt' THEN 'tc:ctc_corporate'
		 WHEN r.dtype = 'IndividualCTCReceipt' THEN 'tc:ctc_individual'
		 WHEN r.dtype = 'LargeCattleOwnershipReceipt' THEN 'tc:cattle_ownership'
		 WHEN r.dtype = 'MiscReceipt' THEN 'tc:general_collection'
		 WHEN r.dtype = 'RPTReceipt' THEN 'tc:real_property'
		 WHEN r.dtype = 'BurialPermitFeeReceipt' THEN 'tc:burial_permit'
		 WHEN r.dtype = 'CashTicketReceipt' THEN 'tc:cash_ticket'
		 WHEN r.dtype = 'LargeCattleTransferReceipt' THEN 'tc:cattle_transfer'
		 WHEN r.dtype = 'MarriageLicenseFeeReceipt' THEN 'tc:marriage_license'
	END as opener, 
	
	r.collectorid, 
	r.remittanceid, 
	rem.docno as remittanceno, 
	rem.dateposted as remittancedate, 
	'' AS info, 
	'' AS items, 
	'' AS payments, 
	'' AS extended, 
	CASE WHEN vr."objid" IS NULL THEN 0 ELSE 1 END AS voided, 
	vr.reason AS voidreason 
FROM etracs_bayombong..receipt r
	LEFT JOIN etracs_bayombong..voidreceipt vr ON r."objid" = vr.receipt_objid 
	LEFT join etracs_bayombong..collectionremittance  rem on r.remittanceid = rem."objid" ;



/* *********************************************************************
*
* RECEIPT  ITEM 
*
********************************************************************* */
INSERT INTO bayombong_etracs..receiptitem 
	("objid", receiptid, acctid, acctno, accttitle, fundid, 
	fundname, 
	amount, 
	remarks, 
	extended, 
	refid
	)
SELECT
	ri."objid", 
	ri.parentid AS receiptid, 
	ri.acctid, 
	ia.acctno, 
	ia.title AS accttitle, 
	ia.fund_name AS fundid, 
	ia.fund_name AS fundname, 
	ri.amount, 
	ri.remarks, 
	'[:]' AS extended, 
	NULL AS refid
FROM etracs_bayombong..receiptitem ri 
	INNER JOIN etracs_bayombong..incomeaccount ia ON ri.acctid = ia."objid" ;




/* *********************************************************************
*
* CASH PAYMENT ITEM 
*
********************************************************************* */

INSERT INTO bayombong_etracs..paymentitem 
	("objid", receiptid, paytype, particulars, amount, extended)
SELECT
	p."objid", 
	p.parentid AS receiptid, 
	'CASH' AS paytype, 
	'CASH PAYMENT' AS particulars, 
	p.amount, 
	'[:]' AS extended
FROM etracs_bayombong..paymentmethod p
WHERE p.dtype = 'CashPaymentMethod';



/* *********************************************************************
*
* CHECK PAYMENT ITEM 
*
********************************************************************* */

INSERT INTO bayombong_etracs..paymentitem 
	("objid", receiptid, paytype, particulars, amount, extended)
SELECT
	p."objid", 
	p.parentid AS receiptid, 
	'CHECK' AS paytype, 
	('CHECK NO.: '+ p.checkno+ '  DATE: '+ 
	REPLACE(CONVERT(varchar(10), p.checkdate, 102), '.', '-')+ '  BANK: '+ b.code ) AS particulars, 
	amount, 
	('['+ 'bank:'+ '"'+ b.code+'",checkdate:"'+ 
	REPLACE(CONVERT(varchar(10), p.checkdate, 102), '.', '-')+ '",checkno:"'+ p.checkno+ '"]') AS extended
FROM etracs_bayombong..paymentmethod p
	left join etracs_bayombong..bank b on p.bankid = b."objid" 
where p.dtype = 'CheckPaymentMethod';




/**********************************************************************
*
* BUSINES_TAX RECEIPT EXTENDED 
*
**********************************************************************/

create table bayombong_etracs..xbpreceiptextended
(
	receiptid varchar(50),
	qtr int,
	applicationid varchar(50),
	businessaddress varchar(100),
	tradename varchar(100),
	applicationlastmodified varchar(50),
	year int,
	businessid varchar(50)
);



INSERT INTO bayombong_etracs..xbpreceiptextended (
	receiptid, 
	qtr, 
	applicationid, 
	businessaddress, 
	tradename, 
	applicationlastmodified, 
	[year], 
	businessid 
)
SELECT 
	r."objid" AS receiptid,
	CASE WHEN ba.type = 'NEW' THEN datepart(qq, a.dtapplied)  ELSE 4 END AS qtr,
	a."objid" AS applicationid,
	b.businessaddress,
	b.tradename,
	NULL AS applicationlastmodified,
	a.year,
	b."objid" AS businessid 
FROM etracs_bayombong..receipt r
	INNER JOIN etracs_bayombong..business b ON r.businessid = b."objid" 
	INNER JOIN etracs_bayombong..abstractbpapplication a ON b.applicationid = a."objid"
	INNER JOIN etracs_bayombong..bpapplication ba ON a."objid"= ba."objid"
WHERE r.dtype = 'BPReceipt';



UPDATE bayombong_etracs..receipt 
	SET
	bayombong_etracs..receipt.extended = '[qtr:'+ convert(varchar(4),e.qtr)+ ',applicationid:"'
				+ e.applicationid+ '",'+
				'businessaddress:"'+ e.businessaddress+ '",'+
				'tradename:"'+ e.tradename+ '",'+
				'applicationlastmodified:"'+ ISNULL(e.applicationlastmodified,'')+ '",'+
				'year:'+ REPLACE(CONVERT(varchar(10),  e.year, 102), '.', '-')+ ','+
				'businessid:"'+ e.businessid+ '"]' 
FROM bayombong_etracs..receipt r, 
	bayombong_etracs..xbpreceiptextended e 
WHERE r."objid" = e.receiptid AND r.doctype = 'BUSINESS_TAX';

DROP TABLE bayombong_etracs..xbpreceiptextended;

	

/* *********************************************************************
*
* RECEIPT LIST 
*
********************************************************************* */
alter table bayombong_etracs..receiptlist alter column payorname varchar(800);
alter table bayombong_etracs..receiptlist alter column paidby varchar(800);
alter table bayombong_etracs..receiptlist alter column payoraddress varchar(255) null;
alter table bayombong_etracs..receiptlist alter column paidbyaddress varchar(255) null;
alter table bayombong_etracs..receiptlist alter column serialno varchar(255);
alter table bayombong_etracs..receiptlist alter column voidreason varchar(255);


INSERT INTO bayombong_etracs..receiptlist 
	("objid", docstate, doctype, opener, remittanceid, remittanceno, 
	remittancedate, 
	txndate, 
	dtposted, 
	iyear, 
	iqtr, 
	imonth, 
	iday, 
	mode, 
	afid, 
	afcontrolid, 
	serialno, 
	stubno, 
	collectiontypeid, 
	collectiontype, 
	collectorid, 
	collectorname, 
	collectortitle, 
	payorid, 
	payorname, 
	payoraddress, 
	paidby, 
	paidbyaddress, 
	amount, 
	cash, 
	otherpayment, 
	voided, 
	voidreason, 
	postcaptureid
	)
SELECT 
	r1."objid", 
	CASE WHEN r1.remittanceid IS NOT NULL THEN 'CLOSED' ELSE 'OPEN' END AS docstate, 
	
	
	CASE WHEN r1.dtype = 'BPReceipt' THEN 'BUSINESS_TAX'
	     WHEN r1.dtype = 'CorporateCTCReceipt' THEN 'CTCC'
		 WHEN r1.dtype = 'IndividualCTCReceipt' THEN 'CTCI'
		 WHEN r1.dtype = 'LargeCattleOwnershipReceipt' THEN 'CATTLE_OWNERSHIP'
		 WHEN r1.dtype = 'MiscReceipt' THEN 'MISC'
		 WHEN r1.dtype = 'RPTReceipt' THEN 'RPT'
		 WHEN r1.dtype = 'BurialPermitFeeReceipt' THEN 'BURIAL_PERMIT'
		 WHEN r1.dtype = 'CashTicketReceipt' THEN 'CASHTICKET'
		 WHEN r1.dtype = 'LargeCattleTransferReceipt' THEN 'CATTLE_TRANSFER'
		 WHEN r1.dtype = 'MarriageLicenseFeeReceipt' THEN 'MARRIAGE'
	END as doctype, 
	
	CASE WHEN r1.dtype = 'BPReceipt' THEN 'tc:business_tax'
	     WHEN r1.dtype = 'CorporateCTCReceipt' THEN 'tc:ctc_corporate'
		 WHEN r1.dtype = 'IndividualCTCReceipt' THEN 'tc:ctc_individual'
		 WHEN r1.dtype = 'LargeCattleOwnershipReceipt' THEN 'tc:cattle_ownership'
		 WHEN r1.dtype = 'MiscReceipt' THEN 'tc:general_collection'
		 WHEN r1.dtype = 'RPTReceipt' THEN 'tc:real_property'
		 WHEN r1.dtype = 'BurialPermitFeeReceipt' THEN 'tc:burial_permit'
		 WHEN r1.dtype = 'CashTicketReceipt' THEN 'tc:cash_ticket'
		 WHEN r1.dtype = 'LargeCattleTransferReceipt' THEN 'tc:cattle_transfer'
		 WHEN r1.dtype = 'MarriageLicenseFeeReceipt' THEN 'tc:marriage_license'
	END as opener, 
	
	r1.remittanceid, 
	rem.docno as remittanceno, 
	rem.dateposted as remittancedate, 
	r1.txndate, 
	r1.dtposted, 
	YEAR( r1.txndate) AS iyear, 
	datepart(qq, r1.txndate ) AS iqtr, 
	MONTH( r1.txndate ) AS imonth, 
	DAY( r1.txndate ) AS iday, 
	'ONLINE' AS mode, 
	a.af_objid as afid, 
	a."objid" AS afcontrolid, 
	r1.serialno, 
	ISNULL(a.stub,'-') AS stubno, 
	r1.collectiontypeid, 
	ct.name AS collectiontype, 
	r1.collectorid as collectorid, 
	case when u.middlename is null 
		then u.lastname+ ', '+ u.firstname 
		else u.lastname+ ', '+ u.firstname+ ' '+ u.middlename
	end as collectorname, 
	r1.collectortitle, 
	r1.payerid AS payorid, 
	r1.payername AS payorname, 
	r1.payeraddress AS payoraddress, 
	ISNULL(r1.paidby, r1.payername) AS paidby, 
	r1.payeraddress AS paidbyaddress, 
	r1.amount, 
	ISNULL((SELECT SUM(p.amount) FROM etracs_bayombong..paymentmethod p WHERE dtype = 'CashPaymentMethod' and parentid = r1."objid" ),0.0) AS cash, 
	ISNULL((SELECT SUM(p.amount) FROM etracs_bayombong..paymentmethod p WHERE dtype = 'CheckPaymentMethod' and parentid = r1."objid" ),0.0) AS otherpayment,
	CASE WHEN vr."objid" IS NULL THEN 0 ELSE 1 END voided, 
	vr.reason AS voidreason, 
	null AS postcaptureid
FROM etracs_bayombong..receipt r1
	LEFT JOIN etracs_bayombong..afcontrol a ON r1.afissuedid = a."objid" 
	LEFT JOIN etracs_bayombong..voidreceipt vr ON r1."objid" = vr.receipt_objid 
	LEFT join etracs_bayombong..collectionremittance  rem on r1.remittanceid = rem."objid" 
	left JOIN etracs_bayombong..collectiontype ct on r1.collectiontypeid = ct."objid" 
	left join etracs_bayombong..sys_user u on a.collectorid = u."objid" ;

	


/* *********************************************************************
*
* REMITTANCE
*
********************************************************************* */

insert into bayombong_etracs..remittance 
	("objid", schemaname, schemaversion, info, docstate, dtposted, 
	liquidationid, 
	liquidationno, 
	liquidationdate, 
	liquidatingofficerid, 
	collectorid
	)
SELECT
	r."objid", 
	'remittance:remittance' AS schemaname, 
	'1.0' AS schemaversion, 
	'[:]' AS info, 
	CASE WHEN r.liquidationid IS NULL THEN 'OPEN' ELSE 'CLOSED' END AS docstate, 
	r.dateposted AS dtposted, 
	r.liquidationid, 
	l.docno as liquidationno, 
	l.dtposted as liquidationdate, 
	r.liquidatingofficerid as liquidatingofficerid, 
	r.collectorid as collectorid
FROM etracs_bayombong..collectionremittance r 
	left join etracs_bayombong..liquidation l on r.liquidationid = l."objid" ;


alter table bayombong_etracs..af alter column description varchar(255);
alter table bayombong_etracs..af alter column aftype varchar(255);

insert into bayombong_etracs..af (
	"objid", 
	schemaname, 
	schemaversion, 
	docstate, 
	description, 
	aftype, 
	unit, 
	pcsperunit, 
	denomination, 
	serieslength
)
select 
	"objid", 
	'af:af' as schemaname, 
	'1.0' as schemaversion, 
	'APPROVED' as docstate, 
	description, 
	lower(type) as aftype, 
	'STUB' as unit, 
	50 as pcsperunit, 
	0 as denomination, 
	7 as serieslength
from etracs_bayombong..af ;



/**********************************************************************
*
* REMOVE FOREIGN KEY FOR AFCONTROL 
*
**********************************************************************/
INSERT INTO bayombong_etracs..remittedform 
	("objid", afcontrolid, afid, receivedfrom, receivedto, 
	receivedqty, 
	beginfrom, 
	beginto, 
	beginqty, 
	issuedfrom, 
	issuedto, 
	issuedqty, 
	endingfrom, 
	endingto, 
	endingqty, 
	remittanceid, 
	stubno, 
	aftype
	)
SELECT 
	r."objid", 
	r.afissuedid AS afcontrolid, 
	a.af_objid as afid, 
	r.receivedfrom, 
	r.receivedto, 
	r.receivedqty, 
	r.beginfrom, 
	r.beginto, 
	r.beginqty, 
	r.issuedfrom, 
	r.issuedto, 
	r.issuedqty, 
	r.endingfrom, 
	r.endingto, 
	r.endingqty, 
	r.parentid AS remittanceid, 
	isnull(a.stub,'-') AS stubno, 
	'serial' AS aftype 
FROM etracs_bayombong..remittedform r
	INNER JOIN etracs_bayombong..afcontrol a ON r.afissuedid = a."objid";


INSERT INTO bayombong_etracs..remittancelist 
	("objid", docstate, txnno, txndate, collectorname, amount, 
	collectorid, 
	collectortitle, 
	totalcash, 
	totalotherpayment, 
	liquidationid, 
	txntimestamp, 
	liquidationno, 
	liquidationdate, 
	liquidatingofficerid, 
	liquidatingofficername, 
	liquidatingofficertitle
	)
SELECT
	r."objid", 
	CASE WHEN r.liquidationid IS NULL THEN 'OPEN' ELSE 'CLOSED' END AS docstate, 
	r.docno AS txnno, 
	r.dateposted AS txndate, 
	case when c.middlename is null 
		then c.firstname+ ' '+ c.lastname
		else c.firstname+ ' '+ c.middlename+ ' '+ c.lastname
	end as 	collectorname, 
	r.amount, 
	r.collectorid as collectorid, 
	r.collectortitle, 
	r.amount - r.totalchecks AS totalcash, 
	r.totalchecks AS totalotherpayment, 
	r.liquidationid, 
	
	CONVERT(varchar(4),YEAR(r.dateposted))+ 
	CONVERT(varchar(1),datepart(qq, r.dateposted))+
	CASE WHEN MONTH(r.dateposted) < 10 
		THEN '0'+ CONVERT(varchar(1), MONTH(r.dateposted)) 
		ELSE CONVERT(varchar(2), MONTH(r.dateposted)) END + 	
	CASE WHEN DAY(r.dateposted) < 10
		THEN '0' + CONVERT(varchar(1), DAY(r.dateposted)) 
		ELSE CONVERT(varchar(2), DAY(r.dateposted)) END
	AS txntimestamp, 	
	l.docno as liquidationno, 
	l.dtposted as liquidationdate, 
	r.liquidatingofficerid as liquidatingofficerid, 
	case when lq.middlename is null 
		then lq.firstname+ ' '+ lq.lastname
		else lq.firstname+ ' '+ lq.middlename+ ' '+ lq.lastname
	end as 	liquidatingofficername, 
	l.liquidatingofficertitle as liquidatingofficertitle
FROM etracs_bayombong..collectionremittance r
	left join etracs_bayombong..liquidation l on r.liquidationid = l."objid" 
	left join etracs_bayombong..sys_user c on r.collectorid = c."objid" 
	left join etracs_bayombong..sys_user lq on r.liquidatingofficerid = lq."objid" ;


/**********************************************************************
*
* LIQUIDATION 
*
**********************************************************************/
INSERT INTO bayombong_etracs..liquidation 
	("objid", schemaname, schemaversion, docstate, dtposted, 
	info, 
	depositid, 
	dtdeposited,
	opener
	)
SELECT
	"objid", 
	'liquidation:liquidation' AS schemaname, 
	'1.0' AS schemaversion, 
	'CLOSED' AS docstate, 
	dtposted, 
	'[:]' AS info, 
	NULL AS depositid, 
	NULL AS dtdeposited,
	'single' as opener
FROM etracs_bayombong..liquidation ;	



alter table bayombong_etracs..liquidationlist alter column liquidatingofficertitle varchar(100) not null;

INSERT INTO bayombong_etracs..liquidationlist 
	("objid", docstate, txnno, txndate, iyear, iqtr, imonth, 
	iday, 
	txntimestamp, 
	liquidatingofficerid, 
	liquidatingofficername, 
	liquidatingofficertitle, 
	amount, 
	totalcash, 
	totalotherpayment, 
	depositid, 
	dtdeposited, 
	depositedbyid, 
	depositedbyname, 
	depositedbytitle,
	opener
	)
SELECT
	l."objid", 
	'CLOSED' AS docstate, 
	l.docno AS txnno, 
	l.dtposted AS txndate, 
	YEAR(l.dtposted) AS iyear, 
	datepart(qq, l.dtposted) AS iqtr, 
	MONTH(l.dtposted) AS imonth, 
	DAY(l.dtposted) AS iday, 
	CONVERT( varchar(4), YEAR(l.dtposted)) +  
	CONVERT( varchar(1), datepart(qq, l.dtposted)) + 
	
	CASE WHEN MONTH(l.dtposted) < 10 
		THEN '0' + CONVERT(varchar(1), MONTH(l.dtposted)) 
		ELSE CONVERT(varchar(2), MONTH(l.dtposted)) END +
	CASE WHEN DAY(l.dtposted) < 10 
		THEN '0' + CONVERT(varchar(1), DAY(l.dtposted)) 
		ELSE CONVERT(varchar(2),DAY(l.dtposted)) END
	 AS txntimestamp, 
	l.liquidatingofficerid, 
	case when U.middlename is null 
		then u.firstname+ ' '+ u.lastname
		else u.firstname+ ' '+ u.middlename+ ' '+ u.lastname
	end as 	liquidatingofficername, 
	l.liquidatingofficertitle, 
	l.amount, 
	(l.amount - l.totalchecks) AS totalcash, 
	l.totalchecks AS totalotherpayment, 
	NULL AS depositid, 
	NULL AS dtdeposited, 
	NULL AS depositedbyid, 
	NULL AS depositedbyname, 
	NULL AS depositedbytitle,
	'single' as opener
FROM etracs_bayombong..liquidation l
	inner join etracs_bayombong..sys_user u on l.liquidatingofficerid = u."objid" ;





/**********************************************************************
*
* REVENUE 
*
**********************************************************************/
alter table bayombong_etracs..revenue alter column collectortitle varchar(50) not null;
alter table bayombong_etracs..revenue alter column accttitle varchar(255);
alter table bayombong_etracs..revenue alter column acctno varchar(255);
alter table bayombong_etracs..revenue alter column payorname varchar(800);
alter table bayombong_etracs..revenue alter column payoraddress varchar(255);


INSERT INTO bayombong_etracs..revenue 
	("objid", docstate, remittanceid, remittanceno, remittancedate, 
	remittancetimestamp, 
	liquidationid, 
	liquidationno, 
	liquidationdate, 
	liquidationtimestamp, 
	depositid, 
	depositno, 
	depositdate, 
	deposittimestamp, 
	collectorid, 
	collectorname, 
	collectortitle, 
	receipttype, 
	receiptid, 
	receiptdate, 
	receiptamount, 
	receiptitemid, 
	afid, 
	afcontrolid, 
	stubno, 
	serialno, 
	payorname, 
	payoraddress, 
	acctid, 
	acctno, 
	accttitle, 
	fundid, 
	fundname, 
	ngasid, 
	sreid, 
	amount, 
	voided
	)
SELECT
	ri."objid", 
	CASE 
		WHEN rem.liquidationid IS NOT NULL THEN 'LIQUIDATED' 
		ELSE 'REMITTED'
	END AS docstate, 
	rl.remittanceid, 
	rl.remittanceno, 
	rl.remittancedate, 
	CONVERT( varchar(4), YEAR(rl.remittancedate)) +  
	CONVERT( varchar(1), datepart(qq, rl.remittancedate)) +  
	CASE WHEN MONTH(rl.remittancedate) < 10 
		THEN '0' + CONVERT(varchar(1), MONTH(rl.remittancedate)) 
		ELSE CONVERT(varchar(2), MONTH(rl.remittancedate)) END +
	CASE WHEN DAY(rl.remittancedate) < 10 
		THEN '0' + CONVERT( VARCHAR(1), DAY(rl.remittancedate)) 
		ELSE CONVERT( VARCHAR(2), DAY(rl.remittancedate))
	END AS remittancetimestamp, 
	
	rem.liquidationid, 
	rem.liquidationno, 
	rem.liquidationdate, 
	
	CONVERT(varchar(4),  YEAR(rem.liquidationdate)) +  
	CONVERT( varchar(1), datepart(qq, rem.liquidationdate)) + 
	CASE WHEN MONTH(rem.liquidationdate) < 10 
		THEN '0' + CONVERT( VARCHAR(1), MONTH(rem.liquidationdate)) 
		ELSE CONVERT( VARCHAR(2), MONTH(rem.liquidationdate)) END + 
	CASE WHEN DAY(rem.liquidationdate) < 10 
		THEN '0' + CONVERT( varchar(1), DAY(rem.liquidationdate)) 
		ELSE CONVERT( varchar(2),DAY(rem.liquidationdate)) END
	AS liquidationtimestamp, 
	
	NULL AS depositid, 
	NULL AS depositno, 
	NULL AS depositdate, 
	NULL AS deposittimestamp, 
	rl.collectorid, 
	rl.collectorname, 
	rl.collectortitle, 
	'MISC' AS receipttype, 
	rl."objid" AS receiptid, 
	rl.txndate AS receiptdate, 
	rl.amount AS receiptamount, 
	ri."objid" AS receiptitemid, 
	rl.afid AS afid, 
	rl."objid" AS afcontrolid, 
	rl.stubno AS stubno, 
	rl.serialno AS serialno, 
	rl.payorname AS payorname, 
	rl.payoraddress AS payoraddress, 
	ri.acctid AS acctid, 
	ri.acctno as acctno, 
	ri.accttitle as accttitle, 
	ri.fundid AS fundid, 
	ri.fundname AS fundname, 
	ia.ngasid AS ngasid, 
	ia.sreid AS sreid, 
	ri.amount, 
	rl.voided
FROM bayombong_etracs..receiptlist rl
	INNER JOIN bayombong_etracs..receiptitem ri on rl."objid" = ri.receiptid 
	LEFT JOIN bayombong_etracs..remittancelist rem on rl.remittanceid = rem."objid"
	LEFT JOIN bayombong_etracs..incomeaccount ia on ri.acctid = ia."objid" 
WHERE rl.remittanceid is not null	;
	
	

insert into bayombong_etracs..fund 
	("objid", schemaname, schemaversion, docstate, fund, subfund, 
	fundname
	)
select
	name as "objid", 
	'fund' as schemaname, 
	'1.0' as schemaversion, 
	'APPROVED' AS docstate, 
	name as fund, 
	name as subfund, 
	name as fundname
from etracs_bayombong..fund;

update r  
	set
	info = '[' + 
	'mode:"'+ isnull(rl.mode,'')+ '",'+
	'afid:"'+ isnull(rl.afid,'')+ '",'+
	'aftype:"serial",'+
	'afcontrolid:"'+ isnull(rl.afcontrolid,'')+ '",'+
	'series:'+ 
	CASE WHEN rl.serialno is not null 
		THEN
			CONVERT(varchar(50), rl.serialno) + ',' 
		ELSE
			'null,' 
	END +
	'serialno:"'+ isnull(rl.serialno,'')+ '",'+
	
	'stubno:"'+ isnull(rl.stubno,'')+ '",'+
	'collectiontypeid:"'+ isnull(rl.collectiontypeid,'')+ '",'+
	'collectiontype:"'+ isnull(rl.collectiontype,'')+ '",'+
	'payorrequired:0,'+
	'collectorid:"'+ isnull(rl.collectorid,'')+ '",'+
	'collectorname:"'+ isnull(rl.collectorname,'')+ '",'+
	'collectortitle:"'+ isnull(rl.collectortitle,'')+ '",'+
	
	'amount:'+ convert( varchar(100), convert( decimal(10,2), rl.amount)) + ','+
	'totalpayment:'+ convert( varchar(100), convert( decimal(10,2), rl.amount)) + ','+
	'cash:'+ convert( varchar(100), convert( decimal(10,2), rl.cash)) + ','+
	'otherpayment:'+ convert( varchar(100), convert( decimal(10,2), rl.otherpayment)) + ',' +
	'change:0,'+
	'paidby:"'+ rl.paidby+ '",'+
	'paidbyaddress:"'+ rl.paidbyaddress+ '",'+ 
	'dtposted:"'+ REPLACE(CONVERT(varchar(10), rl.dtposted, 102), '.', '-') + '",' +
	'txndate:"'+ REPLACE(CONVERT(varchar(10), rl.txndate, 102), '.', '-')+ '",' +
	'payorid:"'+ isnull(rl.payorid,'')+ '",' +
	'payorname:"'+ isnull(rl.payorname,'')+ '",' +
	'payoraddress:"'+ isnull(rl.payoraddress,'')+ '"]' 
from 
   bayombong_etracs..receipt r, 
   bayombong_etracs..receiptlist rl 	
where r.objid = rl.objid;
  

update bayombong_etracs..receipt
set payments = '[[paytype:"CASH",particulars:"CASH PAYMENT",amount:'+
	CONVERT( varchar(100), convert(decimal(10,2), p.amount))
	+  ']]'
from 
bayombong_etracs..receipt r, bayombong_etracs..paymentitem p     
where r."objid" = p.receiptid  
  and len( isnull( CONVERT(varchar(255), r.payments) ,'') ) = 0 
  and p.paytype = 'cash';


update  bayombong_etracs..receipt 
	set payments = 
	'[[paytype:"CHECK",particulars:"' +
	 p.particulars + '",amount:' +
	 convert( varchar(100), convert( decimal(10,2), p.amount ) ) + 
	 + ',' +  
	 replace( replace( convert(varchar(8000), p.extended), '[',''), ']','') + ']]'
from
bayombong_etracs..receipt r, bayombong_etracs..paymentitem p
where r."objid" = p.receiptid 
  and len( isnull( CONVERT(varchar(255), r.payments) ,'') ) = 0 
  and p.paytype = 'check';
  
alter table bayombong_etracs..receipt alter column items text null;

update bayombong_etracs..receipt 
	set items =  '[' + 
			stuff((
				select
				N', ' + 
				'['+
				'acct:null,', 
				'acctid:"', isnull(ri.acctid,'') + '",' +
				'acctno:null,' + 
				'accttitle:"' + isnull(ri.accttitle,'') +  '",' + 
				'fundid:"' + isnull(ri.fundid,'') +  '",' + 
				'fundname:"' + isnull(ri.fundname,'') +  '",' + 
				'amount:' + convert( varchar(100), convert(decimal(10,2), ri.amount))+']'
			from bayombong_etracs..receiptitem ri
			where ri.receiptid = r."objid" 
		    FOR XML PATH(''),TYPE).value('text()[1]','nvarchar(max)'),1,2,N''
		    ) + ']'		    
FROM bayombong_etracs..receipt  r 



update bayombong_etracs..account set charttype = 'NGAS' where "objid" like 'NGAS%';

update bayombong_etracs..incomeaccount 
set
	acctcode = a1.acctno 
from	
bayombong_etracs..incomeaccount a2, 
etracs_bayombong..incomeaccount a1 	
where a2."objid" = a1."objid"
collate Latin1_General_CI_AS ;

-- i dont know what to do this. arbitrary long number is used.
update bayombong_etracs..account set 
	pathbytitle = substring(pathbytitle,6, 1000) 
where pathbytitle like 'null/%';

  

update bayombong_etracs..liquidation set opener = 'single';
  

/*========================================================================================
//
//  MIGRATE LiquidationRCD records 
//
========================================================================================*/


/* ===========================================================================
* insert liquidationrcd record for "single" type liquidation
* that have no equivalent liquidationrcd entry which is possible
* for liquidations before the "multi" type was implemented
=========================================================================== */

alter table bayombong_etracs..liquidationrcd alter column cashierid varchar(50) null;
alter table bayombong_etracs..liquidationrcd alter column cashiername varchar(100) null;
alter table bayombong_etracs..liquidationrcd alter column cashiertitle varchar(50) null;

insert into bayombong_etracs..liquidationrcd (
	"objid", 
	docstate, 
	schemaname, 
	schemaversion, 
	liquidationid, 
	liquidationno, 
	liquidationdate, 
	lqofficerid, 
	lqofficername, 
	lqofficertitle, 
	fundid, 
	fundname, 
	cashierid, 
	cashiername, 
	cashiertitle, 
	cash, 
	noncash, 
	amount, 
	denominations, 
	noncashpayments, 
	depositid, 
	dtdeposited
)
select 
	ll."objid" + '-' + ia.fundname as "objid", 
	'CLOSED' as docstate, 
	'liquidationrcd' as schemaname, 
	'1.0' as schemaversion, 
	ll."objid" as liquidationid, 
	ll.txnno as liquidationno, 
	ll.txndate as liquidationdate, 
	ll.liquidatingofficerid as lqofficerid, 
	ll.liquidatingofficername as lqofficername, 
	ll.liquidatingofficertitle as lqofficertitle, 
	ia.fundid, 
	ia.fundname, 
	ll.depositedbyid as cashierid, 
	ll.depositedbyname as cashiername, 
	ll.depositedbytitle as cashiertitle, 
	SUM(ri.amount) as cash, 
	0.0 as noncash, 
	SUM(ri.amount) as amount, 
	'[[:]]' as denominations, 
	'[]' as noncashpayments, 
	ll.depositid, 
	ll.dtdeposited
from bayombong_etracs..liquidationlist ll
	inner join bayombong_etracs..liquidation lq on ll."objid" = lq."objid" 
	inner join bayombong_etracs..remittancelist rl on ll."objid" = rl.liquidationid 
	inner join bayombong_etracs..receiptlist r on rl."objid" = r.remittanceid
	inner join bayombong_etracs..receiptitem ri on r."objid" = ri.receiptid
	inner join bayombong_etracs..incomeaccount ia on ri.acctid = ia."objid" 
where not exists(select * from bayombong_etracs..liquidationrcd where liquidationid = ll."objid" )
group by ll."objid", ia.fundid, ia.fundname, ll.txnno, ll.txndate,
ll.liquidatingofficerid,ll.liquidatingofficername, ll.liquidatingofficertitle,
ll.depositedbyid,ll.depositedbyname,ll.depositedbytitle,ll.depositid,ll.dtdeposited;


/* ===========================================================================
* update the receiptitem.liquidationrcdid field 
=========================================================================== */
update  bayombong_etracs..receiptitem
set liquidationrcdid = rl.liquidationid +  '-' + ia.fundname	
from 
bayombong_etracs..receiptitem ri, 
bayombong_etracs..receiptlist r, 
bayombong_etracs..remittancelist rl, 
bayombong_etracs..incomeaccount ia	
where ri.receiptid = r."objid" 
  and ri.acctid = ia."objid" 
  and r.remittanceid = rl."objid" 
  and ri.liquidationrcdid is null 
  and rl.liquidationid is not null;



/* ===========================================================================
* update the revenue.liquidationrcdid field 
=========================================================================== */
update bayombong_etracs..revenue
set liquidationrcdid = ri.liquidationrcdid
from	
bayombong_etracs..revenue rev, bayombong_etracs..receiptitem ri 	
where rev.receiptitemid = ri."objid" 
  and rev.liquidationrcdid is null ;


/* ===========================================================================
* update the revenue.liquidationrcdid field 
=========================================================================== */
update bayombong_etracs..liquidationlist 
set docstate = 'CLOSED'
from bayombong_etracs..liquidationlist ll 	
where ll."objid" in (
	select a.liquidationid from 
	( select lr.liquidationid, 
		 count(*) as itemcount, 
		 sum( case when lr.docstate = 'closed' then 1 else 0 end ) as closeditemcount
	  from bayombong_etracs..liquidationrcd lr, bayombong_etracs..liquidationlist ll
	  where lr.liquidationid = ll."objid"  and ll.docstate = 'open'
	  group by lr.liquidationid
	) a
	where a.itemcount = a.closeditemcount 
);

update bayombong_etracs..liquidation
set docstate = lq.docstate
from bayombong_etracs..liquidation l, bayombong_etracs..liquidationlist lq 
where l.docstate = 'open'
  and lq.docstate = 'closed';


  
/* ===========================================================================
* update renveue deposit related info  
=========================================================================== */
update bayombong_etracs..revenue  
set
	depositid = d."objid",
	depositno = d.txnno,
	depositdate = lr.dtdeposited,
	deposittimestamp = 
		convert( varchar(4), year(lr.dtdeposited) ) +  
		convert( varchar(1), datepart(qq, lr.dtdeposited)) + 
		case when month(lr.dtdeposited) < 10 
			then '0' + CONVERT( varchar(1),  month(lr.dtdeposited) ) 
			else convert( varchar(2), month(lr.dtdeposited)) end + 
		case when day(lr.dtdeposited) < 10 
			then '0' + CONVERT( varchar(1), day(lr.dtdeposited) ) 
			else CONVERT( varchar(2), day(lr.dtdeposited)) end 
from bayombong_etracs..revenue rev, 
bayombong_etracs..liquidationrcd lr, 
bayombong_etracs..deposit d	
where rev.liquidationrcdid = lr."objid" 
  and lr.depositid = d."objid" 
  and rev.liquidationrcdid is not null 
  and rev.depositid is null;


/*========== update liquidationlist opener ===========*/
update bayombong_etracs..liquidationlist
set opener = l.opener
from  bayombong_etracs..liquidationlist ll, bayombong_etracs..liquidation l
where ll."objid" = l."objid"


