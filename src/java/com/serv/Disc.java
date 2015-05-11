/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.serv;

import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author Saurabh Garg
 */

public class Disc extends ActionSupport {
private String subject;

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    @Override
    public String execute()
            throws Exception {

            
       return "Success";
    }


}
