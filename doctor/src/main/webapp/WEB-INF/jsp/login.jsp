<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
	
	
	function roleChanged(role)
	{
		$("#submitForm").attr('action', "/"+role+"/signIn");
		
		
	}
</script>
<script>
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#patientImage').attr('src', e.target.result).width(150)
						.height(200);
			};

			reader.readAsDataURL(input.files[0]);
		}
	}
	$(function() {
		$("#datepicker").datepicker({
			maxDate : '0',
			changeMonth : true,
			changeYear : true,
			yearRange : '1940:' + (new Date).getFullYear(),
			dateFormat : 'dd/mm/yy'
		});
	});
	
	
	
</script>
	<div class="container">
		<div class="panel panel-default text-center ">
			<div class="panel-body">
				<form:form class="form-signin" method="POST" action="/admin/signIn" id="submitForm"
					modelAttribute="user" autocomplete="off">
					<h2 class="form-signin-heading text-center">
						<span
							style="text-decoration: underline; color: rgb(14, 118, 189);">MEDICAL</span><span
							style="color: #CD5C5C; text-decoration: underline;">-CARD</span>
						<br> <span style="color: #CD5C5C; font-size: 45%;">THE
							FUTURE OF HEALTHCARE</span>
					</h2>
					<%
						if (request.getAttribute("passwordchanged") != null) {
					%>
					<div class="alert alert-success fade in">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">x</a>
						Your password has been successfully changed, Please login with <b>new password</b>.
					</div>
					<%
						}
					%>
					<%
						if (request.getAttribute("failedToChangePassword") != null) {
					%>
					<div class="alert alert-danger fade in">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">x</a>
						There is some problem to change your password, Try again later.
					</div>
					<%
						}
					%>
					<%
						if (request.getAttribute("checkMail") != null) {
					%>
					<div class="alert alert-success fade in">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">x</a>
						We have sent an password reset email to your <b>registered </b> email address.
					</div>
					<%
						}
					%>
					<%
						if (request.getAttribute("invalidReset") != null) {
					%>
					<div class="alert alert-danger fade in">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">x</a>
						you have entered incorrect email or mobile.
					</div>
					<%
						}
					%>
					<%
						if (request.getAttribute("invalid") != null) {
					%>
					<div class="alert alert-danger fade in">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">x</a>
						Invalid email or password.
					</div>
					<%
						}
					%>
					<%
						if (request.getAttribute("loginFirst") != null) {
					%>
					<div class="alert alert-danger fade in">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">x</a>
						Please login to confirm mail.
					</div>
					<%
						}
					%>
					<label for="Role" class="sr-only">Role</label>
					<select class="form-control" id="Role" name="role"
						required="required" onchange="roleChanged(this.value);">
						<option value="admin">Admin</option>
						<option value="care_team">CareTeam</option>
						<option value="doctor">Doctor</option>
						<option value="patient">Patient</option>
						<option value="pharmacist">Pharmacist</option>
					</select>
					<br>
					<label for="inputEmail" class="sr-only">Email address</label>
					<form:input type="email" id="inputEmail" class="form-control"
						placeholder="Email address" required="autofocus" path="email"></form:input>
					<label for="inputPassword" class="sr-only">Password</label>
					<form:input type="password" id="inputPassword" class="form-control"
						placeholder="Password" path="password"></form:input>
					<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
						in</button>
				</form:form>
				<%
					if (request.getAttribute("invalid") == null) {
				%>
				<span style="color: #999">Not registered yet? </span>
				<button type="button" class="btn btn-xs"
					style="background-color: #CD5C5C; color: white;"
					data-toggle="modal" data-target="#registerForm">register
					now</button>

				<%
					} else {
				%>
				<span style="color: #999">Forgot your password? </span>
				<button type="button" class="btn btn-xs"
					style="background-color: #CD5C5C; color: white;"
					data-toggle="modal" data-target="#resetPassword">reset now</button>
				
				<%
					}
				%>


			</div>
			<div class="panel-footer">
				<marquee>
					<a href="http://www.svvv.edu.in/">This is a beta version of the
						website.If you are facing any kind of problem report to the admin
						or call at <b style="color: #CD5C5C;">9179874953</b>
					</a>
				</marquee>
			</div>
		</div>

		<%
			if (request.getAttribute("invalid") == null) {
		%>
		<div id="registerForm" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title text-center">
							<span
								style="text-decoration: underline; color: rgb(14, 118, 189);">MEDICAL</span><span
								style="color: #CD5C5C; text-decoration: underline;">-CARD</span>
						</h4>
					</div>
					<div class="modal-body">


						<form:form action="register" method="post" id="registerForm"
							modelAttribute="user" role="form" enctype="multipart/form-data">
							<fieldset>

								<div class="form-group">
									<label for="upload-photo"><img id="patientImage"
										alt="User Image" src="img/notavailable.png"
										style="border: 1px solid; border-radius: 5%; max-height: 100px; max-width: 100px; min-height: 100px; min-width: 100px;" /></label>
									<form:input type="file" path="imageFile" id="upload-photo"
										onchange="readURL(this);" style="display:none;"></form:input>
								</div>


								<div class="form-group">
									<label for="firstname"><span class="req">* </span>
										First name: </label>
									<form:input class="form-control" type="text" path="firstName"
										id="txt" onchange="Validate(this)" required="required"></form:input>
									<div id="errFirst"></div>
								</div>

								<div class="form-group">
									<label for="lastname"><span class="req">* </span> Last
										name: </label>
									<form:input class="form-control" type="text" path="lastName"
										id="txt" onchange="Validate(this)" required="required"></form:input>
									<div id="errLast"></div>
								</div>

								<div class="form-group">
									<label for="gender"><span class="req">* </span>Gender:
									</label><br> <label class="radio-inline"><input
										type="radio" name="gen" value="male" required="required">Male</label><br>
									<label class="radio-inline"><input type="radio"
										name="gen" value="female">Female</label>
								</div>

								<div class="form-group">
									<label for="datepicker"><span class="req">* </span>
										Date of birth: </label>
									<form:input type="text" class="form-control" path="dob"
										id="datepicker" required="required"></form:input>
								</div>

								<div class="form-group">
									<label for="phonenumber"><span class="req">* </span>
										Mobile Number: </label>
									<form:input required="required" type="number" path="mobile"
										id="phone" class="form-control phone" min="7000000000"
										max="9999999999"></form:input>
									<div class="phone_status" id="phone_status"></div>
								</div>

								<div class="form-group">
									<label for="Role"><span class="req">* </span>Role: </label> <select
										class="form-control" id="Role" name="role" required="required">
										<option value="admin">Admin</option>
										<option value="care_team">CareTeam</option>
										<option value="doctor">Doctor</option>
										<option value="patient" selected="selected">Patient</option>
										<option value="pharmacist">Pharmacist</option>
									</select>

								</div>

								<div class="form-group">
									<label for="email"><span class="req">* </span> Email
										Address: </label>
									<form:input class="form-control" required="required"
										type="email" path="email" id="email"
										onchange="email_validate(this.value);"></form:input>

									<div class="status" id="status"></div>
								</div>

								<div class="form-group">
									<label for="pass1"><span class="req">* </span>
										Password: </label>
									<form:input required="required" path="password" type="password"
										class="form-control inputpass" minlength="4" maxlength="16"
										id="pass1"></form:input>

									<label for="pass2"><span class="req">* </span> Password
										Confirm: </label> <input required="required" type="password"
										class="form-control inputpass" minlength="4" maxlength="16"
										id="pass2" onkeyup="checkPass(); return false;" /> <span
										id="confirmMessage" class="confirmMessage"></span>
								</div>

								<!--div class="form-group">
                <label for="username"><span class="req">* </span> User name:  <small>This will be your login user name</small> </label> 
                    <input class="form-control" type="text" name="username" id = "txt" onkeyup = "Validate(this)" placeholder="minimum 6 letters" required />  
                        <div id="errLast"></div>
            </div-->



								<div class="form-group">
									<input type="checkbox" required="required" name="terms"
										onchange="this.setCustomValidity(validity.valueMissing ? 'Please indicate that you accept the Terms and Conditions' : '');"
										id="field_terms">   <label for="terms">I agree
										with the <a href="#"
										title="You may read our terms and conditions by clicking on this link">terms
											and conditions</a> for Registration.
									</label><span class="req">* </span>
								</div>

								<div class="form-group">
									<input class="btn btn-success" type="submit" name="submit_reg"
										value="Register">
								</div>
								<h5>You will receive an email to complete the registration
									and validation process.</h5>
								<h5>Be sure to check your spam folders.</h5>


							</fieldset>
						</form:form>
						<!-- ends register form -->

						<script type="text/javascript">
							document
									.getElementById("field_terms")
									.setCustomValidity(
											"Please  accept the Terms and Conditions");
						</script>
						<script>
							function checkPass() {
								//Store the password field objects into variables ...
								var pass1 = document.getElementById('pass1');
								var pass2 = document.getElementById('pass2');
								//Store the Confimation Message Object ...
								var message = document
										.getElementById('confirmMessage');
								//Set the colors we will be using ...
								var goodColor = "#66cc66";
								var badColor = "#ff6666";
								//Compare the values in the password field 
								//and the confirmation field
								if (pass1.value == pass2.value) {
									//The passwords match. 
									//Set the color to the good color and inform
									//the user that they have entered the correct password 
									pass2.style.backgroundColor = goodColor;
									message.style.color = goodColor;
									message.innerHTML = "Passwords Match"
								} else {
									//The passwords do not match.
									//Set the color to the bad color and
									//notify the user.
									pass2.style.backgroundColor = badColor;
									message.style.color = badColor;
									message.innerHTML = "Passwords Do Not Match!"
								}
							}

							// validates text only
							function Validate(txt) {
								txt.value = txt.value.replace(
										/[^a-zA-Z-'\n\r.]+/g, '');
							}
							// validate email
							function email_validate(email) {
								var regMail = /^([_a-zA-Z0-9-]+)(\.[_a-zA-Z0-9-]+)*@([a-zA-Z0-9-]+\.)+([a-zA-Z]{2,3})$/;

								if (regMail.test(email) == false) {
									document.getElementById("status").innerHTML = "<span class='warning'>Email address is not valid yet.</span>";
									return false;
								} else {
									document.getElementById("status").innerHTML = "<span class='valid'>Thanks, you have entered a valid Email address!</span>";
								}
							}
							// validate date of birth
							/*function dob_validate(dob)
							 {
							 var regDOB = /^(\d{1,2})[-\/](\d{1,2})[-\/](\d{4})$/;

							 if(regDOB.test(dob) == false)
							 {
							 document.getElementById("statusDOB").innerHTML	= "<span class='warning'>DOB is only used to verify your age.</span>";
							 }
							 else
							 {
							 document.getElementById("statusDOB").innerHTML	= "<span class='valid'>Thanks, you have entered a valid DOB!</span>";	
							 }
							 }*/
							// validate address
							/* function add_validate(address)
							 {
							 var regAdd = /^(?=.*\d)[a-zA-Z\s\d\/]+$/;
							
							 if(regAdd.test(address) == false)
							 {
							 document.getElementById("statusAdd").innerHTML	= "<span class='warning'>Address is not valid yet.</span>";
							 }
							 else
							 {
							 document.getElementById("statusAdd").innerHTML	= "<span class='valid'>Thanks, Address looks valid!</span>";	
							 }
							 } */
						</script>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
		<%
			} else {
		%>
		<!-- Modal -->
		<div id="resetPassword" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title text-center">
							<span
								style="text-decoration: underline; color: rgb(14, 118, 189);">MEDICAL</span><span
								style="color: #CD5C5C; text-decoration: underline;">-CARD</span>
						</h4>
					</div>
					<div class="modal-body text-center">
						<p>
							Enter your <b>registered</b> email or mobile, and we'll send you
							password reset email.
						</p>
						<br>
						<form action="resetPassword" class="form-horizontal text-center" method="post">
							<div class="form-group">
								<div class="col-md-3"></div>
								<div class="col-md-6">
									<input type="email" name="email" class="form-control"
										placeholder="Enter your Email" />
								</div>
							</div>
							<div class="form-group">or</div>



							<div class="form-group">
								<div class="col-md-3"></div>
								<div class="col-md-6">
									<input type="number" name="mobile" class="form-control"
										placeholder="Enter your mobile number" min="7000000000"
										max="9999999999" />
								</div>
							</div>

							<hr>
							<div class="form-group">

								<input type="submit" class="btn btn-primary pull-left"
									value="reset" style="margin-left: 5%;" />
								<button type="button" class="btn btn-default pull-right"
									data-dismiss="modal" style="margin-right: 5%;">Cancel</button>
							</div>

						</form>


					</div>
				</div>
				</div>
				</div>

				<%
					}
				%>

			</div>


