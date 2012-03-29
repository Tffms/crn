package com.crn.spring.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.PersistenceManagerFactory;
import javax.jdo.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.stereotype.Component;

import com.crn.usermanagement.UserInfo;


@Component
public class CrnAuthenticationProvider implements AuthenticationProvider {
	
	@Autowired
	@Qualifier("persistenceManagerFactory") 
	PersistenceManagerFactory persistenceManagerFactory;
	
	@Override
	public Authentication authenticate(Authentication authentication)
			throws AuthenticationException {
		UsernamePasswordAuthenticationToken auth = (UsernamePasswordAuthenticationToken) authentication;
		String userName = String.valueOf(auth.getPrincipal()); 
		String password = String.valueOf(auth.getCredentials());
		System.out.println(userName);
		System.out.println(password);
		
		PersistenceManager manager = persistenceManagerFactory.getPersistenceManager();
		Query query = manager.newQuery(UserInfo.class);
		query.setFilter("userName == userNameParam");
		query.declareParameters("String userNameParam");
		List<UserInfo> userEntities = (List<UserInfo>) query.execute(userName);
		userEntities = (List<UserInfo>) manager.detachCopyAll(userEntities); 
		manager.close();
		if(userEntities.size() > 0){
			UserInfo userEntity = userEntities.get(0);
			
			if(userName.equalsIgnoreCase(userName) && !password.equalsIgnoreCase(userEntity.getPassword())){
				throw new BadCredentialsException("password wrong");
			}
			
			Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
			for(String role : userEntity.getAuthorities()){
				authorities.add(new GrantedAuthorityImpl(role));
			}
			return new UsernamePasswordAuthenticationToken(userEntity, null, authorities); 
		} else {
			throw new BadCredentialsException("user not found");
		}
		
	}

	@Override
	public boolean supports(Class<? extends Object> authentication) {
		return true; 
	}

}
