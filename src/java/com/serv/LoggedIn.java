package com.serv;

import com.opensymphony.xwork2.ActionSupport;
import java.io.IOException;
import java.sql.*;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import org.apache.struts2.ServletActionContext;
import static org.apache.struts2.ServletActionContext.getServletContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

public class LoggedIn extends ActionSupport implements SessionAware {

    public String username;
    public String password;
    SessionMap<String, Object> sessionmap;

    @Override
    public void setSession(Map map) {
        sessionmap = (SessionMap) map;
        sessionmap.put("username", username);
    }

    public SessionMap<String, Object> getSessionmap() {
        return sessionmap;
    }

    public void setSessionmap(SessionMap<String, Object> sessionmap) {
        this.sessionmap = sessionmap;
    }

    public String logout() {
        sessionmap.invalidate();
        return "success";
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String execute()
            throws ServletException, IOException, ClassNotFoundException, SQLException {

        ServletContext context = getServletContext();
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(context.getInitParameter("url"), context.getInitParameter("user"), context.getInitParameter("pass"));
        Statement smt = con.createStatement();
        ResultSet rs = null;
        HttpServletRequest request=ServletActionContext.getRequest();  
            HttpSession session=request.getSession();
        
        rs = smt.executeQuery("select * from login e where e.username = '" + username + "' and e.pass = '" + password + "'");
        if (rs.next()) {
            sessionmap.put("username", username);
            session.setAttribute("username", username);
            
            String type = rs.getString(3);
            session.setAttribute("type",type);
            if (type.equalsIgnoreCase("admin")) {
                return "admin";
            } else if (type.equalsIgnoreCase("teacher")) {
                return "teacher";
            } else {
                return "student";
            }

        } else {
            return "Fail";
        }

    }

}
