<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<div data-dojo-type="dijit.DropDownMenu" id="navMenu">
    <div data-dojo-type="dijit.MenuItem" data-dojo-props="iconClass:'dijitEditorIcon dijitEditorIconCut',
        onClick:function(){alert('drama!')}">Drama</div>
    <div data-dojo-type="dijit.MenuItem" data-dojo-props="iconClass:'dijitEditorIcon dijitEditorIconCopy',
        onClick:function(){alert('comedy!')}">Comedy</div>
    <div data-dojo-type="dijit.MenuItem" data-dojo-props="iconClass:'dijitEditorIcon dijitEditorIconPaste',
        onClick:function(){alert('romance!')}">Romance</div>
    <div data-dojo-type="dijit.MenuSeparator"></div>
    <div data-dojo-type="dijit.PopupMenuItem">
        <span>Action</span>
        <div data-dojo-type="dijit.DropDownMenu" id="submenu2">
            <div data-dojo-type="dijit.MenuItem" data-dojo-props="onClick:function(){alert('diehard!')}">Diehard</div>
            <div data-dojo-type="dijit.MenuItem" onclick="alert('indiana!')">Indiana Jones</div>
        </div>
    </div>
</div>