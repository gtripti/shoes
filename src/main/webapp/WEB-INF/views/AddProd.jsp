<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Product</title>

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<br>
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
<h1 style="margin: auto; width: 80%; text-align: center;">Add Product</h1>

<form:form action="AddProdToDB" method="post" modelAttribute="Product" style="margin: auto; width: 80%; text-align: center;" enctype="multipart/form-data">
	<form:input path="name" class="form-control" type="text" placeholder="Enter Name" />
	<br>
	<form:input path="description" class="form-control" type="text" placeholder="Enter text"/>
	<br>
	<form:input path="price" type="number" class="form-control" placeholder="Enter Price" />
	<br>
	<form:input path="category" type="text" class="form-control" placeholder="Enter Text" />
	<br>
	<form:input path="qty" type="number"  class="form-control" placeholder="Enter Quantity"/>
	<br>
	<form:input path="f" type="file" class="form-control" placeholder="Add Image" /><br>
	<input type="submit" class="btn btn-primary" value="Submit" />
</form:form>
</body>
</html>