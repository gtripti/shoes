<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Product</title>

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <script type="text/javascript">
	
	$(document).ready(function() {
		
		$('#checkBoxAll').click(function() {
			
			if($(this).is(":checked"))
				$('.chkCheckBoxId').prop('checked', true);
			else
				$('.chkCheckBoxId').prop('checked', false);
		});
	});

</script>
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
</nav><br>
<h1 style="margin:auto;width:80%;text-align:center;">View Product</h1>
<br>

<form method="post" action="${pageContext.request.contextPath}/DeleteProduct">
			<%
			Authentication auth1 = SecurityContextHolder.getContext().getAuthentication();
		    if (auth1 != null && !auth1.getName().equals("anonymousUser"))
		    {    
			if(request.isUserInRole("ROLE_ADMIN") || request.isUserInRole("ROLE_SUPPLIER") ){
		    		%>
		    <input type="submit" class="btn btn-danger" value="Delete" onclick="return confirm('Are you sure you want to delete this product?');" style="margin-left: 135px;">		
		    		<%
		    	}
		    }
		    %>
	<br><br>
	
<table class="table table-striped" style="margin: auto; width: 80%; text-align: center;">
	<thead><tr>
				<th><input type="checkbox" id="checkBoxAll"></th> 
				<th>NAME</th>
				<th>DESCRIPTION</th>
				<th>PRICE</th>
				<th>CATEGORY</th>
				<th>QUANTITY</th>
				<th>IMAGE</th>
				<th>DELETE</th>
				<th>VIEW</th>
			</tr>
	</thead>
	<tbody>
			
		<c:forEach items="${AllProduct}" var="x">		
		<tr class="tb">
			<td><input type="checkbox" class="chkCheckBoxId" name="delete" value="${x.getId()}"></td>
			<td>${x.getName()}</td>
			<td>${x.getDescription()}</td>
			<td>${x.getPrice()}</td>
			<td>${x.getCategory()}</td>
			<td>${x.getQty()}</td>
			<td><img src="${x.getImagePath()}" style="height: 50%; width: 50%;"></td>
			<td><a href="DeleteProductFromDB/${x.getId()}" class="btn btn-danger">Delete</a></td>
			<td class="tb"><a href="ViewOneProduct/${x.getId()}" class="btn btn-danger">View</a></td>
			<%
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		    if (auth != null && !auth.getName().equals("anonymousUser"))
		    {    
			if(request.isUserInRole("ROLE_ADMIN")  || request.isUserInRole("ROLE_SUPPLIER") ){
		    		%>
		    		<td><a href="${pageContext.request.contextPath}/UpdateOneProduct/${x.getId()}" class="btn btn-success">Update</a></td>
			        <td><a href="${pageContext.request.contextPath}/DeleteOneProduct/${x.getId()}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this product?');">Delete</a></td>
		    		<%
		    	}
		    }
			%>
		</tr>
		</c:forEach>		
	</tbody>
</table>
</form>
</body>
</html>