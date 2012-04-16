<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/common/ui" prefix="ui" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<c:if test="${not empty param.txnno}">
	<s:invoke service="WebBPApplicationService" method="findAppByTxnno" params="${param.txnno}" var="APP" debug="true"/>
</c:if>
<c:if test="${not empty APP}">
	<ui:redirect page="home.jsp" hash="bp:app_info?objid=${APP.objid}" />
</c:if>
<c:if test="${empty APP}">
	<ui:redirect page="home.jsp" hash="bp:app_info" />
</c:if>