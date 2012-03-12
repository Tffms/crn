<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${(userSession ne null) ? userSession.userInfo : null}" var="userInfo"></c:set>

<div class="body_content">
<p>
Thank you for Submitting !!!
</p>
</div>