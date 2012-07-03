/*===============================================
 *	DATABASE NAMES:
 *		sancarlos_etracs2, etracs_sancarlos
 *=================================================*/

alter table bayombong_etracs..rptpayment alter column receiptdate date null;

/*===== CAPTURE =======*/
insert into bayombong_etracs..rptpayment (
	objid, schemaname, schemaversion, 
	rptledgerid, opener, mode, dtposted, receiptid, receiptdate, receiptno, collectorid, collectorname, 
	collectortitle, capturedby, particulars, voided, period, revtype, 
	fromyear, fromqtr, toyear, 
	toqtr, 
	basic, 
	basicint, 
	basicdisc, 
	basicpartial, 
	sef, 
	sefint, 
	sefdisc, 
	sefpartial, 
	collectingagencyid, 
	collectingagency
)
select 
	objid, schemaname, schemaversion, 
	rptledgerid, opener, mode, dtposted, receiptid, receiptdate, receiptno, collectorid, collectorname, 
	collectortitle, capturedby, particulars, voided, 
	(
		cast(fromqtr as varchar) + 'Q,' + cast(fromyear as varchar) + ' - ' + 
		cast(toqtr as varchar) + 'Q,' + cast(toyear as varchar)
	) as period, 
	revtype, 
	fromyear as fromyear,
	fromqtr as fromqtr, 
	toyear as toyear, 
	toqtr as toqtr, 
	basic as basic, 
	basicint as basicint, 
	basicdisc as basicdisc, 
	basicpartial as basicpartial, 
	sef as sef, 
	sefint as sefint, 
	sefdisc as sefdisc, 
	sefpartial as sefpartial, 
	collectingagencyid, 
	collectingagency
from (
	select 
		mc.objid, 
		'rptpayment'as schemaname, 
		'1.0' as schemaversion, 
		mc.ledgerid as rptledgerid, 
		'rptledgercapturepmt' as opener, 
		'CAPTURE' AS mode,
		mc.txndate as dtposted, 
		null as receiptid, 
		mc.dtreceipt as receiptdate, 
		mc.refno as receiptno, 
		mc.collectorid, 
		mc.collectorname, 
		mc.collectortitle, 
		mc.capturedby, 
		null as particulars, 
		0 as voided, 
		null as revtype, 
		mc.fromyear, 
		mc.fromqtr, 
		mc.toyear, 
		mc.toqtr, 
		(mc.basic + mc.basicprevious + mc.basicprior ) as basic , 
		(mc.basicinterest + mc.basicintprevious + mc.basicintprior) as basicint, 
		mc.basicdiscount as basicdisc, 
		0.0 as basicpartial, 
		(mc.sef + mc.sefprevious + mc.sefprior) as sef, 
		(mc.sefinterest + mc.sefintprevious + mc.sefintprior ) as sefint, 
		mc.sefdiscount as sefdisc, 
		0.0 as sefpartial, 
		null as collectingagencyid, 
		null as collectingagency
	from etracs_bayombong..abstractrptcredit mc 
	where dtype = 'RPTDataCapturePayment'
) t;



/*===== ONLINE =======*/
insert into bayombong_etracs..rptpayment (
	objid, schemaname, schemaversion, 
	rptledgerid, opener, mode, dtposted, receiptid, receiptdate, receiptno, collectorid, collectorname, 
	collectortitle, capturedby, particulars, voided, period, revtype, 
	fromyear, fromqtr, toyear, 
	toqtr, 
	basic, 
	basicint, 
	basicdisc, 
	basicpartial, 
	sef, 
	sefint, 
	sefdisc, 
	sefpartial, 
	collectingagencyid, 
	collectingagency
)
select 
	objid, schemaname, schemaversion, 
	rptledgerid, opener, mode, dtposted, receiptid, receiptdate, receiptno, collectorid, collectorname, 
	collectortitle, capturedby, particulars, voided, 
	(
		cast(fromqtr as varchar) + 'Q,' + cast(fromyear as varchar) + 
		' - ' + cast(toqtr as varchar) + 'Q,' + cast(toyear as varchar)
	) as period, 
	revtype, 
	fromyear as fromyear,
	fromqtr as fromqtr, 
	toyear as toyear, 
	toqtr as toqtr, 
	basic as basic, 
	basicint as basicint, 
	basicdisc as basicdisc, 
	basicpartial as basicpartial, 
	sef as sef, 
	sefint as sefint, 
	sefdisc as sefdisc, 
	sefpartial as sefpartial, 
	collectingagencyid, 
	collectingagency
from (
	select 
		mc.objid, 
		'rptpayment'as schemaname, 
		'1.0' as schemaversion, 
		mc.ledgerid as rptledgerid, 
		'rptonline' as opener, 
		'ONLINE' AS mode,
		mc.txndate as dtposted, 
		r.objid as receiptid, 
		mc.receiptdate as receiptdate, 
		mc.receiptno as receiptno, 
		r.collectorid, 
		r.collectorname, 
		r.collectortitle, 
		mc.capturedby, 
		null as particulars, 
		0 as voided, 
		null as revtype, 
		mc.fromyear, 
		mc.fromqtr, 
		mc.toyear, 
		mc.toqtr, 
		(isnull(mc.basic,0.00) + isnull(mc.basicprevious,0.00) + isnull(mc.basicprior,0.00) ) as basic , 
		(isnull(mc.basicinterest,0.00) + isnull(mc.basicintprevious,0.00) + isnull(mc.basicintprior,0.00)) as basicint, 
		mc.basicdiscount as basicdisc, 
		0.0 as basicpartial, 
		(isnull(mc.sef,0.00) + isnull(mc.sefprevious,0.00) + isnull(mc.sefprior,0.00)) as sef, 
		(isnull(mc.sefinterest,0.00) + isnull(mc.sefintprevious,0.00) + isnull(mc.sefintprior,0.00) ) as sefint, 
		mc.sefdiscount as sefdisc, 
		0.0 as sefpartial, 
		null as collectingagencyid, 
		null as collectingagency
	from etracs_bayombong..abstractrptcredit mc 
	inner join etracs_bayombong..receipt r on r.serialno = mc.receiptno
	where mc.dtype <> 'RPTDataCapturePayment'
) t;


/*===== PAYMENT DETAIL =======*/
alter table bayombong_etracs..rptpaymentdetail alter column receiptid varchar(50) null;

insert into bayombong_etracs..rptpaymentdetail (
	objid, 
	receiptid, 
	rptledgerid, 
	year, 
	qtr, 
	basic, 
	basicint, 
	basicdisc, 
	basicpartial, 
	sef, 
	sefint, 
	sefdisc,
	sefpartial, 
	revtype, 
	rptledgeritemid
)
select
	objid, 
	null as receiptid, 
	ledgerid as rptledgerid, 
	fromyear as year, 
	fromqtr as qtr, 
	(basic + basicprevious + basicprior) as basic, 
	(basicinterest + basicintprevious + basicintprior) as basicint, 
	basicdiscount as basicdisc, 
	0.0 as basicpartial, 
	(sef + sefprevious + sefprior) as sef, 
	(sefinterest + sefintprevious + sefintprior) as sefint, 
	sefdiscount as sefdisc,
	sefpartial, 
	case when fromyear < 2012 then 'previous' else 'current' end as revtype, 
	null as rptledgeritemid
from etracs_bayombong..abstractrptcredit 
where dtype = 'RPTDataCapturePayment' ;






