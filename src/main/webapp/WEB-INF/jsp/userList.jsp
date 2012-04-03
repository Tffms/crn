<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div class="body_content">
	<div id="userGrid"></div>
	<table id="userListTable">
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
					<td><c:out value="${user.userName }"></c:out>
					</td>
					<td><c:out value="${user.firstName}"></c:out>
					</td>
					<td><c:out value="${user.lastName}"></c:out>
					</td>
					<td><input class="disable_user" type="checkbox"
						<c:if test="${user.enabled}"> checked = 'checked'</c:if>
						userid="${user.key.id}"
						endpoint='<c:url value="/admin/user/editStatus.htm" ></c:url>'></input>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<style type="text/css">
#userListTable {
	font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	font-size: 12px;
	background: white;
	width: 480px;
	border-collapse: collapse;
	text-align: left;
	margin: 20px;
}
#userListTable th{
	font-size: 14px;
	font-weight: normal;
	color: #039;
	border-bottom: 2px solid #6678B1;
	padding: 10px 8px;
}

#userListTable td{
	color: #669;
	padding: 9px 8px 0;
}

#userListTable tbody tr:hover td{color:#009;}

</style>