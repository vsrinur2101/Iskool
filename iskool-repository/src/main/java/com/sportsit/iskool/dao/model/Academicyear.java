package com.sportsit.iskool.dao.model;
// Generated Aug 24, 2019 6:56:06 PM by Hibernate Tools 3.2.2.GA


import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Academicyear generated by hbm2java
 */
@Entity
@Table(name="academicyear"
    ,catalog="iskool"
)
public class Academicyear  implements java.io.Serializable {


     private int id;
     private Organization organization;
     private Date startdate;
     private String description;
     private Date enddate;
     private Set sectionAcademicyearMappings = new HashSet(0);
     private Set employeeSubjectMappings = new HashSet(0);
     private Set studentElectivesAcademicyearMappings = new HashSet(0);

    public Academicyear() {
    }

	
    public Academicyear(int id, Organization organization, Date startdate, String description, Date enddate) {
        this.id = id;
        this.organization = organization;
        this.startdate = startdate;
        this.description = description;
        this.enddate = enddate;
    }
    public Academicyear(int id, Organization organization, Date startdate, String description, Date enddate, Set sectionAcademicyearMappings, Set employeeSubjectMappings, Set studentElectivesAcademicyearMappings) {
       this.id = id;
       this.organization = organization;
       this.startdate = startdate;
       this.description = description;
       this.enddate = enddate;
       this.sectionAcademicyearMappings = sectionAcademicyearMappings;
       this.employeeSubjectMappings = employeeSubjectMappings;
       this.studentElectivesAcademicyearMappings = studentElectivesAcademicyearMappings;
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
    @JoinColumn(name="organization_id", nullable=false)
    public Organization getOrganization() {
        return this.organization;
    }
    
    public void setOrganization(Organization organization) {
        this.organization = organization;
    }
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="startdate", nullable=false, length=19)
    public Date getStartdate() {
        return this.startdate;
    }
    
    public void setStartdate(Date startdate) {
        this.startdate = startdate;
    }
    
    @Column(name="description", nullable=false, length=200)
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="enddate", nullable=false, length=19)
    public Date getEnddate() {
        return this.enddate;
    }
    
    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="academicyear")
    public Set getSectionAcademicyearMappings() {
        return this.sectionAcademicyearMappings;
    }
    
    public void setSectionAcademicyearMappings(Set sectionAcademicyearMappings) {
        this.sectionAcademicyearMappings = sectionAcademicyearMappings;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="academicyear")
    public Set getEmployeeSubjectMappings() {
        return this.employeeSubjectMappings;
    }
    
    public void setEmployeeSubjectMappings(Set employeeSubjectMappings) {
        this.employeeSubjectMappings = employeeSubjectMappings;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="academicyear")
    public Set getStudentElectivesAcademicyearMappings() {
        return this.studentElectivesAcademicyearMappings;
    }
    
    public void setStudentElectivesAcademicyearMappings(Set studentElectivesAcademicyearMappings) {
        this.studentElectivesAcademicyearMappings = studentElectivesAcademicyearMappings;
    }




}

