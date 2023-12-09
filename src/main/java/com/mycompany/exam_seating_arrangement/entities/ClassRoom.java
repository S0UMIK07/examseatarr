/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.exam_seating_arrangement.entities;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

/**
 *
 * @author 91731
 */
@Entity
public class ClassRoom {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int ClassroomNumber;
    private int NumberOfRows;
    private int NumberofColumns;
    private String ExamDuration;
    private String ExamDate;
    private String ExamTime;
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "classRoom", targetEntity = Student.class)
    private List<Student> students = new ArrayList<>();

    private String AssignedInvigilators;

    public ClassRoom() {
    }

    public ClassRoom(int ClassroomNumber, int NumberofRows, int NumberofColumns, String ExamDuration, String ExamDate, String ExamTime, String AssignedInvigilators, List<Student>students) {
        this.ClassroomNumber = ClassroomNumber;
        this.NumberOfRows = NumberofRows;
        this.NumberofColumns = NumberofColumns;
        this.ExamDuration = ExamDuration;
        this.ExamDate = ExamDate;
        this.ExamTime = ExamTime;
        this.AssignedInvigilators = AssignedInvigilators;
        this.students=students;
    }
    public ClassRoom(int NumberofRows, int NumberofColumns, String ExamDuration, String ExamDate, String ExamTime, String AssignedInvigilators, List<Student>students) {
        this.NumberOfRows = NumberofRows;
        this.NumberofColumns = NumberofColumns;
        this.ExamDuration = ExamDuration;
        this.ExamDate = ExamDate;
        this.ExamTime = ExamTime;
        this.AssignedInvigilators = AssignedInvigilators;
        this.students=students;
    }

    public int getClassroomNumber() {
        return ClassroomNumber;
    }

    public void setClassroomNumber(int ClassroomNumber) {
        this.ClassroomNumber = ClassroomNumber;
    }

    public int getNumberOfRows() {
        return NumberOfRows;
    }

    public void setNumberOfRows(int NumberOfRows) {
        this.NumberOfRows = NumberOfRows;
    }

    public int getNumberofColumns() {
        return NumberofColumns;
    }

    public void setNumberofColumns(int NumberofColumns) {
        this.NumberofColumns = NumberofColumns;
    }

    public String getExamDuration() {
        return ExamDuration;
    }

    public void setExamDuration(String ExamDuration) {
        this.ExamDuration = ExamDuration;
    }

    public String getExamDate() {
        return ExamDate;
    }

    public void setExamDate(String ExamDate) {
        this.ExamDate = ExamDate;
    }

    public String getExamTime() {
        return ExamTime;
    }

    public void setExamTime(String ExamTime) {
        this.ExamTime = ExamTime;
    }

    public List<Student> getStudents() {
        return students;
    }

    public void setStudents(List<Student> students) {
        this.students = students;
    }

    public String getAssignedInvigilators() {
        return AssignedInvigilators;
    }

    public void setAssignedInvigilators(String AssignedInvigilators) {
        this.AssignedInvigilators = AssignedInvigilators;
    }

    @Override
    public String toString() {
        return "ClassRoom{" + "ClassroomNumber=" + ClassroomNumber + ", NumberOfRows=" + NumberOfRows + ", NumberofColumns=" + NumberofColumns + ", ExamDuration=" + ExamDuration + ", ExamDate=" + ExamDate + ", ExamTime=" + ExamTime + ", students=" + students + ", AssignedInvigilators=" + AssignedInvigilators + '}';
    }

    
}
