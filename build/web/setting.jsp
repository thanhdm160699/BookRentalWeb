<%-- 
    Document   : setting
    Created on : Nov 12, 2019, 5:00:00 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="Model.UserLib" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
	<title>Setting | Library TN2D</title>
	<link rel="stylesheet" type="text/css" href="css/setting.css">
	<link rel="stylesheet" type="text/css" href="fontawesome-free-5.11.2-web/css/all.css">
	<link href="https://fonts.googleapis.com/css?family=Amaranth|Patua+One&display=swap" rel="stylesheet">
</head>
<body>

	<div class="head">
			<div class="head-left-logo">
				<img src="Image/logoTn2d.PNG" height="100px;" width="240px">
			</div>
			<div class="head-div2">
				<div class="head-center-search">
					<p><input type="text" placeholder="Search..." ><button><i class="fas fa-search"></i></button></p>
				</div>
				<div class="head-right-login">
                                    <p>USSER: ${user.username}</p>
				</div>
			</div>
	</div>
	<div class="menu">
		<div class="menu-inside">
			<ul>
				<li><a href="welcome.jsp">HOME</a></li>
				<li><a href="cardRent.jsp">RENTAL BOOK</a></li>
                   <%
                                    if(user.getRole().equals("1")){
				out.write("<li><a href='searchBook.jsp'>SEARCH BOOK</a></li>"); 
                                        }
                                    else{
                                        out.write("<li><a href='searchBookAdmin.jsp'>SEARCH BOOK</a></li>"); 
                                        out.write("<li><a href='listUserAdmin.jsp'>USER MANAGER</a></li>"); 
                                    }
                                    
                                        %>
				<li><a href="setting.jsp"><i class="fas fa-user-cog"></i></a></li>
			</ul>
		</div>
	</div>	
	<div class="contain">
		<div class="contain-left">
			<div class="topic0_">
				<div class="topic0">
                                    <p><a href="logout">Logout</a></p>
				</div>
			</div>
			<div class="topic1_">
				<div class="topic1">
					<p><a href="changepass.jsp">Change password</a></p>					
				</div>
			</div>
			<div class="topic2_">
				<div class="topic2">
					<p><a href="update.jsp">Update Infomation</a></p>
				</div>
			</div>
		</div>
		<div class="contain-right">
			
		</div>
	</div>
	<!--==========================FOOTER=====================-->
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
</body>
</html>