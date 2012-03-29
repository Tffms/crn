<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div class="body_content">
	<table>
		<thead>
			<tr>
				<th>User Name</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Enabled</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${userList }" var="user">
				<tr>
					<td><c:out value="${user.userName }"></c:out></td>
					<td><c:out value="${user.firstName}"></c:out></td>
					<td><c:out value="${user.lastName}"></c:out></td>
					<td></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>