<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.medical.model.User" %>
<%User user=(User)request.getAttribute("user");
System.out.println(user.getFirstName());
System.out.println(user.getLastName());
System.out.println(user.getId());
System.out.println(user.getDate());
System.out.println(user.getDob());
System.out.println(user.getEmail());
System.out.println(user.getRole());
System.out.println(user.getMobile());
%>
<!DOCTYPE html>
<html lang="en" >
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
  <link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<!-- Load jQuery JS -->
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<!-- Load jQuery UI Main JS  -->
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
  
  <style>

  #patientLogo
{
color:#CD5C5C;
background:white;
border-radius: 10px 0px 0px 10px;
}

#careLogo
{
color:white;
background:#CD5C5C;
border-radius: 0px 10px 10px 0px;
}

#logoname:hover > #patientLogo
{
background:#CD5C5C;
color:white;
}
#logoname:hover > #careLogo
{
background:white;
color:#CD5C5C;
}
  

    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 600px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }
        
    /* On small screens, set height to 'auto' for the grid */
    @media screen and (max-width: 767px) {
      .row.content {height: auto;} 
    }

    footer
 {
      background-color: #555;
      color: white;
      padding: 3px;
 }

 li,h4,a
 {
       color:#CD5C5C;
}

a
{
text-decoration: none;
}
 </style>
<title><tiles:insertAttribute name="title" ignore="true"></tiles:insertAttribute></title>

<body >
	<tiles:insertAttribute name="header" />

	<tiles:insertAttribute name="body" />

	<tiles:insertAttribute name="footer" />
</body>
</html>