<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${(userSession ne null) ? userSession.userInfo : null}" var="userInfo"></c:set>

<div class="body_content" >
	<form:form commandName="studySite">
		 <table>
          <tr>
              <td>First Name:</td>
              <td>
              	<form:input path="firstName" 
				    data-dojo-type="dijit.form.ValidationTextBox"
				    data-dojo-props="validator:dojox.validate.isEmailAddress,
				        invalidMessage:'This is not a valid email!'"
				    />
              </td>
          </tr>
          <tr>
              <td>Last Name:</td>
              <td><form:input path="lastName" /></td>
          </tr>
          <tr>
              <td colspan="2">
                  <input type="submit" value="Save Changes" />
              </td>
          </tr>
      </table>
	</form:form>
</div>