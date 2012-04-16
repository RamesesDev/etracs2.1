/**
 * The value of the name should be a list of map
 * The map should contain the fields:
 *    - name: 				element name
 *    - properties: 		(map) attributes of the element
 *    - caption:			caption label value
 *    - captionProperties:	(map) caption label attributes
 */
BindingUtils.handlers.div_formpanel = function(elem, controller, dix) {
	var fields;
	if(R.attr(elem,'name'))
		fields = controller.get(R.attr(elem,'name'));
	
	if(!fields) return;
	
	var panel = $(elem).empty();
	var tbl = $('<table class="formpanel" cellpadding="0" cellspacing="0"></table>').appendTo(panel);
	fields.each(function(f){
		var lbl;
		var input;
		if(f.caption || f.caption == '') {
			lbl = $('<label class="caption"></label>').html(f.caption);
			if(f.captionProperties) {
				for(var i in f.captionProperties) {
					lbl.attr(i, f.captionProperties[i]);
				}
			}
		}
		if(f.name) {
			input = $('<'+f.name+'></'+f.name+'>');
			input.attr('r:context', panel.attr('r:context'));
			if(f.caption) input.attr('r:caption', f.caption);
			if(f.properties) {
				for(var i in f.properties) {
					input.attr(i, f.properties[i]);
				}
			}
			if(f.innerHTML) input.html(f.innerHTML);
		}
		
		var tr = $('<tr></tr>').appendTo(tbl);
		var inputTd = $('<td></td').append(input).appendTo(tr);
		if(lbl) {
			var lblseparator = $('<td>:</td>');
			tr.prepend(lblseparator);
			tr.prepend($('<th></th>').append(lbl));
			if(f.properties && f.properties['r:required'] == "true") {
				lblseparator.prepend('<span class="req">*</span>');
			}
		}
		else {
			inputTd.attr('colspan', '3');
		}
	});
	
	BindingUtils.bind(null, elem);
};

