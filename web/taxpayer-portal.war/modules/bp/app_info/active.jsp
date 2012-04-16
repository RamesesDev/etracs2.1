<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/message" prefix="msg" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/common/ui" prefix="ui" %>


<s:invoke service="BusinessMgmtService" method="openPermit" params="${param.objid}" var="PERMIT"/>
<t:content title="Permit No: ${PERMIT.txnno}">


	<jsp:attribute name="head">
		<link href="${pageContext.request.contextPath}/modules/bp/style.css" rel="stylesheet" />
		
		<script type="text/javascript">			
			$put(
				'app_info',
				new function() 
				{
					this.permit = <ui:tojson value="${PERMIT}"/>;
				}
			);
		</script>
	</jsp:attribute>
	
	<jsp:attribute name="rightpanel">
		
	</jsp:attribute>
	
	<jsp:body>
		<div r:context="app_info" r:type="label">
			<table class="form section">
				<tr>
					<th>Plate No.</th>
					<td>:</td>
					<td class="appstate">#{permit.plateno}</td>
				</tr>
				<tr>
					<th>Date</th>
					<td>:</td>
					<td>#{permit.txndate}</td>
				</tr>
			</table>
			
			<h3 class="section-title">General Information</h3>
			<div class="hr"></div>
			
			<table class="form section">
				<tr>
					<th>Tradename</th>
					<td>:</td>
					<td>#{permit.tradename}</td>
				</tr>
				<tr>
					<th>Business Address</th>
					<td>:</td>
					<td>#{permit.businessaddress}</td>
				</tr>
				<tr>
					<th>Taxpayer Name</th>
					<td>:</td>
					<td>#{permit.taxpayername}</td>
				</tr>
				<tr>
					<th>Taxpayer Address</th>
					<td>:</td>
					<td>#{permit.taxpayeraddress}</td>
				</tr>
			</table>
		</div>
		
		<h3 class="section-title">Line(s) of Business</h3>
		<div class="hr"></div>

		<table r:context="app_info" r:items="permit.lobs" r:varName="lob"
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

