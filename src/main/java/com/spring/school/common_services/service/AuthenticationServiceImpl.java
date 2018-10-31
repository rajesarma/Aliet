package com.spring.school.common_services.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.school.common_services.dao.AuthenticationDao;

@Service
public class AuthenticationServiceImpl implements AuthenticationService {
	
	@Autowired
	private AuthenticationDao authenticationDao;
	
	public void setAuthenticationDao(AuthenticationDao authenticationDao) {
		this.authenticationDao = authenticationDao;
	}

	@Override
	public HashMap<String, Object> validateUser(HttpServletRequest request, String userName, String password) throws Exception {
		
		HashMap<String, Object> result = authenticationDao.validateUser(request, userName, password);
		
		return result;
	}

}
