package com.spring.school.common_services.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.school.common_services.form.AuthenticationForm;
import com.spring.school.common_services.service.AuthenticationService;


@Controller
public class AuthenticationController {

	@Autowired
	AuthenticationService service;
	
	@RequestMapping(value="Login", method = RequestMethod.GET)
	private ModelAndView loginPage() {
		
		ModelAndView mav = new ModelAndView("Login");
		mav.addObject("adminForm", new AuthenticationForm());
		return mav;

	}
	
	@RequestMapping(value="Login", method = RequestMethod.POST)
	private ModelAndView checkLogin(HttpServletRequest request, AuthenticationForm form) {
		
		HashMap<String, Object> statusMap= null;
		ModelAndView mav = new ModelAndView("Login");
		mav.addObject("adminForm", form);
		
		try 
		{
			statusMap = service.validateUser(request, form.getUsername(), form.getPassword());
			
			//System.out.println(statusMap);
			
			if(statusMap!=null && statusMap.get("target").toString().equalsIgnoreCase("success") )
			{
				mav = new ModelAndView("welcome");
				
			}
			else
			{
				System.out.println("msg : "+request.getAttribute("msg"));
				mav = new ModelAndView("home");
				//request.setAttribute("msg", arg1);
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return mav;

		//return null;		
	}
	
	@RequestMapping(value="Logout", method = RequestMethod.GET)
	private ModelAndView Logout(HttpServletRequest request, AuthenticationForm form) 
	{
		
		HttpSession session = request.getSession(false);
		session.invalidate();
		session = null;
		
		request.setAttribute("msg", "Successfully Logged Out");
		
		//return new ModelAndView("redirect:home");
		return new ModelAndView("home");
	}
	
}
