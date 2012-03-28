package com.crn.spring.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.stereotype.Component;

@Component
public class CrnAuthenticationProvider implements AuthenticationProvider {

	@Override
	public Authentication authenticate(Authentication authentication)
			throws AuthenticationException {
		UsernamePasswordAuthenticationToken auth = (UsernamePasswordAuthenticationToken) authentication;
		String userName = String.valueOf(auth.getPrincipal()); 
		String password = String.valueOf(auth.getCredentials());
		System.out.println(userName);
		System.out.println(password);
		if(!password.equalsIgnoreCase("test")){
			throw new BadCredentialsException("password wrong");
		}
		Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        authorities.add(new GrantedAuthorityImpl("ROLE_USER"));        
		return new UsernamePasswordAuthenticationToken("test", null, authorities); 
	}

	@Override
	public boolean supports(Class<? extends Object> authentication) {
		return true; 
	}

}
