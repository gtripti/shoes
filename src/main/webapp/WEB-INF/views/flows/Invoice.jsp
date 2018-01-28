<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Invoice</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
</head>
<script>

var app = angular.module("myApp", []).controller("myCtrl", function($scope,$http) {
    
$scope.data = [];
    
    $scope.total = 0;
    
    $http(	{
    			method: 'POST',
	      		url: 'http://localhost:8080/shoes/fetchCartItems',
	      		 headers : {'Content-Type':'application/x-www-form-urlencoded'}
    			}).then(function(response){
			    	console.log(response.data);
			    
			    	$scope.data = response.data;
			    	
			    	for( var x = 0; x < $scope.data.length ; x++ )
			    	{
			    		$scope.total += $scope.data[x].pprice *  $scope.data[x].pqty;
			    	}
			    	
    			});
    
    $scope.Delete=function(arg){
    	
    	alert(arg);
    	
    	var json={"id":arg};
    	
    	console.log( JSON.stringify(json) );
    	
    	$http(	{
			method: 'POST',
      		url: 'http://localhost:8080/shoes/deletefromcart',
      		data:JSON.stringify(json),
      		 headers : {'Content-Type':'application/json'}
			}).then(function(response){
		    	console.log(response.data);
		    
		    	//Fetch Again
		    	$http(	{
	    			method: 'POST',
		      		url: 'http://localhost:8080/shoes/fetchCartItems',
		      		 headers : {'Content-Type':'application/x-www-form-urlencoded'}
	    			}).then(function(response){
				    	console.log(response.data);
				    
				    	$scope.data = response.data;
				    	
	    			});
			});   	
    }    
});
</script>
<body ng-app="myApp" ng-controller="myCtrl">
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
<h1 class="alert alert-success"><center>Invoice</center></h1>
<br><br><br>
<table class="table table-striped " style="margin: auto; width: 80%;">
	<thead>
		<tr>
			<th></th>
			<th></th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Sub Total</th>		
		</tr>
	</thead>
	
	<tbody>
		<tr ng-repeat="x in data">
			<td><img src="{{x.pimg}}" style="width:100px; height:100px; border: 1px solid black; box-shadow: 8px 8px 6px grey;" class="img-responsive indexcatimage"></td>
			<td>{{x.pname}}</td>			
			<td>&#8377; {{x.pprice}}</td>
			<td>{{x.pqty}}</td>
			<td>&#8377; {{x.pprice*x.pqty}}</td>
			
		</tr>
			<td></td>
			<td></td>
			<td></td>
			<td><span style="font-weight:bold;">Grand Total:-</span></td>
			<td><span style="font-weight:bold;">&#8377; {{total}}</span></td>
		<tr>	
		</tr>
	</tbody>
</table>
<br>
<br>
<br>
<center>
<a href="${flowExecutionUrl}&_eventId=goToPage2" class="btn btn-success" style=" float:left; margin-left:50px; margin-top:45px">Confirm Billing Address</a>
<a href="${flowExecutionUrl}&_eventId=goToPage4" class="btn btn-success" style=" float:right; margin-right:50px; margin-top:45px">Submit Order</a></center>
</body>
</html>