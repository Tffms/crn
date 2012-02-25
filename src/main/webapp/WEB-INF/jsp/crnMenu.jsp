<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<div data-dojo-type="dijit.DropDownMenu" id="navMenu">
	
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

<style>

#navMenu{
	margin: 20px auto;
}

.item{
	width: 120px;
	height: 40px;
	font-size: 25px;
	font-family:Helvetica, Arial, sans-serif;
    font-weight:100;
}
.claro .dijitMenuItem{
	color: #595959;
}
.claro .dijitMenu{
	border: none;
}


</style>


