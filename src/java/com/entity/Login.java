package com.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity
@NamedQueries({
 @NamedQuery(name="Emp.findAll",query="FROM Login"),
 @NamedQuery(name="Emp.findById",query="FROM Login e where e.username= :id"),
 @NamedQuery(name="Emp.findByName",query="FROM Login e where e.pass= :pass")
})

public class Login {

    @Id
    private String username;
    private String pass;    
    private String type;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    
}
    