<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  .mar{
  	margin-top:20px;
  	margin-left:90px;
  }
  </style>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      ShoeRack
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="http://localhost:8080/shoes/">Home</a></li>
        <li><a href="http://localhost:8080/shoes/AboutUs">About Us</a></li>
        <li><a href="http://localhost:8080/shoes/ViewProduct">View Shoes</a></li>
        <li><a href="http://localhost:8080/shoes/ViewCategory">View Category</a></li>
       <li><a href="http://localhost:8080/shoes/ContactUs">Contact Us</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      <%
      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null && !auth.getName().equals("anonymousUser"))
	    {    
	    	String currUser=auth.getName();
	    	
	    	request.setAttribute("currUser", currUser);
	    	 %>
      	<li><a href="${pageContext.request.contextPath}/cart"><span class="glyphicon glyphicon-shopping-cart"></span>Cart</a></li>
        <li><a><span class="glyphicon glyphicon-user"></span>Welcome ${currUser}</a></li>
        <li><a href="${pageContext.request.contextPath}/Logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
        <%
	    }
	    else
	    {
	    	%>
	    	<li><a href="${pageContext.request.contextPath}/cart"><span class="glyphicon glyphicon-shopping-cart"></span>Cart</a></li>
	        <li><a href="${pageContext.request.contextPath}/signup"><span class="glyphicon glyphicon-user"></span>SignUp</a></li>
	        <li><a href="${pageContext.request.contextPath}/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
	        <%
	    }
        %>
      </ul>
    </div>
  </div>
</nav>

<h1 class="alert alert-success"><b><center>WELCOME</b></center></h1>


<div class="container">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="resources/shoe/shoe22.jpg" alt="Shoe1" style="width:100%;">
      </div>

      <div class="item">
        <img src="resources/shoe/shoe23.jpg" alt="Shoe2" style="width:100%; ;">
      </div>
    
      <div class="item">
        <img src="resources/shoe/shoe25.jpg" alt="Shoe3" style="width:100%;">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<br><br><br>
<center><i><h2 class="text-danger"><b><u>BRANDS AVAILABLE:</u></b></h2></i></center><br><br><br>

<div class="mar">
<div class="container-fluid">
  <div class="row">
    <div class="col-sm-4">
    <img src="resources/shoe/logo1.1.jpg" class="img-rounded" alt="shoe4" width="300" height="200" align="center"> </div>
    <div class="col-sm-4">
    <img src="resources/shoe/logo2.2.jpeg" class="img-rounded" alt="shoe5" width="300" height="200" align="center"> </div>
    <div class="col-sm-4">
    <img src="resources/shoe/logo3.jpg" class="img-rounded" alt="shoe6" width="300" height="200"></div>
  </div>
</div>
<br><br>
<div class="container-fluid">
  <div class="row">
    <div class="col-sm-4">
    <img src="resources/shoe/logo4.jpeg" class="img-rounded" alt="shoe4" width="300" height="200" align="center"> </div>
    <div class="col-sm-4">
    <img src="resources/shoe/logo5.jpeg" class="img-rounded" alt="shoe5" width="300" height="200" align="center"> </div>
    <div class="col-sm-4">
    <img src="resources/shoe/logo6.jpeg" class="img-rounded" alt="shoe6" width="300" height="200"></div>
  </div>
</div>
<br><br>
<div class="container-fluid">
  <div class="row">
    <div class="col-sm-4">
    <img src="resources/shoe/logo7.jpeg" class="img-rounded" alt="shoe4" width="300" height="200" align="center"> </div>
    <div class="col-sm-4">
    <img src="resources/shoe/logo8.jpg" class="img-rounded" alt="shoe5" width="300" height="200" align="center"> </div>
    <div class="col-sm-4">
    <img src="resources/shoe/logo9.jpg" class="img-rounded" alt="shoe6" width="300" height="200"></div>
  </div>
</div>
<br><br>
<div class="container-fluid">
  <div class="row">
    <div class="col-sm-4">
    <img src="resources/shoe/logo10.jpeg" class="img-rounded" alt="shoe4" width="300" height="200" align="center"> </div>
    <div class="col-sm-4">
    <img src="resources/shoe/logo11.jpeg" class="img-rounded" alt="shoe5" width="300" height="200" align="center"> </div>
    <div class="col-sm-4">
    <img src="resources/shoe/logo12.jpeg" class="img-rounded" alt="shoe6" width="300" height="200"></div>
  </div>
</div>
<br><br>
<div class="container-fluid">
  <div class="row">
    <div class="col-sm-4">
    <img src="resources/shoe/logo13.jpeg" class="img-rounded" alt="shoe4" width="300" height="200" align="center"> </div>
    <div class="col-sm-4">
    <img src="resources/shoe/logo14.jpeg" class="img-rounded" alt="shoe5" width="300" height="200" align="center"> </div>
    <div class="col-sm-4">
    <img src="resources/shoe/logo15.jpeg" class="img-rounded" alt="shoe6" width="300" height="200"></div>
  </div>
</div>
</div>
<br><br><br><br><br><br><br>
</body>
</html>