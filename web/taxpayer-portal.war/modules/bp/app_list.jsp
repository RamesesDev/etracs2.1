<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>


<t:content title="${param.title}">


	<jsp:attribute name="head">
		<script type="text/javascript">
			$put(
				'applist',
				new function() 
				{
					var self = this;
					var doctype = '${param.doctype}';
					var svc = ProxyService.lookup('WebBPApplicationListingService');
					
					this.searchtxt = '';
					
					this.listModel = {
						rows: 20,
						fetchList: function(o) {
							o.taxpayerid = '${SESSION_INFO.userid}';
							if( doctype )
								return svc.getList(self.searchtxt, doctype, o);
							
							return svc.getPendingList(self.searchtxt, o);
						}
					};
				}
			);
		</script>
	</jsp:attribute>
	
	<jsp:body>
		<div class="section clearfix">
			<div class="left">
				<input type="text" r:context="applist" r:name="searchtxt" size="40" class="search"/>
				<button r:context="applist" r:name="listModel.load">Search</button>
			</div>
			<div class="right">
				<button r:context="applist" r:name="listModel.moveFirst">First</button>
				<button r:context="applist" r:name="listModel.movePrev">Previous</button>
				<button r:context="applist" r:name="listModel.moveNext">Next</button>
			</div>
		</div>
		<table id="list" r:context="applist" r:model="listModel" r:varName="app"
		       class="grid" width="100%" cellspacing="0" cellpadding="0">
			<thead>
				<tr>
					<th align="left" width="100px">Txn. No.</th>
					<th align="left">Tradename</th>
					<th align="left">Address</th>
					<th align="left" width="100px">State</th>
					<c:if test="${param.doctype == 'EXPIRED'}">
						<th width="50px">&nbsp;</th>
					</c:if>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td valign="top">
						<a href="#bp:app_info?objid=#{app.objid}">
							#{app.txnno}
						</a>
					</td>
					<td valign="top">
						#{app.tradename}
					</td>
					<td valign="top">
						#{app.businessaddress}
					</td>
					<td valign="top">#{app.docstate}</td>
					<c:if test="${param.doctype == 'EXPIRED'}">
						<td valign="top" align="center">
							<a href="#bp:app_renew?objid=#{app.objid}">Renew</a>
						</td>
					</c:if>
				</tr>
			</tbody>
		</table>
		<div class="section align-r">
			<button r:context="applist" r:name="listModel.moveFirst">First</button>
			<button r:context="applist" r:name="listModel.movePrev">Previous</button>
			<button r:context="applist" r:name="listModel.moveNext">Next</button>
		</div>
		
		<script type="text/javascript">
			$(function(){
				//$('#list').colResizable();
			});
		</script>
	</jsp:body>
	
</t:content>

