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
 * SubjectType generated by hbm2java
 */
@Entity
@Table(name="subject_type"
    ,catalog="iskool"
    , uniqueConstraints = @UniqueConstraint(columnNames="subjecttype") 
)
public class SubjectType  implements java.io.Serializable {


     private int id;
     private String subjecttype;
     private Set<Subject> subjects = new HashSet<Subject>(0);

    public SubjectType() {
    }

	
    public SubjectType(int id, String subjecttype) {
        this.id = id;
        this.subjecttype = subjecttype;
    }
    public SubjectType(int id, String subjecttype, Set<Subject> subjects) {
       this.id = id;
       this.subjecttype = subjecttype;
       this.subjects = subjects;
    }
   
     @Id 
    
    @Column(name="id", unique=true, nullable=false)
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    @Column(name="subjecttype", unique=true, nullable=false, length=45)
    public String getSubjecttype() {
        return this.subjecttype;
    }
    
    public void setSubjecttype(String subjecttype) {
        this.subjecttype = subjecttype;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="subjectType")
    public Set<Subject> getSubjects() {
        return this.subjects;
    }
    
    public void setSubjects(Set<Subject> subjects) {
        this.subjects = subjects;
    }




}


