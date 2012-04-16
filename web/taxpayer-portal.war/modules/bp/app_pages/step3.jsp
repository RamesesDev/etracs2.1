<script type="text/javascript">			
	$put(
		'assessment_input',
		new function() 
		{
			var svc;
			var self = this;
			var index = 0;
			var applist = [];
			var additionalInfos = []
			var inputtedValues = [];
			var entity;
			
			this.app;
			this.entitylist;
			
			this.done;
			
			this.start = function() {
				if( !svc ) 
					svc = ProxyService.lookup("WebBPApplicationService");
					
				this.entitylist = svc.getApplicationList( this.app.objid );
				if(this.entitylist)
					entity = this.entitylist[0];

				this.done = false;
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
				this.done = true;
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
				try {
					self.fieldEntity = entity;
					var fields = [];
					var category;
					list.each(function(it, idx){
						var f = {properties:{}};
						if(it.datatype.match(/decimal|integer/)) {
							f.name='input';
							f.properties['type'] = 'text';
							f.properties['r:datatype'] = it.datatype;
							f.properties['size'] = '40';
						}
						else if(it.datatype == 'boolean') {
							f.name='input';
							f.properties['type'] = 'checkbox';
						}
						else if(it.datatype == 'string_array') {
							f.name='select';
							f.properties['r:items'] = 'fieldSelectionItems.'+it.varname;
							self.fieldSelectionItems[it.varname] = it.items;
						}
						else if(it.datatype == 'date') {
							f.name = 'div';
							f.properties['r:type'] = 'datetime';
						}
						f.properties['r:name'] = 'fieldEntity.infos[' +idx+ '].value';
						f.caption = it.caption;
						if(it.required) f.properties['r:required'] = it.required+'';
						
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
				catch(e) {
					alert( e.message );
					throw e;
				}
			}
		}
	);
</script>


<div r:context="app" r:type="label">
	<table class="form section">
		<tr>
			<th width="80px">Tradename</th>
			<td>:</td>
			<td>
				#{app.info.tradename}
			</td>
		</tr>
		<tr>
			<th>Address</th>
			<td>:</td>
			<td>
				#{app.info.businessaddress}
			</td>
		</tr>
	</table>
</div>

<h3 class="section-title">
	<span class="step">3</span>
	Assessment Information
</h3>

<div r:context="assessment_input" r:type="formpanel" r:name="getFields()"
     class="form main-content">
</div>

<br/>
<br/>
<br/>
<div class="hr"></div>

<button r:context="app" r:name="back" r:visibleWhen="#{app._step_ > 1}" title="Previous step">
	Back
</button>
<button r:context="assessment_input" r:name="next" title="Next step">
	Next
</button>
