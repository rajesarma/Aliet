package com.spring.school.common_services.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("logout")
public class LogoutController 
{
	/*@Autowired
	LoginService loginService;
	*/
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
	{
		String userName = null;
		int userSerialNumber;
		String status = null;
		String message = null;
		String errorMessage = null;
		ModelAndView mav = null;
		
		try
		{
			mav = new ModelAndView("login");
			HttpSession session = request.getSession(false);
			if(session!=null)
			{
				userName = (String) session.getAttribute("userName");
				userSerialNumber = (Integer) session.getAttribute("userSerialNumber");
				
				//status = loginService.saveLogoutUserInfo(userName, userSerialNumber);
				
				
				if("Success".equals(status))
				{
					message = "You are Successfully Loged Out";
					mav.addObject("message", message);
				}
				
				session.invalidate();
				session = null;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			errorMessage = "Unable to Process Your request. Please Try Again.";
			mav.addObject("errorMessage", errorMessage);
		}
		return new ModelAndView("redirect:welcome");
	}

}
	