<%-- 
    Document   : logout
    Created on : Jul 6, 2014, 10:02:01 PM
    Author     : Saurabh Garg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
session = request.getSession(false);
            if (session != null) {
                session.invalidate();
                session = null;
                response.sendRedirect("index.html");
            }
            %>