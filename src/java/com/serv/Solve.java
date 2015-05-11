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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import static org.apache.struts2.ServletActionContext.getServletContext;

/**
 *
 * @author Karan
 */

public class Solve extends ActionSupport {
private String id;
private String solution;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSolution() {
        return solution;
    }

    public void setSolution(String solution) {
        this.solution = solution;
    }

    @Override
    public String execute()
            throws Exception {
        
        HttpServletRequest request ;
            ServletContext context = getServletContext();
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(context.getInitParameter("url"), context.getInitParameter("user"), context.getInitParameter("pass"));
            request=ServletActionContext.getRequest();  
            HttpSession session=request.getSession();  
        
            String s=(String)session.getAttribute("username"); 
            
            PreparedStatement p = con.prepareStatement("insert into solutions (solution,d_query_id,solved_by) values (?,?,?)");
            p.setString(1, solution);
            p.setString(2, id);
            p.setString(3, s);
            p.execute();
            con.close();
            
       return "Success";
    }


}
