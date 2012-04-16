<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/message" prefix="msg" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/common/ui" prefix="ui" %>
<%@ page import="java.util.*" %>


<s:invoke service="SessionService" method="getInfo" params="${SESSIONID}" var="SESSION_INFO"/>
<s:invoke service="BPEnum" method="getOrganizations" var="ORGTYPES"/>
<s:invoke service="BPEnum" method="getOfficeTypes" var="OFFICETYPES"/>
<s:invoke service="BPEnum" method="getBarangays" var="BARANGAYS"/>

<c:if test="${not empty param.objid}">
	<s:invoke service="BPApplicationService" method="open" params="${param.objid}" var="APP"/>
</c:if>
<%
	String mode = request.getParameter("mode");
	Map app = (Map) request.getAttribute("APP");
	Map sessInfo = (Map) request.getAttribute("SESSION_INFO");
	
	StringBuffer sb = new StringBuffer("Business Application");
	if("edit".equals(mode) ) {
		sb.append(" - " + app.get("txnno"));
	}
	else if("create".equals(mode)) {
		sb.append(" - New");
		
		Map info = new HashMap();
		info.put("taxpayername", sessInfo.get("entityname"));
		info.put("taxpayeraddress", sessInfo.get("entityaddress"));
		info.put("taxpayerno", sessInfo.get("entityno"));
		info.put("contactno", sessInfo.get("contactno"));
		info.put("taxpayerid", sessInfo.get("objid"));
		
		app = new HashMap();
		app.put("txnmode", "ONLINE");
		app.put("txntype", "NEW");
		app.put("info", info);
		app.put("taxpayerid", sessInfo.get("objid"));
		request.setAttribute("APP", app);
	}
	else if("renew".equals(mode)) {
		sb.append(" - Renew");
		
		Map newapp = new HashMap();
		newapp.put("txnmode", "ONLINE");
		newapp.put("txntype", "RENEW");
		newapp.put("parentid", app.get("objid"));
		newapp.put("businessid", app.get("businessid"));
		request.setAttribute("APP", newapp);
	}

	request.setAttribute("pageTitle", sb.toString());
%>
<c:if test="${param.mode != 'edit'}">
	<s:invoke service="BPApplicationService" method="evaluateTxnType" params="${APP}" var="APP" debug="true"/>
</c:if>


<t:content title="${pageTitle}">

	<jsp:attribute name="head">
		<link href="${pageContext.request.contextPath}/modules/bp/bp.css" rel="stylesheet" />
	
		<script type="text/javascript">
			$put(
				'app',
				new function()
				{
					var self = this;
					this.app = {
						docstate:'DRAFT',
						lobs: []
					};
					
					this.organizations = <ui:tojson value="${ORGTYPES}"/>;
					this.officeTypes = <ui:tojson value="${OFFICETYPES}"/>;
					this.barangays = <ui:tojson value="${BARANGAYS}"/>;
					
					this.onload = function() {
						var app = <ui:tojson value="${APP}"/>;
						if( app ) $.extend(this.app,app);
					}

					var lobHandler = function(items) {
						if(!items) return;

						items.each(function(lob){
							var old = self.app.lobs.find(function(l){ return l.lobid == lob.objid });
							if( old ) self.app.lobs.remove(old);
							
							var newlob = {
								lobid: lob.objid,
								name:  lob.name,
								classificationid: lob.classificationid
								
							};

							if(self.app.txntype == 'NEW')     
								newlob.assessmenttype = 'NEW';
							else if(self.app.txntype == 'RENEW') 
								newlob.assessmenttype = 'ADDLOB';
							
							self.app.lobs.push(newlob);
						});
					};
					
					this.addLob = function() {
						return new PopupOpener('bp:lob_lookup', {handler:lobHandler});
					}
					
					this.removeLob = function() {
						if(!this.selectedLob) return;
						if(!confirm('Are you sure you want to remove the selected line of business?')) return;
						this.app.lobs.remove(this.selectedLob);
					}
					
					this.save = function() {
						var svc = ProxyService.lookup('BPApplicationService');
						console.log( this.app );
						this.app = svc.save(this.app);
						location.hash = 'bp:app_info?objid=' + this.app.objid;
					}
					
					this.cancelEdit = function() {
						location.hash = 'bp:app_info?objid=' + this.app.objid;
					}
					
					this.canRemoveLob = function(lob) {
						if(lob.assessmenttype == 'NEW' || lob.assessmenttype == 'ADDLOB')
							return true;
						
						return false;
					}
				}
			);
		</script>
	</jsp:attribute>
	
	<jsp:attribute name="actions">
		<button r:context="app" r:name="save" title="Save application">
			Save
		</button>
		<c:if test="${param.mode == 'edit'}">
			<button r:context="app" r:name="cancelEdit" title="Cancel edit">
				Cancel
			</button>
		</c:if>
	</jsp:attribute>
	
	<jsp:attribute name="rightpanel">
		
	</jsp:attribute>
	
	<jsp:body>
		<c:set var="toggleInput" value="${param.mode!='create'? 'disabled=\"disabled\"' : ''}"/>
		
		<div class="section" r:context="app" r:type="label">
			<div class="clearfix section appstate">
				<span class="left">
					#{app.txnmode} (#{app.txntype})
				</span>
				<span class="right">
					#{app.docstate}
				</span>
			</div>
			
			<h3 class="section-title">Permittee/Owner</h3>
			<div class="hr"></div>
			
			<table class="form">
				<tr>
					<td width="300px">
						<table>
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
						<table class="right-form">
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
		</div>
		
		<h3 class="section-title">Business Detail</h3>
		<div class="hr"></div>
		
		<table class="form section">
			<tr>
				<th width="80px">Tradename</th>
				<td>:</td>
				<td>
					<input type="text" r:context="app" r:name="app.info.tradename" size="60" ${toggleInput}/>
				</td>
			</tr>
			<tr>
				<th>Address</th>
				<td>:</td>
				<td>
					<input type="text" r:context="app" r:name="app.info.businessaddress" size="60" ${toggleInput}/>
				</td>
			</tr>
			<tr>
				<th>Administrator</th>
				<td>:</td>
				<td>
					<input type="text" r:context="app" r:name="app.info.administratorname" size="60" ${toggleInput}/>
				</td>
			</tr>
			<tr>
				<th>Address</th>
				<td>:</td>
				<td>
					<input type="text" r:context="app" r:name="app.info.administratoraddress" size="60" ${toggleInput}/>
				</td>
			</tr>
		</table>
		
		<table class="form section">
			<tr>
				<td>
					<table width="300px">
						<tr>
							<th width="80px">Organization</th>
							<td>:</td>
							<td>
								<select r:context="app" r:name="app.info.organization" r:items="organizations" 
								        style="width:100%" ${toggleInput}>
								</select>
							</td>
						</tr>
						<tr>
							<th>Office Type</th>
							<td>:</td>
							<td>
								<select r:context="app" r:name="app.info.officetype" r:items="officeTypes" 
								        style="width:100%" ${toggleInput}>
								</select>
							</td>
						</tr>
						<tr>
							<th>Barangay</th>
							<td>:</td>
							<td>
								<select r:context="app" r:name="app.info.barangay" r:items="barangays" r:itemLabel="barangayname" 
								        style="width:100%" ${toggleInput}>
								</select>
							</td>
						</tr>
						<tr>
							<th>BIN</th>
							<td>:</td>
							<td>
								<input type="text" r:context="app" r:name="app.info.bin" 
								       style="width:100%" ${toggleInput}/>
							</td>
						</tr>
						<tr>
							<th>PIN</th>
							<td>:</td>
							<td>
								<input type="text" r:context="app" r:name="app.info.pin"
								       style="width:100%" ${toggleInput}/>
							</td>
						</tr>
					</table>
				</td>
				<td>
					<table class="right-form">
						<tr>
							<th>CTC No.</th>
							<td>:</td>
							<td>
								<input type="text" r:context="app" r:name="app.info.ctcno" disabled="disabled"/>
							</td>
						</tr>
						<tr>
							<th>CTC Place Issued</th>
							<td>:</td>
							<td>
								<input type="text" r:context="app" r:name="app.info.ctcplaceissued" disabled="disabled"/>
							</td>
						</tr>
						<tr>
							<th>CTC Date Issued</th>
							<td>:</td>
							<td>
								<input type="text" r:context="app" r:name="app.info.ctcdateissued" disabled="disabled"/>
							</td>
						</tr>
						<tr>
							<th>TIN</th>
							<td>:</td>
							<td>
								<input type="text" r:context="app" r:name="app.info.tin"/>
							</td>
						</tr>
						<tr>
							<th>Contact No.</th>
							<td>:</td>
							<td>
								<input type="text" r:context="app" r:name="app.info.contactno"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		
		<h3 class="section-title">Line(s) of Business</h3>
		<div class="hr"></div>
		
		<div class="section">
			<button r:context="app" r:name="addLob">
				Add
			</button>
		</div>
		<table r:context="app" r:items="app.lobs" r:varName="lob" r:name="selectedLob" r:varStatus="stat"
		       class="grid" cellpadding="0" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th align="left">Name</th>
					<th align="left">Assessment Type</th>
					<th align="left">Year</th>
					<th align="left" width="50px">&nbsp;</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>#{lob.name}</td>
					<td>
						<span r:context="app" r:visibleWhen="#{app.}">
							#{lob.assessmenttype}
						</span>
					</td>
					<td>#{lob.iyear}</td>
					<td align="center">
						<a r:context="app" r:name="removeLob" r:visibleWhen="#{canRemoveLob(lob)}">
							Remove
						</a>
					</td>
				</tr>
			</tbody>
		</table>
	</jsp:body>
	
</t:content>

