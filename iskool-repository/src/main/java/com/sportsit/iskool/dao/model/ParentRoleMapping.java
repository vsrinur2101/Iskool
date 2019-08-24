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
 * ParentRoleMapping generated by hbm2java
 */
@Entity
@Table(name="parent_role_mapping"
    ,catalog="iskool"
)
public class ParentRoleMapping  implements java.io.Serializable {


     private int id;
     private Role role;
     private Parent parent;

    public ParentRoleMapping() {
    }

    public ParentRoleMapping(int id, Role role, Parent parent) {
       this.id = id;
       this.role = role;
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
    @JoinColumn(name="role_id", nullable=false)
    public Role getRole() {
        return this.role;
    }
    
    public void setRole(Role role) {
        this.role = role;
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

