<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${!empty SESSIONID}">
	<%response.sendRedirect("home.jsp");%>
</c:if>

<% if( "POST".equals(request.getMethod()) ) {%>
	<%  
		Map map = new HashMap();
		map.put( "username", request.getParameter( "username" ) );
		map.put( "password", request.getParameter( "password" ) );
		request.setAttribute( "data", map );	
	%>


	<s:invoke service="LoginService" method="login" params="${data}" var="result" debug="true"/>
	<c:if test="${not empty result and result.usertype != 'entity'}">
		<c:set var="error" value="true" scope="request"/>
	</c:if>
	<c:if test="${empty error}">
		<c:set var="SESSIONID" value="${result.sessionid}" scope="request"/>
		<%
			Cookie cookie = new Cookie( "sessionid", (String)request.getAttribute("SESSIONID") ) ;
			response.addCookie( cookie );
			
			if( request.getParameter("u") != null )
				response.sendRedirect(request.getParameter("u"));
			else
				response.sendRedirect("home.jsp");
		%>
	</c:if>
<% } %>

<!DOCTYPE html>
<html>
	<head>
		<title>ETRACS Taxpayer Portal v1.0</title>
		<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" />
	</head>
	<body>
		<table class="wrapper" width="100%" height="100%">
			<tr>
				<td align="center">
					<div class="login-box">
						<h3 class="clear section align-l title">
							Taxpayer Portal
						</h3>
						<div class="icon left section">
							<img src="${pageContext.request.contextPath}/img/screen.png"/>
						</div>
						<form class="left section" method="post">
							<div class="clear err align-c section">
								<c:if test="${!empty error}">
									Invalid username or password.
								</c:if>
								&nbsp;
							</div>
							<label class="section">
								<span>Username:</span>
								<input id="uid" type="text" name="username" value="${param.username}" size="25"/>
							</label>
							<label class="section">
								<span>Password:</span>
								<input id="pwd" type="password" name="password" size="25"/>
							</label>
							<div class="align-r clear">
								<button type="submit">Login</button>
							</div>
							<script type="text/javascript">
								var u = document.getElementById('uid');
								if(u) {
									if(u.value) {
										var p = document.getElementById('pwd');
										if(p) p.focus();
									}
									else {
										u.focus();
									}
								}
							</script>
						</form>
					</div>
				</td>
			</tr>
			<tr>
				<td class="footer" align="center" height="80px">
					&copy; 2012 Rameses Systems Inc. All Rights Reserved.
				</td>
			</tr>
		</table>
	</body>
</html>

