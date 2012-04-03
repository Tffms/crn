<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="body_content">

	<table id="studySitesTable">
		<thead>
			<tr>
				<th>Site Name</th>
				<th>City</th>
				<th>State</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${studySites}" var="studySite" varStatus="status">
				<tr>
					<td>
						<a class="study_site_info_url" href="javascript:void(0)" content-url='<c:url value="/studysite/report/info.htm?siteId=${studySite.key.id}" ></c:url>' ><c:out value="${studySite.siteName}"></c:out></a>
					</td>
					<td><c:out value="${studySite.state}"></c:out>
					</td>
					<td><c:out value="${studySite.city}"></c:out>
					</td>
				</tr>

			</c:forEach>
		</tbody>
	</table>
</div>


<style type="text/css">
#studySitesTable {
	font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	font-size: 12px;
	background: white;
	width: 480px;
	border-collapse: collapse;
	text-align: left;
	margin: 20px;
}
#studySitesTable th{
	font-size: 14px;
	font-weight: normal;
	color: #039;
	border-bottom: 2px solid #6678B1;
	padding: 10px 8px;
}

#studySitesTable td{
	color: #669;
	padding: 9px 8px 0;
}

#studySitesTable tbody tr:hover td{color:#009;}

</style>