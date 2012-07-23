use bayombong_etracs;

create table realproperty (
	objid varchar(50) not null,
	landfaasid varchar(50) not null,	
	provcity varchar(50) not null,
	munidistrict varchar(50) not null,
	barangay varchar(50) not null,
	barangayid varchar(50) not null,	
	lgutype varchar(50),
	pintype varchar(5),
	pin varchar(30) not null,
	provcityindex varchar(5) not null,
	munidistrictindex varchar(5) not null,
	barangayindex varchar(5) not null,
	section varchar(3) not null,
	parcel varchar(3) not null,
	arpno varchar(30),
	cadastrallotno varchar(255) not null,
	blockno varchar(255),
	surveyno varchar(30),
	houseno varchar(25),
	street varchar(100),
	purok varchar(25),
	attributes text,		
	north varchar(255) not null,
	south varchar(255) not null,
	east varchar(255) not null,
	west varchar(255) not null,
	primary key (objid)
);

create unique index ix_realproperty_landfaasid on realproperty (landfaasid);
create index ix_realproperty_pin on realproperty (pin);



