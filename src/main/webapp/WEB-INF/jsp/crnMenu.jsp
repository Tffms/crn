<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <div id="loader"><div id="loaderInner">Loading...</div></div> 
<div data-dojo-type="dijit.DropDownMenu" id="navMenu" >
	
    <div data-dojo-type="dijit.MenuItem" class="item dijitMenuItemSelected">Home</div>
   
    <div data-dojo-type="dijit.PopupMenuItem" class="item">
        <span>Services</span>
        <div data-dojo-type="dijit.DropDownMenu" id="submenu2">
            <div data-dojo-type="dijit.MenuItem" data-dojo-props="onClick:function(){}">Consulting</div>
            <div data-dojo-type="dijit.MenuItem" data-dojo-props="onClick:function(){}">Outsourcing</div>
            <div data-dojo-type="dijit.MenuItem" data-dojo-props="onClick:function(){}">Support</div>
            <div data-dojo-type="dijit.MenuItem" data-dojo-props="onClick:function(){}">Training</div>
            <div data-dojo-type="dijit.MenuItem" data-dojo-props="onClick:function(){}">Others</div>
        </div>
    </div>
    
    <div data-dojo-type="dijit.MenuItem" class="item">Why us?</div>
   
    <div data-dojo-type="dijit.MenuItem" class="item" >R&D Services</div>
   
    <div data-dojo-type="dijit.MenuItem" class="item">FAQs</div>
    
    <div data-dojo-type="dijit.MenuItem" class="item">Contact us</div>
</div>



