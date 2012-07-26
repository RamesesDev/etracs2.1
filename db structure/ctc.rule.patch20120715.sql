use bayombong_system;


delete from rulegroup where ruleset='ctcassessment';

insert into rulegroup (objid,name,sortorder,ruleset)
values
 ('TAX', 'TAX', 1, 'ctcassessment'),
 ('ATAX', 'AFTER TAX', 2, 'ctcassessment'),
 ('INT', 'INTEREST', 3, 'ctcassessment'),
 ('AINT', 'AFTER INTEREST', 4, 'ctcassessment');


update rule_package
set content = '
package ctc.assessment.facts

declare IndividualFact
	profession:		String
	citizenship:	String
	gender:			String
	civilstatus:	String
	seniorcitizen:  Boolean
	newbusiness:	Boolean
	annualsalary:	Double
	businessgross:	Double
	propertyincome: Double
end

declare CorporateFact
	orgtype:	String
	realpropertyav:	Double
	businessgross:	Double
end

declare CTCFact
	barangayid:	String
	year:       Integer
	qtr:        Integer
	month:      Integer
    day:        Integer
	additional: Boolean
	basictax:   Double
	salarytax:  Double
	businessgrosstax:  Double
	propertyincometax: Double
	additionaltax:     Double
	interest:	Double
	amtdue:		Double
end
'
where ruleset='ctcassessment' and type='facts';


update sys_module set permissions = '
[
	[action: "collection_ctc_individual.edit",   title: "Edit CTC Individual Collection"],
	[action: "collection_ctc_individual.print",  title: "Print CTC Individual Collection"],
	[action: "collection_ctc_individual.void",   title: "Void CTC Individual Collection"],
	[action: "collection_ctc_individual.create", title: "Create CTC Individual Collection"],

	[action: "collection_ctc_individual_brgy.edit",   title: "Edit CTC Individual Barangay Collection"],
	[action: "collection_ctc_individual_brgy.print",  title: "Print CTC Individual Barangay Collection"],
	[action: "collection_ctc_individual_brgy.void",   title: "Void CTC Individual Barangay Collection"],
	[action: "collection_ctc_individual_brgy.create", title: "Create CTC Individual Barangay Collection"],

	[action: "collection_ctc_corporate.edit",    title: "Edit CTC Corporate Collection"],
	[action: "collection_ctc_corporate.void",    title: "Void CTC Corporate Collection"],
	[action: "collection_ctc_corporate.create",  title: "Create CTC Corporate Collection"],
	[action: "collection_ctc_corporate.print",   title: "Print CTC Corporate Collection"],
]
' 
where name='ctc2';