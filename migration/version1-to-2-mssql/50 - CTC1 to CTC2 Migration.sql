/*===  insert master files =========*/

insert into bayombong_etracs..profession
select * from etracs_bayombong..profession;

insert into bayombong_etracs..citizenship
select objid from etracs_bayombong..citizenship;


/*===  update extended fields =========*/
update r2 
set r2.extended = (
	'['+
	' annualsalary:'+ cast(cast(r1.annualSalary as decimal(16, 2)) as varchar) +
	',businessgross:'+ cast(cast(r1.businessGross as decimal(16, 2)) as varchar)+
	',propertyincome:'+ cast(cast(r1.propertyIncome as decimal(16, 2)) as varchar)+
	',additional:false'+
	',tax:[business:'+ cast(cast(r1.businessGrossTax as decimal(16, 2)) as varchar)+
	',basic:'+ cast(cast(r1.basicTax as decimal(16, 2)) as varchar)+
	',salary:'+ cast(cast(r1.annualSalaryTax as decimal(16, 2)) as varchar)+
	',property:'+ cast(cast(r1.propertyIncomeTax as decimal(16, 2)) as varchar)+
	',interest:'+ cast(cast(r1.interest as decimal(16, 2)) as varchar)+
	']]'
)
from bayombong_etracs..receipt r2 
inner join etracs_bayombong..receipt r1 on r2.objid = r1.objid  collate Latin1_General_CI_AS
where r1.dtype = 'IndividualCTCRecept';


update  r2 
	set r2.extended = (
		'[' +
		' annualsalary: 0.00' +
		',businessgross:' + cast(cast( r1.grossReceipt as decimal(16, 2)) as varchar) +
		',propertyincome:' + cast(cast( r1.realPropertyAV as decimal(16, 2)) as varchar) +
		',additional:false'+
		',tax:[business:' + cast(cast( r1.grossReceiptTax as decimal(16, 2)) as varchar) +
		',basic:' + cast(cast( r1.basicTax as decimal(16, 2)) as varchar) +
		',salary: 0.00' +
		',property:' + cast(cast( r1.propertyTax as decimal(16, 2)) as varchar)  +
		',interest:' + cast(cast( r1.interest as decimal(16, 2)) as varchar) +
		']]'
	)
from bayombong_etracs..receipt r2 
inner join etracs_bayombong..receipt r1 on r2.objid = r1.objid  collate Latin1_General_CI_AS
where r1.dtype = 'CorporateCTCReceipt';


