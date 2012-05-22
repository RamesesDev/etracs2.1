/* business */
create index ix_bpapplication_businessid on bpapplication (businessid);
create index ix_business_taxpayerid on business(taxpayerid);


/* remittancelist */
create index  ix_liquidatingofficerid on remittancelist(liquidatingofficerid);
create index  ix_liquidatingofficerid_txndate on remittancelist(liquidatingofficerid,txndate);


/* subdivisionland */
alter table subdivisionland change column itemno itemno int(11);






