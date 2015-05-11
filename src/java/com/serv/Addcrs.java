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

public class Addcrs extends ActionSupport {
private String id;
private String crsinfo;
private String crsname;
private String branch;

    public String getCrsinfo() {
        return crsinfo;
    }

    public void setCrsinfo(String crsinfo) {
        this.crsinfo = crsinfo;
    }

    public String getCrsname() {
        return crsname;
    }

    public void setCrsname(String crsname) {
        this.crsname = crsname;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    
   

    @Override
    public String execute()
            throws Exception {

            ServletContext context = getServletContext();
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(context.getInitParameter("url"), context.getInitParameter("user"), context.getInitParameter("pass")); 
            
            PreparedStatement p = con.prepareStatement("insert into courses values (?,?,?,?)");
            p.setString(1, id);
            p.setString(2, crsname);
            p.setString(3, crsinfo);
            p.setString(4, branch);
            p.execute();
            con.close();
            
       return "Success";
    }


}
