<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<span style="visibility: hidden;">loginPageResponse</span>
<div class="body_content" onload='document.f.j_username.focus();'>
	<table>
		<tr>
			<td>
				<h3>Login with Username and Password (Custom Page)</h3> <c:if
					test="${sessionScope['SPRING_SECURITY_LAST_EXCEPTION'] ne null && not empty sessionScope['SPRING_SECURITY_LAST_EXCEPTION'].message}">
					<p class='error'>
						Your login attempt was not successful, try again.<br /> Caused :
						${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
					</p>
				</c:if>

				<form name='f' action="<c:url value='/j_spring_security_check' />"
					method='POST' dojoType="dijit.form.Form" id="loginForm"
					data-dojo-id="loginForm">

					<table>
						<tr>
							<td>User:</td>
							<td><input type='text' name='j_username' value=''
								placeholder="user name" dojoType="dijit.form.ValidationTextBox"
								missingMessage="Please Enter userName"></td>
						</tr>
						<tr>
							<td>Password:</td>
							<td><input type='password' name='j_password'
								dojoType="dijit.form.ValidationTextBox"
								missingMessage="Please Enter password" /></td>
						</tr>
						<tr>
							<td colspan='2'>
								<button data-dojo-type="dijit.form.Button" name="submit"
									value="submit" id="loginSubmitButton">Submit</button>
							</td>
						</tr>
					</table>

				</form>
			</td>
			<td>
				
			</td>
		</tr>
	</table>

</div>
