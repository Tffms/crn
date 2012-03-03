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
			data-dojo-config="isDebug: true, async: true">
		</script>
<link rel="stylesheet" href="/static/css/crnstyles.css">
<script>
require(["dojo/ready", "dojo/parser", "dijit/registry", "dijit/Dialog"], function(ready, parser, registry){
    ready(function(){
    	require(["dojo/_base/fx", "dojo/on", "dojo/dom", "dojo/domReady!"], function(fx, on, dom) {
			fx.fadeOut({duration: 250, node: dom.byId("loader"), onEnd: function() { loader.style.display = "none";  } }).play(250);
		});
    });
});


function refreshMain(paneUrl){
	require(["dojo/_base/xhr", "dojo/on", "dojo/dom", "dojo/parser","dojo/query", "dojo/NodeList-traverse"],
			function(xhr, on, dom, parser, query) {
					xhr.get({
						url: paneUrl,
						load: function(newContent) {
							dom.byId("bottom_div").innerHTML = newContent;
							dojo.parser.parse("bottom_div");	
							// use dijit.TitlePane here... 
							query(".show").onclick(function(e){
								var content = query(e.currentTarget).next()[0];
								require(["dojo/fx/Toggler", "dojo/fx", "dojo/dom-style", "dojo/domReady!"], function(Toggler, fx, domStyle) {
									var t = new Toggler({
										node : content,
										showDuration: 500,
										hideDuration : 200,
										showFunc: fx.wipeIn,
										hideFunc: fx.wipeOut
									});
									if(domStyle.get(content, "display") =='none'){
										t.show();
									} else{
										t.hide();
									}
								});
							});
							require(["dojo/parser", 
										/* dojox/ validate resources */
										"dojox/validate/us", "dojox/validate/web",
										/* basic dijit classes */
										"dijit/form/CheckBox", "dijit/form/Textarea", "dijit/form/FilteringSelect", "dijit/form/TextBox", "dijit/form/ValidationTextBox", "dijit/form/DateTextBox", "dijit/form/TimeTextBox", "dijit/form/Button", "dijit/form/RadioButton", "dijit/form/Form", "dijit/form/DateTextBox",
										/* basic dojox classes */
										"dojox/form/BusyButton", "dojox/form/CheckedMultiSelect",  "dojo/domReady!"]);
						 },
						error: function() {
							alert("error occured please try again later.. "); 
						}
					});
				
			});
}


</script>
<script>
		require([ "dojo/parser", "dijit/DropDownMenu", "dijit/MenuSeparator",
				"dijit/PopupMenuItem", "dijit/MenuBar",
				"dijit/form/ToggleButton", "dijit/form/ComboButton",
				"dijit/Menu", "dijit/MenuItem", "dijit/form/DropDownButton",
				"dijit/TooltipDialog" ], function(parser){
			parser.parse("left_body_div");
		});
		require([ "dojo/dom", "dojo/fx","dojox/widget/AutoRotator", "dojox/widget/rotator/Slide" , "dojo/domReady!" ], function(dom, fx) {
			 new dojox.widget.AutoRotator({
				            transition: "dojox.widget.rotator.slideLeft",
				            transitionParams: "quick:true,continuous:true",
				            duration: 10000,
				            panes: [
				                { className: "pane pane0", innerHTML: "<img style='height: 100%; width: 100%' alt='' src='/static/images/showcase1.png'>" },
				                { className: "pane pane1", transition: "dojox.widget.rotator.slideRight", innerHTML: "<img style='height: 100%; width: 100%' alt='' src='/static/images/showcase1.png'>" },
				                { className: "pane pane2", transition: "dojox.widget.rotator.slideUp", innerHTML: "<img style='height: 100%; width: 100%' alt='' src='/static/images/showcase1.png'>" }
				            ]

				        },
				        dojo.byId("myAutoRotator1")
				    );
		});
	</script>
	
</head>
<body style="margin: 0; padding: 0;" class="claro">

	<div id="main_body">
		<div id="header_wrap">
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
		</div>
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