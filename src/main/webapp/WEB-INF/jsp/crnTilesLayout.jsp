<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title" /></title>
<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/dojo/1.7.1/dijit/themes/claro/claro.css">
<script src="http://ajax.googleapis.com/ajax/libs/dojo/1.7.1/dojo/dojo.js"
			data-dojo-config="isDebug: true, async: true, parseOnLoad: true">
		</script>
<style type="text/css">
	body{
		background-image: url('/static/images/clinical_bg.jpg');
		background-repeat: repeat;
	}
	
	button {
		-webkit-transition: background-color 0.2s linear;
		border-radius:4px;
		-moz-border-radius: 4px 4px 4px 4px;
		-moz-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.15);
		background-color: #E4F2FF;
		background-image: url("http://ajax.googleapis.com/ajax/libs/dojo/1.7.1/dijit/themes/claro/form/images/button.png");
		background-position: center top;
		background-repeat: repeat-x;
		border: 1px solid #769DC0;
		padding: 2px 8px 4px;
		font-size:1em;
	}

	button:hover {
		background-color: #AFD9FF;
		color: #000000;
	}
			
	div#main_body{
		height: 1000px;
		width: 75%;
		border-radius: 15px;
		margin : 50px auto;
		background-color: white;
	}
	div#left_body_div{
		width: 30%;
		height: 36%;
		overflow: hidden;
		float: left;
	}
	
	div#right_body_div{
		width: 70%;
		height: 36%;
		overflow: hidden;
		float: left;
	}
	#header_div{
		width: 100%;
		height: 7%;	
	}
	.showcase_div{
		width: 85%;
		height: 100%;
		margin: 6% auto;
	}
	#bottom_div{
		height: 45%;
		width: 100%;
	}
	.maindiv_hr{
		width: 80%;
		color: #00FFFF;
	}
	
	.rotator{
	    background-color:#fff;
	    border:solid 1px #e5e5e5;
	    width:100%;
	    height:90%;
	}
	.pane{
	    background-color:#fff;
	    width:100%;
	    height:90%;
	    padding: 10px;
	}
	
	#myAutoRotator1{
		border: none;
	}
	
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

<script>
		require([ "dojo/parser", "dijit/DropDownMenu", "dijit/MenuSeparator",
				"dijit/PopupMenuItem", "dijit/MenuBar",
				"dijit/form/ToggleButton", "dijit/form/ComboButton",
				"dijit/Menu", "dijit/MenuItem", "dijit/form/DropDownButton",
				"dijit/TooltipDialog" ]);
		require([ "dojo/dom", "dojo/fx","dojox/widget/AutoRotator", "dojox/widget/rotator/Slide" , "dojo/domReady!" ], function(dom, fx) {
			 new dojox.widget.AutoRotator({
				            transition: "dojox.widget.rotator.slideLeft",
				            transitionParams: "quick:true,continuous:true",
				            duration: 10000,
				            panes: [
				                { className: "pane pane0", innerHTML: "<img style='height: 90%; width: 100%' alt='' src='/static/images/showcase1.png'>" },
				                { className: "pane pane1", transition: "dojox.widget.rotator.slideRight", innerHTML: "<img style='height: 90%; width: 100%' alt='' src='/static/images/showcase1.png'>" },
				                { className: "pane pane2", transition: "dojox.widget.rotator.slideUp", innerHTML: "<img style='height: 90%; width: 100%' alt='' src='/static/images/showcase1.png'>" }
				            ]

				        },
				        dojo.byId("myAutoRotator1")
				    );
		});
	</script>
	
</head>
<body style="margin: 0; padding: 0;" class="claro">

	<div id="main_body">
		<div id="left_body_div">
			<div style="height: 20%; margin-left: 20px; margin-top: 5px;">
				<img alt="" src="/static/images/crn_logo.png">
			</div>
			<tiles:insertAttribute name="menu" />
		</div>
		
		<div id="right_body_div">
			<div class="showcase_div">
				<div id="myAutoRotator1" class="rotator"></div>				
			</div>
		</div>
		<hr class="maindiv_hr">
		<div id="bottom_div"> 
			<tiles:insertAttribute name="body" />
		</div>
		<hr class="maindiv_hr">
		<div id="footer_div">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
	
</body>
</html>