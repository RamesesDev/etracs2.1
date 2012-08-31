<%@ page import="java.io.*" %>

<%
	response.setContentType("text/xml");
	response.setDateHeader("Last-modified", new java.util.Date().getTime());
	
	BufferedReader br = null;
	try
	{
		br = new BufferedReader(new InputStreamReader(application.getResourceAsStream("modules/updates.xml")));
		String line;
		while( (line=br.readLine()) != null ) {
			if( line.trim().startsWith("</modules") ) {
				//load extra modules
				out.write("<module file='ext-module/test.jar'/>");
			}
			out.write( line );
		}
	}
	catch(Exception e) {}
	finally 
	{
		try{ br.close(); }catch(Exception e){}
	}
%>