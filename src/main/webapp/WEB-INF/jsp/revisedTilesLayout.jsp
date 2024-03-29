<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Clinical Research Network</title>
<title><tiles:insertAttribute name="title" />
</title>
<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/dojo/1.7.1/dijit/themes/claro/claro.css">
<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/dojo/1.7.1/dojox/grid/resources/claroGrid.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/dojo/1.7.1/dojo/dojo.js"
	data-dojo-config="isDebug: true, async: true">
		</script>
<link rel="stylesheet" href="<c:url value='/static/css/crnstyles.css' />" >
<script>
var currentNav = "main_nav_id_1";
/* require(["dojo/ready", "dojo/parser", "dijit/registry", "dijit/Dialog"], function(ready, parser, registry){
    ready(function(){
    	require(["dojo/_base/fx", "dojo/on", "dojo/dom", "dojo/domReady!"], function(fx, on, dom) {
			fx.fadeOut({duration: 250, node: dom.byId("loader"), onEnd: function() { loader.style.display = "none";  } }).play(250);
		});
    });
}); */
function showOverlay(target){
	console.log("show overlay called for : " + target);
	require(["dojox/widget/Standby", "dijit/form/Button", "dojo/domReady!"], function(Standby, Button){
		var standby = new Standby({
			target: target
		});
		document.body.appendChild(standby.domNode);
		standby.show();
	} );
}

function hideOverlay(target){
	console.log("hide overlay called for : " + target);
	require(["dojox/widget/Standby", "dijit/form/Button", "dojo/domReady!"], function(Standby, Button){
		var standby = new Standby({
			target: target
		});
		document.body.appendChild(standby.domNode);
		standby.hide();
	} );
}

function clickmenu(target){
	require(["dojo/on", "dojo/dom", "dojo/dom-class", "dojo/parser","dojo/query", "dojo/dom-attr", "dojo/NodeList-traverse", "dojo/domReady!"], 
			function(on, dom, domClass, parser, query, domAttr) {
				var submenu = domAttr.get(target, "subnav-class");
		        var menuId = domAttr.get(target, "id");	
		        require(["dojo/fx/Toggler", "dojo/fx", "dojo/dom-style", "dojo/dom-attr", "dojo/dom", "dojo/dom-class", "dojo/query", "dojo/NodeList-dom", "dojo/domReady!"], 
		        		function(Toggler, fx, domStyle, domAttr, dom, domClass, query) {
				        	var t = new Toggler({
								node : submenu,
								showDuration: 500,
								hideDuration : 500,
								showFunc: fx.wipeIn,
								hideFunc: fx.wipeOut
							});
				        	var t2 = new Toggler({
								node : currentNav,
								showDuration: 500,
								hideDuration : 500,
								showFunc: fx.wipeIn,
								hideFunc: fx.wipeOut
							});
				        	if(currentNav != submenu){
				        		query("#menubar div").removeClass("menu_selected");
					        	domClass.add(menuId, "menu_selected");
					        	t2.hide();
					        	t.show();
					        	currentNav = submenu;
				        	}			
				        	var submenutarget = query(dojo.byId(submenu)).query("div:first-child")[0]; 
				        	console.log("handling onclick event" + submenutarget);
				        	clickSubmenu(submenutarget);
				        	loadContentPane(submenutarget);
		        		});
	});
}

function clickSubmenu(target){		
	require(["dojox/fx/text", "dojo/_base/xhr", "dojo/on", "dojo/dom", "dojo/dom-class", "dojo/parser","dojo/query", "dojo/dom-attr", "dojo/NodeList-traverse", "dojo/domReady!"],
			function(text, xhr, on, dom, domClass, parser, query, domAttr) {
				console.log(" handling clickSubmenu using " + target);			
				query(".submenu_item").removeClass("menu_selected");
		    	domClass.add(target, "menu_selected");
		    	imagepaneurl =  domAttr.get(target, "img-url");
		    	if(imagepaneurl){
		    		xhr.get({
						url: imagepaneurl,
						load: function(newContent) {
							require(["dojo/_base/fx"], function(fx){
					    		  fx.animateProperty({	
					    		   node:"submenublock", duration: 1000,
					    		   properties: {
					    		     height : 300
					    		   },
					    		   onEnd: function(){
					    			   		dom.byId("header_image_block").innerHTML = newContent;
											dojo.parser.parse("header_image_block");	
											properties = {
															node: "text1",
															duration: 3000,
															random: 0.3,
															text: "Our Mission is to provide high quality, efficient and ethical clinical trial support services to our customers."
														}
											text.blockFadeIn(properties).play();   											
					    			 	}
					    		 }).play();
					    	});						
						},
						error: function() {							
							dom.byId("header_image_block").innerHTML = "";
						}
					});
		    	} else {
		    		require(["dojo/_base/fx"], function(fx){
			    		  fx.animateProperty({	
			    		   node:"submenublock", duration: 1000,
			    		   properties: {
			    		     height : 100
			    		   }
			    		 }).play();
			    	});
		    		dom.byId("header_image_block").innerHTML = "";
		    	}			
	});		
}

function loadContentPane(target){
	require(["dojox/widget/Standby", "dojo/_base/xhr", "dojo/on", "dojo/dom", "dojo/dom-class", "dojo/parser","dojo/query", "dojo/dom-attr",  "dojo/NodeList-traverse", "dojo/domReady!"],
			function(Standby, xhr, on, dom, domClass, parser, query, domAttr) {
				contenturl =  domAttr.get(target, "content-url");
				console.log(" handling loadContentPane using " + target + " and context url " + contenturl);
				if(contenturl){
					destroyWidgets();
					var standby = new Standby({
						target: "contentpane"
					});
					document.body.appendChild(standby.domNode);
					standby.show();
					xhr.get({
						url: contenturl,
						load: function(newContent, ioargs) {	
							var xhrstatus = ioargs.xhr.status;
							console.log(" xhr status : " + xhrstatus);
							dom.byId("contentpane").innerHTML = newContent;
							document.body.appendChild(standby.domNode);
							standby.hide();
							if(contenturl.indexOf("crnFaqs") != -1){
								require(["dojo/on", "dojo/dom", "dojo/dom-class", "dojo/parser","dojo/query", "dojo/dom-attr", "dojo/NodeList-traverse", "dojo/domReady!"], 
										function(on, dom, domClass, parser, query, domAttr) {
												parser.parse("faq_content"); 
												query(".show").on("click", function(e){
													var content = query(e.currentTarget).next()[0];
													require(["dojo/fx/Toggler", "dojo/fx", "dojo/dom-style", "dojo/domReady!"], 
															function(Toggler, fx, domStyle) {
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
											});
							}
							if(contenturl.indexOf("viewStudySiteForm") != -1){
								require(["dojo/parser", 
											"dojox/validate/us", "dojox/validate/web",
											"dijit/form/CheckBox", "dijit/form/Textarea", "dijit/form/Select", "dijit/form/TextBox", "dijit/form/ValidationTextBox", "dijit/form/DateTextBox", "dijit/form/TimeTextBox", "dijit/form/Button", "dijit/form/RadioButton", "dijit/form/Form", "dijit/form/DateTextBox",
											"dojox/form/BusyButton", "dojox/form/CheckedMultiSelect",  "dojo/domReady!"], 
											function(parser){
												if(newContent.indexOf("loginPageResponse") != -1){
													parser.parse("loginForm"); 
													submitEvent();
													loadUserRegistrationpage();
												} else {
													parser.parse("studyCenterForm"); 
													irbOption();
													addIARow();
													submitEvent();
												}
												
											});
								
							}	
							if(contenturl.indexOf("report/viewAllForUser.htm") != -1){
								require(["dojo/parser", 
											"dojox/validate/us", "dojox/validate/web",
											"dijit/form/CheckBox", "dijit/form/Textarea", "dijit/form/Select", "dijit/form/TextBox", "dijit/form/ValidationTextBox", "dijit/form/DateTextBox", "dijit/form/TimeTextBox", "dijit/form/Button", "dijit/form/RadioButton", "dijit/form/Form", "dijit/form/DateTextBox",
											"dojox/form/BusyButton", "dojox/form/CheckedMultiSelect",  "dojo/domReady!"], 
											function(parser){
												submitEvent();
											});
							}
							if(contenturl.indexOf("showAllUsers.htm") != -1){ 
								require(["dojo/parser", 
											"dojox/validate/us", "dojox/validate/web",
											"dijit/form/CheckBox", "dijit/form/Textarea", "dijit/form/Select", "dijit/form/TextBox", "dijit/form/ValidationTextBox", "dijit/form/DateTextBox", "dijit/form/TimeTextBox", "dijit/form/Button", "dijit/form/RadioButton", "dijit/form/Form", "dijit/form/DateTextBox",
											"dojox/form/BusyButton", "dojox/form/CheckedMultiSelect",  "dojo/domReady!"], 
											function(parser){												
												//loadDataGrid('<c:url value="/admin/user/showAllUsersData.htm" />', 'userGrid');
												submitEvent();
											});
							}
							if(contenturl.indexOf("login.htm") != -1){ 
								require(["dojo/parser", 
											"dojox/validate/us", "dojox/validate/web",
											"dijit/form/CheckBox", "dijit/form/Textarea", "dijit/form/Select", "dijit/form/TextBox", "dijit/form/ValidationTextBox", "dijit/form/DateTextBox", "dijit/form/TimeTextBox", "dijit/form/Button", "dijit/form/RadioButton", "dijit/form/Form", "dijit/form/DateTextBox",
											"dojox/form/BusyButton", "dojox/form/CheckedMultiSelect",  "dojo/domReady!"], 
											function(parser){
												parser.parse("loginForm"); 
												submitEvent();
												loadUserRegistrationpage();
											});
							}
						},
						error: function() {
							dom.byId("contentpane").innerHTML = "";
							document.body.appendChild(standby.domNode);
							standby.hide();
						}
					});
				} else{
					dom.byId("contentpane").innerHTML = "";
				}				
	});
}

function destroyWidgets(){
	require(["dijit/registry", "dojo/_base/array"], function(registry, array){
		array.forEach(registry.toArray(), function(widget, i){
			//console.log(widget.declaredClass);
			widget.destroy();
		});
		//console.log(registry.length);
	});
}

function loadDataGrid(storeUrl, gridId){
	var grid, dataStore, store;
	require([
		"dojox/grid/DataGrid",
		"dojo/store/Memory",
		"dojo/data/ObjectStore",
		"dojo/_base/xhr",
		"dojo/domReady!"
	], function(DataGrid, Memory, ObjectStore, xhr){
		xhr.get({
			url: storeUrl,
			headers: {
			      "Content-Type": "text/html"
			    },
			handleAs: "json"
		}).then(function(data){
			console.log(data);
			store = new Memory({ data: data.items });
			dataStore = new ObjectStore({ objectStore: store });
			grid = new DataGrid({
				store: dataStore,
				query: { id: "*" },
				structure: [
					{
						defaultCell: { width: "95px" },
						noscroll: true,
						cells: [
							{ name: "First Name", field: "firstName" },
							{ name: "Last Name", field: "lastName" },
							{ name: "User name", field: "userName"},
							{ name: "Enabled", field: "enabled", formatter: renderCheckbox, width: "70px"}
						]
					}
				]
			}, gridId);
			// since we created this grid programmatically, call startup to render it
			grid.startup();
		});
	});
}

function submitEvent(){
	require(["dojox/widget/Standby", "dojo/_base/xhr", "dojo/on", "dojo/dom", "dojo/dom-class", "dojo/parser","dojo/query", "dojo/dom-attr", "dojo/dom-construct", "dojo/NodeList-traverse", "dojo/domReady!"], 
			function(Standby, xhr, on, dom, domClass, parser, query, domAttr, construct) {
				query("#submitButton2").on("click", 
						function(e){
							construct.destroy("temp_clone");
							var standby = new Standby({
								target: "contentpane"
							});
							document.body.appendChild(standby.domNode);
							standby.show();
							var xhrArgs = {
									  form: dojo.byId("studyCenterForm"),
								      load: function(data){
								    	  dojo.byId("contentpane").innerHTML = data;
								    	  document.body.appendChild(standby.domNode);
								    	  standby.hide();
								    	  destroyWidgets();
								    	  registerConfirmEvent();								    	  
								      },
								      error: function(error){
								        dojo.byId("contentpane").innerHTML = "";
								        document.body.appendChild(standby.domNode);
								        standby.hide();
								      }
								    }
							xhr.post(xhrArgs);
						});
				query(".disable_user").on("click", 
						function(e){
							var standby = new Standby({
								target: "contentpane"
							});
							document.body.appendChild(standby.domNode);
							standby.show();
							contenturl =  domAttr.get(e.target, "endpoint");
							userid =  domAttr.get(e.target, "userid");
							value =  e.target.checked;
							console.log("value checked : " + value);
							var xhrArgs = {
									  url: contenturl,
									  content: {
										  user_id: userid,
									      status: value,
									    },
								      load: function(data){
								    	  document.body.appendChild(standby.domNode);
								    	  standby.hide();
								    	  if(data.indexOf("success")){
								    		  console.log("successfully changed status of user ");
								    	  }
								      },
								      error: function(error){
								        document.body.appendChild(standby.domNode);
								        standby.hide();
								      }
								    }
							xhr.get(xhrArgs);
						});
				query(".study_site_info_url").on("click", 
						function(e){
							var standby = new Standby({
								target: "contentpane"
							});
							document.body.appendChild(standby.domNode);
							standby.show();
							console.log("invoking on click event for " + e.target);
							contenturl =  domAttr.get(e.target, "content-url");
							console.log("using : " + contenturl);
							var xhrArgs = {
									  url: contenturl,
								      load: function(data){
								    	  dojo.byId("contentpane").innerHTML = data;
								    	  document.body.appendChild(standby.domNode);
								    	  standby.hide();
								    	  destroyWidgets();	
								    	  parser.parse("contentpane");
								    	  submitEvent();
								      },
								      error: function(error){
								        dojo.byId("contentpane").innerHTML = "";
								        document.body.appendChild(standby.domNode);
								        standby.hide();
								      }
								    }
							xhr.get(xhrArgs);
						});
				query("#studySiteListButton").on("click", 
						function(e){
							var standby = new Standby({
								target: "contentpane"
							});
							document.body.appendChild(standby.domNode);
							standby.show();
							contenturl =  '<c:url value="/studysite/report/viewAllForUser.htm" />';
							var xhrArgs = {
									  url: contenturl,
								      load: function(data){
								    	  dojo.byId("contentpane").innerHTML = data;
								    	  document.body.appendChild(standby.domNode);
								    	  standby.hide();
								    	  parser.parse("contentpane");
								    	  submitEvent();
								      },
								      error: function(error){
								        dojo.byId("contentpane").innerHTML = "";
								        document.body.appendChild(standby.domNode);
								        standby.hide();
								      }
								    }
							xhr.get(xhrArgs);
						});
				query("#loginSubmitButton").on("click", 
						function(e){
							var standby = new Standby({
								target: "contentpane"
							});
							document.body.appendChild(standby.domNode);
							standby.show();
							var xhrArgs = {
									  form: dojo.byId("loginForm"),
								      load: function(data){
								    	  dojo.byId("contentpane").innerHTML = data;
								    	  document.body.appendChild(standby.domNode);
								    	  standby.hide();
								    	  destroyWidgets();
								    	  if(data.indexOf("loginPageResponse") != -1){
								    		  parser.parse("loginForm"); 
								    		  loadUserRegistrationpage();
								    	  } else if(data.indexOf("StudySiteFormToken") != -1){
								    		  console.log("parsing study center form"); 
								    		  parser.parse("studyCenterForm"); 
											  irbOption();
											  addIARow();
											  reloadTopBar();
								    	  }	else{
								    		  window.location.reload()
								    	  }		    	  
								    	  submitEvent();
								      },
								      error: function(error){
								        dojo.byId("contentpane").innerHTML = "error occurred";
								        destroyWidgets();
								        document.body.appendChild(standby.domNode);
								        standby.hide();
								      }
								    }
							xhr.post(xhrArgs);
						});
			});
}

function loadUserRegistrationpage(){
	require(["dojox/widget/Standby", "dojo/_base/xhr", "dojo/on", "dojo/dom", "dojo/dom-class", "dojo/parser","dojo/query", "dojo/dom-attr", "dojo/dom-construct", "dojo/NodeList-traverse", "dojo/domReady!"], 
			function(Standby, xhr, on, dom, domClass, parser, query, domAttr, construct) {
		var standby = new Standby({
			target: "contentpane"
		});
		document.body.appendChild(standby.domNode);
		standby.show();
		xhr.get({
			url: '<c:url value = "/public/register/showForm.htm" />',
			load: function(newContent, ioargs) {	
				var xhrstatus = ioargs.xhr.status;
				console.log(" xhr status : " + xhrstatus);
				dom.byId("registrationPane").innerHTML = newContent;
				document.body.appendChild(standby.domNode);
				standby.hide();
				require(["dojo/parser", 
							"dojox/validate/us", "dojox/validate/web",
							"dijit/form/CheckBox", "dijit/form/Textarea", "dijit/form/Select", "dijit/form/TextBox", "dijit/form/ValidationTextBox", "dijit/form/DateTextBox", "dijit/form/TimeTextBox", "dijit/form/Button", "dijit/form/RadioButton", "dijit/form/Form", "dijit/form/DateTextBox",
							"dojox/form/BusyButton", "dojox/form/CheckedMultiSelect",  "dojo/domReady!"], 
							function(parser){
								parser.parse("registrationPane"); 
								handleUserRegistrationSubmit();
							});
			},
			error: function(ioargs) {
				dom.byId("contentpane").innerHTML = "error occured";
				document.body.appendChild(standby.domNode);
				standby.hide();
			}
		});
	});	
}

function reloadTopBar(){
	require(["dojo", "dojox/widget/Standby", "dojo/_base/xhr", "dojo/on", "dojo/dom", "dojo/dom-class", "dojo/parser","dojo/query", "dojo/dom-attr", "dojo/dom-construct", "dojo/NodeList-traverse", "dojo/NodeList-manipulate", "dojo/domReady!"], 
			function(dojo, Standby, xhr, on, dom, domClass, parser, query, domAttr, construct) {
		xhr.get({
			url: '<c:url value = "/public/home/crnTopBar.htm" />',
			load: function(newContent, ioargs) {
				dom.byId("top_bar").innerHTML = newContent;
			},
			error: function(ioargs) {
				dom.byId("top_bar").innerHTML = "error occured";
			}
		});
	});
}

function handleUserRegistrationSubmit(){
	require(["dojo", "dojox/widget/Standby", "dojo/_base/xhr", "dojo/on", "dojo/dom", "dojo/dom-class", "dojo/parser","dojo/query", "dojo/dom-attr", "dojo/dom-construct", "dojo/NodeList-traverse", "dojo/NodeList-manipulate", "dojo/domReady!"], 
			function(dojo, Standby, xhr, on, dom, domClass, parser, query, domAttr, construct) {
		query("#userRegisterSubmitButton").on("click", 
				function(e){
					var standby = new Standby({
						target: "contentpane"
					});
					document.body.appendChild(standby.domNode);
					standby.show();
					var xhrArgs = {
							  form: dojo.byId("registerForm"),
						      load: function(data){
						    	  //dojo.byId("registrationPane").innerHTML = data;
						    	  document.body.appendChild(standby.domNode);
						    	  standby.hide();
						    	  console.log("xhrget response data: " + data);	
						    	  if(data == 'success'){
						    		  lastReq = query("#lastRequest").innerHTML();
						    		  if(lastReq.indexOf('true') == -1){
						    			  console.log("destroying widgets.. ");
							    		  destroyWidgets();
							    		  clickSubmenu(dojo.byId("registerStudyCenterLink"));
							    		  loadContentPane(dojo.byId("registerStudyCenterLink"));
							    		  reloadTopBar();
						    		  } else{
						    			  window.location.reload();
						    		  }
						    		  
						    	  } else{
						    		  dojo.byId("regFormMessage").innerHTML = data; 
						    	  }
						      },
						      error: function(error){
						        dojo.byId("contentpane").innerHTML = "";
						        document.body.appendChild(standby.domNode);
						        standby.hide();
						      }
						    }
					xhr.post(xhrArgs);
				});
	});
}


function registerConfirmEvent(){
	
	require(["dojox/widget/Standby", "dojo/parser", "dojo/_base/xhr", "dojo/on", "dojo/dom", "dojo/dom-class", "dojo/parser","dojo/query", "dojo/dom-attr", "dojo/NodeList-traverse", "dojo/domReady!"], 
				function(Standby, parser, xhr, on, dom, domClass, parser, query, domAttr){
					parser.parse("confirm_pane");
					query("#submitButton3").on("click", 
							function(e){
							var standby = new Standby({
								target: "contentpane"
							});
							document.body.appendChild(standby.domNode);
							standby.show();
								var xhrArgs = {
										  url: "/form/register/confirmData.htm",
									      load: function(data){
									    	  dojo.byId("contentpane").innerHTML = data;
									    	  document.body.appendChild(standby.domNode);
									    	  standby.hide();
									    	  destroyWidgets();									    	  
									      },
									      error: function(error){
									        dojo.byId("contentpane").innerHTML = "";
									        document.body.appendChild(standby.domNode);
									        standby.hide();
									      }
									    }
								xhr.get(xhrArgs);
							});
					query("#submitButton4").on("click", 
							function(e){
								var standby = new Standby({
									target: "contentpane"
								});
								document.body.appendChild(standby.domNode);
								standby.show();
								var xhrArgs = {
										  url: "/form/register/editForm.htm",
									      load: function(data){
									    	  dojo.byId("contentpane").innerHTML = data;
									    	  document.body.appendChild(standby.domNode);
									    	  standby.hide();
									    	  require(["dojo/parser", 
														"dojox/validate/us", "dojox/validate/web",
														"dijit/form/CheckBox", "dijit/form/Textarea", "dijit/form/FilteringSelect", "dijit/form/TextBox", "dijit/form/ValidationTextBox", "dijit/form/DateTextBox", "dijit/form/TimeTextBox", "dijit/form/Button", "dijit/form/RadioButton", "dijit/form/Form", "dijit/form/DateTextBox",
														"dojox/form/BusyButton", "dojox/form/CheckedMultiSelect",  "dojo/domReady!"], 
														function(parser){
									    		  			destroyWidgets();
															parser.parse("studyCenterForm"); 
															irbOption();
															addIARow();
															submitEvent();
														});
									      },
									      error: function(error){
									        dojo.byId("contentpane").innerHTML = "";
									        document.body.appendChild(standby.domNode);
									        standby.hide();
									      }
									    }
								xhr.get(xhrArgs);
							});
				});
	
}

function irbOption(){
	require(["dojo/on", "dojo/dom", "dojo/dom-class", "dojo/parser","dojo/query", "dojo/dom-attr", "dojo/NodeList-traverse", "dojo/domReady!"], 
			function(on, dom, domClass, parser, query, domAttr) {
				query(".irb input").on("click", function(e){
			    	var submenu = domAttr.get(e.currentTarget, "value");		    	
			    	require(["dojo/fx/Toggler", "dojo/fx", "dojo/dom-style", "dojo/dom-attr", "dojo/dom", "dojo/dom-class", "dojo/query", "dojo/NodeList-dom", "dojo/domReady!"], 
			        		function(Toggler, fx, domStyle, domAttr, dom, domClass, query) {
					    		if(submenu == 0){
					    			domStyle.set("irbName", "visibility", "visible");
					    		} else {
					    			domStyle.set("irbName", "visibility", "hidden");
					    		}
					    		
			    	});
			    }); 
				
				query(".ftype input").on("click", function(e){
			    	var submenu = domAttr.get(e.currentTarget, "value");		    	
			    	require(["dojo/fx/Toggler", "dojo/fx", "dojo/dom-style", "dojo/dom-attr", "dojo/dom", "dojo/dom-class", "dojo/query", "dojo/NodeList-dom", "dojo/domReady!"], 
			        		function(Toggler, fx, domStyle, domAttr, dom, domClass, query) {
					    		if(submenu == 3){
					    			domStyle.set("facilityTypeName", "visibility", "visible");
					    		} else {
					    			domStyle.set("facilityTypeName", "visibility", "hidden");
					    		}
					    		
			    	});
			    });
	});
}

function addIARow(){
	require(["dojo/on", "dojo/dom", "dojo/dom-class", "dojo/parser","dojo/query", "dojo/dom-attr", "dojo/NodeList-traverse", "dojo/domReady!"], 
			function(on, dom, domClass, parser, query, domAttr) {
				query("#addIARow").on("click", function(e){
					require(["dojo/_base/lang", "dojo/query", "dojo/dom-construct",  "dojo/dom", "dojo/dom-attr", "dojo/_base/array",  "dojo/dom-style", "dojo/NodeList-traverse"], 
							function(lang, query, ctr, dom, attr, array, style){
							  var currentCount = attr.get(query("#currentRowCount")[0], "value");
							  console.log("current row count " + currentCount);
							  
							  var n = query("#temp_clone")[0];
							  console.log("trying to clone element " + n); 
							  var newnode = lang.clone(n);
							  attr.set(newnode, "id", "newNode" + currentCount);
							  style.set(newnode, "display", "");
							  ctr.place(newnode, n, "before");			
							  							  
							  
							  array.forEach(query("#newNode" + currentCount).query("input"), function(e, i){
								  attr.set(e, "dojoType", "dijit.form.ValidationTextBox");
								  var nameAttr = attr.get(e, "name");
								  attr.set(e, "name", nameAttr.replace("newIndex", parseInt(currentCount) + 1))
								  attr.set(e, "id", nameAttr.replace("newIndex", parseInt(currentCount) + 1))
							  });
							  
							  array.forEach(query("#newNode" + currentCount).query("select"), function(e, i){
								  attr.set(e, "dojoType", "dijit.form.Select");
								  var nameAttr = attr.get(e, "name");
								  attr.set(e, "name", nameAttr.replace("newIndex", parseInt(currentCount) + 1))
								  attr.set(e, "id", nameAttr.replace("newIndex", parseInt(currentCount) + 1))
							  });
							  
							  console.log("setting row count");
							  attr.set(query("#currentRowCount")[0], "value", parseInt(currentCount) + 1);
							  
							  require(["dojo/parser", 
										/* dojox/ validate resources */
										"dojox/validate/us", "dojox/validate/web",
										/* basic dijit classes */
										"dijit/form/CheckBox", "dijit/form/Textarea", "dijit/form/FilteringSelect", "dijit/form/TextBox", "dijit/form/ValidationTextBox", "dijit/form/DateTextBox", "dijit/form/TimeTextBox", "dijit/form/Button", "dijit/form/RadioButton", "dijit/form/Form", "dijit/form/DateTextBox",
										/* basic dojox classes */
										"dojox/form/BusyButton", "dojox/form/CheckedMultiSelect",  "dojo/domReady!"], function(parser){
									parser.parse(dojo.byId("newNode")); 
								});
							  return false;
							});
				});
	});
}


require(["dojo/on", "dojo/dom", "dojo/dom-class", "dojo/parser","dojo/query", "dojo/dom-attr", "dojo/NodeList-traverse", "dojo/NodeList-manipulate", "dojo/domReady!"], 
		function(on, dom, domClass, parser, query, domAttr) {
			clickmenu(dom.byId("main_nav_1")); 
		    query(".menu_item").on("click", function(e){		        
		    	clickmenu(e.currentTarget);
		    });
		    
		    query(".submenu_item").on("click", function(e){
		    	clickSubmenu(e.currentTarget);
		    	loadContentPane(e.currentTarget);		    	
		    }); 
		    
		    query("#login_url").on("click", function(e){
		    	clickSubmenu(e.currentTarget);
		    	loadContentPane(e.currentTarget);
		    	domClass.remove(target, "menu_selected");
		    	query("#lastRequest").innerHTML('true');
		    });
		    
		    query("#registry_length").on("click", function(e){
		    	require(["dijit/registry", "dojo/_base/array"], function(registry, array){
		    		array.forEach(registry.toArray(), function(widget, i){
		    			console.log(widget.declaredClass);
		    			//widget.destroy();
		    		});
		    		console.log(registry.length);
		    	});
		    });		    
	});



require([ "dojo/parser", "dijit/DropDownMenu", "dijit/MenuSeparator", "dijit/MenuBarItem",
			"dijit/PopupMenuItem", "dijit/MenuBar","dijit/PopupMenuBarItem",
			"dijit/form/ToggleButton", "dijit/form/ComboButton",
			"dijit/Menu", "dijit/MenuItem", "dijit/form/DropDownButton",
			"dijit/TooltipDialog" ], function(parser){
		parser.parse();
	});
	
function getMethods(obj) {
    var methods = new Array();

    for (var s in obj) {
        if (typeof(obj[s]) == "function") {
            methods[methods.length] = s;
        }
    }

    return methods;
}

function getProperties(obj) {
    var props = new Array();

    for (var s in obj) {
        if (typeof(obj[s]) != "function") {
            props[props.length] = s;
        }
    }

    return props;
}

function renderCheckbox(data, rowIndex){
	console.log(data);
	endpoint = '<c:url value="/admin/user/editStatus.htm" ></c:url>';
	if(data == true){
		return "<input class='disable_user' endpoint='"+ endpoint + "' type='checkbox' checked  />";	
	} else {
		return "<input class='disable_user' endpoint='"+ endpoint + "'  type='checkbox'  />";
	}
	
};
	
</script>
</head>
<body class="claro">
<!-- <div id="loader">
	<div id="loaderInner">Loading...</div>
</div> -->
	<div id="top_bar" style="height: 21px;" >		
		<tiles:insertAttribute name="topbar" />
	</div>
	<div id="menubar" >
		<div  class="menu_item"	id="main_nav_1" subnav-class = "main_nav_id_1">
			<a href="javascript:void(0)">Home</a></div>
		<div class="menu_item" 	id="main_nav_2" subnav-class = "main_nav_id_2">
			<a href="javascript:void(0)">Pharma Services</a></div>		
		<div class="menu_item" id="main_nav_3" subnav-class = "main_nav_id_3" >
			<span><a href="javascript:void(0)">Investigator Services</a></span>
		</div>
		<sec:authorize ifAnyGranted="ROLE_ADMIN"> 
			<div  class="menu_item" id="main_nav_6" subnav-class = "main_nav_id_6">
				<a href="javascript:void(0)">Admin</a></div>
		</sec:authorize>
	</div>
	<!-- http://www.developer.nokia.com/Community/Wiki/Simple_Web_Runtime_Design_Patterns_Using_Dojo#4._Expand.2FCollapse 
	use above link to collapse submenublock -->
	
	<div id="submenublock">
		<div id="submenubar" >
			
			<div id="main_nav_id_1">
				<div class="submenu_item image_nav" img-url="<c:url value='/imagepane/home.htm?tab=ABOUT_US' />" content-url="<c:url value='/public/home/crnAboutUs.htm' />" >
					<a href="javascript:void(0)" >About us</a></div>
				<div class="submenu_item image_nav" img-url="<c:url value='/imagepane/home.htm?tab=FAQS' />" content-url="<c:url value=' /public/home/crnFaqs.htm' />" >
					<a href="javascript:void(0)">FAQs</a></div>
				<div class="submenu_item image_nav" img-url="<c:url value='/imagepane/home.htm?tab=TRAINING_HOME' /> " content-url="<c:url value='/public/home/trainingHome.htm' /> " >
					<a href="javascript:void(0)">Outsourcing</a></div>
				<div class="submenu_item image_nav"  img-url="<c:url value='/imagepane/home.htm?tab=TRAINING_HOME' /> " content-url="<c:url value='/public/home/trainingHome.htm' /> " >
					<a href="javascript:void(0)">Training</a></div>
			</div>
			<div id="main_nav_id_2" style="display:none">
				<div class="submenu_item image_nav" img-url="<c:url value='/imagepane/home.htm?tab=PHARMA_HOME' /> " content-url="<c:url value='/public/home/pharmaHome.htm' /> " >
					<a href="javascript:void(0)">Home</a></div>
				<div class="submenu_item image_nav" img-url="<c:url value='/imagepane/home.htm?tab=PHARMA_HOME' /> ">
					<a href="javascript:void(0)">Study Startup</a></div>
				<div class="submenu_item image_nav" img-url="<c:url value='/imagepane/home.htm?tab=PHARMA_HOME' /> ">
					<a href="javascript:void(0)">Support</a></div>		
				<div class="submenu_item image_nav" img-url="<c:url value='/imagepane/home.htm?tab=PHARMA_HOME' /> ">
					<a href="javascript:void(0)">Locate Investigator</a></div>	
				<div class="submenu_item image_nav" img-url="<c:url value='/imagepane/home.htm?tab=PHARMA_HOME' /> ">
					<a href="javascript:void(0)">Regulatory Documents</a></div>		
			</div>
			<div id="main_nav_id_3" style="display:none">
				<div class="submenu_item image_nav" content-url="<c:url value='/public/home/investigorHome.htm' /> " img-url="<c:url value='/imagepane/staffing.htm' /> "> 
					<a href="javascript:void(0)">Home</a></div>
					 
				<div id="registerStudyCenterLink"  class="submenu_item no_image_nav" content-url="<c:url value='/form/register/viewStudySiteForm.htm' /> " >
						<a href="javascript:void(0)"  >Register Study Center</a></div>
				
				<div class="submenu_item image_nav" img-url="<c:url value='/imagepane/staffing.htm' /> ">
					<a href="javascript:void(0)">Staffing</a></div>
				<div class="submenu_item image_nav" content-url="<c:url value='/public/home/investigorHome.htm' /> "> 
					<a href="javascript:void(0)">Clinical Train</a></div>
				<div  class="submenu_item image_nav" content-url="<c:url value='/studysite/report/viewAllForUser.htm' /> ">
					<a href="javascript:void(0)">My Study Sites</a></div>
			</div>
			 <div id="main_nav_id_6" style="display:none">
				<div class="submenu_item image_nav" content-url="<c:url value='/admin/user/showAllUsers.htm' /> "> 
					<a href="javascript:void(0)">All Users</a></div>
				<div  class="submenu_item image_nav" content-url="<c:url value='/studysite/report/viewAllForUser.htm' /> ">
					<a href="javascript:void(0)">Study Sites</a></div>
			 </div>
		</div>
		
		<div id="header_image_block">
			
		</div>
	</div>
	<div id="contentpane" >
	
	</div>
	<div id="crn_footer"> 
		
			<ul style="width: 70%; margin-left:auto; margin-right:auto;" >
			<li><a href="#">Contact</a></li>
			<li><a href="#">Privacy</a></li>
			<li><a href="#">Terms of Use</a></li>
			<li><a href="#">Accessibility</a></li>
			<li><a href="#">Feedback</a></li>
			</ul>
			
	</div>
	<p style="visibility: hidden;" id="lastRequest"></p> 
</body>
</html>