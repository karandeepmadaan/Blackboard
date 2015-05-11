<%-- 
    Document   : profile_edit
    Created on : Jul 31, 2014, 9:41:41 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.entity.Discussion"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
        <jsp:include page="links.jsp"/>
        <link rel="stylesheet" type="text/css" href="css/style1.css"/>
        <link rel="stylesheet" type="text/css" href="css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css/component.css" />
    </head>
    <body>
        <header>
            <jsp:include page="header_stu.jsp"/>
        </header>
        <div id="main-wrapper">
            <!-- Main -->
            <div  class="container">
                <div style="width:60%;float:left"> 
                    <%ServletContext c = getServletContext();String l=(String)session.getAttribute("type"); String s=(String)session.getAttribute("username");
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection(c.getInitParameter("url"), c.getInitParameter("user"), c.getInitParameter("pass"));
                            Statement smt2 = con.createStatement();
                            ResultSet rs2= null ;
                            //String l=(String)session.getAttribute("type");
                    rs2=smt2.executeQuery("select * from "+l+" where l_username='"+s+"'");
                    while(rs2.next()){%>
                    <table>
                        <tr><th style="text-align: left">Username</th><td><%=s%></td></tr>
                        <tr><th style="text-align: left">Name</th><td><%=rs2.getString(6)%></td></tr>
                        <tr><th style="text-align: left">Branch</th><td><%=rs2.getString(8)%></td></tr>
                        <tr><th style="text-align: left">Gender</th><td><%=rs2.getString(5)%></td></tr>
                        <tr><th style="text-align: left">Phone</th><td id="a"><%=rs2.getString(7)%></td></tr>
                        <tr><th style="text-align: left">E-mail</th><td id="b"><%=rs2.getString(4)%></td></tr>
                        <tr><th style="text-align: left">Address</th><td id="c"><%=rs2.getString(2)%></td></tr>
                        
                    </table>
                        <%}%>
                        <input type="button" class="button" value="Change Password" id="karan2">
                        <script>
                            $(document).ready(function(){
                            $("#karan2").click(function(){
                               $("#karan").slideToggle(100); 
                            });
                            });
                        </script>
                </div>
                        <div class="form" id="karan" style="display: none; margin-left: 20px;padding: 10px;float: left; width: 35%">
                            
                            <form id="contactform" action="passchange" method="post"> 
                                <input type="hidden" value="<%=s%>" name="user123">
                            <label for="name">Old Password:<span class="required">*</span></label>
                            <input name="oldpass" type="password"> 
                            <label for="name">New Password:<span class="required">*</span></label>
                            <input name="newpass" type="password">
                            <label for="name">Re-enter New Password:<span class="required">*</span></label>
                            <input name="new1pass" type="password"><br><br>
                            <input class="buttom"  id="submit" style="width:100px; padding: 15px" tabindex="5"  value="Submit" type="submit">
                            </form>
                        </div>
            </div>
        </div>
    </body>
</html>
