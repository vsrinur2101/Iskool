package com.sportsit.iskool.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.sportsit.iskool.dao.model.Parent;

@Repository
public interface ParentRepository extends CrudRepository<Parent, Long> {
	
	@Query("SELECT * FROM Parent parent where parent.email = :email")
    Optional<Parent> findByEmail(@Param("email")String email);

    Optional<Parent> findByUsernameOrEmail(String username, String email);

    List<Parent> findByIdIn(List<Long> userIds);

    @Query("SELECT * FROM Parent parent where parent.username = :username")
    Optional<Parent> findByUsername(@Param("username")String username);

    Boolean existsByUsername(String username);

    Boolean existsByEmail(String email);
}