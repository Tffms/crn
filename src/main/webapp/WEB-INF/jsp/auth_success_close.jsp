<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<script
	src="http://ajax.googleapis.com/ajax/libs/dojo/1.7.1/dojo/dojo.js"
	data-dojo-config="async: true">
	
</script>
<script>
require([ "dojo/dom", "dojo/domReady!" ], function() {
	window.opener.location.href = "/";
	self.close();
});
</script>