<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<ul style="margin-right: 20px;">
	<sec:authorize ifAnyGranted="ROLE_ANONYMOUS">
		<li><a id="login_url"
			content-url="<c:url value="/public/home/login.htm"/>"
			href="javascript:void(0)">Login</a></li>
	</sec:authorize>
	<sec:authorize ifNotGranted="ROLE_ANONYMOUS">
		<li style="color: #CCC;">Welcome &nbsp; <c:out
				value="${sessionScope.sessionUserName}" /></li>
		<li><a href="<c:url value="/j_spring_security_logout"/>">Logout</a>
		</li>
	</sec:authorize>
</ul>