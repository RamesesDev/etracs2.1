<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/common/ui" prefix="common" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>

<t:secured-doc>
	<jsp:attribute name="head">
		<link href="${pageContext.servletContext.contextPath}/css/home.css?v=${APP_VERSION}" type="text/css" rel="stylesheet" />
		<script src="${pageContext.servletContext.contextPath}/js/ext/datetime.js?v=${APP_VERSION}"></script>
		
		<script>
			$(function(){
				var pause_animation;
				var index = 1;
				
				$('#banner .step-box').click(function(){
					$('#banner img.selected').removeClass('selected').stop().animate({opacity: 0});
					$('#banner img#img-' + this.id).addClass('selected').stop().animate({opacity: 1});
					$('#banner .step-box-selected').removeClass('step-box-selected');
					$(this).addClass('step-box-selected');
				})
				.hover(
					function(){ 
						$(this).addClass('step-box-hover'); 
						pause_animation = true; 
						index = parseInt( this.id.replace('s','') );
					},
					function(){ 
						$(this).removeClass('step-box-hover'); 
						pause_animation = false; 
					}
				);
				
				setInterval(function(){
					if( pause_animation ) return;
					index = (++index > 4)? 1 : index;
					$('#banner #s' + index).trigger('click');
				}, 5000);
			});
		</script>
	</jsp:attribute>
	
	<jsp:body>
		<h1 class="section">Welcome to ETRACS Taxpayer Portal!</h1>
		<div class="section">
			<div class="clearfix">
				<h4 class="left">Apply for a new business permit online in just 4 simple steps.</h4>
				<div class="right">
					<a href="modules/bp/application.jsp" class="button special">
						Apply A New Business Now!
					</a>
					<!--
					<a href="#" class="button special">
						View My Business Ledgers
					</a>
					-->
					<a href="modules/bp/home.jsp" class="button special">
						View My Applications
					</a>
				</div>
			</div>
			<div id="banner" class="section clearfix">
				<div class="left">
					<div id="s1" class="step-box step-box-selected">
						<h2>Step 1</h2>
						<div>Encode your business information.</div>
					</div>
					<div id="s2" class="step-box">
						<h2>Step 2</h2>
						<div>Find your line(s) of business.</div>
					</div>
					<div id="s3" class="step-box">
						<h2>Step 3</h2>
						<div>Encode the required assessment information.</div>
					</div>
					<div id="s4" class="step-box">
						<h2>Step 4</h2>
						<div>Print the online application form.</div>
					</div>
				</div>
				<div class="right step-image">
					<img id="img-s4" src="img/home/step4.png"/>
					<img id="img-s3" src="img/home/step3.png"/>
					<img id="img-s2" src="img/home/step2.png"/>
					<img id="img-s1" src="img/home/step1.png" class="selected"/>
				</div>
			</div>
		</div>
		<table class="section" width="100%" cellspacing="0">
			<tr>
				<td valign="top" class="box rounded">
					<h3>Updates</h3>
					<div class="hr"></div>
					<div class="section">
						<ul>
							<li>You have 1 draft renew application.</li>
							<li>The City Hall offers discount to new permit applications if ...<a href="#">read more</a></li>
							<li>Office of the Mayor gave credits to outstanding business ...<a href="#">read more</a></li>
						</ul>
					</div>
				</td>
				<td width="3px"></td>
				<td class="box rounded box-center" width="33%" valign="top">
					<h3>FAQ</h3>
					<div class="hr"></div>
					<ul class="section">
						<li>
							<a href="#">What services are available in Taxpayer Portal?</a>
						</li>
						<li>
							<a href="#">How will I print the online application form?</a>
						</li>
						<li>
							<a href="#">What should I do with my online application form?</a>
						</li>
						<li>
							<a href="#">What is the use of my online application form?</a>
						</li>
					</ul>
				</td>
				<td width="3px"></td>
				<td class="box rounded" width="33%" valign="top">
					<h3>Check Application Status</h3>
					<div class="hr"></div>
					<div class="section">
						<form action="modules/bp/checkstat.jsp" method="get">
							Enter the Business Application Number:
							<input type="text" class="search" size="25" name="txnno"/>
							<button type="submit">Go</button>
						</form>
					</div>
				</td>
			</tr>
		</table>
	</jsp:body>
</t:secured-doc>