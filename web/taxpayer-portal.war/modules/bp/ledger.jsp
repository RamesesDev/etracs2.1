<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/common/ui" prefix="ui" %>
<%@ page import="java.util.*" %>


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
		<div class="content-title">
			Business Ledger
		</div>
	</jsp:body>
</t:secured-doc>