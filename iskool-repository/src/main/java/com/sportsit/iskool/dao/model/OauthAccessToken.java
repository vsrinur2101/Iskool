package com.sportsit.iskool.dao.model;
// Generated Aug 24, 2019 6:56:06 PM by Hibernate Tools 3.2.2.GA


import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * OauthAccessToken generated by hbm2java
 */
@Entity
@Table(name="oauth_access_token"
    ,catalog="iskool"
)
public class OauthAccessToken  implements java.io.Serializable {


     private OauthAccessTokenId id;

    public OauthAccessToken() {
    }

    public OauthAccessToken(OauthAccessTokenId id) {
       this.id = id;
    }
   
     @EmbeddedId
    
    @AttributeOverrides( {
        @AttributeOverride(name="tokenId", column=@Column(name="token_id", length=256) ), 
        @AttributeOverride(name="token", column=@Column(name="token") ), 
        @AttributeOverride(name="authenticationId", column=@Column(name="authentication_id", length=256) ), 
        @AttributeOverride(name="userName", column=@Column(name="user_name", length=45) ), 
        @AttributeOverride(name="clientId", column=@Column(name="client_id", length=256) ), 
        @AttributeOverride(name="authentication", column=@Column(name="authentication") ), 
        @AttributeOverride(name="refreshToken", column=@Column(name="refresh_token", length=256) ) } )
    public OauthAccessTokenId getId() {
        return this.id;
    }
    
    public void setId(OauthAccessTokenId id) {
        this.id = id;
    }




}


