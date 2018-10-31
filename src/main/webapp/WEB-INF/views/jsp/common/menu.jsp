<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	 <base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>SCHOOL</title>

	<link href="<c:url value="/resources/theme1/css/styles.css"/>"  rel="stylesheet"/>
	<link href="<c:url value="/resources/theme1/css/menus.css"/>"  rel="stylesheet"/>
		
	<script src="<c:url value="/resources/jquery/jquery-1.12.4.min.js"/>"></script>
	<script src="<c:url value="/resources/theme1/js/menus.js"/>"></script>

	<style type="text/css">
		
		.container1
		{
		    display: flex;
		}
		.sm-blue{border-radius:0;}
		
	</style>

	</head>
<body>
	<!-- <div align="center" style="width: 100%"> -->
    	
    	
    	<div class="container1">
    		<div id="logo" >
    			<!-- <img alt="" src="images/logo.jpg" style="height: 80px; margin-left: 20px"> -->
    		</div>
    		<div id="title" style="text-align: left;  margin-left: 20px; margin-top: 10px" >
    			<H1 style="font-size: 36px; margin-top: -5px; margin-bottom:-25px; font-stretch: extra-expanded;">SCHOOL</H1>
    			<h3 style="font-size: 30px; margin-bottom: 0px">Information Project</h3>
    		</div>
    	</div>
    	<div class="container1">
	    	<div id="menu" style="margin-top: 5px; width: 100%; border-radius:0 !important; border-top: 3px solid #ff8100; " class="navbg" >
	    	
	    	</div>
	    	
		</div>
		<div class="user-info" >
	  		Welcome : ${user_desc }
	  		
	  		<span style="padding: 10px"></span>
	  		<a href="Logout.do">Log Out</a>
	  	</div>  
	
	<script type="text/javascript">
		buildMenu('menu', eval('${services1}'));
	</script>
	
	<script type="text/javascript">
		$(function() 
		{
			$('#main-menu').smartmenus({
				mainMenuSubOffsetX: -1,
				mainMenuSubOffsetY: 4,
				subMenusSubOffsetX: 6,
				subMenusSubOffsetY: -6
			});
		});
	</script>
	
</body>
</html>