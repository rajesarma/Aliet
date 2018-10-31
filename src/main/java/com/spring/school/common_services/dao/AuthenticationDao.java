package com.spring.school.common_services.dao;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

public interface AuthenticationDao {

	HashMap<String, Object> validateUser(HttpServletRequest request, String userName, String password) throws Exception;
}
