<%--
    Document   : view_br
    Created on : Jul 11, 2014, 5:42:37 PM
    Author     : Saurabh Garg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header_tchr.jsp"/>
<jsp:include page="links.jsp"/>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css/component.css" />
        <title>Courses</title>
    </head>
    <body>
        <div id="main-wrapper">
            <div class="container">
                <!-- Top Navigation -->
                <div class="component">
                    <% ServletContext c = getServletContext();
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection(c.getInitParameter("url"), c.getInitParameter("user"), c.getInitParameter("pass"));
                        Statement smt = con.createStatement();
                        ResultSet rs = smt.executeQuery("select * from courses order by b_branch_id");

                    %>

                    <table>
                        <thead>
                            <tr>
                                <th>Branch</th>
                                <th>Course Id</th>
                                <th>Course Name</th>
                                <th>Course Info</th>
                                
                            </tr>
                        </thead>
                        <% while (rs.next()) {%>
                        <tbody>
                            <tr><td class="user-name"><% out.print(rs.getString(4));%></td><td class="user-email"><% out.print(rs.getString(1));%></td><td class="user-phone"><% out.print(rs.getString(2));%></td><td class="user-mobile"><% out.print(rs.getString(3));%></td>
                                </tr>

                        </tbody>
                        <%}
                        con.close();%>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
