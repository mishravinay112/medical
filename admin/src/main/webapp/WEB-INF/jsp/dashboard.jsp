
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<script>
	var myapp = angular
			.module('MyModule', [])
			.controller(
					'MyController',
					function($scope, $http) {
						
						//$scope.updateForm=false;
						//$scope.updateInput=true;
						$scope.doctor = 0;
						$scope.care_team = 0;
						$scope.patient = 0;
						$scope.pharmacist = 0;
						$scope.users = [];
						$scope.doctor_msg=[];
						$scope.care_team_msg=[];
						$scope.patient_msg=[];
						//console.log("calling all user");/* 
						$scope.allUsers = function() {
							//alert("sending request to server to get all users");
							$http
									.get(
											"/admin/getAllUsers")
									.then(
											function(response) {
												console.log(response);
												console.log(response.data);
												for (var i = 0, len = response.data.length; i < len; i++) {
													response.data[i] = JSON
															.parse(response.data[i]);
													console
															.log(response.data[i]);

												}

												$scope.users = response.data;

												console.log($scope.users);

											});
						}

					});
	/* } */
	/* 
	$scope.myfunction = function(d,c,pt,ph)
	{
	    alert("---> " + d +" "+ c +" "+ pt +" "+ ph +" ");
	    $scope.doctor=d;
		$scope.care_team=c;
		$scope.patient=pt;
		$scope.pharmacist=ph;
	}; */
</script>

<script type="text/javascript">
	var ws = new WebSocket("ws://"+window.location.host+"/admin/echo");
	ws.onmessage = function(event) {
		//var mySpan = document.getElementById("messageGoesHere");
		var obj = JSON.parse(event.data);
		//alert(event.data);
		var d = obj.doctor;
		var c = obj.care_team;
		var pt = obj.patient;
		var ph = obj.pharmacist;
		var scope = angular.element($("#MyController")).scope();//.myfunction(d,c,pt,ph);
		scope.$apply(function() {
			scope.doctor = d;
			scope.care_team = c;
			scope.patient = pt;
			scope.pharmacist = ph;
		})

		//  mySpan.innerHTML=event.data+"<span id='messageGoesHere'></span>";
	};

	ws.onerror = function(event) {
		console.log("Error ", event)
	};

	ws.onopen = function() {
		ws.send('hello start montering');
	};
</script>

<script>
	$(document).ready(function() {
		console.log("ready!");
		document.getElementById("registerForm").reset();
		console.log("form reset done");
	});
	
	function hideUpdateUserForm()
	{
		document.getElementById("domain").value='';
		document.getElementById("updateInput").style.display = "block";
		document.getElementById("updateForm").style.display = "none";
		 document.getElementById("tryAgain").style.display = "none";
	}
	
	function updateUser()
	{
		document.getElementById("updateInput").style.display = "none";
		document.getElementById("updateForm").style.display = "block";
	//	var scope = angular.element($("#MyController")).scope();
		//scope.updateInput=false;
	//	scope.updateForm=true;
		var id=document.getElementById("domain").value;
		//alert("id : "+id);
		 $.ajax({url: "/admin/getUser?id="+id ,success: function(ans){
			 console.log(ans+"<------");
		       //alert(ans+"<----");
		      // alert(typeof ans);
		       var w="wrong";
		      // alert(w);
		      // console.log(ans+"--------- "+w);
		       if($.trim(ans) == w )
		    	{
		    	  // alert("return of null");
		    	   console.log("null  hai yah");
		    	   
		    	   document.getElementById("updateForm").style.display = "none";
		    	   document.getElementById("updateInput").style.display = "block";
		    	   document.getElementById("tryAgain").style.display = "block";
		    	}
		       else
		    	 {
		    	   document.getElementById("updateForm").style.display = "block";
		    	   console.log("data parsing start");
		    	   var json=JSON.parse(ans);
		    	   console.log("data parsing done");
		    	   var scope = angular.element($("#MyController")).scope();//.myfunction(d,c,pt,ph);
		   			scope.$apply(function() {
		   			scope.id = json.id;
		   			scope.firstName = json.firstName;
		   			scope.lastName = json.lastName;
		   			scope.password = json.password;
		   			scope.role = json.role;
		   			scope.gender = json.gender;
		   			scope.isDeleted = json.isDeleted;
		   			scope.dob = json.dob;
		   			scope.mobile = json.mobile;
		   			scope.email = json.email;
		   		})
		   		
		    	if(json.gender=="male")  
		    	{
		    		document.getElementById("male").checked = true;
		    	}
		    	else
		    	{
		    		document.getElementById("female").checked = true;
		    	}
		   		
		   		switch(json.role)
		   		{
		   		case "admin":
		   			document.getElementById("admin").selected = "true";
		        break;
		        case "care_team":
		        	document.getElementById("care_team").selected = "true";
		        break;
		        case "doctor":
		        	document.getElementById("doctor").selected = "true";
		        break;
		        case "patient":
		        	document.getElementById("patient").selected = "true";
		        break;
		        case "pharmacist":
		        	document.getElementById("pharmacist").selected = "true";
		   		
		   		} 
		   		
		   			
		    	   console.log("done all setting");
		    	 }
		 }});
		    	  // alert(JSON.parse(result));
		    	 
		       
	}
		   
		
	
	
</script>


<div class="container-fluid">
	<div class="row content" id="MyController">
		<div class="col-sm-3 sidenav hidden-xs text-center">
			<a href="#" style="text-decoration: none;">
				<h4>
					<span id="logoname"><span id="patientLogo">MEDICAL</span><span
						id="careLogo">CARD</span> <br> <span
						style="font-size: 75%; color: #CD5C5C">The Future of
							Healthcare</span>
				</h4>
			</a>
			<ul class="nav nav-pills nav-stacked">
				<div class="well">
					<li><a href="#"> <img src="userImage?id=${user.id}"
							class="img-responsive img-thumbnail" height="100" width="100"
							alt="${user.firstName} ${user.lastName}"></a></li>
					<p class="divider"></p>
					<p>
					<h4>
						<a href="#" style="color: #CD5C5C">${user.firstName}&nbsp;${user.lastName}</a>
					</h4>
					</p>
					<p>
					<h6>
						<a href="#" style="color: #CD5C5C">${user.role}</a>
					</h6>
					</p>
					<button type="button" class="btn btn-success btn-xs">
						<a href="#" style="color: white">logout</a>
					</button>
				</div>
				<div class="well">
					<li><button type="button"
							style="background: none; border: none;" data-toggle="modal"
							data-target="#registerFormModal">
							<img src="img/add.jpg" class="img-responsive img-thumbnail"
								height="50" width="50" alt="Add user">
						</button></li>
					<li>Add User</li>
					<li><button type="button"
							style="background: none; border: none;" data-toggle="modal"
							data-target="#viewUser" ng-click="allUsers()">
							<img src="img/view.ico" class="img-responsive img-thumbnail"
								height="50" width="50" alt="view user">
						</button></li>
					<li>View User</li>
					<li><button type="button"
							style="background: none; border: none;" data-toggle="modal"
							data-target="#updateUser">
							<img src="img/update.png" class="img-responsive img-thumbnail"
								height="50" width="50" alt="update user">
						</button></li>
					<li>Update User</li>
				</div>


			</ul>
			<br>
		</div>
		<br>

		<div class="col-sm-9">
			<div class="well">
				<h4>Dashboard</h4>
				<p>Welcome to the India's most sophesticated E-Helath System.</p>
			</div>
			<div class="row">
				<div class="col-sm-3">
					<div class="well">
						<h4>Doctors</h4>
						<p>{{doctor}}</p>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="well">
						<h4>Care Teams</h4>
						<p>{{care_team}}</p>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="well">
						<h4>Patients</h4>
						<p>{{patient}}</p>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="well">
						<h4>Pharmacists</h4>
						<p>{{pharmacist}}</p>
					</div>
				</div>
			</div>
			<script type="text/javascript">
			var ws1 = new WebSocket( "ws://"+window.location.host+"/admin/doctor");
			var ws2 = new WebSocket("ws://"+window.location.host+"/admin/patient");
			var ws3 = new WebSocket("ws://"+window.location.host+"/admin/careTeam");
			
			ws1.onmessage = function(event) {
				//var mySpan = document.getElementById("messageGoesHere");
				var d = $.parseJSON(event.data);
				console.log("---------------");
				
				console.log(d);
				console.log(d.length+"<----------");
				//console.log(event.data);
				//console.log(event.data.length);
				console.log("---------------");
				//var obj = event.data;
				//alert(event.data);
				//console.log(event.data);
				

				var scope = angular.element($("#MyController")).scope();//.myfunction(d,c,pt,ph);
				scope.$apply(function() {
					console.log("before msg add in doctor");
					console.log(scope.doctor_msg);
					for (var i = 0, len = d.length; i < len; i++) 
					{
						d[i]=$.parseJSON(d[i]);
						console.log(d[i]);
						scope.doctor_msg.splice(0, 0, d[i]);
						//console.log(scope.doctor_msg[i]+"<======with i");
						console.log(scope.doctor_msg+"<======without i");

					}
					console.log("after msg add in doctor");
					
				})

			};
			
		/* 	ws2.onmessage = function(event) {
				//var mySpan = document.getElementById("messageGoesHere");
				console.log(event.data);
				var obj = event.data;
				//alert(event.data);
				var d = obj.doctor;
				var c = obj.care_team;
				var pt = obj.patient;
				var ph = obj.pharmacist;
				var scope = angular.element($("#MyController")).scope();//.myfunction(d,c,pt,ph);
				scope.$apply(function() {
					scope.doctor = d;
					scope.care_team = c;
					scope.patient = pt;
					scope.pharmacist = ph;
				})

			};
			ws3.onmessage = function(event) {
				//var mySpan = document.getElementById("messageGoesHere");
				var obj = JSON.parse(event.data);
				//alert(event.data);
				var d = obj.doctor;
				var c = obj.care_team;
				var pt = obj.patient;
				var ph = obj.pharmacist;
				var scope = angular.element($("#MyController")).scope();//.myfunction(d,c,pt,ph);
				scope.$apply(function() {
					scope.doctor = d;
					scope.care_team = c;
					scope.patient = pt;
					scope.pharmacist = ph;
				})

			};

			ws1.onerror = function(event) {
				console.log("Error ", event)
			};
			ws2.onerror = function(event) {
				console.log("Error ", event)
			};
			ws3.onerror = function(event) {
				console.log("Error ", event)
			}; */

			ws1.onopen = function() {
				
				ws1.send('${user.id}');
			};
			/* ws2.onopen = function() {
				ws2.send('${user.id}');
			};
			ws3.onopen = function() {
				//ws.send('${user.id}');
				//var id=${user.id};
			}; */
			</script>
			<div class="row">
				<div class="col-sm-4">
					<div class="well">
						<p ng-repeat="d in doctor_msg">
							<a href="#">Dr.{{d.name}}</a><!-- <br><h6 style="color:#CD5C5C;">{{d.date_time}}</h6> --><br>{{d.msg}}
						</p>
						
						<p>
							<button type="button" class="btn btn-success btn-xs">
								<a href="#" style="color: white">more</a>
							</button>
						</p>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="well">
						<p>
							<a href="#">Ravindra Rajpoot</a><br> it is showing error
							when i upload my x-ray report.
						</p>
						<p>
							<a href="#">Rajkumar Pandey</a><br> Thanks for enable my
							account again.
						</p>
						<p>
							<button type="button" class="btn btn-success btn-xs">
								<a href="#" style="color: white">more</a>
							</button>
						</p>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="well">
						<p>
							Care Team : <a href="#">Alfa</a><br>need to change team
							members.
						</p>
						<p>
							Care Team : <a href="#">Jayram</a><br>I added 67 new
							medicines.
						</p>
						<p>
							<button type="button" class="btn btn-success btn-xs">
								<a href="#" style="color: white">more</a>
							</button>
						</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-8">
					<div class="well">
						<p>
							1 New admin <a href="#">Vivesh Singh</a> added today
						</p>
					</div>
				</div>

			</div>
		</div>
	</div>

	<div id="registerFormModal" class="modal fade" role="dialog">
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
						modelAttribute="user" role="form" enctype="multipart/form-data"  autocomplete="off">
						<fieldset>

							<div class="form-group">
								<label for="upload-photo"><img id="patientImage"
									alt="User Image" src="img/notavailable.png"
									style="border: 1px solid; border-radius: 5%; max-height: 100px; max-width: 100px; min-height: 100px; min-width: 100px;" /></label>
								<form:input type="file" path="imageFile" id="upload-photo"
									onchange="readURL(this);" style="display:none;"></form:input>
							</div>



							<div class="form-group">
								<label for="firstname"><span class="req">* </span> First
									name: </label>
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
								<label for="gender"><span class="req">* </span>Gender: </label><br>
								<label class="radio-inline"><input type="radio"
									name="gen" value="male" required="required">Male</label><br>
								<label class="radio-inline"><input type="radio"
									name="gen" value="female">Female</label>
							</div>

							<div class="form-group">
								<label for="datepicker"><span class="req">* </span> Date
									of birth: </label>
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
								<label for="pass1"><span class="req">* </span> Password:
								</label>
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
							txt.value = txt.value.replace(/[^a-zA-Z-'\n\r.]+/g,
									'');
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
					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="hideUpdateUserForm();">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div id="viewUser" class="modal fade" role="dialog">
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
					<div class="table-responsive">
						<table class="table table-bordered text-center">
							<thead style="background-color: #CD5C5C;">
								<tr style="color: #f1f1f1">
									<th>#</th>
									<th>Photo</th>
									<th>Name</th>
									<th>Age</th>
									<th>Gender</th>
									<th>Email</th>
									<th>Registration</th>
									<th>mobile</th>
									<th>Role</th>
									<th>Status</th>

								</tr>
							</thead>
							<tbody>
								<tr ng-repeat="u in users track by $index">
									<td>{{$index+1}}</td>
									<td><img ng-src="userImage?id={{u.id}}"
										class="img-responsive img-thumbnail" height="100" width="100"
										alt="{{u.name}}"></td>
									<td>{{u.name}}</td>

									<td>{{u.age}}</td>
									<td>{{u.gender}}</td>
									<td>{{u.email}}</td>
									<td>{{u.entry_time}}</td>
									<td>{{u.mobile}}</td>
									<td>{{u.role}}</td>
									<td>{{u.status}}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

	<!-- Modal -->
	<div  id="updateUser"  class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" onclick="hideUpdateUserForm();">&times;</button>
					<h4 class="modal-title text-center">
						<span
							style="text-decoration: underline; color: rgb(14, 118, 189);">MEDICAL</span><span
							style="color: #CD5C5C; text-decoration: underline;">-CARD</span>
					</h4>
				</div>
				<div class="modal-body">
				<div id="updateInput">
					<p class="text-center">
						Enter User ID to update the <b>User</b>
						
					</p>
					<br>
					<form action="javascript:updateUser();" class="form-horizontal text-center">
						<div class="well">
							<div class="input-group col-lg-12">
								<div class="input-group-addon">
									<select id="protocol">
										<option>Search</option>

									</select>
								</div>
								<input type="text" class="form-control" id="domain"
									aria-describedby="protocol" placeholder="Enter User Id" name="id" required="required"/>

								<div class="input-group-btn">
									<input type="submit" class="btn btn-md"
										style="background-color: #CD5C5C; color: #f1f1f1" value="Get User"/>
								</div>
							</div>
						</div>
					</form>
					<p id="tryAgain" class="text-center" style="display:none;">
						No any user found of this userid !!! <b style="color:#CD5C5C;">Try again</b>
						
					</p>
					</div>
					<script type="text/javascript">
					function updateUserDataPost(formDt)
					{
						var formData = new FormData($("#updateFormData")[0]);
						console.log(formData);
						console.log("start posting updated user data");
						$.ajax({
					           type: "POST",
					           url: '/admin/updateUser',
					           data: formData, // serializes the form's elements.
					           success: function(data)
					           {
					               alert(data); 
					           },
					           cache: false,
					           contentType: false,
					           processData: false
					         });
						console.log("done posting updated user data");
					}
					
					</script>
					<div id="updateForm" style="display:none;">
						<form:form action="javascript:updateUserDataPost();" method="post" id="updateFormData"
							modelAttribute="user" role="form" enctype="multipart/form-data">
							<fieldset>

								<div class="form-group">
									<label for="upload-photo"><img id="patientImage1"
										alt="User Image" ng-src="userImage?id={{id}}"
										style="border: 1px solid; border-radius: 5%; max-height: 100px; max-width: 100px; min-height: 100px; min-width: 100px;" /></label>
									<form:input type="file" path="imageFile" id="upload-photo"
										onchange="readURL(this);" style="display:none;"></form:input>
								</div>
								<input type="hidden" value="{{id}}" name="id" required/>

								<div class="form-group">
									<label for="firstname"><span class="req">* </span>
										First name: </label>
									<form:input class="form-control" type="text" path="firstName" value="{{firstName}}"
										id="txt" onchange="Validate(this)" required="required"></form:input>
									<div id="errFirst"></div>
								</div>

								<div class="form-group">
									<label for="lastname"><span class="req">* </span> Last
										name: </label>
									<form:input class="form-control" type="text" path="lastName" value="{{lastName}}"
										id="txt" onchange="Validate(this)" required="required"></form:input>
									<div id="errLast"></div>
								</div>

								<div class="form-group">
									<label for="gender"><span class="req">* </span>Gender:
									</label><br> <label class="radio-inline"><input
										type="radio" name="gen" value="male" id="male" required="required">Male</label><br>
									<label class="radio-inline"><input type="radio" id="female"
										name="gen" value="female">Female</label>
								</div>

								<div class="form-group">
									<label for="datepicker1"><span class="req">* </span>
										Date of birth: </label>
									<form:input type="text" class="form-control" path="dob" value="{{dob}}"
										id="datepicker1" required="required"></form:input>
								</div>

								<div class="form-group">
									<label for="phonenumber"><span class="req">* </span>
										Mobile Number: </label>
									<form:input required="required" type="number" path="mobile" value="{{mobile}}"
										id="phone" class="form-control phone" min="7000000000"
										max="9999999999"></form:input>
									<div class="phone_status" id="phone_status"></div>
								</div>

								<div class="form-group">
									<label for="Role"><span class="req">* </span>Role: </label> <select
										class="form-control" id="Role" name="role" required="required">
										<option id="admin" value="admin">Admin</option>
										<option id="care_team" value="care_team">CareTeam</option>
										<option id="doctor" value="doctor">Doctor</option>
										<option id="patient" value="patient">Patient</option>
										<option id="pharmacist" value="pharmacist">Pharmacist</option>
									</select>

								</div>

								<div class="form-group">
									<label for="email"><span class="req">* </span> Email
										Address: </label>
									<form:input class="form-control" required="required"
										type="email" path="email" id="email" value="{{email}}"
										onchange="email_validate(this.value);"></form:input>

									<div class="status" id="status"></div>
								</div>

								<div class="form-group">
									<label><span class="req">* </span>
										Password: </label>
									<form:input required="required" path="password" type="password" value="{{password}}"
										class="form-control inputpass" minlength="4" maxlength="16"
										></form:input>
								</div>
								
								<div class="form-group">
									<label><span class="req">* </span>
										isDisable: </label>
									<form:input required="required" path="isDeleted" type="text" value="{{isDeleted}}"
										class="form-control inputpass" minlength="4" maxlength="16"
										></form:input>
								</div>
								
								<hr>
							<div class="form-group">

								<input type="submit" class="btn btn-primary pull-left"
									value="update" style="margin-left: 5%;" />
								<button type="button" class="btn btn-default pull-right"
									data-dismiss="modal" style="margin-right: 5%;" onclick="hideUpdateUserForm()">Cancel</button>
							</div>
							</fieldset>
						</form:form>
					</div>
				</div>
				
			</div>

		</div>
	</div>

</div>
