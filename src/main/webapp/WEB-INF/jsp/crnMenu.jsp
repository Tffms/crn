<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<div id="loader">
	<div id="loaderInner">Loading...</div>
</div>
<div data-dojo-type="dijit.DropDownMenu" id="navMenu">

	<div data-dojo-type="dijit.MenuItem" class="item" id="home_menu_item" onclick="javascript:refreshMain('/public/home/homePane.htm')">Home</div>

	<div data-dojo-type="dijit.PopupMenuItem" class="item">
		<span>Services</span>
		<div data-dojo-type="dijit.DropDownMenu" id="submenu2">
			<div data-dojo-type="dijit.MenuItem" data-dojo-props=""
				id="consulting_link">Consulting</div>
			<div data-dojo-type="dijit.MenuItem" >Outsourcing</div>
			<div data-dojo-type="dijit.MenuItem" data-dojo-props="">Support</div>
			<div data-dojo-type="dijit.MenuItem" data-dojo-props="">Training</div>
			<div data-dojo-type="dijit.MenuItem" data-dojo-props="">Others</div> 
		</div>
	</div>

	<div data-dojo-type="dijit.MenuItem" class="item" id="whyus_item" onclick="javascript:refreshMain('/public/home/whyUsPane.htm')">Why us?</div>

	<div data-dojo-type="dijit.MenuItem" class="item">R&D Services</div>

	<div data-dojo-type="dijit.MenuItem" class="item" onclick="javascript:refreshMain('/public/home/crnFaqs.htm')">FAQs</div>

	<div data-dojo-type="dijit.MenuItem" class="item">Contact us</div>
</div>




