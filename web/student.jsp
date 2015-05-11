<%-- 
    Document   : student
    Created on : Jul 8, 2014, 11:03:07 PM
    Author     : Saurabh Garg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="links.jsp"/>
<jsp:include page="header_stu.jsp"/>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Home Page</title>
        <jsp:include page="links.jsp"/>
    </head>
    <body>
        <%
            ServletContext c = getServletContext();
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(c.getInitParameter("url"), c.getInitParameter("user"), c.getInitParameter("pass"));
        %>
        <!-- Main Wrapper -->
        <div id="main-wrapper" >
            <!-- Main -->
            

            <div style=" padding:20px 50px;border-radius: 10px; float: left;   height:780px ;width:30%;margin-left: 3%;">
                <center>
                    <span >
                        <strong style="color: #088A68; ">Quick links</strong>
                    </span>
                </center><br>
                <form  action="download.jsp"><%
                Statement smt2 = con.createStatement();
                            ResultSet rs3 = null;
                            rs3 = smt2.executeQuery("select * from courses");%>
                        <select name="subject" style="width:100%; padding: 2px" >
                                    <%while (rs3.next()) {%>
                                    <option value="<%out.print(rs3.getString(2));%>"><%out.println(rs3.getString(2));%></option>
                                    <%}%>  
                        </select><br>
                                <input class="button" value="View Assignments" type="submit" style="padding:5px;">
                    </form>
                        <br>
                <center>
                    <span >
                       <!-- <strong style="color: #088A68">Calender</strong>-->
                    </span>
                    <br><br>

                    <center>
                        <script language="javascript" type="text/javascript">
                            var day_of_week = new Array('Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat');
                            var month_of_year = new Array('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');
                            var Calendar = new Date();

                            var year = Calendar.getFullYear();
                            var month = Calendar.getMonth();
                            var today = Calendar.getDate();
                            var weekday = Calendar.getDay();

                            var DAYS_OF_WEEK = 7;
                            var DAYS_OF_MONTH = 31;
                            var cal;

                            Calendar.setDate(1);
                            Calendar.setMonth(month);

                            var TR_start = '<TR>';
                            var TR_end = '</TR>';
                            var highlight_start = '<TD WIDTH="30"><TABLE CELLSPACING=0 BORDER=1 BGCOLOR=DEDEFF BORDERCOLOR=CCCCCC><TR><TD WIDTH=20><B><CENTER>';
                            var highlight_end = '</CENTER></TD></TR></TABLE></B>';
                            var TD_start = '<TD WIDTH="30"><CENTER>';
                            var TD_end = '</CENTER></TD>';

                            cal = '<TABLE BORDER=1 CELLSPACING=0 CELLPADDING=0 BORDERCOLOR=BBBBBB><TR><TD>';
                            cal += '<TABLE BORDER=0 CELLSPACING=0 CELLPADDING=2>' + TR_start;
                            cal += '<TD COLSPAN="' + DAYS_OF_WEEK + '" BGCOLOR="#EFEFEF"><CENTER><B>';
                            cal += month_of_year[month] + '   ' + year + '</B>' + TD_end + TR_end;
                            cal += TR_start;

                            for (index = 0; index < DAYS_OF_WEEK; index++)
                            {

                                if (weekday == index)
                                    cal += TD_start + '<B>' + day_of_week[index] + '</B>' + TD_end;
                                else
                                    cal += TD_start + day_of_week[index] + TD_end;
                            }

                            cal += TD_end + TR_end;
                            cal += TR_start;
                            for (index = 0; index < Calendar.getDay(); index++)
                                cal += TD_start + '  ' + TD_end;
                            for (index = 0; index < DAYS_OF_MONTH; index++)
                            {
                                if (Calendar.getDate() > index)
                                {
                                    week_day = Calendar.getDay();
                                    if (week_day == 0)
                                        cal += TR_start;

                                    if (week_day != DAYS_OF_WEEK)
                                    {
                                        var day = Calendar.getDate();
                                        if (today == Calendar.getDate())
                                            cal += highlight_start + day + highlight_end + TD_end;
                                        else
                                            cal += TD_start + day + TD_end;
                                    }
                                    if (week_day == DAYS_OF_WEEK)
                                        cal += TR_end;
                                }
                                Calendar.setDate(Calendar.getDate() + 1);
                            }

                            cal += '</TD></TR></TABLE></TABLE>';
                            document.write(cal);
                            //  End -->
                        </script>

                        </div>
                        <div style=" border-radius: 10px; float: left;  height:800px ;width:30%;margin-left: 20px">
                            <div style=" padding:20px;border-radius: 10px;    height:auto ;width:100%">
                                <center>
                                    <span >
                                        <strong style="color: #088A68">Announcement</strong>
                                    </span>
                                </center><br>
                                <%
                                    Statement smt = con.createStatement();
                                    ResultSet rs = null;

                                    rs = smt.executeQuery("select * from announcement  order by created desc limit 1,5");
                                    while (rs.next()) {
                                        out.println("<span class=\"date\">" + rs.getString(3) + "</span>&nbsp;&nbsp;&nbsp;&nbsp;" + rs.getString(2));
                                        out.println("<br><hr><br>");
                                    }

                                %>

                                <span style="text-align: right">    <a href="announce.jsp">    <input type="button" style="padding:5px;" class="button" value="Read More"></a></span>
                            </div><br><br>
                            <div style=" padding:20px;border-radius: 10px;    height:auto ;width:100%"></div>
                        </div>
                        <div style="padding:20px; border-radius: 10px; float: left;   height:780px ;width:30%;margin-left: 20px;">
                            <center>
                                <span >
                                    <strong style="color: #088A68">Discussions</strong>
                                </span>
                            </center><br>
                            <%  Statement smt1 = con.createStatement();
                                
                                ResultSet rs1 = null;
                                ResultSet rs2 = null;
                                rs1 = smt1.executeQuery("SELECT * FROM courses  where b_branch_id='CSE' limit 2 ;");
                                while (rs1.next()) {%> <span >
                                <strong style="color: #088A68"><%out.print(rs1.getString(2));%></strong>
                            </span><br><br><%
                                rs2 = smt2.executeQuery("select * from discussion where course_course_id='" + rs1.getString(1) + "'order by rand(),created desc limit 0,2;");
                                while (rs2.next()) {
                                    out.print("<div><span class=\"date\">" + rs2.getString(3) + "</span>&nbsp;&nbsp;&nbsp;&nbsp;<strong>" + rs2.getString(4) + "</strong>&nbsp;&nbsp;&nbsp;&nbsp; <h4 style=\"text-align:right\">Asked By: " + rs2.getString(2) + "</h4>" + "");
                                }%><span style="text-align: right">    <a href="newdiscussions?subject=<%out.print(rs1.getString(1));%>">    <input type="button" style="padding:5px;" class="button" value="Read More"></a></span><br><br><%
                        }%>    
                        </div>

                        </div>

                        </body>

                        </html>
