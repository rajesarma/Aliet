<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>School</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  </head>
  
  <!-- <link rel="stylesheet" type="text/css" href="css\menu.css"> -->
  <link href="<c:url value="/resources/theme1/css/styles.css"/>"  rel="stylesheet"/>
  
	<style type="text/css">
		
	.page 
	{
		width:1170px;
	    margin:0px auto;
	}
	
	.container 
	{
	    display: flex;
	 
	}
	
	</style>
	
	<script type="text/javascript">
		function checkValues()
		{
			if (document.forms[0].username.value=="")
			{
				alert("Enter Username");
				document.forms[0].username.value="";
				return false;
			}
			else if (document.forms[0].password.value=="")
			{
				alert("Enter Password");
				document.forms[0].password.value="";
				return false;
			}
			else
			{
				document.forms[0].submit();
			}
		}
		
		function clearvalues()
		{
			document.forms[0].username.value="";
			document.forms[0].password.value="";
		}
		
	</script>
  
  <body onload="clearvalues()">
  	
  	<div align="center" style="width: 100%">
  		<div class="page">
	    	<div class="container">
	    		<div id="logo" >
	    			<!-- <img alt="" src="images/logo.jpg" style="height: 80px; margin-left: 20px"> -->
	    		</div>
	    		<div id="title" style="text-align: left;  margin-left: 20px; margin-top: 10px" >
	    			<!-- <H1 style="font-size: 36px; margin-top: -5px; margin-bottom:-25px; font-stretch: extra-expanded;">SCHOOL</H1>
	    			<h3 style="font-size: 30px; margin-bottom: 0px">Information Project</h3> -->
	    		</div>
	    	</div>
	    	<div style="background-color: #084B8A; padding: 14px 16px; border-top: 3px solid #ff8100; ">
	    	
	    	
	    	</div>
	    	<div class="container">
	    		
	    		<div align="center" class="login_box" id="login_box">
	    			<form:form action="Login" method="post" modelAttribute = "authenticationForm" >
				    	<!-- <html:hidden property="mode" name="authenticationForm" /> -->
						<h1>Login</h1>
						<span style="color: blue;font-size: 16px; padding-bottom: 10px"> 
                        	${msg }
                        </span>
                        <table style="margin-top: 10px; margin-bottom: 10px">
                        	<tr>
                        		<td>User Name</td>
                        		<td><form:input path="username" id="username" placeholder="User Name"  maxlength="15" cssStyle="font-size:14px; margin-left :20px "/></td>
                        	</tr>
                        	<tr>
                        		<td>Password</td>
                        		<td><form:password path="password" id="password" placeholder="Password"  maxlength="15" cssStyle="font-size:14px; margin-left :20px " /></td>
                        	</tr>
                        </table>
						<div>
							 <input type="submit" name="button" id="button" class="btn btn-danger btn-10px"  value="Sign  in" onclick="return checkValues();" />
						</div>
					</form:form>
	    		</div>
	    	</div>
	    </div>
    </div>
  </body>
</html>
