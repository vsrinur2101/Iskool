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
import javax.persistence.UniqueConstraint;

/**
 * Employee generated by hbm2java
 */
@Entity
@Table(name="employee"
    ,catalog="iskool"
    , uniqueConstraints = {@UniqueConstraint(columnNames="email"), @UniqueConstraint(columnNames="firstname"), @UniqueConstraint(columnNames="lastname")} 
)
public class Employee  implements java.io.Serializable {


     private int id;
     private Organization organization;
     private String firstname;
     private String lastname;
     private String email;
     private String primarycontact;
     private String secondarycontact;
     private String employeeId;
     private String password;
     private int enabled;
     private int expired;
     private Date created;
     private Date lastupdated;
     private Set<DepartmentEmployeeMapping> departmentEmployeeMappings = new HashSet<DepartmentEmployeeMapping>(0);
     private Set<StudentElectivesAcademicyearMapping> studentElectivesAcademicyearMappings = new HashSet<StudentElectivesAcademicyearMapping>(0);
     private Set<Section> sections = new HashSet<Section>(0);
     private Set<EmployeeRoleMapping> employeeRoleMappings = new HashSet<EmployeeRoleMapping>(0);
     private Set<EmployeeSubjectMapping> employeeSubjectMappings = new HashSet<EmployeeSubjectMapping>(0);

    public Employee() {
    }

	
    public Employee(int id, Organization organization, String firstname, String lastname, String email, String primarycontact, String employeeId, String password, int enabled, int expired, Date created, Date lastupdated) {
        this.id = id;
        this.organization = organization;
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.primarycontact = primarycontact;
        this.employeeId = employeeId;
        this.password = password;
        this.enabled = enabled;
        this.expired = expired;
        this.created = created;
        this.lastupdated = lastupdated;
    }
    public Employee(int id, Organization organization, String firstname, String lastname, String email, String primarycontact, String secondarycontact, String employeeId, String password, int enabled, int expired, Date created, Date lastupdated, Set<DepartmentEmployeeMapping> departmentEmployeeMappings, Set<StudentElectivesAcademicyearMapping> studentElectivesAcademicyearMappings, Set<Section> sections, Set<EmployeeRoleMapping> employeeRoleMappings, Set<EmployeeSubjectMapping> employeeSubjectMappings) {
       this.id = id;
       this.organization = organization;
       this.firstname = firstname;
       this.lastname = lastname;
       this.email = email;
       this.primarycontact = primarycontact;
       this.secondarycontact = secondarycontact;
       this.employeeId = employeeId;
       this.password = password;
       this.enabled = enabled;
       this.expired = expired;
       this.created = created;
       this.lastupdated = lastupdated;
       this.departmentEmployeeMappings = departmentEmployeeMappings;
       this.studentElectivesAcademicyearMappings = studentElectivesAcademicyearMappings;
       this.sections = sections;
       this.employeeRoleMappings = employeeRoleMappings;
       this.employeeSubjectMappings = employeeSubjectMappings;
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
    
    @Column(name="firstname", unique=true, nullable=false, length=45)
    public String getFirstname() {
        return this.firstname;
    }
    
    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }
    
    @Column(name="lastname", unique=true, nullable=false, length=45)
    public String getLastname() {
        return this.lastname;
    }
    
    public void setLastname(String lastname) {
        this.lastname = lastname;
    }
    
    @Column(name="email", unique=true, nullable=false, length=45)
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    @Column(name="primarycontact", nullable=false, length=45)
    public String getPrimarycontact() {
        return this.primarycontact;
    }
    
    public void setPrimarycontact(String primarycontact) {
        this.primarycontact = primarycontact;
    }
    
    @Column(name="secondarycontact", length=45)
    public String getSecondarycontact() {
        return this.secondarycontact;
    }
    
    public void setSecondarycontact(String secondarycontact) {
        this.secondarycontact = secondarycontact;
    }
    
    @Column(name="employee_id", nullable=false, length=45)
    public String getEmployeeId() {
        return this.employeeId;
    }
    
    public void setEmployeeId(String employeeId) {
        this.employeeId = employeeId;
    }
    
    @Column(name="password", nullable=false, length=45)
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    @Column(name="enabled", nullable=false)
    public int getEnabled() {
        return this.enabled;
    }
    
    public void setEnabled(int enabled) {
        this.enabled = enabled;
    }
    
    @Column(name="expired", nullable=false)
    public int getExpired() {
        return this.expired;
    }
    
    public void setExpired(int expired) {
        this.expired = expired;
    }
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="created", nullable=false, length=19)
    public Date getCreated() {
        return this.created;
    }
    
    public void setCreated(Date created) {
        this.created = created;
    }
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="lastupdated", nullable=false, length=19)
    public Date getLastupdated() {
        return this.lastupdated;
    }
    
    public void setLastupdated(Date lastupdated) {
        this.lastupdated = lastupdated;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="employee")
    public Set<DepartmentEmployeeMapping> getDepartmentEmployeeMappings() {
        return this.departmentEmployeeMappings;
    }
    
    public void setDepartmentEmployeeMappings(Set<DepartmentEmployeeMapping> departmentEmployeeMappings) {
        this.departmentEmployeeMappings = departmentEmployeeMappings;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="employee")
    public Set<StudentElectivesAcademicyearMapping> getStudentElectivesAcademicyearMappings() {
        return this.studentElectivesAcademicyearMappings;
    }
    
    public void setStudentElectivesAcademicyearMappings(Set<StudentElectivesAcademicyearMapping> studentElectivesAcademicyearMappings) {
        this.studentElectivesAcademicyearMappings = studentElectivesAcademicyearMappings;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="employee")
    public Set<Section> getSections() {
        return this.sections;
    }
    
    public void setSections(Set<Section> sections) {
        this.sections = sections;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="employee")
    public Set<EmployeeRoleMapping> getEmployeeRoleMappings() {
        return this.employeeRoleMappings;
    }
    
    public void setEmployeeRoleMappings(Set<EmployeeRoleMapping> employeeRoleMappings) {
        this.employeeRoleMappings = employeeRoleMappings;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="employee")
    public Set<EmployeeSubjectMapping> getEmployeeSubjectMappings() {
        return this.employeeSubjectMappings;
    }
    
    public void setEmployeeSubjectMappings(Set<EmployeeSubjectMapping> employeeSubjectMappings) {
        this.employeeSubjectMappings = employeeSubjectMappings;
    }




}


