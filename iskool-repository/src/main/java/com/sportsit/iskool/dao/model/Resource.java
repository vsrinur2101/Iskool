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

/**
 * Resource generated by hbm2java
 */
@Entity
@Table(name="resource"
    ,catalog="iskool"
)
public class Resource  implements java.io.Serializable {


     private int id;
     private String name;
     private String description;
     private Set<OrgResourceScope> orgResourceScopes = new HashSet<OrgResourceScope>(0);

    public Resource() {
    }

	
    public Resource(int id) {
        this.id = id;
    }
    public Resource(int id, String name, String description, Set<OrgResourceScope> orgResourceScopes) {
       this.id = id;
       this.name = name;
       this.description = description;
       this.orgResourceScopes = orgResourceScopes;
    }
   
     @Id 
    
    @Column(name="id", unique=true, nullable=false)
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    @Column(name="name", length=45)
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
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="resource")
    public Set getOrgResourceScopes() {
        return this.orgResourceScopes;
    }
    
    public void setOrgResourceScopes(Set<OrgResourceScope> orgResourceScopes) {
        this.orgResourceScopes = orgResourceScopes;
    }




}


