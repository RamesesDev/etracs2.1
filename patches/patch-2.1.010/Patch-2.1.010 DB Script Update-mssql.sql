
use sannicolas_etracs;

create table remittance_subcollector (
	objid varchar(50) NOT NULL,
	schemaname varchar(50) NOT NULL,
	schemaversion varchar(5) NOT NULL,
	docstate varchar(20) NOT NULL,
	txnno varchar(20) NOT NULL,
	txndate date NOT NULL,
	collectorname varchar(50) NOT NULL,
	amount decimal(10, 2) NULL,
	collectorid varchar(50) NOT NULL,
	collectortitle varchar(50) NULL,
	totalcash decimal(10, 2) NULL,
	totalotherpayment decimal(10, 2) NULL,
	remittanceid varchar(50) NULL,
	remittanceno varchar(15) NULL,
	remittancedate date NULL,
	remittanceofficerid varchar(50) NULL,
	remittanceofficername varchar(50) NULL,
	remittanceofficertitle varchar(50) NULL,
	info text NULL,
	PRIMARY KEY  (objid)
);

alter table receiptlist add sc_remittanceid varchar(50) null;