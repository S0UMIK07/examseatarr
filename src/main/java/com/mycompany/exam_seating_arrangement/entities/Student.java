/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.exam_seating_arrangement.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 *
 * @author 91731
 */
@Entity
public class Student {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int StudentId;
    private String StudentName;
    private String Gender;
    private String DOB;
    private String RollNumber;
    private String RegistrationNumber;
    private String FatherName;
    private String ContactNumber;
    private String Address;
    private String Branch;
    private String Type;
    
    @ManyToOne
    @JoinColumn (name = "ClassroomNumber")
    private ClassRoom classRoom;
    public Student() {
    }

    public Student(int StudentId, String StudentName, String Gender, String DOB, String RollNumber, String RegistrationNumber, String FatherName, String ContactNumber, String Address, String Branch, String Type, ClassRoom classRoom) {
        this.StudentId = StudentId;
        this.StudentName = StudentName;
        this.Gender = Gender;
        this.DOB = DOB;
        this.RollNumber = RollNumber;
        this.RegistrationNumber = RegistrationNumber;
        this.FatherName = FatherName;
        this.ContactNumber = ContactNumber;
        this.Address = Address;
        this.Branch = Branch;
        this.Type = Type;
        this.classRoom = classRoom;
    }

    public Student(String StudentName, String Gender, String DOB, String RollNumber, String RegistrationNumber, String FatherName, String ContactNumber, String Address, String Branch, String Type, ClassRoom classRoom) {
        this.StudentName = StudentName;
        this.Gender = Gender;
        this.DOB = DOB;
        this.RollNumber = RollNumber;
        this.RegistrationNumber = RegistrationNumber;
        this.FatherName = FatherName;
        this.ContactNumber = ContactNumber;
        this.Address = Address;
        this.Branch = Branch;
        this.Type = Type;
        this.classRoom = classRoom;
    }

    public int getStudentId() {
        return StudentId;
    }

    public void setStudentId(int StudentId) {
        this.StudentId = StudentId;
    }

    public String getStudentName() {
        return StudentName;
    }

    public void setStudentName(String StudentName) {
        this.StudentName = StudentName;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

    public String getDOB() {
        return DOB;
    }

    public void setDOB(String DOB) {
        this.DOB = DOB;
    }

    public String getRollNumber() {
        return RollNumber;
    }

    public void setRollNumber(String RollNumber) {
        this.RollNumber = RollNumber;
    }

    public String getRegistrationNumber() {
        return RegistrationNumber;
    }

    public void setRegistrationNumber(String RegistrationNumber) {
        this.RegistrationNumber = RegistrationNumber;
    }

    public String getFatherName() {
        return FatherName;
    }

    public void setFatherName(String FatherName) {
        this.FatherName = FatherName;
    }

    public String getContactNumber() {
        return ContactNumber;
    }

    public void setContactNumber(String ContactNumber) {
        this.ContactNumber = ContactNumber;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getBranch() {
        return Branch;
    }

    public void setBranch(String Branch) {
        this.Branch = Branch;
    }

    public String getType() {
        return Type;
    }

    public void setType(String Type) {
        this.Type = Type;
    }

    public ClassRoom getClassRoom() {
        return classRoom;
    }

    public void setClassRoom(ClassRoom classRoom) {
        this.classRoom = classRoom;
    }

    @Override
    public String toString() {
        return "Student{" + "StudentId=" + StudentId + ", StudentName=" + StudentName + ", Gender=" + Gender + ", DOB=" + DOB + ", RollNumber=" + RollNumber + ", RegistrationNumber=" + RegistrationNumber + ", FatherName=" + FatherName + ", ContactNumber=" + ContactNumber + ", Address=" + Address + ", Branch=" + Branch + ", Type=" + Type + ", classRoom=" + classRoom + '}';
    }

    
}
