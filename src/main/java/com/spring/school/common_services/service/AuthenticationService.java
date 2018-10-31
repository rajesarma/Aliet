package com.spring.school.common_services.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

public interface AuthenticationService {

	HashMap<String,Object> validateUser(HttpServletRequest request, String userName, String password) throws Exception;
	
}
