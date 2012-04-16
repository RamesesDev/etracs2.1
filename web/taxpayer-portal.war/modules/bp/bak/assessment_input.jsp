<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/message" prefix="msg" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/common/ui" prefix="ui" %>


<t:popup>

	<jsp:attribute name="head">	
		<script type="text/javascript">			
			$put(
				'assessment_input',
				new function() 
				{
					var svc = ProxyService.lookup("BPApplicationService");
					var self = this;
					var index = 0;
					var applist = [];
					var additionalInfos = []
					var inputtedValues = [];
					var entity;
					
					this.app;
					this.entitylist;
					
					this.onload = function() {
						if(this.entitylist)
							entity = this.entitylist[0];

						entity = svc.evaluateApplicationInfo( entity );
					}
					
					this.next = function() {
						if( entity ){
							if( !checkIfDone() ) {
								return;
							}
							
							entity.infos.addAll( inputtedValues );
							inputtedValues.clear();
							applist.push(entity);
							
							index ++;

							if( index < this.entitylist.length ){
								entity = this.entitylist[index];
								entity = svc.evaluateApplicationInfo( entity );
								return;
							}
							
						}
						
						var bpapp = svc.evaluateTaxesAndFees( this.app.objid, applist, this.app.info.requirements );
						if(this.oncomplete) this.oncomplete(bpapp);
						return '_close';
					}
					
					var checkIfDone = function() {
						additionalInfos.clear();
						additionalInfos = determineAdditionalInfos(entity);

						if( additionalInfos ) {
							//preserve currently inputted values
							inputtedValues.addAll( entity.infos );
							
							//remove additional infos to avoid infinite loop
							entity.infos.clear();
							entity.infos.addAll( additionalInfos );
							var newentity = svc.evaluateApplicationInfo( entity );
							
							clearMap(entity);
							$.extend(entity, newentity); //put all
							
							//exclude previous infos from result 
							removeAllInfos( entity, additionalInfos );
							removeAllInfos( entity, inputtedValues ) ;
							
							return (!entity.infos || entity.infos.length==0? true : false);
						}
						
						return true;
					}
					
					var clearMap = function(map) {
						for(var i in map)
							delete map[i];
					}
					
					var removeAllInfos = function( obj, list ) {
						list.each(function(item) {
							obj.infos.removeAll(function(it){ return it.lobid == item.lobid && it.varid == item.varid });
						});
					}
					
					var determineAdditionalInfos = function( obj ) {
						return obj.infos.findAll(function(it) { return it.requiredbeforeprint == true });
					}
					
					this.getFields = function(){
						if(!entity) return;
						var fieldinfos = entity.infos;
						fieldinfos.each(function(it){
							it.datatype = it.vartype;
							it.category = it.lobname;
							it.caption = it.varcaption
							it.items = it.arrayvalues;
						});

						fieldinfos.sort(function(a,b){
							var atext = (a.lobname ? a.lobname : '-') + a.varcaption
							var btext = (b.lobname ? b.lobname : '-') + b.varcaption
							return atext == btext? 0 : atext < btext ? -1 : 1;
						});
						
						return buildFormFields(fieldinfos);
					}
					
					
					this.fieldEntity;
					this.fieldSelectionItems = {};
					
					var buildFormFields = function(list) {
						self.fieldEntity = entity;
						var fields = [];
						var category;
						list.each(function(it, idx){
							var f = {properties:{}};
							if(it.datatype.match(/decimal|integer/)) {
								f.name='input';
								f.properties['type'] = 'text';
								f.properties['r:datatype'] = it.datatype;
							}
							else if(it.datatype == 'boolean') {
								f.name='input';
								f.properties['type'] = 'checkbox';
							}
							else if(it.datatype == 'string_array') {
								f.name='select';
								f.properties['r:items'] = 'selectionItems.'+item.varname;
								this.fieldSelectionItems = it.items;
							}
							else if(it.datatype == 'date') {
								f.name = 'div';
								f.properties['r:type'] = 'datetime';
							}
							f.properties['r:name'] = 'fieldEntity.infos[' +idx+ '].value';
							f.caption = it.caption;
							if(it.required) f.properties['r:required'] = it.required+'';
							f.properties['size'] = '40';
							
							if(it.category != category) {
								category = it.category;
								fields.push({
									name: 'div',
									innerHTML: category,
									properties: {'class': 'category'}
								});
							}
							
							fields.push(f);
						});
						return fields;
					}
				}
			);
		</script>
	</jsp:attribute>
	
	<jsp:attribute name="rightactions">
		<button r:context="assessment_input" r:name="next">
			Next
		</button>
		<button r:context="assessment_input" r:name="_close" r:immediate="true">
			Cancel
		</button>
	</jsp:attribute>
	
	<jsp:body>
		<div r:context="assessment_input" r:type="formpanel" r:name="getFields()"></div>
	</jsp:body>
	
</t:popup>

