<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/common/ui" prefix="ui" %>


<s:invoke service="BPApplicationService" method="open" params="${param.objid}" var="APP"/>
<c:choose>
	<c:when test="${APP.docstate=='DRAFT'}">
		<jsp:include page="app_info/view.jsp"/>
	</c:when>
	<c:when test="${APP.docstate=='ACTIVE' or APP.docstate=='EXPIRED'}">
		<jsp:include page="app_info/active.jsp"/>
	</c:when>
	<c:when test="${not empty APP}">
		<jsp:include page="app_info/assessment.jsp"/>
	</c:when>
	<c:otherwise>
		<jsp:include page="app_info/not_found.jsp"/>
	</c:otherwise>
</c:choose>