<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/common" prefix="common" %>
<%@ tag import="com.rameses.web.support.*" %>
<%@ tag import="com.rameses.server.common.*" %>
<%@ tag import="java.util.*" %>

<%@ attribute name="name" %>
<%@ attribute name="role" %>

<%
	List perms = (List) request.getAttribute("PERMISSIONS");
	List elements = ModuleUtil.getEntries( application, "invokers", name, name );
	List newList = new ArrayList();
	Iterator iter = elements.iterator();
	
	String ctxpath = request.getContextPath();
	if(ctxpath == null) ctxpath = "/";
	
	while( iter.hasNext() ) {
		boolean isPermitted = true;
		Map o = (Map) iter.next();
		Object perm = o.get("permission");
		if( perm!=null && perms!=null ) {
			isPermitted = ( perms.indexOf( perm)>=0 ); 
		}
		if( role!=null && o.get("role")!=null ) {
			isPermitted = ( o.get("role").toString().matches( role ) ); 
		}
		
		if(isPermitted) {
			Map m = new HashMap();
			if(o.get("id")!=null ) {
				m.putAll( o );
				String modname = (String) o.get("_name" );
				m.remove("_parent");
				
				if( m.get("page")==null ) {
					m.put( "page", o.get("id") + ".jsp" );
				}
				m.put( "page", ctxpath + "/" + name + "/" + modname + "/" + m.get("page" ) );
				m.put( "id", modname + ":" + m.get("id") );
				if( m.get("parent")!=null) {
					m.put( "parent", modname + ":" + m.get("parent") );
				}
				if( m.get("context")==null) {
					m.put( "context", o.get("id") );
				}
				
				m.remove("_name");
				newList.add(m);
			}
		}	
	}
	request.setAttribute("APPLIST", newList );
%>

<c:forEach items="${APPLIST}" var="item">
	<c:set var="item" scope="request" value="${item}"/>
	$register( <%=JsonUtil.toString( request.getAttribute("item"))%>  );
</c:forEach>


