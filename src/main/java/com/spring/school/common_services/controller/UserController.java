package com.spring.school.common_services.controller;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.school.spring.DBUtils.DBUtils;
import com.spring.school.common_services.form.AuthenticationForm;

@Controller
@RequestMapping(value="userCreation")
public class UserController {
	
	@Autowired
	private BasicDataSource dataSource;
	
	@RequestMapping(method=RequestMethod.GET)
	private ModelAndView createUser() 
	{
		Connection con;
		ModelAndView mav = null;
		try 
		{
			con = dataSource.getConnection();
		
			mav = new ModelAndView("userCreation");
			
			AuthenticationForm userForm = new AuthenticationForm();
			userForm.setProperty("requestType", "test");
			
			String sql = "select role_id, role_name from roles where role_id not in (1,4)";
			ArrayList<HashMap<String,Object>> rolesList =  DBUtils.getListMap(sql, con, null);
			
			mav.addObject("rolesList", rolesList);
			
			//userForm.setProperty("rolesList", rolesList);
			
			mav.addObject("userForm", userForm);
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView createUser(HttpServletRequest request, AuthenticationForm form) 
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("userForm", new AuthenticationForm());
		
		return mav;
	}
	
	
	@RequestMapping(value="getNextUser", method=RequestMethod.GET)
	public ModelAndView getNextUser(HttpServletRequest request, AuthenticationForm form) 
	{
		Connection con = null;
		//String user_name = "";
		String sql = "";
		ModelAndView mav = null;
		int roleId =0;
		try {
			con = dataSource.getConnection();
			
			mav = new ModelAndView("userCreation");
			
			//mav.addObject("userForm", new AuthenticationForm());
			//String uId = DBUtils.getValue(st, "select case when count(id) is null then 1 else max(id) +1 end as id from users");
			if(form.getProperty("id")!=null && !"".equals(form.getProperty("id").toString()))
				roleId = Integer.parseInt(form.getProperty("id").toString());
			
			if(roleId == 2)
				sql = " select faculty_id as person_id, faculty_name as person_name from faculty_details where faculty_id not in (select faculty_id from users where faculty_id is not null) order by faculty_id ";
			
			else if(roleId == 3 )
				sql = " select student_id as person_id, student_name as person_name from student_details where student_id not in (select student_id from users where student_id is not null) order by student_id ";
			
			ArrayList<HashMap<String,Object>> personsList =  DBUtils.getListMap(sql, con, null);
			mav.addObject("personsList", personsList);
			
			sql = "select role_id, role_name from roles where role_id not in (1,4)";
			ArrayList<HashMap<String,Object>> rolesList =  DBUtils.getListMap(sql, con, null);
			
			form.setRoleId(form.getRoleId());
			
			mav.addObject("rolesList", rolesList);
			mav.addObject("userForm", form);
			
			
			
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	
	
}
