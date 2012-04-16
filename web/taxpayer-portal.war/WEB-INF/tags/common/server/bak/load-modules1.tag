<%@ attribute name="var" rtexprvalue="true" %>
<%@ attribute name="name" rtexprvalue="true" %>
<%@ tag import="com.rameses.web.support.*" %>

<%request.setAttribute( var, ModuleUtil.getEntries( application, name, var, var ) );%>
