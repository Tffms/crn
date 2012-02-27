<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${(userSession ne null) ? userSession.userInfo : null}" var="userInfo"></c:set>

<div class="body_content" >
<div id="user_div" style="float: right;">
	<c:choose>
		<c:when test="${userInfo ne null}">
			<div class="logout_pane" style="border: 1px solid #595959;"> 
				Welcome &nbsp; <c:out
						value="${userInfo.firstName}"></c:out> 
				<br /> 
				<a href="/display/logout.htm" style="float: right;">Logout</a>
			</div>
		</c:when>
		<c:otherwise>
			<div class="login_pane">
			<a href="javascript:googlePopup()" class="google_button">
				<img class="google_image" src="/logo-google.png" alt="Login With Google">
				SIGN IN WITH GOOGLE				
			</a>
			</div>
		</c:otherwise>
	</c:choose>
</div>
	<p>CRN is a COST service provider organization that provides
		specialized Consulting, Outsourcing Support and Training services to
		Pharmaceutical Companies / CRO & Study Centers.</p>

	<h3>About us</h3>
	<p>CRN is a clinical trials service provider organization that
		provides specialized services to study Sponsors/ CROs & Research
		sites. Our primary focus is to work with Pharmaceutical Companies,
		CRO’s & Research Sites. Our management team has a combined experience
		base of more than 30 years in the Pharmaceutical and Medical
		Industries.</p>
	<h3>Our Mission</h3>
	<p>CRN mission is to provide high quality, efficient and ethical
		clinical trial support services to our customers. CRN brings a unique
		perspective to the Pharmaceutical, Biotechnology, Medical, and Device
		Industries, as well as Government based researchers through its
		ability to provide community based clinical trial investigators. With
		their community participation in your clinical trials, you will
		experience a direct increase in underrepresented minority populations
		(African Americans, Latinos and Asians, etc). CRN business model
		focuses on providing opportunities to physicians who have large
		minority, underrepresented, and women patient populations that desire
		to participate in the research and development of medicines, devices,
		and treatments to ensure the best medical care for their patients
		through training, mentoring, and coaching.</p>

</div>
<script>
	function googlePopup() {
		var popupURL = "/display/googleLogin.htm";
		window
				.open(
						popupURL,
						"Popup",
						"toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0,width=630,height=450");
	}
</script>

<script>
require(["dojo/dom-class"], function(domClass){
    domClass.add("whyus_item", "dijitMenuItemSelected");
});
</script>