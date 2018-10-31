<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
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
	<!-- <title>SCHOOL</title> -->
	<title><tiles:insertAttribute name="title" ignore="true" /></title>

	<link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css"/>"  rel="stylesheet"/>
	<link href="<c:url value="/resources/theme1/css/styles.css"/>"  rel="stylesheet"/>
	<link href="<c:url value="/resources/theme1/css/menus.css"/>"  rel="stylesheet"/>
		
	<script src="<c:url value="/resources/jquery/jquery-1.12.4.min.js"/>"></script>
	


	</head>
<body>
    	<div class="container">
    		<%-- <div class = "menu"><tiles:insertAttribute name="menu" /></div> --%>
    		<div class = "menu">
		    	<jsp:include page="/WEB-INF/views/jsp/common/menu.jsp"/>
		    </div>
    		
	    	<div class = "content">
	    	<br>
	    		<tiles:insertAttribute name="content" />
	    	</div>
		</div>
</body>
</html>