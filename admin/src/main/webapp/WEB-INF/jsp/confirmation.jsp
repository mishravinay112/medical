
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
					<%
						if (request.getAttribute("msg") != null) {
					%>
					<div class="alert alert-danger fade in">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">x</a>
						incorrect pin
					</div>
					<%
						}
					%>	
				Confirming your account will give you full access to <b>Medical-Card</b>
				and all future notification will be send to this email address.<br>
				<br>
				<form action="pin_confirm" class="form-horizontal">
					<div class="form-group">
						<div class="col-md-3"></div>
						<div class="col-md-3">
							<input type="text" name="pin" class="form-control" placeholder="Enter pin"
								required="required" />
						</div>
						<div class="col-md-2">
							<input type="submit" class="form-control btn btn-primary"
								value="verify" />
						</div>
						<div class="col-md-2">
							<a href="send_again" class="form-control btn btn-danger">Resend</a>
						</div>
					</div>
				</form>
				<%
						if (request.getAttribute("sent") != null) {
					%>
					<div class="alert alert-success fade in">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">x</a>
								New pin has been sent to your registered email.
					</div>
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
	</div>



</body>
</html>

