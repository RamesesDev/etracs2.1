<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<c:choose>
	<c:when test="${param.t == 'assessment'}">
		<s:invoke service="WebBPReportService" method="getPDFAssessmentReport" params="${param.id}" var="APP" debug="true"/>
	</c:when>
	<c:when test="${param.t == 'app'}">
		<s:invoke service="WebBPReportService" method="getPDFAppReport" params="${param.id}" var="APP" debug="true"/>
	</c:when>
	<c:otherwise>
		<c:set var="errormsg" value="Invalid report type." scope="request"/>
	</c:otherwise>
</c:choose>
<%
	byte[] bytes = (byte[]) request.getAttribute("APP");
	String errormsg = (String)request.getAttribute("errormsg");
	if( errormsg != null ) {
		out.write( errormsg );
	}
	else if( bytes == null ) {
		out.write("Failed to load the pdf file. Please try again or contact the LGU IT administrator.");
	} 
	else {
		response.setContentType("application/pdf");		
		Writer w = response.getWriter();
		InputStream is = null;
		
		try {
			is = new ByteArrayInputStream(bytes);
			int i = -1;
			while( (i=is.read()) != -1 ) w.write(i);
			w.flush();
		}
		catch(Exception e) {
			if( is != null ) try{ is.close(); }catch(Exception ign){;}
		}
	}
%>