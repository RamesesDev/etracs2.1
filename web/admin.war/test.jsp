<script>
	$put(
		"${param.id}_widget",
		new function() {
			this.click = function() {
				alert('button clicked!');
			}
		}
	);
</script>

This is widget [${param.id}]
<button r:context="${param.id}_widget" r:name="click">+/- Like</button>
