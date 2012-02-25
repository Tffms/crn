<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<c:set value="${(userSession ne null) ? userSession.userInfo : null}" var="userInfo"></c:set>
<div id="header_div">
	<c:choose>
		<c:when test="${userInfo ne null}">
			<div class="logout_pane">
				Welcome &nbsp; <c:out
						value="${userInfo.firstName}"></c:out> 
				&nbsp; &nbsp; &nbsp; 
				<a href="/display/logout.htm" style="float: right;">Logout</a>
			</div>
		</c:when>
		<c:otherwise>
			<div class="login_pane">
			<a href="javascript:googlePopup()" class="google_button">
				<img class="google_image" src="/logo-google.png" alt="Login With Google">
				SIGN IN WITH GOOGLE				
			</a>
			</div>
		</c:otherwise>
	</c:choose>
</div>
<style type="text/css">
.logout_pane{
	font: regular 14px Helvetica, Arial, sans-serif;
}
a.google_button{
	color: #6E6E6E;
	font: bold 14px Helvetica, Arial, sans-serif;
	text-decoration: none;
	padding: 10px 12px 10px 12px;
	text-shadow: 0 1px 0 white;
	border: solid 1px #999;
	height: 46px;
}
.google_image{
	width: 30px;
	vertical-align: middle;
	padding-bottom: 7px;
}
a.google_button:hover{
	color: #333;
	border-color: #333;
}
div.login_pane{
	padding-left: 50px;
	padding-top: 20px;
}

div.logout_pane{
	padding: 20px 50px 0 50px;
}
#header_div{
	height: 70px;
	background-color: #FFCC66;
}
a img {border: none; }
</style>
<script
	src="http://ajax.googleapis.com/ajax/libs/dojo/1.7.1/dojo/dojo.js"
	data-dojo-config="async: true">
</script>

<script src="https://apis.google.com/js/client.js"></script>
<script>
	require([ "dojo/dom", "dojo/fx", "dojo/domReady!" ], function(dom, fx) {

	});
</script>
<script>
	function googlePopup() {
		var popupURL = "/display/googleLogin.htm";
		window
				.open(
						popupURL,
						"Popup",
						"toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0,width=630,height=450");
	}
</script>
