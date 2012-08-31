<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.*,java.util.*" %>

<%
  File f  = new File( System.getProperty("jboss.server.home.dir") + "/apps/install.war/installed" );
  if( f.exists() ) {
	   response.sendRedirect( "/" );
  }
%>

<!DOCTYPE html>
<html>

	<head>
		<link href="style.css" rel="stylesheet"/>
		<link href="${pageContext.servletContext.contextPath}/js/lib/css/jquery-ui/jquery.css" type="text/css" rel="stylesheet" />
		<script src="${pageContext.servletContext.contextPath}/js/lib/jquery-all.js"></script>
		<link href="${pageContext.servletContext.contextPath}/js/lib/css/rameses-lib.css" type="text/css" rel="stylesheet" />
		<script src="${pageContext.servletContext.contextPath}/js/lib/rameses-ext-lib.js"></script>
		<script src="${pageContext.servletContext.contextPath}/js/lib/rameses-ui.js"></script>
		<script>
			$put( 
				"installer",
				new function() 
				{
					var self = this;
					
					this.info = {
						server_ip: '<%=System.getProperty("jboss.bind.address")%>',
						server_port: "8080",
						dbhost: "localhost",
						adminuser: "admin"
					}
					
					this.errors = {}
					this.db = {}					
					this.drivers = [
						{caption: "MySQL", id:"mysql"},
						{caption: "SQL Server",  id:"mssql"},
					];
					
					this.onload = function() {						
						//check if there is data on the sessionStorage
						if( window.sessionStorage && window.sessionStorage.installation_info ) {
							var info;
							try {
								info = eval('(' + sessionStorage.installation_info + ')' );
							}
							catch(e){}
							
							if( info ) this.info = info;
							
							if( sessionStorage.installation_current_page )
								return sessionStorage.installation_current_page;
						}
					}
					
					this.back = function() {
						var pageName = 'default';
						if( this._controller.currentPage == 'step2' )
							pageName = 'step1';
						
						updateSessionInfo( pageName );
						return pageName;
					}
					
					this.verifyServerInfo = function() {
						this.errors = {}
						var hasErrs = false;
						if(!this.info.appname) {this.errors.appname = true; hasErrs = true;}
						if(!this.info.lguname) {this.errors.lguname = true; hasErrs = true;}
						if(!this.info.server_ip) {this.errors.server_ip = true; hasErrs = true;}
						if(!this.info.server_port) {this.errors.server_port = true; hasErrs = true;}
						if(! hasErrs ){
							updateSessionInfo("step1");
							return "step1";
						}	
					}
					
					this.verifyDbInfo = function() {
						this.errors = {}
						var hasErrs = false;
						if(!this.info.dbhost) {this.errors.dbhost = true; hasErrs = true;}
						if(!this.info.dbuser) {this.errors.dbuser = true; hasErrs = true;}
						if(!this.info.dbpwd) {this.errors.dbpwd = true; hasErrs = true;}
						if(!this.info.c_dbpwd) {this.errors.c_dbpwd = true; hasErrs = true;}
						if(! hasErrs ){
							if( this.info.dbpwd != this.info.c_dbpwd ) {
								alert("Password must match the confirmed password");
								return;
							}
							updateSessionInfo("step2");
							return "step2";
						}	
					}
					
					var startProcessing = function() {
						self.message = '- Building server configuration...';
						$invoke( "install.jsp", self.info, function(hreq) {
							var msg = hreq.responseText;
							if( msg ) msg = msg.trim();
							if( msg != 'DONE' ) {
								alert( msg );
								updateSessionInfo('step2');
								self._controller.navigate('step2');
								return;
							}
							self.message += '<br/>- Deploying server configuration...';
							self._controller.refresh();
							setTimeout( waitForDeployment, 3000 );
						});
					}
					
					var waitForDeployment = function() {
						var oncomplete = function(req) {
							if( req.status != 200 ) {
								setTimeout( waitForDeployment, 3000 );
							}
							else {
								location.href = 'completed.jsp';
							}
						}
						
						//wait for the ear to be deployed
						$invoke( "/" + self.info.appname, null, oncomplete, "get" );
					}
					
					this.verifyAdminInfo = function() {
						this.errors = {}
						var hasErrs = false;
						if(!this.info.adminpwd) {this.errors.adminpwd = true; hasErrs = true;}
						if(!this.info.c_adminpwd) {this.errors.c_adminpwd = true; hasErrs = true;}
						if(! hasErrs ){
							if( this.info.adminpwd != this.info.c_adminpwd ) {
								alert("Password must match the confirmed password");
								return;
							}
							
							if( confirm("You are about to start the installation process. Continue?")) {
								//set the currentPage to "step2" just in case 
								//the user cancels/reloads the processing page
								updateSessionInfo("step2");
								
								startProcessing();
								return "processing";
							}
							
						}
					}
					
					//if sessionStorage is supported by the browser,
					//store the info to the sessionStorage
					var updateSessionInfo = function( currentPage ) {
						if( window.sessionStorage ) {
							sessionStorage.installation_info = $.toJSON( self.info );
							sessionStorage.installation_current_page = currentPage;
						}
					}
					
				},
				{
					"default" : "installer_start.jsp",
					"step1" : "installer_step1.jsp",
					"step2" : "installer_step2.jsp",
					"processing" : "installer_processing.jsp"
				}
			);	
		</script>
	</head>

	<body>
		<table width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td height="100">
					<img src="img/etracs.png" height="70px" width="230px"/>
				</td>
				<td>
					<h1>Welcome to ETRACS version 2.0 Installation</h1>
				</td>
			</tr>
			<tr>
				<td valign="top" width="250px">
					<div r:type="label" r:context="installer">
						<div class="step #{_controller.currentPage == 'default' ? 'selected' : ''}">Server Info</div>
						<div class="step #{_controller.currentPage == 'step1' ? 'selected' : ''}">Database Info</div>
						<div class="step #{_controller.currentPage == 'step2' ? 'selected' : ''}">Admin Info</div>
						<div class="step #{_controller.currentPage == 'processing' ? 'selected' : ''}">Processing</div>
					</div>
				</td>
				<td valign="top">
					<div r:controller="installer" class="paging-canvas"></div>
				</td>
			</tr>
		</table>
	
	</body>
	
</html>