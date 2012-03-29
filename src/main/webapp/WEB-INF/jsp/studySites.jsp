<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="body_content">

	<table>
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