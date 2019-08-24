package com.sportsit.iskool.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.sportsit.iskool.dao.model.OauthClientDetails;

public interface OauthClientDetailsRepository  extends CrudRepository<OauthClientDetails, Long> {
	
	@Query("SELECT * FROM OauthClientDetails oauthClientDetails where oauthClientDetails.clientId = :clientId")
    Optional<OauthClientDetails> findByClientID(@Param("clientId")String clientId);

}
