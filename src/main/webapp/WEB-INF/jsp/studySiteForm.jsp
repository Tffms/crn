<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${(userSession ne null) ? userSession.userInfo : null}" var="userInfo"></c:set>

<div class="body_content" >
	<form:form commandName="studySite">
		 <table>
          <tr>
              <td>Full Site Name:</td>
              <td>
              <form:input path="siteName"  type="text" required="true" placeholder="Site Name" 
					dojoType="dijit.form.ValidationTextBox" missingMessage="Please Enter Site Name" />
              </td>
          </tr>

          <tr>
              <td>Address Line 1:</td>
              <td>
              	<form:input path="addressLine1"  type="text" required="true" placeholder="Address Line 1" 
					dojoType="dijit.form.ValidationTextBox" missingMessage="Please Enter Address" />
              </td>
          </tr>
          <tr>
              <td>Address Line 2:</td>
              <td>
              	<form:input path="addressLine2"  type="text" required="true" placeholder="Address Line 2" 
					dojoType="dijit.form.ValidationTextBox" missingMessage="Please Enter Address" />
              </td>
          </tr>
          <tr>
              <td>City:</td>
              <td>
              	<form:input path="city"  type="text" required="true" placeholder="City" 
					dojoType="dijit.form.ValidationTextBox" missingMessage="Please enter City" />
              </td>
          </tr>
          <tr>
              <td>State:</td>
              <td>
              	<form:input path="state"  type="text" required="true" placeholder="State" 
					dojoType="dijit.form.ValidationTextBox" missingMessage="Please Enter state" />
              </td>
          </tr>
          <tr>
              <td>Zip:</td>
              <td>
              	<form:input path="zip"  type="text" required="true" placeholder="Zip" 
					dojoType="dijit.form.ValidationTextBox" missingMessage="Please Enter zip code" />
              </td>
          </tr>
          <tr>
              <td>Contact Phone :</td>
              <td>
              	<form:input path="phone"  type="text" required="true" placeholder="Contact Phone #" 
					dojoType="dijit.form.ValidationTextBox" missingMessage="Please Enter contact Phone number" />
              </td>
          </tr>
          <tr>
              <td>Fax:</td>
              <td>
              	<form:input path="fax"  type="text" required="true" placeholder="Fax Number" 
					dojoType="dijit.form.ValidationTextBox" missingMessage="Please Enter your fax number" />
              </td>
          </tr>
          <tr>
              <td>Email Address:</td>
              <td>
              	<form:input path="email"  type="text" required="true" placeholder="Email" 
					dojoType="dijit.form.ValidationTextBox" missingMessage="Please Enter your email address" />
              </td>
          </tr>
          <tr>
              <td>Website:</td>
              <td>
              	<form:input path="website"  type="text" required="true" placeholder="Website Address" 
					dojoType="dijit.form.ValidationTextBox" missingMessage="Please Enter your Website Address" />
              </td>
          </tr>
          
          <tr>
              <td>Facility Type:</td>
		              <td>Research Center: <form:radiobutton path="facilityType.typeId" value="0" dojoType="dijit.form.RadioButton" /> <br/>
		         University : <form:radiobutton path="facilityType.typeId" value="1" dojoType="dijit.form.RadioButton" /> </td>
          </tr>
          <tr>
              <td colspan="2">
                  <input type="submit" value="Save Changes" />
              </td>
          </tr>
      </table>
	</form:form>
</div>