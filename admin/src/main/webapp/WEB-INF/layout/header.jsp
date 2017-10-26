


<nav class="navbar navbar-default visible-xs">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#" style="margin-bottom: 5px;margin-top: 0px;">
       
          <span id="logoname"><span id="patientLogo">PATIENT</span><span id="careLogo">CARE</span> <br>
					<span style="font-size: 75%;color:#CD5C5C">The Future of Healthcare</span></span>
			
      </a>
    </div>
    <div class="collapse navbar-collapse text-center" id="myNavbar">
      <ul class="nav navbar-nav">
         <div class="well">
        <li><a href="#"> <img src="userImage?id=${user.id}" class="img-responsive img-thumbnail" height="100" width="100" alt="${user.firstName} ${user.lastName}"></a></li>
          <p><h4><a href="#" style="color:#CD5C5C">${user.firstName}&nbsp;${user.lastName}</a></h4></p>
            <p><h6><a href="#" style="color:#CD5C5C">${user.role}</a></h6></p>
             <button type="button" class="btn btn-success btn-xs"><a href="#" style="color:white">logout</a></button>
         </div>
        <li><button type="button" style="background:none;border:none;" data-toggle="modal" data-target="#registerForm" ><img src="img/add.jpg" class="img-responsive img-thumbnail" height="50" width="50" alt="Add user"></button></li>
        <li>Add User</li>
         <li><button type="button" style="background:none;border:none;" data-toggle="modal"
							data-target="#viewUser"  ng-click="allUsers()" ><img src="img/view.ico" class="img-responsive img-thumbnail" height="50" width="50" alt="view user"></button></li>
        <li>View User</li>
         <li><button type="button" style="background:none;border:none;"  data-toggle="modal"
							data-target="#updateUser"><img src="img/update.png" class="img-responsive img-thumbnail" height="50" width="50" alt="update user"></button></li>
        <li>Update User</li>
      </ul>
    </div>
  </div>
</nav>
