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
 * StudentParentMapping generated by hbm2java
 */
@Entity
@Table(name="student_parent_mapping"
    ,catalog="iskool"
)
public class StudentParentMapping  implements java.io.Serializable {


     private int id;
     private Student student;
     private Parent parent;

    public StudentParentMapping() {
    }

    public StudentParentMapping(int id, Student student, Parent parent) {
       this.id = id;
       this.student = student;
       this.parent = parent;
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
    @JoinColumn(name="student_id", nullable=false)
    public Student getStudent() {
        return this.student;
    }
    
    public void setStudent(Student student) {
        this.student = student;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="parent_id", nullable=false)
    public Parent getParent() {
        return this.parent;
    }
    
    public void setParent(Parent parent) {
        this.parent = parent;
    }




}


