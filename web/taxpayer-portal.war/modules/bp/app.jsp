<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/common/ui" prefix="ui" %>
<%@ page import="java.util.*" %>


<s:invoke service="BPEnum" method="getOrganizations" var="ORGTYPES"/>
<s:invoke service="BPEnum" method="getOfficeTypes" var="OFFICETYPES"/>
<s:invoke service="BPEnum" method="getBarangays" var="BARANGAYS"/>

<c:if test="${param.mode == 'create'}">
	<s:invoke service="WebBPApplicationService" method="createNewApplication" var="DRAFT_APP" debug="true"/>
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


<t:content title="${title}">

	<jsp:attribute name="head">		
		<link href="${pageContext.request.contextPath}/js/ext/formpanel/formpanel.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/modules/bp/style.css?v1.1" rel="stylesheet" />
		
		<script src="${pageContext.request.contextPath}/js/ext/formpanel/formpanel.js" type="text/javascript" ></script>
	
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
						if( this.app.docstate == 'FOR_REVIEW' )
							assessmentDone();
						else if( this.app._step_ == 3 )
							initAssessment();
					}
					
					this.cancelEdit = function() {
						location.hash = 'bp:app_info?objid=' + this.app.objid;
					}
					
					this.next = function() {
						validate();
						var ostep = this.app._step_;
						try {
							if( this.app._step_ == 3 ) {
								var assess = $ctx('assessment_input');
								assess.next();
							}
							else {
								this.app._step_++;
								if( this.app._step_ == 3 ) {
									this.app = svc.saveForAssessment( this.app );
									initAssessment();
								}
								else {
									svc.saveDraft( this.app );
								}
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
						location.hash = 'bp:app_info?objid=' + self.app.objid;
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
								svc.saveDraft(this.app);
							}
						}
						catch(e) {
							this.app._step_ = ostep;
							throw e;
						}
					}
					
					this.cancel = function(){
						if(!confirm('Are you sure you want to cancel this application?'))
							return;
						
						svc.cancelDraft('${SESSION_INFO.userid}');
						location.hash = '';
						location.reload();
					}

					var lobsvc;
					this.searchLob = function(o) {
						if(!lobsvc) lobsvc = ProxyService.lookup('WebLOBSearchService');
						return lobsvc.search(o);
					}
					
					this.removeLob = function() {
						if(!this.selectedLob) return;
						if(!confirm('Are you sure you want to remove the selected line of business?')) return;
						this.app.lobs.remove(this.selectedLob);
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
	</jsp:attribute>
	
	<jsp:body>
		<c:if test="${not empty ERROR_MSG}">
			<span class="error">
				${ERROR_MSG}
			</span>
		</c:if>
		<c:if test="${empty ERROR_MSG}">
			<div r:context="app" r:visibleWhen="#{app.docstate!='FOR_REVIEW'}" style="display:none">
				<div r:context="app" r:visibleWhen="#{app._step_ == 1}">
					<jsp:include page="app_pages/step1.jsp"/>
				</div>
				
				<div r:context="app" r:visibleWhen="#{app._step_ == 2}">
					<jsp:include page="app_pages/step2.jsp"/>
				</div>
				
				<div r:context="app" r:visibleWhen="#{app._step_ == 3}">
					<jsp:include page="app_pages/step3.jsp"/>
				</div>
				
				<br/>
				<br/>
				<br/>
				<div class="hr"></div>
				
				<button r:context="app" r:name="cancel" r:visibleWhen="#{app._step_ == 1}" title="Previous step">
					Cancel
				</button>
				<button r:context="app" r:name="back" r:visibleWhen="#{app._step_ > 1}" title="Previous step">
					Back
				</button>
				<button r:context="app" r:name="next" title="Next step">
					Next
				</button>
				<c:if test="${param.mode == 'edit'}">
					<button r:context="app" r:name="cancelEdit" title="Cancel edit">
						Cancel
					</button>
				</c:if>
			</div>
		</c:if>
	</jsp:body>
	
</t:content>

