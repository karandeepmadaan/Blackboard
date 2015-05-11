/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.serv;

import com.opensymphony.xwork2.ActionSupport;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import static org.apache.struts2.ServletActionContext.getServletContext;

/**
 *
 * @author PC
 */
public class changepass extends ActionSupport {
    String oldpass;
    String newpass;
    String new1pass;
    String user123;

    public String getUser123() {
        return user123;
    }

    public void setUser123(String user123) {
        this.user123 = user123;
    }
    

    public String getOldpass() {
        return oldpass;
    }

    public void setOldpass(String oldpass) {
        this.oldpass = oldpass;
    }

    public String getNewpass() {
        return newpass;
    }

    public void setNewpass(String newpass) {
        this.newpass = newpass;
    }

    public String getNew1pass() {
        return new1pass;
    }

    public void setNew1pass(String new1pass) {
        this.new1pass = new1pass;
    }
    
    @Override
   public String  execute()
            throws ServletException, IOException, ClassNotFoundException, SQLException {
       ServletContext context = getServletContext();
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(context.getInitParameter("url"), context.getInitParameter("user"), context.getInitParameter("pass"));
            Statement smt = con.createStatement();
ResultSet rs= null ;
rs=smt.executeQuery("select * from login where pass='"+oldpass+"' and username='"+user123+"';");
while(rs.next())
{
    if(newpass.equals(new1pass))
    {
        PreparedStatement p = con.prepareStatement("update login set pass=?  where username=?");
            p.setString(1, newpass);
            p.setString(2, rs.getString(1));
            
            p.execute();
    }
}

        return "Success";
    
}
}
