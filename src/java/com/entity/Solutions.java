/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

/**
 *
 * @author Saurabh Garg
 */
@Entity
public class Solutions {
    @Id 
    @GeneratedValue
    private int sno;
    private String solution;
    private String solved_by;
    @ManyToOne(cascade = CascadeType.ALL)
    private Discussion d;

    public int getSno() {
        return sno;
    }

    public String getSolved_by() {
        return solved_by;
    }

    public void setSolved_by(String solved_by) {
        this.solved_by = solved_by;
    }

    public void setSno(int sno) {
        this.sno = sno;
    }

    public String getSolution() {
        return solution;
    }

    public void setSolution(String solution) {
        this.solution = solution;
    }

    public Discussion getD() {
        return d;
    }

    public void setD(Discussion d) {
        this.d = d;
    }
    
    
}
