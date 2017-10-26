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
<html lang="en">
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
   
footer
 {
      background-color: #555;
      color: white;
      padding: 15px;
 }
.nav.navbar-nav.navbar-right li a {
    color:#CD5C5C;
}
.nav.navbar-nav li a
 {
       color:#CD5C5C;
}
  </style>
<title><tiles:insertAttribute name="title" ignore="true"></tiles:insertAttribute></title>

<body style="font-family: 'Raleway', sans-serif;">
	<tiles:insertAttribute name="header" />

	<tiles:insertAttribute name="body" />

	<tiles:insertAttribute name="footer" />
</body>
</html>