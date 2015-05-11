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
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import static org.apache.struts2.ServletActionContext.getServletContext;

/**
 *
 * @author Saurabh Garg
 */

public class Announce extends ActionSupport {

    private String branch;
    
    private String announce;
    private String d;


    public String getD() {
        return d;
    }

    public void setD(String d) {
        this.d = d;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getAnnounce() {
        return announce;
    }

    public void setAnnounce(String announce) {
        this.announce = announce;
    }

  
    
    @Override
   public String  execute()
            throws ServletException, IOException, ClassNotFoundException, SQLException {
            ServletContext context = getServletContext();
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(context.getInitParameter("url"), context.getInitParameter("user"), context.getInitParameter("pass"));

            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
            d= dateFormat.format(date);
            PreparedStatement p = con.prepareStatement("insert into announcement (announce,created,b_branch_id) values(?,?,?)");
            p.setString(1,announce);
            p.setString(2,d );
            p.setString(3, branch);

            p.execute();
            con.close();            

            return "Success";
        
    }

    


}
