<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/common" prefix="common" %>
<%@ tag import="com.rameses.web.support.*" %>
<%@ tag import="java.util.*" %>

<%@ attribute name="target" rtexprvalue="true"%>

<style>
	.usermenu tr.unselected td { font-size: 11px; font-family:arial; padding:2px;}
	.usermenu tr.selected { background: lightgrey;  }
	.usermenu tr.selected td { font-size: 11px; font-family:arial; color: black; padding:2px; font-weight:bolder; }
</style>
<script type="text/javascript">
	$put("module_manager", 
		new function() {
			var self = this;
			this.selected;
			
			this.onload = function() {
				Bookmark.handlers.usermenu = function( inv, params ) {
					if( inv.type == 'usermenu' ) {
						self.selected = inv;
					}
					else if ( inv.parent ) {
						self.selected = Registry.find( inv.parent );
					}
					if( self.menuModel.refresh )
						self.menuModel.refresh(); 
				}
				Bookmark.start();
			}
			
			this.menuModel = {
				fetchList: function(o) {
					return Registry.lookup( "usermenu" );
				}
			}
			
			this.navigate = function() {
				Bookmark.navigate( this.menuModel.getSelectedItem().id );
			}
		}	
	);
	
</script>
<div style="padding-top:5px;padding-bottom:5px;border-top:1px solid lightgrey;">
<table width="100%" class="usermenu" context="module_manager" name="selected" model="menuModel" cellpadding="0" cellspacing="0" style="padding-top:5px;" varName="item">
	<tbody>
		<tr zclass="unselected" zonclick="$ctx('module_manager').navigate()">
			<td width="10"><img src="img/online.png"/></td>
			<td><a href="##{item.id}">#{item.caption}</a></td>
		</tr>
	</tbody>
</table>
</div>

