<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/message" prefix="msg" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>


<t:popup>


	<jsp:attribute name="head">
		<script type="text/javascript">
			$put(
				'entity_lookup',
				new function() 
				{
					var self = this;
					var svc = ProxyService.lookup('EntityService');
					
					this.searchtxt = '';
					
					this.listModel = {
						rows: 10,
						fetchList: function(o) {
							return svc.getList(self.searchtxt, o);
						}
					};
					
					this.select = function() {
						if(this.handler) this.handler(this.selected);
						return '_close';
					}
				}
			);
		</script>
	</jsp:attribute>

	
	<jsp:attribute name="rightactions">
		<button r:context="entity_lookup" r:name="_close">
			Cancel
		</button>
	</jsp:attribute>
	
	<jsp:body>
		<div class="section search-box">
			<input type="text" r:context="entity_lookup" r:name="searchtxt" size="40"/>
			<button r:context="entity_lookup" r:name="listModel.load">Search</button>
		</div>
		<table id="entity_lookup:list" r:context="entity_lookup" r:model="listModel" 
		       r:name="selected" r:varName="lob" r:varStatus="stat"
		       class="grid" cellpadding="0" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th width="10px">Account No.</th>
					<th align="left">Account Name</th>
					<th align="left">Address</th>
					<th>&nbsp;</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>#{lob.entityno}</td>
					<td>#{lob.entityname}</td>
					<td>#{lob.entityaddress}</td>
					<td align="center">
						<a r:context="entity_lookup" r:name="select">Select</a>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="section align-r">
			<button r:context="entity_lookup" r:name="listModel.moveFirst">
				First
			</button>
			<button r:context="entity_lookup" r:name="listModel.movePrev">
				Previous
			</button>
			<button r:context="entity_lookup" r:name="listModel.moveNext">
				Next
			</button>
		</div>
		
		<script type="text/javascript">
			$(function(){
				//$('#entity_lookup\\:list').colResizable();
			});
		</script>
	</jsp:body>
	
</t:popup>

