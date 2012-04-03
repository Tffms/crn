<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${(userSession ne null) ? userSession.userInfo : null}"
	var="userInfo"></c:set>
<div class="body_content">
	<h3>Study Site Information..</h3>
	<div id="confirm_pane">
		<table>
			<tr>
				<td>
					<table class="site_form_table" id="site_form_table1">
						<thead>
							<tr>
								<th colspan="2"><h4>Contact Information</h4></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><h4>Full Site Name:</h4></td>
								<td><c:out value="${studySite.siteName}"></c:out></td>
							</tr>

							<tr>
								<td><h4>Address Line 1:</h4></td>
								<td><c:out value="${studySite.addressLine1}"></c:out>
								</td>
							</tr>
							<tr>
								<td><h4>Address Line 2:</h4></td>
								<td><c:out value="${studySite.addressLine2}"></c:out>
								</td>
								</td>
							</tr>
							<tr>
								<td><h4>City:</h4></td>
								<td><c:out value="${studySite.city}"></c:out></td>
							</tr>
							<tr>
								<td><h4>State:</h4></td>
								<td><c:out value="${studySite.state}"></c:out>
								</td>
							</tr>
							<tr>
								<td><h4>Zip:</h4></td>
								<td><c:out value="${studySite.zip}"></c:out>
								</td>
							</tr>
							<tr>
								<td><h4>Site IRB :</h4></td>
								<td><c:choose>
										<c:when test="${studySite.irbType.typeId eq 1}">
										Central
									</c:when>
										<c:otherwise>
										Local : <c:out value="${studySite.irbType.typeName}"></c:out>
								</td>
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
								<td><h4>Contact Phone :</h4></td>
								<td><c:out value="${studySite.phone}"></c:out>
								</td>
							</tr>
							<tr>
								<td><h4>Fax:</h4></td>
								<td><c:out value="${studySite.fax}"></c:out>
								</td>
							</tr>
							<tr>
								<td><h4>Email Address:</h4></td>
								<td><c:out value="${studySite.email}"></c:out>
								</td>
							</tr>
							<tr>
								<td><h4>Website:</h4></td>
								<td><c:out value="${studySite.website}"></c:out>
								</td>
							</tr>
							<tr>
								<td><h4>Facility Type:</h4></td>
								<td><c:choose>
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
				<td colspan="2">
					<table class="site_form_table" id="iaTable">
						<thead>
							<tr>
								<th colspan="2"><h4>Investigators Associated</h4></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><h4>Name</h4></td>
								<td><h4>PI/ Sub-I</h4></td>
								<td><h4>Experience</h4></td>
								<td><h4>Area/Speciality</h4></td>
							</tr>
							<c:forEach var="inv" items="${studySite.investigators}">
								<tr class="iaclass">
									<td>
										<c:out value="${inv.name}"></c:out>
									</td>
									<td>
										<c:out value="${inv.subi}"></c:out>
									</td>
									<td>
										<c:out value="${inv.experience}"></c:out>
									</td>
									<td>
										<c:out value="${inv.area}"></c:out>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: left;">
					<button data-dojo-type="dijit.form.Button" id="studySiteListButton" >Back</button> 
				</td>
			</tr>
		</table>
	</div>
</div>
<style type="text/css">
h4{
	margin: inherit;
}

</style>