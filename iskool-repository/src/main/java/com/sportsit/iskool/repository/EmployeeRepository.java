package com.sportsit.iskool.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.sportsit.iskool.dao.model.Employee;

@Repository
public interface EmployeeRepository extends CrudRepository<Employee, Long> {
	
	@Query("SELECT * FROM Employee employee where employee.email = :email")
    Optional<Employee> findByEmail(@Param("email")String email);

    Optional<Employee> findByUsernameOrEmail(String username, String email);

    List<Employee> findByIdIn(List<Long> userIds);

    @Query("SELECT * FROM Employee employee where employee.employeeId = :username")
    Optional<Employee> findByUsername(@Param("username")String username);

    Boolean existsByUsername(String username);

    Boolean existsByEmail(String email);
}