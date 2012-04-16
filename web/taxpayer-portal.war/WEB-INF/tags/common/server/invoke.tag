<%@ tag import="com.rameses.service.*" %>
<%@ tag import="java.util.*"%>
<%@ attribute name="appcontext"%>
<%@ attribute name="host"%>
<%@ attribute name="service"%>
<%@ attribute name="method"%>
<%@ attribute name="var"%>
<%@ attribute name="debug"%>
<%@ attribute name="params" rtexprvalue="true" type="java.lang.Object" required="false"%>

<%
	try {
		if(host==null) host = application.getInitParameter("app.host");
		if(appcontext==null) appcontext = application.getInitParameter("app.context");
		
		Map env = new HashMap();
		if(request.getAttribute("SESSIONID")!=null) {
			env.put("sessionid", request.getAttribute("SESSIONID"));
		}	
		Map conf = new HashMap();
		conf.put("app.host", host );
		conf.put("app.context", appcontext );
		
		ScriptServiceContext svc = new ScriptServiceContext(conf);
		ServiceProxy ac = (ServiceProxy) svc.create( service, env );
		Object o = null;
		if(params==null) {
			o = ac.invoke(method);
		}
		else if(params instanceof List) {
			o = ac.invoke(method, ((List) params).toArray() );
		}
		else {
			o = ac.invoke(method, new Object[]{params});
		}
		if(var!=null) {
			request.setAttribute(var, o);
		}
		request.setAttribute("error", null);
		
	}
	catch(Exception e) {
		if("true".equals(debug)) e.printStackTrace();
		
		String errorMessage = "";
		e = com.rameses.util.ExceptionManager.getOriginal(e);
		if( e != null ) errorMessage = e.getMessage();
		
		request.setAttribute("error", errorMessage );
	} 	
%>

