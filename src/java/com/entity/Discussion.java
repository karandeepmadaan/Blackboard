package com.entity;

import java.sql.Date;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Discussion {

    @Id
    @GeneratedValue
    private int query_id;
    private String query;

    private String asked_by;

    private Date created;
    @ManyToOne(cascade = CascadeType.ALL)
    private Courses course;

    public int getQuery_id() {
        return query_id;
    }

    public void setQuery_id(int query_id) {
        this.query_id = query_id;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public String getQuery() {
        return query;
    }

    public void setQuery(String query) {
        this.query = query;
    }

    public String getAsked_by() {
        return asked_by;
    }

    public void setAsked_by(String asked_by) {
        this.asked_by = asked_by;
    }

    public Courses getCourse() {
        return course;
    }

    public void setCourse(Courses course) {
        this.course = course;
    }

}
