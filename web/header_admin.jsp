<%-- 
    Document   : header_admin
    Created on : Jul 6, 2014, 10:06:39 PM
    Author     : Saurabh Garg
--%>


<%@page import="org.apache.struts2.ServletActionContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
          String name=(String)session.getAttribute("username");
           if(session==null || name=="" || name==null)
                {
                response.sendRedirect("index.html");
                }
              else{
            %>
            <div style="text-align: right" > <font color="black" size="4" > Welcome <%=name%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></div>
            <%} %>
<div id="header-wrapper" >

    <!-- Header -->
    <div id="header" class="container">
        
        <!-- Nav -->
        <nav id="nav">
            <ul>
                <li><a class="fa fa-home" href="admin.jsp"><span>Home</span></a></li>
                <li>
                    <a href="" class="fa fa-bar-chart-o"><span>Edit Database</span></a>
                    <ul>
                        <li>
                            <a href="">Branches</a>
                            <ul>
                                <li><a href="view_br.jsp">View Branches</a></li>
                                <li><a href="edit br.jsp">Add Branch</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="">Courses</a>
                            <ul>
                                <li><a href="view_crs.jsp">Edit Courses</a></li>
                                <li><a href="addcrs.jsp">Add Course</a></li>
                            </ul>
                        </li>
                        
                        <li>
                            <a href="">Assignments</a>
                            <ul>
                                
                                <li><a href="Add_assign_1.jsp">Add Assignments</a></li>
                                
                            </ul>
                        </li>
                    </ul>
                </li>
                <li><a class="fa fa-cog" href=""><span>Utilities</span></a>
                    <ul>
                        <li><a href="add_announce.jsp">Announcements</a>
                            <ul><li><a href="add_announce.jsp">Add Announcement</a></li></ul>
                        </li>
                        <li><a href="#">Calendar</a></li>
                    </ul>
                </li>
                <li><a class="fa fa-retweet" href="show_disc.jsp"><span>Discussions</span></a>
                
                </li>
                <li><a class="fa fa-sitemap" href="logout.jsp"><span>Log Out</span></a></li>
            </ul>
        </nav>

    </div>

</div>
 