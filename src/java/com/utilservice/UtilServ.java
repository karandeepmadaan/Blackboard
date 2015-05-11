package com.utilservice;

import com.entity.Announcement;
import com.entity.Assignment;
import com.entity.Branch;
import com.entity.Courses;
import com.entity.Discussion;
import com.entity.Login;
import com.entity.Solutions;
import com.entity.Student;
import com.entity.Teacher;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.SessionFactory;

public class UtilServ {

    private static SessionFactory sessionFactory;

    static {
        try {
            AnnotationConfiguration c = new AnnotationConfiguration();
            c.addAnnotatedClass(Student.class);
            c.addAnnotatedClass(Teacher.class);
            c.addAnnotatedClass(Login.class);
            c.addAnnotatedClass(Solutions.class);
            c.addAnnotatedClass(Courses.class);
            c.addAnnotatedClass(Branch.class);
            c.addAnnotatedClass(Discussion.class);
            c.addAnnotatedClass(Assignment.class);
            c.addAnnotatedClass(Announcement.class);

            c.configure();
            sessionFactory = c.buildSessionFactory();
            // Create the SessionFactory from standard (hibernate.cfg.xml) 
            // config file.
            //sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        } catch (HibernateException ex) {
            // Log the exception. 
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public static Session getSession() {
        return sessionFactory.openSession();
    }
}
