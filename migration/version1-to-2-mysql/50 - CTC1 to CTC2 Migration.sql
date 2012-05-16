/*===  insert master files =========*/

insert into sancarlos_etracs2.profession
select * from etracs_sancarlos.profession;

insert into sancarlos_etracs2.citizenship
select objid from etracs_sancarlos.citizenship;


/*===  update extended fields =========*/
update sancarlos_etracs2.receipt r2, etracs_sancarlos.receipt r1
set r2.extended = concat(
	'[',
	' annualsalary:', r1.annualSalary,
	',businessgross:', r1.businessGross,
	',propertyincome:', r1.propertyIncome,
	',additional:false',
	',tax:[business:', r1.businessGrossTax,
	',basic:', r1.basicTax,
	',salary:', r1.annualSalaryTax,
	',property:', r1.propertyIncomeTax,
	',interest:', r1.interest,
	']]'
)
where r2.objid = r1.objid
  and r1.dtype = 'IndividualCTCReceipt';


update sancarlos_etracs2.receipt r2, etracs_sancarlos.receipt r1
set r2.extended = concat(
	'[',
	' annualsalary: 0.00',
	',businessgross:', r1.grossReceipt,
	',propertyincome:', r1.realPropertyAV,
	',additional:false',
	',tax:[business:', r1.grossReceiptTax,
	',basic:', r1.basicTax,
	',salary: 0.00',
	',property:', r1.propertyTax,
	',interest:', r1.interest,
	']]'
)
where r2.objid = r1.objid
  and r1.dtype = 'CorporateCTCReceipt';


