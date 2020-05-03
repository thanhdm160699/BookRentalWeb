<%-- 
    Document   : login
    Created on : Nov 12, 2019, 4:57:28 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
	<title>Login | Library TN2D</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/login.css">
	<link rel="shortcut icon" type="png" href="">
	<script type="text/javascript">
		function ketthuc(){
			alert("Login success!!!");
		}
	</script>
</head>
<body>
	<form class="box" action="login" method="post">
		<h1 onClick="message();">Login</h1>
		<label>User Name :</label>
		<input type="text" name="username" placeholder="Username..." required>
		<label>Password :</label>
		<input type="password" name="password" placeholder="Password..." required>
		<label><input type="checkbox" check="checked" name="remember">Keep login</label>
		<input type="submit" value="Submit" onsubmit="ketthuc()">

	</form>
</body>
</html>