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
public class deleteq extends ActionSupport{
    private String idq;
    private String ida;

    public String getIdq() {
        return idq;
    }

    public void setIdq(String idq) {
        this.idq = idq;
    }

    public String getIda() {
        return ida;
    }

    public void setIda(String ida) {
        this.ida = ida;
    }
    
    @Override
    public String execute()
            throws Exception {
         ServletContext context = getServletContext();
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(context.getInitParameter("url"), context.getInitParameter("user"), context.getInitParameter("pass"));
           //delete from discussion where query_id=5;            
            PreparedStatement p = con.prepareStatement("delete from discussion where query_id=?");
            p.setString(1, idq); 
            PreparedStatement p1 = con.prepareStatement("delete from solutions where d_query_id=? and sno=?");
            p1.setString(1, idq); 
            p1.setString(2, ida); 
            p.execute();
            p1.execute();
            con.close();
            
       return "Success";
    }
    
}
