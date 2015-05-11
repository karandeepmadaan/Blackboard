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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import static org.apache.struts2.ServletActionContext.getServletContext;

/**
 *
 * @author Saurabh Garg
 */

public class Doubt extends ActionSupport {

    private String doubt;
    
    private String subject;
    private String d;

    public String getDoubt() {
        return doubt;
    }

    public void setDoubt(String doubt) {
        this.doubt = doubt;
    }

    public String getD() {
        return d;
    }

    public void setD(String d) {
        this.d = d;
    }

   

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }
    
    
    @Override
   public String  execute()
            throws ServletException, IOException, ClassNotFoundException, SQLException {
            ServletContext context = getServletContext();
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(context.getInitParameter("url"), context.getInitParameter("user"), context.getInitParameter("pass"));
            HttpServletRequest request=ServletActionContext.getRequest();  
            HttpSession session=request.getSession();  
        
            String s=(String)session.getAttribute("username");  
            subject = subject.toUpperCase();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
            d= dateFormat.format(date);
            PreparedStatement p = con.prepareStatement("insert into discussion (asked_by,created,query,course_course_id) values(?,?,?,?)");
            p.setString(1,s);
            p.setString(2,d );
            p.setString(3, doubt);
            p.setString(4, subject);
            p.execute();
            con.close();            

            return "Success";
        
    }

    


}
