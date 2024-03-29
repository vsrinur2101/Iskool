package com.sportsit.iskool.dao.model;
// Generated Aug 24, 2019 6:56:06 PM by Hibernate Tools 3.2.2.GA


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * CourseStudentMapping generated by hbm2java
 */
@Entity
@Table(name="course_student_mapping"
    ,catalog="iskool"
)
public class CourseStudentMapping  implements java.io.Serializable {


     private int id;
     private Course course;
     private Student student;

    public CourseStudentMapping() {
    }

    public CourseStudentMapping(int id, Course course, Student student) {
       this.id = id;
       this.course = course;
       this.student = student;
    }
   
     @Id 
    
    @Column(name="id", unique=true, nullable=false)
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="course_id", nullable=false)
    public Course getCourse() {
        return this.course;
    }
    
    public void setCourse(Course course) {
        this.course = course;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="student_id", nullable=false)
    public Student getStudent() {
        return this.student;
    }
    
    public void setStudent(Student student) {
        this.student = student;
    }




}


