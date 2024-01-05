/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.exam_seating_arrangement.Dao;

import com.mycompany.exam_seating_arrangement.entities.Student;
import com.mycompany.exam_seating_arrangement.helper.FactoryProvider;
import java.util.List;
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
    
    public List<Student> getAllStudentByBranch(String branch){
        List<Student> list = null;
        try {
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            Query query;
            query = session.createQuery("from Student where Branch=:b and Type=:t");
            query.setParameter("b", branch);
            query.setParameter("t", "student");
            list=query.list();
            tx.commit();
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Student> getAllStudents(){
        List<Student> list = null;
        try {
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            Query query;
            query = session.createQuery("from Student where Type=:t");
            query.setParameter("t", "student");
            list=query.list();
            tx.commit();
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<String> getAllBranch(){
        List<String> list = null;
        try {
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            Query query;
            query = session.createQuery("Select Distinct Branch from Student where Type=:t");
            query.setParameter("t", "student");
            list=query.list();
            tx.commit();
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
     public int assignStudentsRoomNumber(int quantity, int roomNo, String branch) {
    int t = 0;
    try {
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();

        Query minQuery = session.createQuery("Select MIN(CAST(S.RollNumber AS int)) from Student S where S.classRoom is null AND S.Branch = :b");
        minQuery.setParameter("b", branch);
        Integer minRollNumber = (Integer) minQuery.uniqueResult();
        

        if (minRollNumber != null) {
            int startingRollNumber = minRollNumber;
            t++;
            for (int i = 0; i < quantity; i++) {
                Query updateQuery = session.createQuery("Update Student S set S.classRoom.ClassroomNumber = :r where S.RollNumber = :m AND S.Branch = :b");
                updateQuery.setParameter("r", roomNo);
                updateQuery.setParameter("m", String.valueOf(startingRollNumber));
                updateQuery.setParameter("b", branch);
                int updated = updateQuery.executeUpdate();

                if (updated > 0) {
                    startingRollNumber++;
                    t++;
                }else{
                    return -1;
                }
            }
        }

        tx.commit();
        session.close();
    } catch (Exception e) {
        e.printStackTrace();
        t = 0;
    }
    return t;
}
     
     public List<Student> getAllStudentByBranchWhereRoomIsNotAlloted(String branch){
        List<Student> list = null;
        try {
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            Query query;
            query = session.createQuery("from Student S where S.Branch=:b and S.Type=:t and S.classRoom.ClassroomNumber is null");
            query.setParameter("b", branch);
            query.setParameter("t", "student");
            list=query.list();
            tx.commit();
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Student getStudentByBranchAndRoll(String Branch,String Roll){
        Student studen=null;
        try {
            String query;
            query = "FROM Student WHERE Branch = :n and RollNumber = :r";
            Session session=FactoryProvider.getFactory().openSession();
            Transaction tx=session.beginTransaction();
            Query q=session.createQuery(query);
            q.setParameter("n", Branch);
            q.setParameter("r", Roll);
            studen=(Student)q.uniqueResult();
            
            tx.commit();
            session.close();
        } catch (Exception e) {
        }
        return studen;
    }
    public List<Student> getAllStudentByBranchAndRoomNumber(String branch,int RoomNo){
        List<Student> list = null;
        try {
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            Query query;
            query = session.createQuery("from Student S where S.Branch=:b and S.classRoom.ClassroomNumber=:t");
            query.setParameter("b", branch);
            query.setParameter("t", RoomNo);
            list=query.list();
            tx.commit();
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
