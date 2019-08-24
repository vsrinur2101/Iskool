package com.sportsit.iskool.dao.model;
// Generated Aug 24, 2019 6:56:06 PM by Hibernate Tools 3.2.2.GA


import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * Course generated by hbm2java
 */
@Entity
@Table(name="course"
    ,catalog="iskool"
    , uniqueConstraints = @UniqueConstraint(columnNames="name") 
)
public class Course  implements java.io.Serializable {


     private int id;
     private String name;
     private String description;
     private int durationinmonths;
     private Set courseStudentMappings = new HashSet(0);
     private Set courseSubjectMappings = new HashSet(0);
     private Set sections = new HashSet(0);

    public Course() {
    }

	
    public Course(int id, String name, String description, int durationinmonths) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.durationinmonths = durationinmonths;
    }
    public Course(int id, String name, String description, int durationinmonths, Set courseStudentMappings, Set courseSubjectMappings, Set sections) {
       this.id = id;
       this.name = name;
       this.description = description;
       this.durationinmonths = durationinmonths;
       this.courseStudentMappings = courseStudentMappings;
       this.courseSubjectMappings = courseSubjectMappings;
       this.sections = sections;
    }
   
     @Id 
    
    @Column(name="id", unique=true, nullable=false)
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    @Column(name="name", unique=true, nullable=false, length=100)
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    @Column(name="description", nullable=false, length=200)
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    @Column(name="durationinmonths", nullable=false)
    public int getDurationinmonths() {
        return this.durationinmonths;
    }
    
    public void setDurationinmonths(int durationinmonths) {
        this.durationinmonths = durationinmonths;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="course")
    public Set getCourseStudentMappings() {
        return this.courseStudentMappings;
    }
    
    public void setCourseStudentMappings(Set courseStudentMappings) {
        this.courseStudentMappings = courseStudentMappings;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="course")
    public Set getCourseSubjectMappings() {
        return this.courseSubjectMappings;
    }
    
    public void setCourseSubjectMappings(Set courseSubjectMappings) {
        this.courseSubjectMappings = courseSubjectMappings;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="course")
    public Set getSections() {
        return this.sections;
    }
    
    public void setSections(Set sections) {
        this.sections = sections;
    }




}

