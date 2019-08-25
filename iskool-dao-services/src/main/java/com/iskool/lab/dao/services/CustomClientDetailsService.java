package com.iskool.lab.dao.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.provider.ClientDetails;
import org.springframework.security.oauth2.provider.ClientDetailsService;
import org.springframework.security.oauth2.provider.ClientRegistrationException;

import com.sportsit.iskool.dao.model.OauthClientDetails;
import com.sportsit.iskool.repository.OauthClientDetailsRepository;

public class CustomClientDetailsService implements ClientDetailsService {
	
	@Autowired
	OauthClientDetailsRepository oauthClientDetailsRepository;

	@Override
	public ClientDetails loadClientByClientId(String clientId) throws ClientRegistrationException {
		Optional<OauthClientDetails> client = oauthClientDetailsRepository.findByClientID(clientId);
		return null;
	}

}
