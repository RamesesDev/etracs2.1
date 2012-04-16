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
		<table width="100%" height="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td valign="top" width="1px" height="100%">
					<table id="leftpanel" width="165px" cellpadding="0" cellspacing="0">
						<tr>
							<td valign="top">
								<jsp:doBody/>
							</td>
						</tr>
					</table>
				</td>
				<td valign="top" height="100%">
					<table class="shadowbox canvas" width="100%">
						<tr>
							<td align="right">
								<a id="toggle" href="#" style="text-decoration:none" title="Expand content panel">
									[+]
								</a>
								<script type="text/javascript">
									$(function(){
										var lp = $('#leftpanel');
										$('#toggle').click(function(){
											var e = $(this);
											if( lp.css('display') == 'none' )
												e.html('[+]').attr('title','Expand content panel');
											else
												e.html('[-]').attr('title','Compress content panel');

											lp.toggle();
											return false;
										});										
									});
								</script>
							</td>
						</tr>
						<tr>
							<td id="content" height="100%" valign="top">&nbsp;</td> 
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</jsp:body>

</t:secured>

