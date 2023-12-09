/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.exam_seating_arrangement.Dao;
import com.mycompany.exam_seating_arrangement.entities.ClassRoom;
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
public class ClassRoomDao {
    private SessionFactory factory;

    public ClassRoomDao(SessionFactory factory) {
        this.factory = factory;
    }

    
    public int NewClassRoomRegister(ClassRoom classRoom){
        int ClassRoomId=0;
        try {
            Session session=FactoryProvider.getFactory().openSession();
            Transaction tx=session.beginTransaction();
            ClassRoomId=(int)session.save(classRoom);
            tx.commit();
            session.close();
        } catch (Exception e) {
        }
        return ClassRoomId;
    }
    public List<ClassRoom> getAllClassRoom(){
        List<ClassRoom> list = null;
        try {
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            Query query;
            query = session.createQuery("from ClassRoom");
            list=query.list();
            tx.commit();
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public ClassRoom getClassRoomByRoomNumber(int id){
        if(id==0){
            return null;
        }
        ClassRoom cls=null;
        try {
            Session sessi=this.factory.openSession();
            cls=sessi.get(ClassRoom.class, id);
            sessi.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cls;
    }
}
