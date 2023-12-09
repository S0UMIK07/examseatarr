/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.exam_seating_arrangement.Dao;

import com.mycompany.exam_seating_arrangement.entities.Student;
import com.mycompany.exam_seating_arrangement.helper.FactoryProvider;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author 91731
 */
public class StudentDao {
    private SessionFactory factory;

    public StudentDao(SessionFactory factory) {
        this.factory = factory;
    }
    public int StudentNewRegister(Student student){
        int StudentId=0;
        try {
            Session session=FactoryProvider.getFactory().openSession();
            Transaction tx=session.beginTransaction();
            StudentId=(int)session.save(student);
            tx.commit();
            session.close();
        } catch (Exception e) {
        }
        return StudentId;
    }
    public Student loginStudent(String nam,String Roll){
        Student studen=null;
        try {
            String query;
            query = "FROM Student WHERE StudentName = :n and RollNumber = :r";
            Session session=FactoryProvider.getFactory().openSession();
            Transaction tx=session.beginTransaction();
            Query q=session.createQuery(query);
            q.setParameter("n", nam);
            q.setParameter("r", Roll);
            studen=(Student)q.uniqueResult();
            
            tx.commit();
            session.close();
        } catch (Exception e) {
        }
        return studen;
    }
    
}
