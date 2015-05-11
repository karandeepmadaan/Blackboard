<%-- any content can be specified here e.g.: --%>
<%@ page pageEncoding="UTF-8" %>
<jsp:include page="header_tchr.jsp"/>
<jsp:include page="links.jsp"/>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css/component.css" />
        <title>Announcement</title>
    </head>
    <body>
        <div id="main-wrapper">
            <div class="container">
                <!-- Top Navigation -->
                <center> <div style="width:30%; float: left ">
                    <% ServletContext c = getServletContext();
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection(c.getInitParameter("url"), c.getInitParameter("user"), c.getInitParameter("pass"));
                        Statement smt = con.createStatement();
                       
                        ResultSet rs = smt.executeQuery("select * from branch");
                        %>
                        
                        <form action="announce">
                        <select name="branch"  required style="width:100%; padding: 2px ">
                                        <option >Select Branch</option>
                                        <%while (rs.next()) {%>
                                        <option ><%= rs.getString(1)%></option>
                                        <%}%>  
                        </select><br>
                        <input type="text" name="announce" placeholder="Add Announcement" style="width: 100%"><br><br>
                        <input class="button" type="submit" >
                        </form>
                       
                </div>
                         <div class="row">
                    <!-- Sidebar -->
                    <div id="sidebar" style="text-align: left; width: 60%; float: right" >
                        <!-- Excerpts -->
                        <section>
                            <ul class="divided">
                                <li>
                                    <!-- Excerpt -->
                                    <article class="is-excerpt">
                                        <table>
                                                <thead>
                                                    <tr><th>Date</th><th>Description</th></tr>
                                                </thead>
                                                <tbody>
                                                    
                                            <% 
                                                Class.forName("com.mysql.jdbc.Driver");                                                
                                                ResultSet rs1 = null;
                                                rs1 = smt.executeQuery("select * from announcement order by created desc");
                                                while (rs1.next()) {
                                                    out.println("<tr><td style=\"min-width:250px\"><span class=\"date\">" + rs1.getString(3) + "</span></td><td>" + rs1.getString(2)+"</td></tr>");
                                                    
                                                }
                                            %>
                                                    
                                                </tbody>
                                            </table>
                                    </article>
                                </li>
                            </ul>
                        </section>
                        <!-- Highlights -->
                        
                    </div>
                    <!-- Content -->
                    
                </div>
            </div>
                    <% con.close();%> 
        </div>
    </body>
</html>

