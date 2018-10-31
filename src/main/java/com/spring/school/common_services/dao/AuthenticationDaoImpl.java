package com.spring.school.common_services.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.school.spring.DBUtils.DBUtils;

@Repository
public class AuthenticationDaoImpl implements AuthenticationDao 
{
	/*@Autowired
	private BasicDataSource dataSource;*/
	
	@Autowired
	DataSource dataSource;
	
	/*public void setDataSource(BasicDataSource dataSource) {
		this.dataSource = dataSource;
	}*/

	@SuppressWarnings("rawtypes")
	@Override
	public HashMap<String, Object> validateUser(HttpServletRequest request, String userName, String password) throws Exception
	{
		HashMap<String, Object> statusMap = new HashMap<String, Object>();
		
		Connection con = dataSource.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		stmt = con.createStatement();
		String target = "";
		String sql = "";
		String msg = "";
		
		// If User Exists
		if(DBUtils.recordExists(con, " select count(*) as count from users where user_name = '"+userName+ "'"))
		{
			sql = " select count(*) as count from users " +
					" where user_name = '"+userName+ "'" +
					" and password = '"+password+"' ";
			
			// If User and Password Matches
		    if(DBUtils.recordExists(con, sql))
			{
				int roleId = Integer.parseInt(DBUtils.getValue(stmt, "select role_id from users where  user_name = '"+userName+ "' and password ='"+password+"'")); 
				String userId = DBUtils.getValue(stmt, "select id from users where  user_name = '"+userName+ "' and password ='"+password+"'");
				String user_desc = DBUtils.getValue(stmt, "select user_desc from users where  user_name = '"+userName+ "' and password ='"+password+"'");
				String user_name = DBUtils.getValue(stmt, "select user_name from users where  user_name = '"+userName+ "' and password ='"+password+"'");
				
				// If User name and password both are same, then redirect to change password screen
				if(userName.equals(password))
				{
					HttpSession session=request.getSession();
					
					session.removeAttribute("services");
					session.removeAttribute("services1");
					session.removeAttribute("servicesTarget");
					
					session.setAttribute("user_name", user_name);
					
					target = "changePassword";
				}
				else
				{	
					HttpSession session=request.getSession(true);
					session.setAttribute("roleId", roleId);
					session.setAttribute("userId", userId);
					session.setAttribute("user_desc", user_desc);
					session.setAttribute("user_name", user_name);
					
					session.setAttribute("services", DBUtils.getServices(con, session, userName, password));
					
					List menu=DBUtils.getServices(con, session, userName, password);
					session.setAttribute("services1",new JSONArray(menu));
					
					//formBean.setPassword("");
					
					target = "success";
					
					
					// If Student Login
					if(roleId == 3)
						target = "studentDisplay";
					
					if(roleId == 4)
						target = "managementDisplay";
					
				}
				
				//msg = "Login Succes..";
			}
			else
			{
				msg = "User Name and Password does not match";
				target="failure";
			}
		}
		else
		{
			msg = "User Name does not exists";
			target="failure";
			//formBean.setUsername("");
			//formBean.setPassword("");
		}
		
		System.out.println("userName : "+userName );
		System.out.println("password : "+password );
		
		//System.out.println(con.isClosed());
		request.setAttribute("msg", msg);
		statusMap.put("msg", msg);
		statusMap.put("target", target);
		
		return statusMap;
	}

}
