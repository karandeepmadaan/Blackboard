<%-- 
    Document   : addcrs
    Created on : Jul 25, 2014, 10:24:51 PM
    Author     : Saurabh Garg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header_admin.jsp"/>
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
                        ResultSet rs = smt.executeQuery("select * from branch");

                    %>
<form action="addcourse">
                    <table>
                        <thead>
                            <tr>
                                <th>Branch</th>
                                <th>Course Id</th>
                                <th>Course Name</th>
                                <th>Course Info</th>
                                
                            </tr>
                        </thead>
                        
                        <tbody>
                        
                            <tr><td class="user-name"><select name="branch"  required style="width:auto; padding: 0 ">
                                        <option >Select Branch</option>
                                        <%while (rs.next()) {%>
                                        <option ><%= rs.getString(1)%></option>
                                        <%}%>  
                                    </select></td>
                                    <td class="user-email"><input type="text" name="id"></td>
                                    <td class="user-phone"><input type="text" name="crsname"></td>
                                    <td class="user-mobile"><input type="text" name="crsinfo"><input type="submit" value="Add"></td></tr>
                            
                        

                        </tbody>
                        
                    </table>
                    </form>
                </div><% con.close();%> 
            </div>
        </div>
    </body>
</html>
