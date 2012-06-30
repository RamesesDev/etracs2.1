<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>

<t:content title="Tasks">
	
	<jsp:attribute name="head">
		<script type="text/javascript">
			$put("tasklist",
				new function(){
					var session ;
					var svc = ProxyService.lookup("TaskSchedulerService");
					
					var self = this;
					this.task;
					this.tasklist = [];
					
					this.listModel = {
						rows: 15,
						fetchList: function(o) {
							if(o==null) o = {}
							self.tasklist = svc.getActiveTasks(o);
							return self.tasklist;
						}
					}
					
					this.onload = function() {
						session = new Notifier( svc.getSessionId(), window.location.href );
						session.handler = function(o) {
							var z = self.tasklist.find(
								function(x) {return o.id==x.id}
							) 
							if(z) {
								z.status = o.status;
								if(!z.status || z.status == 'proceed' || z.status == 'resumed') z.status = 'active';
								if( o.currentdate ) z.currentdate = o.currentdate;
								self.listModel.refresh(false);
							}
						}
						session.connect();
					}
					
					this.suspend = function() {
						if(this.task) svc.suspend({id: this.task.id});
					}

					this.resume = function() {
						if(this.task) svc.resume({id:this.task.id});
					}

					this.resumeError = function() {
						if(this.task) svc.resumeError({id:this.task.id});
					}

					this.addTask = function() {
						var saveHandler = function(o) {
							o.suspended = "true";
							svc.create( o );
							self.listModel.refresh(true);
						}
						return new PopupOpener("scheduler:newtask", {saveHandler: saveHandler });
					}

					this.editTask = function() {
						var saveHandler = function(o) {
							svc.update( o );
							self.listModel.refresh(true);
						}
						return new PopupOpener("scheduler:newtask", {saveHandler: saveHandler, task: this.task, mode: 'edit'});
					}
					
					this.remove = function() {
						if(this.task && confirm('Are you sure you want to delete this record?')) {
							svc.remove( this.task );
							this.listModel.refresh(true);
						}
					}

				}
			);
		</script>
	</jsp:attribute>

	<jsp:attribute name="actions">
		<input type="button" r:context="tasklist" r:name="addTask" value="Add Task" /> 
	</jsp:attribute>
	
	<jsp:body>
		<table class="grid" r:context="tasklist" r:model="listModel" r:varName="item" r:varStatus="stat" r:name="task" cellpadding="0" cellspacing="0" border="0" width="100%">
			<thead>
				<tr>
					<td>Id</td>
					<td>Description</td>
					<td>Status</td>
					<td>Service</td>
					<td>Method</td>
					<td>Current Date</td>
					<td>&nbsp;</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td valign="top">#{item.id}</td>
					<td valign="top">#{item.description}</td>
					<td valign="top">#{item.status}</td>
					<td valign="top">#{item.service}</td>
					<td valign="top">#{item.method}</td>
					<td valign="top">#{item.currentdate? item.currentdate : ''}</td>
					<td valign="top" style="font-size: 9pt">
						<nobr>
							<a r:context="tasklist" r:name="suspend" r:visibleWhen="#{item.status == 'active'}">Suspend</a>
							
							<span r:context="tasklist" r:visibleWhen="#{item.status == 'suspended'}">
								<a r:context="tasklist" r:name="editTask">Edit</a>|
								<a r:context="tasklist" r:name="resume">Resume</a>|
								<a r:context="tasklist" r:name="remove">Delete</a>
							</span>
							
							<a r:context="tasklist" r:name="recover" r:visibleWhen="#{item.status == 'error'}">Recover</a>
						</nobr>
					</td>
				</tr>
			</tbody>
			<tfoot>

				<tr class="control">

					<td colspan="7" align="right">

						<input type="button" r:context="tasklist" r:name="listModel.moveFirst" value="&lt;&lt;" />

						<input type="button" r:context="tasklist" r:name="listModel.movePrev" value="&lt;" />

						<input type="button" r:context="tasklist" r:name="listModel.moveNext" value="&gt;" />

					</td>

				</tr>

			</tfoot>
		</table>
	</jsp:body>
	
</t:content>


