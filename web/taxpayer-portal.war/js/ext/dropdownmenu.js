BindingUtils.handlers.span_dropdownmenu = function( elem, controller, idx ) 
{
	var $e = $(elem);
	if( $e.data('__binded') ) return;
	if( !R.attr($e, 'menu') ) return;
	
	var position = R.attr($e, 'position');

	var menu = $('#' + R.attr($e, 'menu')).clone().removeAttr('id');
	//BindingUtils.bind( menu );

	var ddMenu = new DropdownOpener.DropdownWindow(elem, {
		styleClass: 'dropdown-menu',
		position: position? position : 'bottom-right',
		onClose : function() { $e.addClass('selected'); },
		onShow  : function() { $e.removeClass('selected'); }
	});

	var a = $('<a href="#"></a>')
	.click(function(){
		ddMenu.show( menu );
		return false;
	});
	
	$e.wrap(a);
   
};
