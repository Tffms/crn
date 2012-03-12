<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${(userSession ne null) ? userSession.userInfo : null}"
	var="userInfo"></c:set>
<div class="body_content">
	<h3>Please Confirm your data..</h3>
	<div id="confirm_pane">
		<table>
			<tr>
				<td>
					<table class="site_form_table" id="site_form_table1">
						<thead>
							<tr>
								<th colspan="2">Contact Information</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Full Site Name:</td>
								<td><c:out value="${studySite.siteName}"></c:out></td>
							</tr>

							<tr>
								<td>Address Line 1:</td>
								<td><c:out value="${studySite.addressLine1}"></c:out>
								</td>
							</tr>
							<tr>
								<td>Address Line 2:</td>
								<td><c:out value="${studySite.addressLine2}"></c:out>
								</td>
								</td>
							</tr>
							<tr>
								<td>City:</td>
								<td><c:out value="${studySite.city}"></c:out></td>
							</tr>
							<tr>
								<td>State:</td>
								<td><c:out value="${studySite.state}"></c:out>
								</td>
							</tr>
							<tr>
								<td>Zip:</td>
								<td><c:out value="${studySite.zip}"></c:out>
								</td>
							</tr>
							<tr>
								<td>Site IRB :</td>
								<td>
								<c:choose>
									<c:when test="${studySite.irbType.typeId eq 1}">
										Central
									</c:when>
									<c:otherwise>
										Local : <c:out value="${studySite.irbType.typeName}"></c:out></td>
									</c:otherwise>
								</c:choose>
							</tr>
						</tbody>
					</table></td>
				<td>
					<table class="site_form_table">
						<thead>
							<tr>
								<th colspan="2"></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Contact Phone :</td>
								<td><c:out value="${studySite.phone}"></c:out>
								</td>
							</tr>
							<tr>
								<td>Fax:</td>
								<td><c:out value="${studySite.fax}"></c:out>
								</td>
							</tr>
							<tr>
								<td>Email Address:</td>
								<td><c:out value="${studySite.email}"></c:out>
								</td>
							</tr>
							<tr>
								<td>Website:</td>
								<td><c:out value="${studySite.website}"></c:out>
								</td>
							</tr>
							<tr>
								<td>Facility Type:</td>
								<td>
								<c:choose>
									<c:when test="${studySite.facilityType.typeId eq 0}">
										Research Center
									</c:when>
									<c:otherwise>
										University
									</c:otherwise>
								</c:choose>
								</td>
							</tr>
						</tbody>
					</table></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: left;">
					<button	data-dojo-type="dijit.form.Button" id="submitButton3">Confirm</button>
					<button	data-dojo-type="dijit.form.Button" id="submitButton4">Edit</button>
				</td>
			</tr>
		</table>
	</div>
</div>