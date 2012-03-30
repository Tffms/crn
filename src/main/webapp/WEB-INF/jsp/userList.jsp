<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div class="body_content">
	<div id="userGrid"></div>
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
					<td> <input class="disable_user" type="checkbox" <c:if test="${user.enabled}"> checked = 'checked'</c:if> userid="${user.key.id}"  endpoint='<c:url value="/admin/user/editStatus.htm" ></c:url>' ></input> </td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>