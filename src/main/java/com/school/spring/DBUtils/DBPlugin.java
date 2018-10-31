package com.school.spring.DBUtils;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;

	@Configuration
	@PropertySource("classpath:db.properties")
	public class DBPlugin {
		
		@Autowired
	    Environment environment;
		
		@Value("#{ environment['jdbc.url'] }")
	    protected String databaseUrl;

	    @Value("#{ environment['jdbc.username'] }")
	    protected String databaseUserName = "";

	    @Value("#{ environment['jdbc.password'] }")
	    protected String databasePassword = "";

	    @Value("#{ environment['jdbc.driverClassName'] }")
	    protected String driverClassName;

	    @Bean(destroyMethod = "close")
	    public DataSource dataSource() 
	    {
	        BasicDataSource dataSource = new BasicDataSource();
	        dataSource.setDriverClassName(driverClassName);
	        dataSource.setUrl(databaseUrl);
	        dataSource.setUsername(databaseUserName);
	        dataSource.setPassword(databasePassword);
	        dataSource.setTestOnBorrow(true);
	        dataSource.setTestOnReturn(true);
	        dataSource.setTestWhileIdle(true);
	        dataSource.setTimeBetweenEvictionRunsMillis(1800000);
	        dataSource.setNumTestsPerEvictionRun(3);
	        dataSource.setMinEvictableIdleTimeMillis(1800000);
	        return dataSource;
	    }
	
}
