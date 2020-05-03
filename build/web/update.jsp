<%-- 
    Document   : update
    Created on : Nov 12, 2019, 5:00:38 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %> 
<jsp:useBean id="user" class="Model.UserLib" scope="session"></jsp:useBean>
<!doctype html>
<html>
    <head>
        <title>Udate Infomation | Library TN2D</title>
        <meta charset="utf-8"/>
        <link rel="stylesheet" type="text/css" href="css/update.css">
    </head>
    <body>
        <form class="box" action="updateUser" method="post">
            <p>UPDATE INFOMATION</p>
            <label>Full Name (<span style="color : red">*</span>) :</label>
            <br>
            <input type="text" name="fullname" value="${user.fullname}">
        <label>Date of Birth (<span style="color : red">*</span>):</label><input type="date" name="bday" value="${user.dob}">

            <label>Phone number (<span style="color : red">*</span>) :</label>
            <br>
            <input type="text" name="phone" value="${user.phone}">
            <c:if test="${user.gender == '1'}">
            <label>Gender (<span style="color : red">*</span>) :</label><span>&nbsp&nbsp&nbsp</span>
            <input type="radio" name="sex" value="male" checked><span style="color: #f1f1f1">Male</span>
            <input type="radio" name="sex" value="female"><span style="color: #f1f1f1">Female</span>
            </c:if>
            
            
             <c:if test="${user.gender == '0'}">
            <label>Gender (<span style="color : red">*</span>) :</label><span>&nbsp&nbsp&nbsp</span>
            <input type="radio" name="sex" value="male" ><span style="color: #f1f1f1">Male</span>
            <input type="radio" name="sex" value="female" checked><span style="color: #f1f1f1">Female</span>
            </c:if>
            <br>
            <label>Mail (<span style="color : red">*</span>):</label>
            <br>
            <input type="text" name="mail" value="${user.email}">

            <label>Address (<span style="color : red">*</span>):</label>
            <br>
            <input type="text" name="address" value="${user.address}">
            <input type="submit" name="submit" value="Submit">
        </form>
    </body>
</html>