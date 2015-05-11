
package com.entity;

import java.sql.Date;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Announcement {
    @Id
    @GeneratedValue
    private int sno;
    private String announce;
    private Date created;
    @ManyToOne   (cascade = CascadeType.ALL) 
    private Branch b;

    public int getSno() {
        return sno;
    }

    public void setSno(int sno) {
        this.sno = sno;
    }

    public String getAnnounce() {
        return announce;
    }

    public void setAnnounce(String announce) {
        this.announce = announce;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Branch getB() {
        return b;
    }

    public void setB(Branch b) {
        this.b = b;
    }
    
}
