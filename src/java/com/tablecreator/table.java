package com.tablecreator;

import com.entity.Announcement;
import com.entity.Assignment;
import com.entity.Branch;
import com.entity.Courses;
import com.entity.Discussion;
import com.entity.Login;
import com.entity.Solutions;
import com.entity.Student;
import com.entity.Teacher;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

public class table {

    public static void main(String[] args) {
        AnnotationConfiguration c = new AnnotationConfiguration();
        c.addAnnotatedClass(Solutions.class);
        c.addAnnotatedClass(Student.class);
            c.addAnnotatedClass(Teacher.class);
        c.addAnnotatedClass(Courses.class);
        c.addAnnotatedClass(Login.class);
        c.addAnnotatedClass(Branch.class);
        c.addAnnotatedClass(Discussion.class);
        c.addAnnotatedClass(Assignment.class);
        c.addAnnotatedClass(Announcement.class);
        c.configure();
        SchemaExport s = new SchemaExport(c);
        s.create(true, true);
    }
}
