<%-- 
    Document   : register
    Created on : Nov 12, 2019, 4:58:13 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <title>Register | Library TN2D</title>
        <meta charset="utf-8"/>
        <link rel="stylesheet" type="text/css" href="css/register.css">
    </head>
    <body>
        <form class="box" action="checkRegister" method="post">
            <p>FORM REGISTER</p>
            <label>Full Name (<span style="color : red">*</span>) :</label>
            <input type="text" name="fullname" placeholder="Full name..." required>
            <label>User Name (<span style="color : red">*</span>) :</label>
            <br>
            <input type="text" name="username" placeholder="User name..." required>
            <label>Password (<span style="color : red">*</span>) :</label>
            <br>
            <input type="password" name="password" placeholder="Password..." required>
            <label>Repeat Password (<span style="color : red">*</span>) :</label>
            <br>
            <input type="password" name="repeatpassword" placeholder="Repeat password..." required>
            <label>Gender (<span style="color : red">*</span>) :</label><span>&nbsp&nbsp&nbsp</span>
            <input type="radio" name="sex" value="male" checked><span style="color: #f1f1f1">Male</span>
            <input type="radio" name="sex" value="female"><span style="color: #f1f1f1">Female</span>
            <br>
            <label>Phone number (<span style="color : red">*</span>) :</label>
            <br>
            <input type="text" name="phone" placeholder="Phone number or Email..." required>
            <label>CMND (<span style="color : red">*</span>):</label>
            <br>
            <input type="text" name="identityCard" placeholder="CMND..." required>
            <label>Mail (<span style="color : red">*</span>):</label>
            <br>
            <input type="text" name="mail" placeholder="Mail..." required>
            <label>Date of Birth (<span style="color : red">*</span>):</label><input type="date" name="bday">
            <label>Address (<span style="color : red">*</span>):</label>
            <br>
            <input type="text" name="address" placeholder="Address..." required>
            <input type="submit" name="submit" value="Submit">
        </form>


    </body>
</html>