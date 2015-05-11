<%-- 
    Document   : Add_assign
    Created on : Jul 11, 2014, 4:07:16 PM
    Author     : Saurabh Garg
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assignment</title>
    </head>
    <body><header>
            <jsp:include page="header_admin.jsp"/>
            <jsp:include page="links.jsp"/>
        </header>
        <!-- Main Wrapper -->
        <div id="main-wrapper">
            <!-- Main -->
            <div  class="container">
                <center> <div style="width:60%; ">




                        <% ServletContext c = getServletContext();
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection(c.getInitParameter("url"), c.getInitParameter("user"), c.getInitParameter("pass"));
                            Statement smt = con.createStatement();

                            ResultSet rs2 = null;

                            rs2 = smt.executeQuery("select * from courses");
                        %>

                        <form action="upload"  method="post" enctype="multipart/form-data">
                            <label for="name">Name</label>
                            <input id="name" name="name" placeholder="First and last name" required tabindex="1" type="text" style="width:100%;"> <br>
                            <label for="subject">Subject</label>
                            <select name="subject"  required style="width:100%; padding: 4px">
                                <option >Select Subject</option>
                                <%while (rs2.next()) {%>

                                <option ><%= rs2.getString(2)%></option>
                                <%}%>  
                            </select><br>
                            <input type="file" class="buttom" required name="myFile" ><br>

                            <input class="button" style="padding: 4px 25px; margin-top: 20px" name="submit"  value="Upload" type="submit">
                        </form>


                    </div></center>
            </div>
        </div>
        <footer><jsp:include page="footer.jsp"/></footer>
<% con.close();%> 
    </body>
</html>
