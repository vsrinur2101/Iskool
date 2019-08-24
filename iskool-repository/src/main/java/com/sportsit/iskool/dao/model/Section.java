package com.sportsit.iskool.dao.model;
// Generated Aug 24, 2019 6:56:06 PM by Hibernate Tools 3.2.2.GA


import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * Section generated by hbm2java
 */
@Entity
@Table(name="section"
    ,catalog="iskool"
    , uniqueConstraints = @UniqueConstraint(columnNames="name") 
)
public class Section  implements java.io.Serializable {


     private int id;
     private Employee employee;
     private Course course;
     private Student student;
     private String name;
     private String description;
     private Set sectionAcademicyearMappings = new HashSet(0);

    public Section() {
    }

	
    public Section(int id, Employee employee, Course course, Student student, String name) {
        this.id = id;
        this.employee = employee;
        this.course = course;
        this.student = student;
        this.name = name;
    }
    public Section(int id, Employee employee, Course course, Student student, String name, String description, Set sectionAcademicyearMappings) {
       this.id = id;
       this.employee = employee;
       this.course = course;
       this.student = student;
       this.name = name;
       this.description = description;
       this.sectionAcademicyearMappings = sectionAcademicyearMappings;
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
    @JoinColumn(name="class_teacher_id", nullable=false)
    public Employee getEmployee() {
        return this.employee;
    }
    
    public void setEmployee(Employee employee) {
        this.employee = employee;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="Course_id", nullable=false)
    public Course getCourse() {
        return this.course;
    }
    
    public void setCourse(Course course) {
        this.course = course;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="Student_id", nullable=false)
    public Student getStudent() {
        return this.student;
    }
    
    public void setStudent(Student student) {
        this.student = student;
    }
    
    @Column(name="name", unique=true, nullable=false, length=45)
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    @Column(name="description", length=45)
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="section")
    public Set getSectionAcademicyearMappings() {
        return this.sectionAcademicyearMappings;
    }
    
    public void setSectionAcademicyearMappings(Set sectionAcademicyearMappings) {
        this.sectionAcademicyearMappings = sectionAcademicyearMappings;
    }




}


