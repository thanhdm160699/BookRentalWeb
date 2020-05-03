<%-- 
    Document   : changepass
    Created on : Nov 12, 2019, 4:55:19 PM
    Author     : PC
--%>

<%@page import="Model.UserLib"%>
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
			alert("!!!");
		}
	</script>
</head>
<body>
        <% 
            HttpSession s = request.getSession();
            UserLib userEdit = (UserLib)s.getAttribute("userEdit") ;
                    %>
	<form class="box" action="EditStatus" method="post">
		<h1>Edit Status</h1>
		<label>Status :</label>
                <%if(userEdit.getStatus() != null){ %>
                <input type="text" name="status" value="<%=userEdit.getStatus()%>" required>
                <% } else{ %>
                <input type="text" name="status" required>
                <% } %>
		<input type="submit" value="Submit" >
	</form>
</body>
</html>