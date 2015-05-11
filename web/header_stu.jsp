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
                <li><a class="fa fa-home" href="student.jsp"><span>Home</span></a></li>
                <li>
                    <a href="" class="fa fa-bar-chart-o"><span>Courses</span></a>
                    <ul>
                        <li><a href="view_crs_1.jsp">View Courses</a></li>
                        
                        <li>
                            <a href="">Assignments</a>
                            <ul>
                                <li><a href="subdnld.jsp">View Assignments</a></li>
                                <li><a href="#">View Solutions</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li><a class="fa fa-cog" href=""><span>Utilities</span></a>
                    <ul>
                        <li><a href="announce.jsp">Announcements</a></li>
                        <li><a href="#">Calendar</a></li>
                    </ul>
                </li>
                <li><a class="fa fa-retweet" href="show_disc_s.jsp"><span>Discussions</span></a>
                
                </li>
                <li><a class="fa fa-sitemap" href=""><span>Profile</span></a>
                <ul>
                        <li><a href="profile_edit.jsp">Edit Profile</a></li>
                        <li><a href="logout.jsp">Log Out</a></li>
                    </ul></li>
            </ul>
        </nav>

    </div>

</div>