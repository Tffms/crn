package com.crn.spring.security;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.GenericFilterBean;

public class CrnAuthFilter extends GenericFilterBean {
	
	@Autowired
	AuthenticationManager authenticationManager;

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		if(authentication == null){
			// user isn't authenticated ..
			if(request instanceof HttpServletRequest){
				if(((HttpServletRequest)request).getRequestURL().toString().contains("login.htm")){
					
				}
			}
			
		}
		chain.doFilter(request, response);
	}

}
