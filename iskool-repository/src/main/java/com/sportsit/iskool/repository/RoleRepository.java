package com.sportsit.iskool.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.sportsit.iskool.dao.model.Role;

@Repository
public interface RoleRepository extends CrudRepository<Role, Long> {

	 @Query("SELECT * FROM Role role where role.id = :id")
	 Role findById(@Param("id")String id);
	 
	 @Query("SELECT * FROM Role role where role.name = :name")
	 Role findByName(@Param("name")String name);
}
