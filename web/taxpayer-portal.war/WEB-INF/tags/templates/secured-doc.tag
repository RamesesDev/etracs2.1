<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>

<%@ attribute name="before_rendering" fragment="true" %>
<%@ attribute name="header_middle" fragment="true" %>
<%@ attribute name="script" fragment="true" %>
<%@ attribute name="style" fragment="true" %>
<%@ attribute name="head" fragment="true" %>
<%@ attribute name="pageTitle" fragment="false"%>


<t:secured pageTitle="${pageTitle}">

	<jsp:attribute name="before_rendering">
		<jsp:invoke fragment="before_rendering"/>
	</jsp:attribute>

	<jsp:attribute name="head">
		<jsp:invoke fragment="head"/>
	</jsp:attribute>	
	
	<jsp:attribute name="header_middle">
		<jsp:invoke fragment="header_middle"/>
	</jsp:attribute>	
	
	<jsp:attribute name="script">
		<jsp:invoke fragment="script"/>
	</jsp:attribute>	
	
	<jsp:attribute name="style">
		<jsp:invoke fragment="style"/>
	</jsp:attribute>	
	
	<jsp:body>
		<table class="shadowbox canvas" width="100%">
			<tr>
				<td class="content" valign="top">
					<jsp:doBody/>
				</td> 
			</tr>
		</table>
	</jsp:body>

</t:secured>

