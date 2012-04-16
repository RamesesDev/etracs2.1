<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/message" prefix="msg" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/common/ui" prefix="ui" %>


<t:content title="Business Application - ${APP.txnno}">


	<jsp:attribute name="head">
		<link href="${pageContext.request.contextPath}/modules/bp/style.css" rel="stylesheet" />
		
		<script type="text/javascript">			
			$put(
				'app_info',
				new function() 
				{
					var svc = ProxyService.lookup("WebBPApplicationService");
					this.app = <ui:tojson value="${APP}"/>;
					
					this.submit = function() {
						this.app = svc.submitForAssessment('${APP.objid}');
						Hash.reload();
					}
					
					this.remove = function() {
						MsgBox.confirm('Are you sure you want to delete this application?', function(){
							svc.cancelApplication( this.app.objid );
							location.hash = 'bp:app_list';
						});
					}
					
					this.edit = function() {
						location.href = "application.jsp?objid=" + this.app.objid;
					}
				}
			);
		</script>
	</jsp:attribute>
	
	<jsp:attribute name="actions">
		<button r:context="app_info" r:name="edit" r:visibleWhen="#{app.docstate == 'DRAFT'}">
			Edit
		</button>
		<button r:context="app_info" r:name="remove" r:visibleWhen="#{app.docstate == 'DRAFT'}">
			Delete
		</button>
	</jsp:attribute>
	
	<jsp:attribute name="rightpanel">
		
	</jsp:attribute>
	
	<jsp:body>
		<div r:context="app_info" r:type="label">
			<table class="form section">
				<tr class="appstate">
					<th>State</th>
					<td>:</td>
					<td>#{app.docstate}</td>
				</tr>
				<tr>
					<th>Type</th>
					<td>:</td>
					<td>#{app.txntype}</td>
				</tr>
				<tr>
					<th>Mode</th>
					<td>:</td>
					<td>#{app.txnmode}</td>
				</tr>
				<tr>
					<th>Date</th>
					<td>:</td>
					<td>#{app.txndate}</td>
				</tr>
				<tr>
					<th>Year</th>
					<td>:</td>
					<td>#{app.iyear}</td>
				</tr>
			</table>
			
			<h3 class="section-title">Business Information</h3>
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
					<th>Taxpayer Name</th>
					<td>:</td>
					<td>#{app.info.taxpayername}</td>
				</tr>
				<tr>
					<th>Taxpayer Address</th>
					<td>:</td>
					<td>#{app.info.taxpayeraddress}</td>
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
			
			<div class="hr"></div>
			
			<table width="100%" class="form section">
				<tr>
					<td>
						<table class="form">
							<tr>
								<th>Organization</th>
								<td>:</td>
								<td>#{app.info.organization}</td>
							</tr>
							<tr>
								<th>Office Type</th>
								<td>:</td>
								<td>#{app.info.officetype}</td>
							</tr>
							<tr>
								<th>Barangay</th>
								<td>:</td>
								<td>#{app.info.barangay.barangayname}</td>
							</tr>
							<tr>
								<th>BIN</th>
								<td>:</td>
								<td>#{app.info.bin}</td>
							</tr>
							<tr>
								<th>PIN</th>
								<td>:</td>
								<td>#{app.info.pin}</td>
							</tr>
						</table>
					</td>
					<td>
						<table class="form">
							<tr>
								<th>CTC No.</th>
								<td>:</td>
								<td>#{app.info.ctcno}</td>
							</tr>
							<tr>
								<th>CTC Place Issued</th>
								<td>:</td>
								<td>#{app.info.ctcplaceissued}</td>
							</tr>
							<tr>
								<th>CTC Date Issued</th>
								<td>:</td>
								<td>#{app.info.ctcdateissued}</td>
							</tr>
							<tr>
								<th>TIN</th>
								<td>:</td>
								<td>#{app.info.tin}</td>
							</tr>
							<tr>
								<th>Contact No.</th>
								<td>:</td>
								<td>#{app.info.contactno}</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
		
		<div class="clearfix">
			<h3 class="left section-title">Line(s) of Business</h3>
			<div class="right">
				<button>Edit</button>
			</div>
		</div>
		<div class="hr"></div>

		<table r:context="app_info" r:items="app.lobs" r:varName="lob"
		       class="grid" cellpadding="0" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th align="left">Name</th>
					<th align="left">Assessment Type</th>
					<th align="left">Year</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>#{lob.name}</td>
					<td>#{lob.assessmenttype}</td>
					<td>#{lob.iyear}</td>
				</tr>
			</tbody>
		</table>
	</jsp:body>
	
</t:content>

