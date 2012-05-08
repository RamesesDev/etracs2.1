<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>

<t:popup>

	<jsp:attribute name="head">
		<script src="${pageContext.servletContext.contextPath}/js/ext/datetime.js"></script>

		<script type="text/javascript">
			$put("newtask",
				new function()
				{
					this.name = "hello";
					this.task = {servicetype:"script"}
					this.saveHandler;
					this.mode = 'create';
					this.restart;
					
					this.save = function() {
						if( this.restart ) this.task.currentdate = null;
						this.saveHandler( this.task );
						return "_close";
					}
				}
			);
		</script>
	</jsp:attribute>

	<jsp:attribute name="leftactions">
		<input type="button" r:context="newtask" r:name="save" value="Save" /> 
	</jsp:attribute>

	<jsp:body>
		<table>
			<tr>
				<td>Task ID:</td>
				<td> <input type="text" r:context="newtask" r:name="task.id" r:required="true" r:caption="ID"/></td>
			</tr>
			<tr>
				<td>Description:</td>
				<td> <input type="text" r:context="newtask" r:name="task.description"/></td>
			</tr>
			<tr>
				<td>Service:</td>
				<td> <input type="text" r:context="newtask" r:name="task.service" r:required="true" r:caption="Service name"/></td>
			</tr>
			<tr>
				<td>Method:</td>
				<td> <input type="text" r:context="newtask" r:name="task.method" r:required="true" r:caption="Method"/></td>
			</tr>
			<tr>
				<td>Service Type:</td>
				<td> <input type="text" r:context="newtask" r:name="task.servicetype" r:required="true" r:caption="Service Type"/></td>
			</tr>
			<tr>
				<td>Parameters:</td>
				<td> <textarea r:context="newtask" r:name="task.parameters" r:caption="Parameters"></textarea></td>
			</tr>
			<tr>
				<td>App Host:</td>
				<td> <input type="text" r:context="newtask" r:name="task.apphost" r:required="true" r:caption="App Host"/></td>
			</tr>
			<tr>
				<td>App Context:</td>
				<td> <input type="text" r:context="newtask" r:name="task.appcontext" r:required="true" r:caption="App Context"/></td>
			</tr>
			<tr>
				<td>Allowed Host:</td>
				<td> <input type="text" r:context="newtask" r:name="task.allowedhost" r:caption="Allowed Host"/></td>
			</tr>
			<tr>
				<td>Start date:</td>
				<td> <span r:type="datetime" r:context="newtask" r:name="task.startdate" r:required="true" r:caption="Start Date"/></td>
			</tr>
			<tr>
				<td>End date :</td>
				<td><span r:type="datetime" r:context="newtask" r:name="task.enddate" r:caption="End Date" r:options="{maxYear: (new Date()).getFullYear() + 3}"/></td>
			</tr>
			<tr r:context="newtask" r:visibleWhen="#{mode == 'edit'}">
				<td>Restart Task :</td>
				<td>
					<input type="checkbox" r:context="newtask" r:name="restart" />
				</td>
			</tr>
			<tr>
				<td>Interval:</td>
				<td> <input type="text" r:context="newtask" r:name="task.interval" r:required="true" r:caption="Interval"/></td>
			</tr>
		</table>
	</jsp:body>
	
</t:popup>


