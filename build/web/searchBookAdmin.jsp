<%-- 
    Document   : searchBook
    Created on : Nov 12, 2019, 4:58:57 PM
    Author     : PC
--%>

<%@page import="Model.Title"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %> 
<jsp:useBean id="user" class="Model.UserLib" scope="session"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <title>Search Book | Library TN2D</title>
            <link rel="stylesheet" type="text/css" href="css/searchBook.css">
            <link rel="stylesheet" type="text/css" href="fontawesome-free-5.11.2-web/css/all.css">
            <link href="https://fonts.googleapis.com/css?family=Amaranth|Patua+One&display=swap" rel="stylesheet">
        </head>
        <body>
            <style>
            .rental-card a:link, .rental-card a:visited{
                color: blue;
                text-decoration: none;
            }
            </style>
            <div class="head">
                <div class="head-left-logo">
                    <img src="Image/logoTn2d.PNG" height="100px;" width="240px">
                </div>
                <div class="head-div2">
                    <div class="head-center-search">
                        <p><input type="text" placeholder="Search..." ><button><i class="fas fa-search"></i></button></p>
                    </div>

                    <div class="head-right-login">
                        <p>${user.username}</p>
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
                        <p>Topic Hot ></p>					
                    </div>
                </div>
                <div class="topic1_">
                    <div class="topic1">
                        <p>Romance</p>					
                    </div>
                </div>
                <div class="topic2_">
                    <div class="topic2">
                        <p>Horror</p>
                    </div>
                </div>
                <div class="topic3_">
                    <div class="topic3">
                        <p>Poetry</p>
                    </div>
                </div>
                <div class="topic4_">
                    <div class="topic4">
                        <p>Art</p>
                    </div>
                </div>
                <div class="topic5_">
                    <div class="topic5">
                        <p>Psychology</p>
                    </div>
                </div>
            </div>
            <!--===================RIGHT================ <button type="submit"><i class="fas fa-search"></i></button>-->
            <div class="contain-right">
                <div class="box-search">
                    <form action="search" method="post">
                        <p><input type="text" name="searchCatolog"><input type="submit" value="search"></p>
                    </form>
                </div>
                <div class="box-rent">
                    <div id="box-rent-color">
                        <!-- <p>the duy</p>	 -->
                    </div>
                    <div class="rental-card">
                        <h2>SEARCH BOOK</h2>
                        <%
                            try {
                                HttpSession s = request.getSession();
                                ArrayList<Title> al = (ArrayList<Title>) s.getAttribute("search");
                                if (al.size() != 0) {
                        %>
                        <table border="2" cellspacing="0px" height="80px;" border-radius="20px 20px 0px 0px;">
                            <tr>
                                <th width="150px">Image</th>
                                <th width="150px">Name Book</th>
                                <th width="150px">Catalog</th>
                                <th width="150px">Price rent</th>
                                <th width="150px">Select</th>
                            </tr>
                            <% for (Title x : al) {%>
                            <tr height="25px;">
                                <td><img src="<%=x.getImage()%>" width="60" height="100"></td>
                                <td><%=x.getNameTitle()%></td>
                                <td><%=x.getType()%></td>
                                <td><%=x.getRentCost()%> VND</td>
                                <td><a href="Edit?id=<%=x.getIdTitle()%>">Edit</a> | <a href="checkDeleteTitle?id=<%=x.getIdTitle()%>">Delete</a></td>
                            </tr>
                            <%}%>
                        </table>
                        <% } else { %>
                        <p>No product is found</p>
                        <%}
                            } catch (Exception e) {
                                
                            }%>   
                    </div>

                </div>
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