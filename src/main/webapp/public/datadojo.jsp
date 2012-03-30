<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>Demo: dojox/grid/DataGrid View's defaultCell</title>
		<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/dojo/1.7.1/dojo/resources/dojo.css">
		<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/dojo/1.7.1/dijit/themes/claro/claro.css">
		<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/dojo/1.7.1/dojox/grid/resources/claroGrid.css">
		<link rel="stylesheet" href="<c:url value='/static/css/crnstyles.css' />" >
		<!-- load dojo and provide config via data attribute -->
		<script src="http://ajax.googleapis.com/ajax/libs/dojo/1.7.1/dojo/dojo.js"
				data-dojo-config="async: true">
		</script>
		<script>
			var renderCheckbox = function(data, rowIndex){
				console.log(data);
				if(data == true){
					return "<input type='checkbox' checked  />";	
				} else {
					return "<input type='checkbox'  />";
				}
				
	        };
			var grid, dataStore, store;
			require([
				"dojox/grid/DataGrid",
				"dojo/store/Memory",
				"dojo/data/ObjectStore",
				"dojo/_base/xhr",
				"dojo/domReady!"
			], function(DataGrid, Memory, ObjectStore, xhr){
				xhr.get({
					url: '<c:url  value = "/public/home/jsonTest.htm" />',
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
					}, "grid");
					// since we created this grid programmatically, call startup to render it
					grid.startup();
				});
			});
		</script>
		
		<style>
			#grid {
				width: 400px;
			}
			* {
				outline: none !important;
			}
			body {
				margin: 0;
				font-family: Lucida Sans,Lucida Grande,Arial !important;
				font-size: 13px !important;
				background: white;
				color: #333;
			}
			
		</style>
	</head>
	<body class="claro">
		<h1>Demo: dojox/grid/DataGrid View's defaultCell</h1>

		<br/>
		<div id="grid"></div>
	</body>
</html>
