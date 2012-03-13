<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="header_title1">
	<c:if test="${crnCycle ne null}">
		<img alt="crn cycle" src="${crnCycle}" style="height: 100%; width: 100%;">	
	</c:if>
	
	<div id="headertextblock" >
		<h3 id="text1"></h3>
    </div>
	
</div>
<div id="header_image">
	<img alt="home_img" src="${imageurl}"
		style="height: 100%; width: 100%;">
</div>