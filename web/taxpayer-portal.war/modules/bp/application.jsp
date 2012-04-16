<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/common/ui" prefix="ui" %>
<%@ page import="java.util.*" %>


<s:invoke service="BPEnum" method="getOrganizations" var="ORGTYPES"/>
<s:invoke service="BPEnum" method="getOfficeTypes" var="OFFICETYPES"/>
<s:invoke service="BPEnum" method="getBarangays" var="BARANGAYS"/>

<c:if test="${param.mode == 'create' or empty param.mode}">
	<c:if test="${not empty param.objid}">
		<s:invoke service="WebBPApplicationService" method="open" params="${param.objid}" var="DRAFT_APP" debug="true"/>
	</c:if>
	<c:if test="${empty param.objid}">
		<s:invoke service="WebBPApplicationService" method="createNewApplication" var="DRAFT_APP" debug="true"/>
	</c:if>
</c:if>
<c:if test="${param.mode == 'renew'}">
	<s:invoke service="WebBPApplicationService" method="createRenewApplication" params="${param.objid}" var="DRAFT_APP" debug="true"/>
</c:if>
<c:if test="${not empty error}">
	<c:set var="ERROR_MSG" value="${error}"/>
	<c:set var="title" value="Transaction Error"/>
</c:if>
<c:if test="${DRAFT_APP.txntype=='NEW'}">
	<c:set var="title" value="New Business Application"/>
</c:if>
<c:if test="${DRAFT_APP.txntype=='RENEW'}">
	<c:set var="title" value="Business Renewal Application"/>
	<c:set var="toggleInput" value="disabled='disabled'" scope="request"/>
</c:if>

<t:secured-doc>
	<jsp:attribute name="head">
		<link href="${pageContext.request.contextPath}/js/ext/formpanel/formpanel.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/modules/bp/style.css?v1.1" rel="stylesheet" />
		
		<script src="${pageContext.servletContext.contextPath}/js/ext/datetime.js?v=${APP_VERSION}"></script>
		<script src="${pageContext.request.contextPath}/js/ext/formpanel/formpanel.js" type="text/javascript" ></script>

		<script type="text/javascript">
			<ui:loadmodules name="modules" role="${CLASS_INFO.usertype}"/>
		</script>
	
		<script type="text/javascript">
			$put(
				'app',
				new function()
				{
					var self = this;
					var svc = ProxyService.lookup('WebBPApplicationService');
					
					this.app = <ui:tojson value="${DRAFT_APP}"/>;
					
					this.organizations = <ui:tojson value="${ORGTYPES}"/>;
					this.officeTypes = <ui:tojson value="${OFFICETYPES}"/>;
					this.barangays = <ui:tojson value="${BARANGAYS}"/>;
					
					this.onload = function() {
						if( !this.app ) return;
						else if( this.app.docstate == 'DRAFT' )
							this.app._step_ = 1;
						else if( this.app._step_ == 3 )
							initAssessment();							
					}
					
					this.cancelEdit = function() {
						location.href = 'home.jsp#bp:app_info?objid=' + this.app.objid;
					}
					
					this.next = function() {
						validate();
						var ostep = this.app._step_;
						try {
							this.app._step_++;
							if( this.app._step_ == 3 ) {
								this.app = svc.saveForAssessment( this.app );
								initAssessment();
							}
							else {
								svc.save( this.app );
							}
						}
						catch(e) {
							this.app._step_ = ostep;
							throw e;
						}
					}
					
					var initAssessment = function() {
						var assess = $ctx('assessment_input');
						assess.oncomplete = assessmentDone;
						assess.app = self.app;
						assess.start();
					}
					
					var assessmentDone = function(app) {
						location.href = 'home.jsp#bp:app_info?objid=' + self.app.objid;
					}
					
					var validate = function() {
						if( self.app._step_ == 2 && self.app.lobs.length == 0 )
							throw new Error("Please provide at least one Line of Business.");
					}
					
					this.back = function() {
						var ostep = this.app._step_;
						try {
							if( this.app._step_ == 3 ) {
								this.app = svc.cancelAssessment( this.app );
							}
							else {
								this.app._step_--;
								svc.save(this.app);
							}
						}
						catch(e) {
							this.app._step_ = ostep;
							throw e;
						}
					}
					
					this.cancel = function(){
						MsgBox.confirm('Are you sure you want to cancel this application?', function(){
							svc.cancelDraft('${SESSION_INFO.userid}');
							location.href = 'home.jsp';
						});
					}

					var lobsvc;
					this.searchLob = function(o) {
						if(!lobsvc) lobsvc = ProxyService.lookup('WebLOBSearchService');
						return lobsvc.search(o);
					}
					
					this.removeLob = function() {
						if(!this.selectedLob) return;
						MsgBox.confirm('Are you sure you want to remove the selected line of business?',function(){
							self.app.lobs.remove(self.selectedLob);
							self._controller.refresh();
						});
					}
					
					this.propertyChangeListener = {
						'searchedLob': function(lob) {
							var old = self.app.lobs.find(function(l){ return l.lobid == lob.objid });
							if( !old ) {
								var newlob = {
									lobid: lob.objid,
									name:  lob.name,
									classificationid: lob.classificationid
								};

								if(self.app.txntype == 'NEW')     
									newlob.assessmenttype = 'NEW';
								else if(self.app.txntype == 'RENEW') 
									newlob.assessmenttype = 'ADDLOB';
								
								self.app.lobs.push(newlob);
							}
							self.lobsearchkey = '';
							self._controller.refresh();
						}
					};
					
					this.canRemoveLob = function(lob) {
						if(lob.assessmenttype == 'NEW' || lob.assessmenttype == 'ADDLOB')
							return true;
						
						return false;
					}
					
					this.canEditLob = function(lob) {
						return this.app.txntype == 'RENEW' && (lob.assessmenttype == 'RENEW' || lob.assessmenttype == 'RETIRELOB')
					}
				}
			);
		</script>
		
		<style>
			.main-content {
				margin-left: 32px;
			}
			.content-title {
				border-bottom: solid 1px lightgrey;
				padding-bottom: 10px;
				padding-top: 20px;
			}
		</style>
	</jsp:attribute>
	
	<jsp:body>
		<c:if test="${not empty ERROR_MSG}">
			<span class="error">
				${ERROR_MSG}
			</span>
		</c:if>
		<c:if test="${empty ERROR_MSG}">
			<div class="content-title">
				${title}
			</div>
			<div r:context="app" r:visibleWhen="#{app.docstate!='FOR_REVIEW'}" style="display:none">
				<div r:context="app" r:visibleWhen="#{app._step_ < 3}">
					<div r:context="app" r:visibleWhen="#{app._step_ == 1}">
						<jsp:include page="app_pages/step1.jsp"/>
					</div>
					
					<div r:context="app" r:visibleWhen="#{app._step_ == 2}">
						<jsp:include page="app_pages/step2.jsp"/>
					</div>
					
					<br/>
					<br/>
					<br/>
					<div class="hr"></div>
					
					<button r:context="app" r:name="cancel" r:visibleWhen="#{app._step_ == 1}" r:immediate="true" title="Previous step">
						Cancel
					</button>
					<button r:context="app" r:name="back" r:visibleWhen="#{app._step_ > 1}" title="Previous step">
						Back
					</button>
					<button r:context="app" r:name="next" title="Next step">
						Next
					</button>
				</div>
				
				<div r:context="app" r:visibleWhen="#{app._step_ == 3}">
					<jsp:include page="app_pages/step3.jsp"/>
				</div>
			</div>
		</c:if>
	</jsp:body>
</t:secured-doc>