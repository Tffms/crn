<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<h3>(OR) Join our Network</h3>
<p class="error" id="regFormMessage"></p>
<form:form  action ="${pageContext.request.contextPath}/public/register/registerUser.htm" dojoType="dijit.form.Form" commandName="newUser" id="registerForm"	data-dojo-id="registerForm">
	<table>
		<tr>
			<td>Username:</td>
			<td>
				<form:input path="userName"  type="text" required="true" placeholder="User Name" 
					dojoType="dijit.form.ValidationTextBox" missingMessage="Please Enter user name" />
			</td>
		</tr>
		<tr>
			<td>Password:</td>
			<td>
				<form:input path="password"  type="text" required="true" 
					dojoType="dijit.form.ValidationTextBox" missingMessage="Please Enter password" />
			</td>
		</tr>
		<tr>
			<td>Email Address:</td>
			<td>
				<form:input path="email"  type="text" required="true" placeholder="Email Address" 
					dojoType="dijit.form.ValidationTextBox" missingMessage="Please Enter Email Address" />
			</td>
		</tr>
		<tr>
			<td>First Name:</td>
			<td>
				<form:input path="firstName"  type="text" required="true" placeholder="First name" 
					dojoType="dijit.form.ValidationTextBox" missingMessage="Please Enter First Name" />
			</td>
		</tr>
		<tr>
			<td>Last Name:</td>
			<td>
				<form:input path="lastName"  type="text" required="true" placeholder="Last Name" 
					dojoType="dijit.form.ValidationTextBox" missingMessage="Please Enter Last Name" />
			</td>
		</tr>
		<tr>
			<td colspan='2'>
				<button data-dojo-type="dijit.form.Button" name="submit"
					value="submit" id="userRegisterSubmitButton">Submit</button>
			</td>
		</tr>
	</table>

</form:form>