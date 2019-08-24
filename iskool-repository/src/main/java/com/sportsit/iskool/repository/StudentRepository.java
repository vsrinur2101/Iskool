package com.sportsit.iskool.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.sportsit.iskool.dao.model.Student;

@Repository
public interface StudentRepository extends CrudRepository<Student, Long> {
	
	@Query("SELECT * FROM Student student where student.email = :email")
    Optional<Student> findByEmail(@Param("email")String email);

    Optional<Student> findByUsernameOrEmail(String username, String email);

    List<Student> findByIdIn(List<Long> userIds);

    @Query("SELECT * FROM Student student where student.studentid = :username")
    Optional<Student> findByUsername(@Param("username")String username);

    Boolean existsByUsername(String username);

    Boolean existsByEmail(String email);
}