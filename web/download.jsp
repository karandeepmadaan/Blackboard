<%-- 
    Document   : download
    Created on : Jul 30, 2014, 7:52:48 PM
    Author     : Saurabh Garg
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.File" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css/component.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assignment</title>
    </head>
    <body><header>
            <jsp:include page="header_stu.jsp"/>
            <jsp:include page="links.jsp"/>
        </header>
        <!-- Main Wrapper -->
        <div id="main-wrapper">
            <!-- Main -->
            <div  class="container">
                <center> <div style="width:80%; ">
                        <table>
                            <thead>
                                <tr>
                                    <th>File</th>
                                    <th>Download</th>
                                </tr>
                            </thead>
                            <tbody>
                        <%
                            String sub=request.getParameter("subject");
                            String path="C:/apache-tomcat-6.0.33/work/"+sub+"/";
                            File folder = new File(path);
                            File[] listOfFiles = folder.listFiles();

                            for (File file : listOfFiles) {
                                if (file.isFile()) {
                        String fileName=file.getName();
                        String fpath=path+fileName+"/";%>
                        <tr> <td><%=fileName%></a></td><td><a href=<%=fpath%>>download</a></td>
                                   <% 
                                }
                            }
                        %>
                        </tbody>
                        </table>
                    </div></center>
            </div>
        </div>
        <footer><jsp:include page="footer.jsp"/></footer>

    </body>
</html>
