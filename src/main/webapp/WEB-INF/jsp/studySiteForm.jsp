<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${(userSession ne null) ? userSession.userInfo : null}" var="userInfo"></c:set>

<div class="body_content" >
	<form:form action="/form/register/submitStudySiteForm.htm"  dojoType="dijit.form.Form" commandName="studySite" id="studyCenterForm" data-dojo-id="studyCenterForm">  
		 <table class="site_form_table" id="site_form_table1"  style="float: left; overflow: hidden;">
		 <thead>
		 	<tr>
		 		<th colspan="2">
		 			Contact Information
		 		</th>
		 	</tr>
		 </thead>
		 <tbody>
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
          <tr >
          	<td>Site IRB :</td>
          	<td>
          		 <form:radiobutton class="irb" path="irbType.typeId" value="1" dojoType="dijit.form.RadioButton" /> &nbsp; Central<br/>
		         <form:radiobutton class="irb" path="irbType.typeId" value="0" dojoType="dijit.form.RadioButton" /> &nbsp; Local <br />
		         <span id="irbName" style="display: none;">
		         <form:input path="irbType.typeName"    type="text" required="true" placeholder="Contact Phone #" 
					dojoType="dijit.form.ValidationTextBox" missingMessage="Please Enter contact Phone number" /> </span>
          	</td>
          </tr>
        </tbody>
      </table>
       <table class="site_form_table" style="float: left; overflow: hidden;">
       	<thead>
       		<tr>
       			<th colspan="2"></th>
       		</tr>
       	</thead>
       	<tbody>
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
		              <td><form:radiobutton class="ftype" path="facilityType.typeId" value="0" dojoType="dijit.form.RadioButton" /> &nbsp; Research Center<br/>
		          <form:radiobutton class="ftype" path="facilityType.typeId" value="1" dojoType="dijit.form.RadioButton" />&nbsp;   University <br/>
		          <form:radiobutton class="ftype" path="facilityType.typeId" value="2" dojoType="dijit.form.RadioButton" /> &nbsp; Private Practice <br /> 
		          <form:radiobutton class="ftype" path="facilityType.typeId" value="3" dojoType="dijit.form.RadioButton" />&nbsp;  Other
		         <br />
		          <span id="facilityTypeName" style="visibility:hidden;">
		         <form:input path="facilityType.typeName"    type="text" required="true" placeholder="Facility Type Name " 
					dojoType="dijit.form.ValidationTextBox" missingMessage="Please Enter Facility type name" /> </span> 
		         </td>
          </tr>
     
      	</tbody>
      </table>
      
      <table class="site_form_table" id="iaTable" style="width: 600px">
      	<thead>
      		<tr>
      			<th colspan="2">Investigators Associated</th>
      		</tr>
      	</thead>
		<tbody>
      	<tr>
      		<td>
      			Name
      		</td>
      		<td>
      			PI/ Sub-I
      		</td>
      		<td>
      			Experience
      		</td>
      		<td>
      			Area/Speciality
      		</td>
      	</tr>
      	
      	<tr class="iaclass">
      		<td>
      			<form:input path="investigators[0].name"  type="text" required="true" placeholder="Investigator Name" 
					dojoType="dijit.form.ValidationTextBox" row-count="0" missingMessage="Please Enter your email address" />
      		</td>
      		<td>
      		
      			<form:select path="investigators[0].subi" dojoType="dijit.form.Select">
      				<form:option value="PI" >PI</form:option>
      				<form:option value="Sub-I">Sub-I</form:option>
      			</form:select>
      		</td>
      		<td>
      			<form:input class="textbox_small" path="investigators[0].experience" size="3"  type="text" required="true" placeholder="Experience" 
					dojoType="dijit.form.ValidationTextBox" missingMessage="Please Enter your email address" />
      		</td>
      		<td>
      			<form:input path="investigators[0].area"  type="text" required="true" placeholder="Speciality" 
					dojoType="dijit.form.ValidationTextBox" missingMessage="Please Enter your email address" />
      		</td>
      	</tr>
      	<c:forEach  items="${studySite.investigators}" varStatus="status" begin="1">
      		<tr class="iaclass">
	      		<td>
	      			<form:input path="investigators[${status.index}].name"  type="text" required="true" placeholder="Investigator Name" 
						dojoType="dijit.form.ValidationTextBox" row-count="1" missingMessage="Please Enter your email address" />
	      		</td>
	      		<td>
	      			<form:input class="textbox_small" path="investigators[${status.index}].subi"  type="text" required="true" placeholder="Type" 
						dojoType="dijit.form.ValidationTextBox" missingMessage="Please Enter your email address" />
	      		</td>
	      		<td>
	      			<form:input class="textbox_small" path="investigators[${status.index}].experience"  type="text" required="true" placeholder="Experience" 
						dojoType="dijit.form.ValidationTextBox" missingMessage="Please Enter your email address" />
	      		</td>
	      		<td>
	      			<form:input path="investigators[${status.index}].area"  type="text" required="true" placeholder="Speciality" 
						dojoType="dijit.form.ValidationTextBox" missingMessage="Please Enter your email address" />
	      		</td>
	      	</tr>
      	</c:forEach>
      	
      	
      	<tr id="temp_clone" style="display: none;">
      		<td>
      			<input name="investigators[newIndex].name"  type="text" required="true" placeholder="Investigator Name" 
					 row-count="0" missingMessage="Please Enter your email address" />
      		</td>
      		<td>
      			<input class="textbox_small" name="investigators[newIndex].subi"  type="text" required="true" placeholder="Type" 
					 missingMessage="Please Enter your email address" />
      		</td>
      		<td>
      			<input class="textbox_small" name="investigators[newIndex].experience" type="text" required="true" placeholder="Experience" 
					 missingMessage="Please Enter your email address" />
      		</td>
      		<td>
      			<input name="investigators[newIndex].area"  type="text" required="true" placeholder="Speciality" 
					missingMessage="Please Enter your email address" />
      		</td>
      	</tr>
      	<tr>
      		<td colspan="4" style="text-align: left;">
      			<div>
			      	<input type="hidden" value="0" id="currentRowCount">
			      	<a href="javascript:void(0)" id="addIARow" >Add More.. </a>
			      </div>
      		</td>
      	
      	</tr>
      	</tbody>
      </table>
      
      
      <table>
      	<tr><td colspan="3"><div class="table_heading" style="margin-left: 5px; margin-top: 20px; text-align: left;">Area/Specialization</div> </td></tr>
      	<tr>
      		<td>
      			 <table class="site_form_table">
			      	<c:forEach var="area" items="${specialisedItems}" step="3" begin="0">   
			      		<tr>
			      			<td>
			      				<form:checkbox dojoType="dijit.form.CheckBox"  path="specialisedAreas" value="${area}"/>
			      			</td>
			      			<td>
			      				<c:out value="${area}"></c:out>
			      			</td>
			      		</tr>
			      	</c:forEach>
			      </table>      		
      		</td>
      		<td>      			
      			<table  class="site_form_table">
			      	<c:forEach var="area" items="${specialisedItems}" step="3" begin="1">   
			      		<tr>
			      			<td>
			      				<form:checkbox dojoType="dijit.form.CheckBox" path="specialisedAreas" value="${area}"/>
			      			</td>
			      			<td>
			      				<c:out value="${area}"></c:out>
			      			</td>
			      		</tr>
			      	</c:forEach>
		      	</table>
      		</td>
      		<td>
      			<table class="site_form_table">
			      	<c:forEach var="area" items="${specialisedItems}" step="3" begin="2">   
			      		<tr>
			      			<td>
			      				<form:checkbox dojoType="dijit.form.CheckBox" path="specialisedAreas" value="${area}"/>
			      			</td>
			      			<td>
			      				<c:out value="${area}"></c:out>
			      			</td>
			      		</tr>
			      	</c:forEach>			      
			      </table>
      		</td>
      	</tr>
      	<tr>
      		<td colspan="3" style="text-align: left;">
			      		<button data-dojo-type="dijit.form.Button" id="submitButton2">Send it!</button>
			      	</td>
      	</tr>
      </table>
      
     
      
      
      	
      
	</form:form>
</div>