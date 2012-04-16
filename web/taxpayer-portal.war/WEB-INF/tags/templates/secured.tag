<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ attribute name="before_rendering" fragment="true" %>
<%@ attribute name="head" fragment="true" %>
<%@ attribute name="script" fragment="true" %>
<%@ attribute name="style" fragment="true" %>
<%@ attribute name="header_middle" fragment="true" %>
<%@ attribute name="pageTitle" fragment="false"%>

<c:if test="${empty SESSIONID}">
	<%
		String uri = request.getRequestURI();
		String qs = request.getQueryString();
		if( qs != null )
			uri = uri + "?" + qs;
		
		response.sendRedirect("index.jsp?u=" + java.net.URLEncoder.encode(uri));
	%>
</c:if>

<%

//get the app version
request.setAttribute("APP_VERSION", application.getInitParameter("app.version"));

%>

<c:if test="${!empty SESSIONID}">
	<s:invoke service="SessionService" method="getInfo" params="${SESSIONID}" var="SESSION_INFO"/>

	<jsp:invoke fragment="before_rendering"/>
	<!DOCTYPE html>
	<html>
		<head>
			<title>ETRACS Taxpayer Portal v1.0<c:if test="${not empty pageTitle}"> - ${pageTitle}</c:if></title>
			<link href="${pageContext.servletContext.contextPath}/js/lib/css/jquery-ui/jquery.css?v=${APP_VERSION}" type="text/css" rel="stylesheet" />
			<link href="${pageContext.servletContext.contextPath}/js/lib/css/rameses-lib.css?v=${APP_VERSION}" type="text/css" rel="stylesheet" />
			<script src="${pageContext.servletContext.contextPath}/js/lib/jquery-all.js?v=${APP_VERSION}"></script>
			<script src="${pageContext.servletContext.contextPath}/js/lib/rameses-ext-lib.js?v=${APP_VERSION}"></script>
			<script src="${pageContext.servletContext.contextPath}/js/lib/rameses-ui.js?v=${APP_VERSION}"></script>
			<script src="${pageContext.servletContext.contextPath}/js/lib/rameses-proxy.js?v=${APP_VERSION}"></script>
			<script src="${pageContext.servletContext.contextPath}/js/lib/rameses-session.js?v=${APP_VERSION}"></script>
			<link href="${pageContext.servletContext.contextPath}/css/secured.css?v=${APP_VERSION}" type="text/css" rel="stylesheet" />
			
			<script>
				//global settings
				Env.sessionid = $.cookie("sessionid");
				ProxyService.contextPath = '${pageContext.request.contextPath}';
				Notifier.contextPath = '${pageContext.request.contextPath}';
				
				var Session = new Notifier( Env.sessionid );
				Registry.add( {id:"#usermenu", context:"session"} );
				
				$put("session",
					new function() {

						this.logout = function() {
							try {
								var svc = ProxyService.lookup('LogoutService');
								svc.logout( Env.sessionid ); 
							}
							catch(e) {
								if( window.console ) console.log( e );
							}
						}
						
						var profileMenu;						
						this.showProfileMenu = function() {
							if( !profileMenu ) {
								profileMenu = new DropdownOpener( '#usermenu' );
								profileMenu.options = {
									styleClass: 'dropdownmenu',
									handleClassOnOpen: 'menu_open',
									position: {my: 'right top', at: 'right bottom'}
								};
							}
							return profileMenu;
						}
						
						this.onload = function() {
							Session.connectionListener.ended = function(o) {
								$.cookie( "sessionid", null );
								if( o == "_:ended" || o == "_:destroyed" ) {
									window.location.href = "${pageContext.request.contextPath}/";
								}
								else {
									window.location.reload(true);
								}	
							}	
							Session.connect();
						}
					}
				);	
			</script>

			<jsp:invoke fragment="head"/>
			<c:if test="${! empty script}">
			<script>
				<jsp:invoke fragment="script"/>	
			</script>	
			</c:if>

			<c:if test="${! empty style}">
			<style>
				<jsp:invoke fragment="style"/>	
			</style>	
			</c:if>
		</head>
		
		<body>
			<div class="wrapper">
				<table class="main-container" width="930px" align="center" cellpadding="0" cellspacing="0" height="100%">
					<tr>
						<td height="100%">
							<jsp:doBody/>
						</td>
					</tr>
					<tr>
						<td class="footer" width="980" valign="top">
							&copy; 2012 Rameses Systems Inc. All Rights Reserved.
						</td>
					</tr>
				</table>
			</div>
			
			<!-- this is the header which will be floated at the top of the page -->
			<div class="header">
				<table class="inner" cellpadding="0" cellspacing="0" width="930px" height="100%" align="center">
					<tr>
						<td width="165">
							<a href="${pageContext.servletContext.contextPath}">
								<img src="${pageContext.servletContext.contextPath}/img/etracs-logo.gif">
							</a>
						</td>
						<td align="left">
							<jsp:invoke fragment="header_middle"/>
						</td>
						<td align="right" class="mainmenu">
							<a href="${pageContext.request.contextPath}/home.jsp">Home</a>
							<a href="#" onclick="return false;">Profile</a>
							<a href="#" id="useraccountmenu" class="capitalized"
							   r:context="session" r:name="showProfileMenu" 
							   title="${SESSION_INFO.account_name_title}">
								Hi ${not empty SESSION_INFO.firstname? SESSION_INFO.firstname : SESSION_INFO.username}
								&nbsp;&nbsp;&#9660;
							</a>
							<!-- useraccount menu panel -->
							<div id="usermenu" style="display:none">
								<ul>
									<li>
										<a href="profile.jsp">Edit Profile</a>
									</li>
									<li>
										<a r:context="session" r:name="logout">Logout</a>
									</li>
								</ul>
							</div>
						</td>
					</tr>
				</table>
			</div>
			
		</body>
	</html>	
</c:if>
