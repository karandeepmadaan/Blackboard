/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.serv;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletContext;
import static org.apache.struts2.ServletActionContext.getServletContext;

/**
 *
 * @author Saurabh Garg
 */

public class Editcrs extends ActionSupport {
private String id;
private String info;
private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

   

    @Override
    public String execute()
            throws Exception {

            ServletContext context = getServletContext();
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(context.getInitParameter("url"), context.getInitParameter("user"), context.getInitParameter("pass")); 
            
            PreparedStatement p = con.prepareStatement("update courses set info=? , course_name=? where course_id=?");
            p.setString(1, info);
            p.setString(2, name);
            p.setString(3, id);
            p.execute();
            con.close();
            
       return "Success";
    }


}
