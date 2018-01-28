<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>About Us</title>
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
  	margin-left:20px;
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
<h1 class="alert alert-success"><center>ABOUT US</center></h1>
<div class="mar"><b>
	<p>Welcome to our website.We always appreciate your business. Shoebuy.("the company", "we", "us", "our"), the entity that owns and operates Shoes, provides services to you subject to the terms and conditions and other customer service pages which we have prepared to help make your shopping experience at ShoeRack as enjoyable and problem-free as possible. Please read them carefully.
	</p>
	 <p>
	 If you would like to provide feedback about the Shoes.com web site, or recommend a way we can improve the buying experience, please click here. In addition, we offer a Safe Purchase Guarantee to ensure your comfort when buying on a ShoeRack web site.
	 </p>
	 <h3 class="text-danger">Privacy</h3>
	 <p>Please review the Privacy Policy, which also applies to your visit to and use of any of our web sites.</p>
	<h3 class="text-danger"> Ownership and Copyright</h3>
	<p>Unless otherwise noted, all design and content included on this web site, including text, graphics, logos, icons, images, artwork, audio and video clips and software is the property of ShoeRack. (or is used under license to ShoeRack.) and is protected by United States and international copyright laws.
	</p>
	<h3 class="text-danger">Trademarks</h3>
	<p>
	Nothing on this web site or in these Terms of Use should be construed as any license or right to use any trademarks or service marks displayed on the web site without the express written permission of ShoeRack or the trademark or service mark owner. Neither the name "ShoeRack" nor any associated logos may be used for any purpose without the company's prior written consent. The Shoes.com or Shoebuy.com logos may not be used as a "hot" link to any other web site without the company's prior written consent.
	</p>
	<h3 class="text-danger">Use of Web Site</h3>
	<p>
	The ShoeRack web site and content are intended solely for personal and non commercial use by visitors and on-line shoppers. Any use of any ShoeRack web site, including ShoeRack, or its content other than for personal and non-commercial purposes is prohibited. You agree not to reproduce, publish, transmit, distribute, modify, create derivative works from, or commercially exploit in any way any of the content of ShoeRack web site. However, you may download, electronically copy and print any of the content of the web site for your personal, non-commercial use only. This is a revocable license, not a transfer of title, and is subject to the restrictions that you may not
	<br>(a) modify the content or use it for any commercial purpose, or any public display, performance, sale  or rental, 
	<br>(b) decompile, reverse engineer, or disassemble the content, or 
	<br>(c) remove any copyright, trademark registration, or other  proprietary notices from the content.<br> You further agree not to access or use 
	ShoeRack web site in any manner  that may be harmful to the operation of the web site or its content.
	</p>
	<h3 class="text-danger">Product Descriptions</h3>
	<p>
	ShoeRack makes all reasonable efforts to display the products listed for sale on its web site as accurately as possible. However, the colors we use, as well as the display and color capabilities of your computer monitor, will affect the colors that you actually see on your screen. The company cannot guarantee that your monitor's display of any product color, texture or detail will be accurate. In addition, ShoeRack does not warrant that product descriptions or other content are accurate, complete, reliable current or error free. If a product offered  is not as described, your sole remedy is to return it in unused condition.
	</p>
	<h3 class="text-danger">Comments and Suggestions</h3>
	<p>
	We appreciate hearing from our customers and welcome your comments and suggestions regarding the company's web site and the products offered for sale, provided that such comments and suggestions are not illegal, obscene, threatening, defamatory, invasive of privacy, infringements of intellectual property rights or otherwise objectionable or injurious to third parties and do not contain or consist of viruses, political campaigning, commercial solicitation, chain letters, mass mailings or any form of "spam." You may not use a false email address, impersonate any person, or otherwise mislead us as to the origin of any comment or suggestion.
	</p>
	<p>
	If you do submit comments or suggestions, you should be aware that company's policies do not permit us to accept or consider creative ideas, suggestions, inventions or materials other than those that we have specifically requested. We value your feedback on our products and our service but requests that you be specific in your comments and not submit creative ideas, inventions, suggestions or materials. Any feedback, comments or suggestions that you do send will become the property of ShoeRack and shall not be subject to any obligation of confidentiality on the part of the company shall not be liable for any use or disclosure of any such feedback, comments or suggestions shall be entitled to unrestricted use of any such feedback, comments or suggestions for any purpose whatsoever, commercial or otherwise, without compensation to you or any other person who submitted the information.
	</p>
 </b></div>
 <hr>
</body>
</html>