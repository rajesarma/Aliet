package com.school.spring.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

@Repository
public class DBUtils 
{
	
	/*@Autowired
	static BasicDataSource dataSource = null;
	static Connection con;
	
	public static BasicDataSource getDataSource() {
		return dataSource;
	}
	
	public static void setDataSource(BasicDataSource dataSource) {
		DBUtils.dataSource = dataSource;
		
		dataSource.setUsername("school");
		dataSource.setPassword("school");
		dataSource.setDriverClassName("org.postgresql.Driver");
		dataSource.setUrl("jdbc:postgresql://localhost:5432/school");
		
	}*/
	
	public static String getValue(Statement st , String sql)
	{
		String result ="";
		
	    ResultSet rs = null;
		try 
		{
			rs = st.executeQuery(sql);
			if (rs!=null && rs.next())
			{	
				if (rs.getString(1)!=null)
					result = rs.getString(1);	
			}
			
			if(rs.next())
				result = rs.getString(1);
			
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		return result;
	}
	
	public static boolean recordExists(Connection con, String query) {
		boolean flag = false;
		ResultSet rs = null;
		Statement st = null;
		try {
			st = con.createStatement();
			//System.out.println("650==="+query);
			rs = st.executeQuery(query);
			if (rs != null && rs.next()) {
				if (rs.getString(1).equals("0"))
					flag = false;
				else
					flag = true;
			} else
				flag = false;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeStatement(st);
			closeResultSet(rs);

		}
		return flag;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static ArrayList getServices(Connection conn, HttpSession session, String userName, String password ) throws Exception
	{
		Statement stmt = null;
		ResultSet servicesRS = null;
		ArrayList servicesTarget=new ArrayList();
		ArrayList services=new ArrayList();
		HashMap<String, Object> serviceMap = new HashMap<String, Object>();
		try
		{
			stmt = conn.createStatement();
			
			String serviceSql = "select s.service_id, s.service_url, s.service_name,s.parent_id, s.dispay_order" +
					" from users u" +
					" join role_services rs on(u.role_id = rs.role_id )" +
					" join services s on (s.service_id = rs.service_id)" +
					" where user_name = '"+userName+ "' " +
					" and password = '"+password+"'" +
					" order by parent_id, service_id"; 
			
			servicesRS = stmt.executeQuery(serviceSql);
			while (servicesRS.next())
			{
				serviceMap = new HashMap<String, Object>();
				
				serviceMap.put("service_id", servicesRS.getString("service_id"));
				serviceMap.put("service_url", servicesRS.getString("service_url"));
				serviceMap.put("service_name", servicesRS.getString("service_name"));
				serviceMap.put("parent_id", servicesRS.getString("parent_id"));
				serviceMap.put("dispay_order", servicesRS.getString("dispay_order"));
				
				services.add(serviceMap);
				
				servicesTarget.add(servicesRS.getString("service_url"));
			}
			session.setAttribute("servicesTarget", servicesTarget);
			
		}
		catch(SQLException sqle)
		{
			return null;
		}
		
		return services;
	}
	
	public static void closeStatement(Statement _stmt) 
	{
		try
		{
			if(_stmt!=null) {
				_stmt.close();
			}
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
	}
	
	public static void closeResultSet(ResultSet _rs) 
	{
		try
		{
			if(_rs!=null) {
				_rs.close();
			}
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
	}
	
	public static void closeConnection(Connection con)
    {
		try 
		{
			if (con != null) 
			{
				if (!con.isClosed()) 
				{
					con.close();
					con = null;
				} 
				else
					con = null;
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	
	public static ArrayList<HashMap<String, Object>> getListMapData(ResultSet rs)
	{
		ArrayList<HashMap<String, Object>> reportData = new ArrayList<HashMap<String, Object>>();
		ResultSetMetaData rm = null;
		HashMap<String, Object> rowData = null;
		int noOfCols = 0;
		try{
			rm = rs.getMetaData();
			noOfCols = rm.getColumnCount();
			if(rs!=null && rs.next())
			{
				do {
					rowData = new HashMap<String, Object>(noOfCols);
					for(int i=1;i<=noOfCols;i++)
					{
						rowData.put(rm.getColumnName(i).toLowerCase(), ((rs.getObject(i)!=null && !rs.getObject(i).equals(""))?rs.getObject(i):""));
					} 
					reportData.add(rowData);
				} while(rs.next());
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) {
					rs.close();
				}
			} catch (SQLException se) {
				// TODO: handle exception
				se.printStackTrace();
			}
		}
		
		return reportData;
	}
	
	public static ArrayList<HashMap<String,Object>> getListMap(String sql,Connection con,Object[] columnvalues) throws SQLException
	{       
		ArrayList<HashMap<String,Object>> records=new ArrayList<HashMap<String,Object>>();
		PreparedStatement ps = con.prepareStatement(sql);
		if(columnvalues!=null)
		{
			for(int ci=0;ci<columnvalues.length;ci++)
			{
				ps.setObject(ci+1, columnvalues[ci]);
			}
		}
		ResultSet rs=ps.executeQuery();
		ResultSetMetaData rm = rs.getMetaData();
		int cols = rm.getColumnCount();
		if (rs.next()) 
		{
			 do {
				 HashMap<String, Object> row = new java.util.HashMap<String, Object>(cols);
				 for (int i=1; i<=cols; i++) {
					 String columnName = rm.getColumnName(i);
					 Object columnValue = rs.getObject(i);
					 row.put(columnName.trim(), columnValue);
				 } 
				 records.add(row);
				 row = null;
			 } 
			 while (rs.next());
		 }
		closeResultSet(rs);
		closeStatement(ps);
		return records;
	}
	
	public static Map<String, Object> getMapData(String sql, Connection con)
 	{
 		Map<String, Object> reportData = new HashMap<String, Object>();
 		Statement stmt = null;
 		ResultSet rs = null;
 		try {
 			stmt = con.createStatement();
 			rs = stmt.executeQuery(sql);
 			reportData = getMapData(rs);
 		} catch (Exception e) {
 			e.printStackTrace();// TODO: handle exception
 		} finally {
 			try {
 				if (rs != null) {
 					rs.close();
 				}
 				if (stmt != null) {
 					stmt.close();
 				}
 			} catch (SQLException e) {
 				// TODO Auto-generated catch block
 				e.printStackTrace();
 			}
 		}
 		return reportData;
 	}
	
	public static Map<String, Object> getMapData(ResultSet rs)
  	{
  		ResultSetMetaData rm = null;
  		Map<String, Object> reportData = new HashMap<String, Object>();
  		int noOfCols = 0;
  		try{
  			rm = rs.getMetaData();
  			noOfCols = rm.getColumnCount();
  			if(rs.next())
  			{
  				reportData = new HashMap<String, Object>(noOfCols);
  				for(int i=1;i<=noOfCols;i++)
  				{
  					reportData.put(rm.getColumnName(i), ((rs.getObject(i)!=null && !rs.getObject(i).equals(""))?rs.getObject(i):""));
  				} 
  			}
  		} catch (Exception e) {
  			// TODO: handle exception
  			e.printStackTrace();
  		} finally {
  			try {
  				if(rs!=null) {
  					rs.close();
  				}
  			} catch (SQLException se) {
  				// TODO: handle exception
  				se.printStackTrace();
  			}
  		}

  		return reportData;
  	}
	
	/*public void init(DispatcherServlet ds ) 
	{
		try
		{
			datasource = (BasicDataSource) ds.getServletContext().getAttribute("basicDataSource");	
			System.out.println("Max Idle : "+datasource.getMaxIdle());
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}*/
	
}
