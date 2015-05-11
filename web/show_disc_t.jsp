<%-- 
    Document   : show_disc
    Created on : Jul 26, 2014, 4:56:46 PM
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
        <title>Discussion</title>
        <jsp:include page="links.jsp"/>
        <link rel="stylesheet" type="text/css" href="css/style1.css"/>

    </head>
    <body >
        <header>
            <jsp:include page="header_tchr.jsp"/>
        </header>
        <!-- Main Wrapper -->
        <div id="main-wrapper">
            <!-- Main -->
            <div  class="container">
                <div style="width:70%; ">


                    <form  action="newdiscussiont"> 
                        <%

                            ServletContext c = getServletContext();
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection(c.getInitParameter("url"), c.getInitParameter("user"), c.getInitParameter("pass"));
                            Statement smt2 = con.createStatement();
                            ResultSet rs2 = null;
                            String s = request.getParameter("subject");
                            rs2 = smt2.executeQuery("select * from courses");%>
                        <table>
                            <td><select name="subject" style="width:100%; padding: 2px" >
                                    <%while (rs2.next()) {
                                        if (rs2.getString(1).equalsIgnoreCase(s)) {
                                            %><option selected="selected" value=<%=rs2.getString(1)%>><%= rs2.getString(2)%></option>
                                <% continue;
                                } else%>
                                <option value=<%=rs2.getString(1)%>><%= rs2.getString(2)%></option>
                                <%}%>   
                                </select></td>
                            <td><input  value="Show!" type="submit"></td></table>
                    </form><hr><hr>

                    <%
                        
                        Statement smt = con.createStatement();
                        Statement smt1 = con.createStatement();
                        ResultSet rs = null;
                        ResultSet rs1 = null;
                        rs = smt.executeQuery("select * from discussion where course_course_id='" + s + "';");

                        while (rs.next()) {
                            int i = rs.getInt(1);
                            out.print("<div><span class=\"date\">" + rs.getString(3) + "</span>&nbsp;&nbsp;&nbsp;&nbsp;<strong>" + rs.getString(4) + "</strong>&nbsp;&nbsp;&nbsp;&nbsp; <h4 style=\"text-align:right\">Asked By: " + rs.getString(2) + "</h4>" + "");
                            rs1 = smt1.executeQuery("SELECT * FROM solutions where d_query_id='" + i + "';");
                            while (rs1.next()) {
                                out.println(rs1.getString(2) + "<span style=\"float:right\">Solved By:" + rs1.getString(4) + "</span><br>");
                            }
                            out.print("</div><br><input class=\"button\" style=\"padding:5px;\" type=\"button\" value=\"Add Solution\" id=\"text" + i + "\">");
                            out.println("<div id=\"" + i + "\" style=\"height:200px; margin:15px; display:none; \"><form action=\"solve\" method=\"post\">"
                                    + "<textarea name=\"solution\" style=\"width:410px; height:50px;\" required placeholder=\"Add another solution\"></textarea>");
                            out.print("<input type=\"hidden\" name=\"id\" value=\"" + i + "\">");
                            out.println("<input style=\"padding:5px;\"  class=\"button\" name=\"submit\" value=\"Solve\" type=\"submit\"></form> </div>");
                            out.println("<hr>");
                            out.print("<script>"
                                    + "$(document).ready(function(){"
                                    + "$(\"#text" + i + "\").click(function(){"
                                    + "$(\"#" + i + "\").slideToggle(100);});});"
                                    + "</script>");

                        }

                    %>

                    <!--<p>
                </p>-->
                </div>
                <div  class="form" style="width: 30%; float: right; position: fixed; top: 130px; right: 3%; " >
                    <form id="contactform" action="doubt" method="post"> 
                        <p class="contact"><label for="name">Name</label></p> 
                        <input id="name" name="name" placeholder="First and last name" required tabindex="1" type="text" style="width:100%;"> <br>

                        <p class="contact"><label for="sub">Subject</label></p> 
                        <input  name="subject" placeholder="EX: UMA032" required tabindex="1" type="text" style="width:100%;"> <br>

                        <p class="contact"><label for="dbt">Doubt</label></p><textarea required name="doubt" placeholder="write your doubt here"></textarea>

                        <input class="buttom" name="submit"  value="Ask!" type="submit"> 	 
                    </form> 
                </div><% con.close();%> 

                <!-- Highlights -->
                <section style="width: 70%">
                    <ul class="divided">
                        <li>
                            <!-- Highlight -->
                            <article class="is-highlight">

                            </article>
                        </li>
                    </ul>
                </section>
            </div>
            <!-- Content -->
            <div id="content" class="8u skel-cell-important">

                <!-- Post -->
                <article class="is-post">

                </article>
            </div>
        </div>

        <!-- Footer -->
        <footer><jsp:include page="footer.jsp"/></footer>                   

        <!-- Copyright -->
    </body>
</html>