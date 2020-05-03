<%-- 
    Document   : changepass
    Created on : Nov 12, 2019, 4:55:19 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
	<title>Change Password | Library TN2D</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/changepass.css">
	<link rel="shortcut icon" type="png" href="">
	<script type="text/javascript">
		function ketthuc(){
			alert("Login success!!!");
		}
	</script>
</head>
<body>
	<form class="box" action="error.jsp" method="post">
		<h1 onClick="message();">Change Password</h1>
		<label>User Name :</label>
		<input type="text" name="username" placeholder="Username..." required>
		<label>Old Password :</label>
		<input type="password" name="oldpassword" placeholder="Old Password..." required>
		<label>New Password :</label>
		<input type="password" name="newpassword" placeholder="New Password..." required>
		<label><input type="checkbox" check="checked" name="remember">Keep login</label>
		<input type="submit" value="Submit" onsubmit="ketthuc()">

	</form>
</body>
</html>