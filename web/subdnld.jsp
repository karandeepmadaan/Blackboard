<%-- 
    Document   : subdnld
    Created on : Jul 30, 2014, 9:22:09 PM
    Author     : Saurabh Garg
--%>

<%@page import="com.entity.Discussion"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Choose Subject</title>
        <jsp:include page="links.jsp"/>
        <link rel="stylesheet" type="text/css" href="css/style1.css"/>

    </head>
    <body >
        <header>
            <jsp:include page="header_stu.jsp"/>
        </header>
        <!-- Main Wrapper -->
        <div id="main-wrapper">
            <!-- Main -->
            <div  class="container">
                <div style="width:70%; ">


                    <form  action="download.jsp"> 
                        <% ServletContext c = getServletContext();
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection(c.getInitParameter("url"), c.getInitParameter("user"), c.getInitParameter("pass"));
                            Statement smt2 = con.createStatement();
                            ResultSet rs2 = null;
                            rs2 = smt2.executeQuery("select * from courses");%>
                        <table>
                            <td><select name="subject" style="width:100%; padding: 2px" >
                                    <%while (rs2.next()) {%>
                                    <option value="<%out.print(rs2.getString(2));%>"><%out.println(rs2.getString(2));%></option>
                                    <%}%>  
                                </select></td>
                            <td><input  value="Show!" type="submit"></td></table>
                    </form><hr><hr>
                </div>
                <% con.close();%> 
            </div>
        </div>
        <!-- Footer -->
        <footer><jsp:include page="footer.jsp"/></footer>                   

        <!-- Copyright -->
    </body>
</html>