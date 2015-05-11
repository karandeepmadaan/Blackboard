<%-- 
    Document   : announce
    Created on : Jun 29, 2014, 10:39:12 PM
    Author     : Saurabh Garg
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Home Page</title>
        <jsp:include page="links.jsp"/>
         <link rel="stylesheet" type="text/css" href="css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css/component.css" />
    </head>
    <body class="left-sidebar">
        <header>
            <jsp:include page="header_stu.jsp"/>
        </header>
        <!-- Main Wrapper -->
        <div id="main-wrapper">
            <!-- Main -->
            <div id="main" class="container">
                <div class="row">
                    <!-- Sidebar -->
                    <div id="sidebar"  >
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
                                                    
                                            <% ServletContext c= getServletContext();
                                                Class.forName("com.mysql.jdbc.Driver");
                                                Connection con = DriverManager.getConnection(c.getInitParameter("url"), c.getInitParameter("user"), c.getInitParameter("pass"));
                                                Statement smt = con.createStatement();
                                                ResultSet rs = null;

                                                rs = smt.executeQuery("select * from announcement order by created desc");
                                                while (rs.next()) {
                                                    out.println("<tr><td style=\"min-width:250px\"><span class=\"date\">" + rs.getString(3) + "</span></td><td style=\"max-width:65%\">" + rs.getString(2)+"</td></tr>");
                                                    
                                                }

                                            %>
                                                    
                                                </tbody>
                                            </table>
                                       
                                   
                                    </article>
                                </li>
                            </ul>
                        </section>
                        <!-- Highlights -->
                        <section>
                            <ul class="divided">
                                <li>
                                    <!-- Highlight -->
                                    <article class="is-highlight">
                                        <header>
                                            <h3><a href="#">Something of note</a></h3>
                                        </header>
                                        <a href="http://regularjane.deviantart.com/art/In-Your-Hands-356733525" class="image image-left"><img src="images/pic06.jpg" alt="" /></a>
                                        <p>Phasellus  sed laoreet massa id justo mattis pharetra. Fusce suscipit ligula vel quam 
                                            viverra sit amet mollis tortor congue magna lorem ipsum dolor et quisque ut odio facilisis 
                                            convallis. Etiam non nunc vel est suscipit convallis non id orci. Ut interdum tempus 
                                            facilisis convallis. Etiam non nunc vel est suscipit convallis non id orci.</p>
                                        <ul class="actions">
                                            <li><a href="#" class="button button-icon fa fa-file">Learn More</a></li>
                                        </ul>
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
            </div>
        </div>

        <!-- Footer -->
        <footer><jsp:include page="footer.jsp"/></footer>                   
<% con.close();%> 
        <!-- Copyright -->
    </body>
</html>