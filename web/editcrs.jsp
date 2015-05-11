<%-- 
    Document   : editcrs.jsp
    Created on : Jul 24, 2014, 11:19:18 PM
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
                        String id=request.getParameter("id");
                        ResultSet rs = smt.executeQuery("select * from courses where course_id = '"+id+"'");
                        if(rs.next())
                        {
                    %>
                    <form action="Editcrs">
                        <input type="text" name="id" value="<%=rs.getString(1)%>" readonly="true">
                        <input type="text" name="name" value="<%=rs.getString(2)%>" >
                        <input type="text" name="info" value="<%=rs.getString(3)%>" >
                        <input type="text" value="<%=rs.getString(4)%>" readonly="true">
                        <input type="submit" value="Save">
                    </form>
                        <%}%>
                        <% con.close();%> 
                </div>
            </div>
        </div>
    </body>
</html>
