<%@ page import="java.io.*" %>

<%
	response.setDateHeader("Last-modified", new java.util.Date().getTime());
	
	InputStream is = null;
	try
	{
		if( request.getPathInfo() != null ) {
			out.write("serving resource " + request.getPathInfo().substring(1));
		}
		else {
			response.sendError(404, "Module requested not found.");
		}
	}
	catch(Exception e) {}
	finally 
	{
		try{ is.close(); }catch(Exception e){}
	}
%>
