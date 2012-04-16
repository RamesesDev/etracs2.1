<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/common/ui" prefix="common" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>

<t:secured-master>
	<jsp:attribute name="head">
		<script src="${pageContext.servletContext.contextPath}/js/ext/datetime.js?v=${APP_VERSION}"></script>
		<!--
		<script src="${pageContext.servletContext.contextPath}/js/ext/colResizable-1.3.min.js?v=${APP_VERSION}"></script>
		-->
		
		<script type="text/javascript">
			<common:loadmodules name="modules" role="${CLASS_INFO.usertype}"/>
		
			$put("modules", 
				new function() {
					this.items = new Array();
					this.onload = function() {
						this.items = Registry.lookup( "bp:menu" );
					}
				}
			);

			$put("home", 
				new function() {
					
					this.onload = function() {
						if(!window.location.hash) {
							var items = $ctx('modules').items;
							if(items) window.location.hash = items[0].id;
						}
					}
					
				}
			);
		</script>
	</jsp:attribute>
	
	<jsp:attribute name="style">
		
	</jsp:attribute>
	
	<jsp:body>
		<h3>Business Applications</h3>
		<div class="hr"></div>
		<table class="nav" r:context="modules" r:items="items" r:varName="item" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td class="icon">
					#{item.icon? '<img src="' + item.icon + '" width="16px"/>' : ''}
				</td>
				<td class="caption">
					<a href="##{item.id}">
						#{item.caption}
					</a>
				</td>
			</tr>
		</table>
		<div class="hr"></div>
		<div class="section">
			<button class="special" onclick="location.href='application.jsp'">
				Apply A New Business
			</button>
		</div>
	</jsp:body>
</t:secured-master>