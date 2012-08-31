function RemoteProxy( c) {
	this.contextService = c;
	
	var convertResult = function( result ) {
		if(result!=null) {
			//alert( result );
			if( result.trim().substring(0,1) == "["  || result.trim().substring(0,1) == "{"  ) {
				return $.parseJSON(result);
			}
			else {
				return eval(result);
			}
		}
		return null;
	}
	
	this.invoke = function( action, args, handler ) {
		var modname = '';
		if( window._MODULE_NAME )
			modname = window._MODULE_NAME + '/';
				
		var urlaction = "/invoke/" + modname + this.contextService+ "."+action;
		var err = null;			
		var data = [];
		if( args ) { 
			data.push('args=' + escape($.toJSON( args )));
		}
		data = data.join('&');
		
		if(handler==null) {
			var result = $.ajax( {
				url:urlaction,
				type:"POST",
				error: function( xhr ) { 
					err = xhr.responseText; 
				},
				data: data,
				async : false }).responseText;

			if( err!=null ) {
				throw new Error(err);
			}
			return convertResult( result );
		}
		else {
			$.ajax( {
				url: urlaction,
				type: "POST",
				error: function( xhr ) { handler( null, new Error(xhr.responseText) ); },
				data: data,
				async: true,
				success: function( data) { 
					var r = convertResult(data);
					handler(r); 
				}
			});
		}
	}
};

var Service = new function() {
	this.services = {}
	
	this.lookup = function(name) {
		if( this.services[name]==null ) {
			var err = null;
			var modname = '';
			if( window._MODULE_NAME )
				modname = window._MODULE_NAME + '/';
				
			var urlaction =  "/services/"+ modname + name + ".js";
			
			var result = $.ajax( {
                url:urlaction,
                type:"GET",
                error: function( xhr ) { err = xhr.responseText },
                async : false }).responseText;
				
			if( err!=null ) {
				throw new Error(err);
            }
			var func = eval( '(' + result + ')' );
			this.services[name] = new func();
		}
		return this.services[name];
	}
};