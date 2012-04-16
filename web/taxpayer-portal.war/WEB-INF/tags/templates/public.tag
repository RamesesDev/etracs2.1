<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ tag import="java.util.regex.*" %>

<%@ attribute name="redirect_session" fragment="false" %>
<%@ attribute name="check_useragent" fragment="false" %>
<%@ attribute name="head" fragment="true" %>
<%@ attribute name="script" fragment="true"%>
<%@ attribute name="style" fragment="true"%>
<%@ attribute name="pageTitle" fragment="false"%>

<c:if test="${check_useragent != 'false'}">
	<%

	String userAgent = request.getHeader("user-agent");
	if( userAgent.contains("MSIE") ) {
		String exp = "MSIE(.*?);";
		Pattern p = Pattern.compile(exp);
		Matcher m = p.matcher(userAgent);
		if( m.find() ) {
			int v = Integer.parseInt(m.group(1).replaceAll("^\\s+|\\..*", ""));
			if( v <= 6 ) {
				response.sendRedirect("not-supported.jsp");
			}
		}
	}
	
	%>
</c:if>

<%

//get the app version
request.setAttribute("APP_VERSION", application.getInitParameter("app.version"));

%>

<c:if test="${!empty SESSIONID and redirect_session=='true'}">
	<%response.sendRedirect("home.jsp");%>
</c:if>

<c:if test="${(empty SESSIONID) || (empty redirect_session) || (redirect_session=='false')}">
	<!DOCTYPE html>
	<html>
		<head>
			<title>Gazeebu Classroom<c:if test="${not empty pageTitle}"> - ${pageTitle}</c:if></title>
			<meta charset="UTF-8" >
			<link href="${pageContext.servletContext.contextPath}/js/lib/css/jquery-ui/jquery.css?v=${APP_VERSION}" type="text/css" rel="stylesheet" />
			<link href="${pageContext.servletContext.contextPath}/js/lib/css/rameses-lib.css?v=${APP_VERSION}" type="text/css" rel="stylesheet" />
			<link href="${pageContext.servletContext.contextPath}/css/public.css?v=${APP_VERSION}" type="text/css" rel="stylesheet" />		
			<script src="${pageContext.servletContext.contextPath}/js/lib/jquery-all.js?v=${APP_VERSION}"></script>
			
			<script src="${pageContext.servletContext.contextPath}/js/lib/rameses-ext-lib.js?v=${APP_VERSION}"></script>
			<script src="${pageContext.servletContext.contextPath}/js/lib/rameses-ui.js?v=${APP_VERSION}"></script>
			<script src="${pageContext.servletContext.contextPath}/js/lib/rameses-proxy.js?v=${APP_VERSION}"></script>
			<script type="text/javascript">
				ProxyService.contextPath = '${pageContext.request.contextPath}';
			</script>
			
			<jsp:invoke fragment="head" />
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
			<table width="100%" height="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td class="head" valign="top">&nbsp;</td>
					<td class="head" width="850px" align="right" valign="top">
						<table width="100%" height="100%" cellpadding="0" cellspacing="0">
							<tr>
								<td id="topmenu" align="left" valign="center">
									<a href="${pageContext.servletContext.contextPath}">
										<img src="img/biglogo25.png">	
									</a>
								</td>
								<td id="topmenu" align="right" valign="top">&nbsp;</td>
							</tr>
						</table>
					</td>
					<td class="head">&nbsp;</td>		
				</tr>
				<tr>
					<td class="middle">&nbsp;</td>
					<td class="middle" valign="top" style="padding-top: 20px;">
						<jsp:doBody/>
					</td>
					<td class="middle">&nbsp;</td>		
				</tr>
				<tr>
					<td class="foot">&nbsp;</td>
					<td class="foot">
						<p id="footmenu">
							About &nbsp;&nbsp;
							Privacy &nbsp;&nbsp;
							Terms
						</p>
					</td>
					<td class="foot">&nbsp;</td>				
				</tr>
			</table>
		</body>	
	</html>	
</c:if>


	