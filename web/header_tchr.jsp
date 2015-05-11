<% 
          String name=(String)session.getAttribute("username");
           if(session==null || name=="" || name==null)
                {
                response.sendRedirect("index.html");
                }
              else{
            %>
            <div style="text-align: right" > <font color="black" size="4" > Welcome <%=name%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></div>
            <%} %><div id="header-wrapper">

    <!-- Header -->
    <div id="header" class="container">
        <!-- Nav -->
        <nav id="nav">
            <ul>
                <li><a class="fa fa-home" href="teacher.jsp"><span>Home</span></a></li>
                <li>
                    <a href="" class="fa fa-bar-chart-o"><span>Courses</span></a>
                    <ul>
                        <li><a href="view_crs_2.jsp">View Courses</a></li>
                        
                        <li>
                            <a href="">Assignments</a>
                            <ul>
                                <li><a href="Add_assign.jsp">Add Assignments</a></li>
                                <li><a href="#">Add Solutions</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li><a class="fa fa-cog" href=""><span>Utilities</span></a>
                    <ul>
                        <li><a href="announce_1.jsp">Announcements</a></li>
                        <li><a href="#">Calendar</a></li>
                    </ul>
                </li>
                <li><a class="fa fa-retweet" href="show_disc_t.jsp"><span>Discussions</span></a>
               
                </li>
                <li><a class="fa fa-sitemap" href=""><span>Profile</span></a>
                <ul>
                        <li><a href="profile_edit_1.jsp">Edit Profile</a></li>
                        <li><a href="logout.jsp">Log Out</a></li>
                    </ul></li>
            </ul>
        </nav>

    </div>

</div>