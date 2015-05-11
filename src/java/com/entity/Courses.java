package com.entity;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Courses implements Serializable {

    @Id
    private String course_id;   
    private String info;
    private String course_name;

   // @Lob
    // private Blob info;
    
    @ManyToOne(cascade = CascadeType.ALL)
    
    private Branch b;

    public String getCourse_id() {
        return course_id;
    }

    public void setCourse_id(String course_id) {
        this.course_id = course_id;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }
//
//    public Blob getContent() {
//        return content;
//    }
//
//    public void setContent(Blob content) {
//        this.content = content;
//    }

    public Branch getB() {
        return b;
    }

    public void setB(Branch b) {
        this.b = b;
    }

}
