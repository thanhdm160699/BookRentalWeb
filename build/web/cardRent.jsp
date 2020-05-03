<%-- 
    Document   : cardRent
    Created on : Nov 12, 2019, 4:54:22 PM
    Author     : PC
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="Model.UserLib"  scope="session"></jsp:useBean>
<jsp:useBean id="rentCard" class="Model.RentCard" scope="session"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <title>Card Rent | Library TN2D</title>
            <link rel="stylesheet" type="text/css" href="css/cardRent.css">
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
                        <form action="" method=""> <p><input type="text" placeholder="Search..." ><button type="submit"></a><i class="fas fa-search"></i></button></p></form>
                    </div>
                    <div class="head-right-login">
                        <!-- <ul>
                                <li><i class="fas fa-user"></i>  Register</li>
                                <li><i class="fas fa-sign-in-alt"></i>  Login</li>
                                <li><i class="fas fa-sign-out-alt"></i>  Logout</li>
                        </ul> -->
                        <p>${user.username}</p>
                </div>
            </div>
        </div>
        <div class="menu">
            <div class="menu-inside">
                <ul>
                    <li><a href="index.jsp">HOME</a></li>
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
            <div class="contain-right">
                <div class="box-rent">
                    <div id="box-rent-color">
                        <!-- <p>the duy</p>	 -->
                    </div>
                    <div class="rental-card">
                        <form class="box-card" action="" method="POST">
                            <h2>Book Rental Card</h2>
                            <label>ID Card Rent:</label>
                            <input type="text" name="idcard" placeholder="Id Card..." required>
                            <label>Number ID (CMND):</label>
                            <input type="text" name="cmnd" placeholder="Identity cards..." required>
                            <label>Full Name</label>
                            <input type="text" name="fullname" placeholder="Full name..." required>
                            <label>Rent Date</label>
                            <input type="date" name="rentday" placeholder="Rent days..." required>
                            <label>Pay Date</label>
                            <input type="date" name="paydate" placeholder="Pay days..." required>
                            <h2>Selected Book :</h2>
                            <table border="2" cellspacing="0px" height="80px;" border-radius="20px 20px 0px 0px;">
                                <tr>
                                    <th width="150px">ID Book</th>
                                    <th width="150px">Image</th>
                                    <th width="150px">Price</th>
                                    <th width="150px">Quantity</th>
                                    <th width="150px">Total Price</th>
                                </tr>
                                <tr height="25px;">
                                    <td ></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>

                                <tr height="25px;">
                                    <td colspan="4"></td>
                                    <td>Total(1): </td>
                                </tr>
                                <tr height="25px;">
                                    <td colspan="5">Down Payment(2) :</td>
                                </tr>
                                <tr height="25px;">
                                    <td colspan="5">Money must be Pay: (1) + (2) =</td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    <div class="note">
                        <p>* Maximum range of borrowing time is 7 days.</p>
                        <p>- If pass the due day, the borrowing price for each book will be doubled, start on the first late day.</p>
                        <p>- Books must be returned as intact as they were when borrowing.</p>
                        <p>- Deposit is equal to the book’s price.</p>
                        <p>- Return all books in acceptable conditions in order to receive the deposit.</p>
                    </div>

                </div>
            </div>
        </div>
        <!--==========================FOOTER=====================-->
        <div class="footer">
            <div class="footer-logo">
                <img src="Image/logo.PNG" box-shadow: 0px 0px 50px 0px blue;>
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
