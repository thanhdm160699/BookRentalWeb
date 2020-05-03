<%-- 
    Document   : index
    Created on : Nov 12, 2019, 4:56:10 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %> 
<jsp:useBean id="user" class="Model.UserLib" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
	<title>Library TN2D</title>
	<link rel="stylesheet" type="text/css" href="css/css.css">
	<link rel="stylesheet" type="text/css" href="fontawesome-free-5.11.2-web/css/all.css">
	<link href="https://fonts.googleapis.com/css?family=Amaranth|Patua+One&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/javascript" href="js/index.js">
</head>
<body>

	<div id="color-top">

	</div>

	<div class="head">
		<div class="head-left-logo">
			<img src="Image/logoTn2d.PNG" height="100px;" width="240px">
			<!-- <h2>LIBRARY TN2D</h2> -->

		</div>
		<div class="head-div2">
			<div class="head-center-search">
				<p><input type="text" placeholder="Search..." ><button><i class="fas fa-search"></i></button></p>
			</div>

			 <div class="head-right-login"> 
                             <p>${user.username}</p>
				<!-- <p><i class="fas fa-user"></i><a href="register.html">Register</a> </p>
				<p><a href="login.html">Login</a></p> -->
				<!-- <i class="fas fa-sign-in-alt"></i> -->
			</div>
		</div>
	</div>	
			
	<div class="menu">
		<div class="menu_">
			<ul>
				<li><a href="index.jsp">HOME</a></li>
				<li><a href="cardRent.jsp">RENTAL BOOK</a></li>	
				<li><a href='searchBook.jsp'>SEARCH BOOK</a></li>
				<li><a href="setting.jsp"><i class="fas fa-user-cog"></i></a></li>
			</ul>
		</div>
	</div>

	<div class="banner">
		<div class="search">
			<img src="Image/banner.jpg" width="100%" height="700px;">
		</div>
		<div class="banner-search">
			<h1>Welcome come to TN2D Library</h1>
			<br>
			<p></p>
			
			<p id="re"><a href="register.jsp">REGISTER</a></p>
			<p id="lo"><a href="login.jsp">LOGIN</a></p>

		</div>

	</div>
	<!--======================FOOTER=========================== -->
	<div class="footer">
		<div class="footer-logo">
			<img src="Image/logo.png" box-shadow: 0px 0px 50px 0px blue;>
		</div>
		<div class="footer-library">
			<h3>My library</h3>
			<ul>
				<li>About</li>
				<li>History</li>
				<li>Library Vote</li>
				<li>Friends of the Library</li>
			</ul>
		</div>
		<div class="footer-service">
			<h3>Get Help</h3>
			<ul>
				<li>Hours and Locations</li>
				<li>Services</li>
				<li>Ask A Librarian</li>
			</ul>
		</div>
		<div class="footer-visit">
			<h3>Visit</h3>
			<ul>
				<li>Monday-Thursday 8 am-5:30 pm</li>
				<li>Friday 8 am-4:30 pm</li>
				<li>Saturday 8 am-1 pm</li>
				<li>Sunday Off</li>
				<li>Phone 0905-371-822</li>
			</ul>
		</div>
	</div>
	<div class="footer-bottom">
		<h3>© 2019 TN2D Library. All Rights Reserved | Designed by Team TN2D</h3>
	</div>
</body>
</html>