
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
<style>
body {
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #eee;
}

.form-signin {
	max-width: 330px;
	padding: 15px;
	margin: 0 auto;
}

.form-signin .form-signin-heading, .form-signin .checkbox {
	margin-bottom: 10px;
}

.form-signin .checkbox {
	font-weight: normal;
}

.form-signin .form-control {
	position: relative;
	height: auto;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 10px;
	font-size: 16px;
}

.form-signin .form-control:focus {
	z-index: 2;
}

.form-signin input[type="email"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}
</style>
</head>

<body>

	<div class="container">
		<div class="panel panel-default text-center">
			<div class="panel-heading">
				<div class="panel-title">
					<h2 class="form-signin-heading">
						<span
							style="text-decoration: underline; color: rgb(14, 118, 189);">MEDICAL</span><span
							style="color: #CD5C5C; text-decoration: underline;">-CARD</span>
						<br> <span style="color: #CD5C5C; font-size: 45%;">THE
							FUTURE OF HEALTHCARE</span>
					</h2>
				</div>
			</div>
			<div class="panel-body">
					Welcome back<br>Please pick a new password to complete the reset process. You will use this new password to sign in to the site from now on.
                   <br><br>
				<form action="newPassword" class="form-horizontal" method="post">
					
                    <div class="form-group">
                        <label for="pass1" class="col-md-4 control-label">New Password<sup style="color:#CD5C5C">*</sup></label>
                            <div class="col-md-4">
                                     <input type="password" class="form-control" id="pass1"  name="password" required="required"/>
                            </div>
                    </div>
                    <br>
                     <div class="form-group">
                        <label for="pass2" class="col-md-4 control-label">Confirm New Password<sup style="color:#CD5C5C">*</sup></label>
                            <div class="col-md-4">
                                     <input type="password" class="form-control" id="pass2" onkeyup="checkPass(); return false;"  required="required"/>
                                     <span id="confirmMessage" class="confirmMessage"></span>
                            </div>
                    </div>
						
                    <div class="form-group">
                        <div class="col-md-4 "></div>

                        <div class="col-md-2">
                                    <input type="submit" class="form-control btn btn-primary" value="done" onclick="return validate();" />
                        </div>

                        <div class="col-md-2">
							
                            <a href="#" onclick="goBack()" class="form-control btn btn-danger">Go Back</a>

                            <script>
                                function goBack()
                                 {
                                    window.history.back();
                                 }
                            </script>

						 </div>

                    </div>
            
				</form>
				<script>

                        function validate()
                        {
                            var pass1 = document.getElementById('pass1');
						    var pass2 = document.getElementById('pass2');
                            if (pass1.value == pass2.value)
                             {
                                
                                return true;
                             }
                             else
                             {
                                 alert("password must be same");
                                 return false;
                            }
                        }

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
                     </script>

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
	</div>



</body>
</html>

