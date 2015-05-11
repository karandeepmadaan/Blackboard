package com.serv;

import com.entity.Branch;
import com.entity.Login;
import com.entity.Student;
import com.entity.Teacher;
import com.opensymphony.xwork2.ActionSupport;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class SignedUp extends ActionSupport implements SessionAware {

    static Statement s;
    private String name;
    private String username;
    private String password;
    private String phone;
    private String gender;
    private String email;
    private String address;
    private String branch;
    private String type;
SessionMap<String,Object> sessionmap;

    @Override
 public void setSession(Map map) {  
    sessionmap=(SessionMap)map;  
    sessionmap.put("username",username);  
}  

    public SessionMap<String, Object> getSessionmap() {
        return sessionmap;
    }
    public void setSessionmap(SessionMap<String, Object> sessionmap) {
        this.sessionmap = sessionmap;
    }
  
   

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    
    /**
     *
     * @return
     * @throws ServletException
     * @throws IOException
     * @throws ClassNotFoundException
     * @throws SQLException
     * @throws InvocationTargetException
     */
    @Override
    public String execute()
            throws ServletException, IOException, ClassNotFoundException, SQLException,InvocationTargetException {
            Session z = com.utilservice.UtilServ.getSession();
            Transaction tr = z.beginTransaction();
            HttpServletRequest request=ServletActionContext.getRequest();  
            HttpSession session=request.getSession();
             session.setAttribute("type",type);
            Login a = new Login();
            Student b = new Student();
            Teacher t = new Teacher();
            Branch br = new Branch();
            br.setBranch_id(branch);
            if (type.equals("student")) {
                b.setBranches(br);
                b.setAddress(address);
                b.setBranch(branch);
                b.setEmail(email);
                b.setGender(gender);
                b.setName(name);
                b.setPhone(phone);
                a.setPass(password);
                a.setType(type);
                a.setUsername(username);
                b.setL(a);
                sessionmap.put("username", username);
                 session.setAttribute("type",type);
                z.save(b);
                z.save(a);
            } else {
                t.setBranches(br);
                t.setAddress(address);
                t.setBranch(branch);
                t.setEmail(email);
                t.setGender(gender);
                t.setName(name);
                t.setPhone(phone);
                a.setPass(password);
                a.setType(type);
                a.setUsername(username);
                sessionmap.put("username", username);
                t.setL(a);
                z.save(t);
                z.save(a);
            }
            tr.commit();

   
        if(type.equalsIgnoreCase("student"))
            return "student";
        else return "teacher";
    
    
   
    }
}
