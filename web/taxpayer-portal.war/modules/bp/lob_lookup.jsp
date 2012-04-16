<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/message" prefix="msg" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>


<t:popup>


	<jsp:attribute name="head">
		<script type="text/javascript">
			$put(
				'lob_lookup',
				new function() 
				{
					var self = this;
					var svc = ProxyService.lookup('LOBService');
					
					this.searchtxt = '';
					
					this.listModel = {
						rows: 10,
						fetchList: function(o) {
							return svc.getList(self.searchtxt, o);
						}
					};
					
					this.select = function() {
						var selected = this.listModel.getList().findAll(function(o){
							if(o.selected == true) {
								delete o['selected'];
								return true;
							}
						});
						if(this.handler) this.handler(selected);
						return '_close';
					}
				}
			);
		</script>
	</jsp:attribute>

	
	<jsp:attribute name="rightactions">
		<button r:context="lob_lookup" r:name="select">
			Ok
		</button>
		<button r:context="lob_lookup" r:name="_close">
			Cancel
		</button>
	</jsp:attribute>
	
	<jsp:body>
		<div class="section search-box">
			<input type="text" r:context="lob_lookup" r:name="searchtxt" size="40"/>
			<button r:context="lob_lookup" r:name="listModel.load">Search</button>
		</div>
		<table r:context="lob_lookup" r:model="listModel" r:varName="lob" r:varStatus="stat"
		       class="grid" cellpadding="0" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th width="10px">&nbsp;</th>
					<th align="left">Name</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<input type="checkbox" r:context="lob_lookup" r:name="listModel.getList()[#{stat.index}].selected" />
					</td>
					<td>#{lob.name}</td>
				</tr>
			</tbody>
		</table>
		<div class="section align-r">
			<button r:context="lob_lookup" r:name="listModel.moveFirst">
				First
			</button>
			<button r:context="lob_lookup" r:name="listModel.movePrev">
				Previous
			</button>
			<button r:context="lob_lookup" r:name="listModel.moveNext">
				Next
			</button>
		</div>
	</jsp:body>
	
</t:popup>

