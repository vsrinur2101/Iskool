package com.sportsit.iskool.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.sportsit.iskool.dao.model.StudentRoleMapping;

public interface StudentRoleMappingRepository  extends CrudRepository<StudentRoleMapping, Long> {

	@Query("SELECT * FROM StudentRoleMapping studentRoleMapping where studentRoleMapping.id = :id")
    List<StudentRoleMapping> findByStudentRoleMapping(@Param("id")int id);
}
