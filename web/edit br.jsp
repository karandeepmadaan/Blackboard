<%-- 
    Document   : edit br
    Created on : Jul 27, 2014, 5:31:53 PM
    Author     : Saurabh Garg
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header_admin.jsp"/>
<jsp:include page="links.jsp"/>

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
                  
                    <form action="Editbr">
                        Branch Id : <input type="text" name="id"  >
                        Branch Name:<input type="text" name="name"  >
                        Branch Info:<input type="text" name="info"  >
                       
                        <input type="submit" value="Save">
                    </form>
                        
                </div>
            </div>
        </div>
    </body>
</html>
