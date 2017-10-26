<nav class="navbar navbar-default">
 <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a style="text-decoration: none;" href="#">
        <h4 style="margin-right: 10px;margin-left: 10px;">
          <span id="logoname"><span id="patientLogo">MEDICAL</span><span id="careLogo">CARD</span> <br>
					<span style="font-size: 75%;color:#CD5C5C">The Future of Healthcare</span>
				</h4>
      </a>
    </div>
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="navbar-collapse">
      <ul class="nav navbar-nav" style="padding-top:10px;padding-left:10px;">
        <li><button class="btn btn-link" data-toggle="modal" data-target="#medicineTime">Medicine Time</button></li>
        <li><button class="btn btn-link" data-toggle="modal" data-target="#doctorsAdvice">Doctor Advice</button></li>
        <li><button class="btn btn-link" data-toggle="modal" data-target="#tellProblem">Tell Your Problem</button></li>
        <li class="dropdown">
        <button class="btn btn-link" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Meeting<span class="caret"></span></button>
          <ul class="dropdown-menu" role="menu">
            <li><button class="btn btn-link" data-toggle="modal" data-target="#takeAppointment">Take Appointment</button></li>
            <li><button class="btn btn-link" data-toggle="modal" data-target="#viewAppointment">View Appointment</button></li>
          </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
         <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="glyphicon glyphicon-envelope"></span> <span class="badge"> 2 </span></a>
          <ul class="dropdown-menu" role="menu">
            <li class="divider"></li>
            <li><a href="#">you have appointment with dr. sharma at 9 pm</a></li>
            <li class="divider"></li>
            <li><a href="#">don't forget to take milk with medicine</a></li>
            <li class="divider"></li>
          </ul>
         </li>
         <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="glyphicon glyphicon-bell"></span> <span class="badge"> 1 </span></a>
          <ul class="dropdown-menu" role="menu">
            <li class="divider"></li>
            <li><a href="#">please provide your blood reports as soon as possible</a></li>
            <li class="divider"></li>
          </ul>
         </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">My Account <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-envelope"></span> Contact</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-cog"></span> Settings</a></li>
            <li class="divider"></li>
            <li><a href="#"><span class="	glyphicon glyphicon-off"></span> Log Out</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
  <!--start of modal of nav bar-->
<!-- Modal medicine time-->
<div id="medicineTime" class="modal fade" role="dialog">
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
       <div class="table-responsive text-center">
						<table class="table table-bordered ">
							<thead style="background-color: #CD5C5C;">
								<tr style="color: #f1f1f1">
									<th>Medicine</th>
									<th>from</th>
									<th>to</th>
									<th>time</th>
									<th>quantity</th>
									<th>with</th>
                  					<th>description</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Paracetamol</td>
									<td>23/09/2016</td>
									<td>21/10/2016</td>
									<td>mon-even</td>
									<td>2</td>
									<td>NA</td>
                  					<td>Take care of timing</td>
								</tr>
								<tr>
									<td>Vicodene</td>
									<td>23/09/2016</td>
									<td>21/10/2016</td>
									<td>mon-even</td>
									<td>2</td>
									<td>NA</td>
                  					<td>Take care of timing</td>
								</tr>
								<tr>
									<td>Soframicine</td>
									<td>23/09/2016</td>
									<td>21/10/2016</td>
									<td>mon-even</td>
									<td>2</td>
									<td>NA</td>
                  					<td>Take care of timing</td>
                  <td></td>
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
       <!-- Modal doctor advice-->
<div id="doctorsAdvice" class="modal fade" role="dialog">
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
       	<div class="table-responsive text-center">
						<table class="table table-bordered ">
							<thead style="background-color: #CD5C5C;">
								<tr style="color: #f1f1f1">
                  <th>#</th>
									<th>Image</th>
									<th>Name</th>
									<th>Advice</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td>Dr. Vinay Mishra</td>
									<td>Take care of your sugar.</td>
                  <td></td>
								</tr>
							</tbody>
						</table>
					</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div> </div>
</div>
     <!-- Modal tell problem-->
<div id="tellProblem" class="modal fade" role="dialog">
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
        <p>	
        			<select class="form-control" id="Role" name="role"
						required="required" onchange="roleChanged(this.value);">
						<option value="admin">Admin</option>
						<option value="care_team">CareTeam</option>
						<option value="doctor">Doctor</option>
						<option value="patient">Patient</option>
						<option value="pharmacist">Pharmacist</option>
					</select>
						<textarea class="form-control" placeholder="write your problem here"></textarea>
			
			<input type="submit" value="send" class="form-control">		
		</p>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
  </div>
  </div>
</div>

 <!-- Modal  takeAppointment-->
<div id="takeAppointment" class="modal fade" role="dialog">
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
        <p></p>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
  </div>
  </div>
</div>

 <!-- Modal view Appointments-->
<div id="viewAppointment" class="modal fade" role="dialog">
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
        <p></p>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
  </div>
  </div>
</div>
    <!--end of nav bar modals-->