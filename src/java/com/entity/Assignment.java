
package com.entity;

import java.sql.Date;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Assignment {
    @Id
    @GeneratedValue
    private int sno;
//    @Lob
//    private Blob assign;
    private String solution;
    private String asked_by;
    private Date created;
    @ManyToOne(cascade = CascadeType.ALL)
    private Courses course;

    public int getSno() {
        return sno;
    }

    public void setSno(int sno) {
        this.sno = sno;
    }

//    public Blob getAssign() {
//        return assign;
//    }
//
//    public void setAssign(Blob assign) {
//        this.assign = assign;
//    }

    public String getSolution() {
        return solution;
    }

    public void setSolution(String solution) {
        this.solution = solution;
    }

    public String getAsked_by() {
        return asked_by;
    }

    public void setAsked_by(String asked_by) {
        this.asked_by = asked_by;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Courses getCourse() {
        return course;
    }

    public void setCourse(Courses course) {
        this.course = course;
    }
    
    
}
