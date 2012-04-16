<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/common/ui" prefix="ui" %>


<s:invoke service="BPApplicationService" method="getApplicationList" params="${param.objid}" var="APP_LIST"/>
<t:content title="Business Application - ${APP.txnno}">

	<jsp:attribute name="head">	
		<link href="${pageContext.request.contextPath}/modules/bp/style.css" rel="stylesheet" />

		<script type="text/javascript">			
			$put(
				'app_info',
				new function() 
				{
					var self = this;
					var svc = ProxyService.lookup("WebBPApplicationService");
					
					this.app = <ui:tojson value="${APP}"/>;
					this.applist = <ui:tojson value="${APP_LIST}"/>;
					
					this.appdata;
					
					this.onload = function() {
						if(this.applist)
							this.appdata = this.applist[0];
					}

					this.cancel = function() {
						MsgBox.confirm(
						  'Are you sure you want to cancel this application?\nCancellation will delete the application.',
						  function(){
							svc.cancelApplication(self.app.objid);
							location.hash = '';
							location.reload();
						  }
						);
					}

					this.assess = function() {
						svc.reassess(this.app.objid);
						location.href = 'application.jsp?objid=' + escape(this.app.objid);
					}

					this.submit = function() {
						MsgBox.confirm(
						  "Please verify that all entries are correct. Proceed?", 
						  function(){
							var draftid = '${SESSION_INFO.userid}';
							self.app = svc.submitForReview( draftid, self.app.objid, self.applist, self.app.info.requirements );
							self._controller.refresh();
							MsgBox.alert("Application successfully submitted.");
						  }
						);
					}
					
					this.getTotalAssessment = function(){
						var total = 0.0;
						if( this.appdata ){ 
							this.appdata.taxfees.each(function(it){ total += it.amountdue; });
							this.appdata.amountdue = total;
						}
						return total;
					}
					
					this.printApp = function() {
						window.open("print_view.jsp?t=app&id=" + escape(this.app.objid));
					}
					
					this.printAssessment = function() {
						window.open("print_view.jsp?t=assessment&id=" + escape(this.app.objid));
					}
				}
			);
		</script>
		
		<style>
			.disclaimer {
				border: solid 1px red;
				font-size: 12px;
				line-height: 140%;
				padding: 10px 20px 20px 20px;
				margin-bottom: 20px;
				text-align: justify;
			}
		</style>
	</jsp:attribute>
	
	<jsp:attribute name="actions">
		<button r:context="app_info" r:name="cancel" r:visibleWhen="#{app.docstate != 'FOR_APPROVAL'}"
		        title="Cancel Application">
			Cancel
		</button>
		<button r:context="app_info" r:name="assess" r:visibleWhen="#{app.docstate == 'FOR_REVIEW'}"
		        title="Reassess Application">
			Reassess
		</button>
		<button r:context="app_info" r:name="assess" r:visibleWhen="#{app.docstate == 'FOR_ASSESSMENT'}"
		        title="Reassess Application">
			Assess
		</button>
		<button r:context="app_info" r:name="submit" r:visibleWhen="#{app.docstate == 'FOR_REVIEW'}"
		        title="Submit for Approval">
			Submit
		</button>
		<button r:context="app_info" r:name="printApp" r:visibleWhen="#{app.docstate == 'FOR_APPROVAL'}"
		        title="Print Business Application Form">
			Print Application Form
		</button>
		<button r:context="app_info" r:name="printAssessment" r:visibleWhen="#{app.docstate == 'FOR_APPROVAL'}"
		        title="Print Assessment">
			Print Assessment
		</button>
	</jsp:attribute>
	
	<jsp:attribute name="rightpanel">
		<div class="rightpanel right" r:context="app_info" r:type="label" style="width:80%">
			<div class="appstate">
				<h3>#{app.txnmode} (#{app.txntype})</h3>
			</div>
			<div class="section">
				<h3>Doc. State:</h3>
				<h3>#{app.docstate}</h3>
			</div>
			<div class="section">
				<h3>Total Assessment:</h3>
				<h2 class="amount">Php #{getTotalAssessment().formatDecimal()}</h2>
			</div>
		</div>
	</jsp:attribute>
	
	<jsp:body>
		<div class="disclaimer">
			<h3>Note:</h3>
			The assessment result below is based on the figures/values you declared.
			These computations may vary during the actual assessment due to adjustments of the figures/values you declared.
		</div>
		<div r:context="app_info" r:type="label">
			<table class="form section">
				<tr>
					<td width="300px">
						<table class="form">
							<tr>
								<th width="80px">Permittee</th>
								<td>:</td>
								<td>#{app.info.taxpayername}</td>
							</tr>
							<tr>
								<th>Address</th>
								<td>:</td>
								<td>#{app.info.taxpayeraddress}</td>
							</tr>
						</table>
					</td>
					<td>
						<table class="form right-form">
							<tr>
								<th>Date</th>
								<td>:</td>
								<td>#{app.txndate}</td>
							</tr>
							<tr>
								<th>Applicable Year</th>
								<td>:</td>
								<td>#{app.iyear}</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
			<h3 class="section-title">General Information</h3>
			<div class="hr"></div>

			<table class="form section">
				<tr>
					<th>Tradename</th>
					<td>:</td>
					<td>#{app.tradename}</td>
				</tr>
				<tr>
					<th>Business Address</th>
					<td>:</td>
					<td>#{app.businessaddress}</td>
				</tr>
				<tr>
					<th>Administrator Name</th>
					<td>:</td>
					<td>#{app.info.administratorname}</td>
				</tr>
				<tr>
					<th>Administrator Address</th>
					<td>:</td>
					<td>#{app.info.administratoraddress}</td>
				</tr>
			</table>
		</div>
		
		<h3 class="section-title">Application List</h3>
		<div class="hr"></div>

		<table r:context="app_info" r:items="applist" r:varName="item" r:name="appdata"
		       class="grid" cellpadding="0" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th align="left">App. No.</th>
					<th align="left">App. Type</th>
					<th align="left">Assessed Value</th>
					<th align="left">Amount Due</th>
					<th align="left">Applicable Year</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>#{item.txnno}</td>
					<td>#{item.txntype}</td>
					<td>#{item.assessedvalue}</td>
					<td>#{item.amountdue}</td>
					<td>#{item.iyear}</td>
				</tr>
			</tbody>
		</table>
		
		<h3 class="section-title">Assessment Information</h3>
		<div class="hr"></div>

		<table r:context="app_info" r:items="appdata.infos" r:varName="item" r:depends="appdata"
		       class="grid" cellpadding="0" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th align="left">Line of Business</th>
					<th align="left">Information</th>
					<th align="left">Value</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>#{item.lobname}</td>
					<td>#{item.varcaption}</td>
					<td align="#{item.datatype.match(/decimal|integer/)? 'right' : 'center'}">
						#{item.datatype=='decimal'? item.value.formatDecimal() : item.value}
					</td>
				</tr>
			</tbody>
		</table>
		
		<h3 class="section-title">Taxes and Fees</h3>
		<div class="hr"></div>

		<table r:context="app_info" r:items="appdata.taxfees" r:varName="item" r:depends="appdata"
		       class="grid" cellpadding="0" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th align="left">Line of Business</th>
					<th align="left">Account</th>
					<th align="left">Assessed Value</th>
					<th align="left">Amount Due</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>#{item.lobname}</td>
					<td>#{item.accttitle}</td>
					<td align="right">
						#{item.assessedvalue.formatDecimal()}
					</td>
					<td align="right">
						#{item.amountdue.formatDecimal()}
					</td>
				</tr>
			</tbody>
		</table>
		<div class="section align-r" r:context="app_info" r:type="label">
			<h2>
				Total Assessment: 
				<span class="amount">Php #{getTotalAssessment().formatDecimal()}</span>
			</h2>
		</div>
	</jsp:body>
	
</t:content>

