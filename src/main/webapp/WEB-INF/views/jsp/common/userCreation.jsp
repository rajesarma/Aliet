<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="html"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>User Creation</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<!-- <link rel="stylesheet" type="text/css" href="css/styles.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
  	
  	<link href="<c:url value="/resources/theme1/css/styles.css"/>"  rel="stylesheet"/>

	<script language="javascript">
	
		function createUser()
        {
			var i=0;
            if(document.forms[0].roleId.value=="0")        
            {        
				alert("Select Role");
                return false;
			}
            if(document.forms[0].userId.value=="0")        
            {        
				alert("Select User");
                return false;
			}
            if(document.forms[0].user_desc.value=="")
            {
            	alert("Enter User Description.");
               	document.forms[0].user_desc.value="";
               	return false;
			}
            else
            {
            	document.forms[0].mode.value="createUser";
				document.forms[0].submit();
			}
       	}
       	
       	 function getData(requestType, obj)
	     {
	     	//document.forms[0].submit();
	     	//alert("rt : "+document.getElementById("requestType").value);
	     	/* 
	     	document.forms[0].action="userCreation/getNextUser";
	     	//alert("rt : "+document.forms[0].action);
	     	document.forms[0].method = "GET";
			document.forms[0].modelAttribute = "userForm";
       		document.getElementById("requestType").value="userCreation/getNextUser";
			document.forms[0].submit();
			 */
			
			var url = '<%=basePath%>userCreation/getNextUser';
			$.ajax(
			{
				type: "GET",
				url:url,
				data: 
				{
	   				//'property(type)':requestType,
	   				'properties[id]': obj.value,
				},
				
				cache: false,
				success: function(response)
				{
					$("#wait").html("");
					
					if(requestType == "getProjectData")
					{
						var project_client = JSON.parse(response).project_client;
						document.getElementById(setData1).value = project_client;
						var projectcost = JSON.parse(response).projectcost;
						document.getElementById(setData2).value = projectcost;
					}
				}
			});	
	     }
       	
	</script>
	
	<style type="text/css">
		#container 
		{
		    display: flex;
		}
	</style>
	
	</head>
<body>
	
	<div class="page">
	
	<!-- <div class="container"> -->
	    		
    			<html:form action="userCreation" method="post" modelAttribute = "userForm" >
    				<html:hidden path="properties[requestType]" id="requestType" />
    				<html:hidden path="properties[roleId]" id="requestType" />
			    	
			    	<div class="container_form">
				  		<div class="header" >
							<h3 style="color:#fff; text-align: center;">User Creation</h3>
						</div>
			    	
						<span style="color: blue;font-size: 16px; padding-bottom: 10px"> 
	                       	${msg }
	                       </span>
	                       <%-- <table style="margin-top: 10px; margin-bottom: 10px">
	                       	<tr>
	                       		<td>User Name</td>
	                       		<td><form:input path="username" id="username" placeholder="User Name"  maxlength="15" cssStyle="font-size:14px; margin-left :20px "/></td>
	                       	</tr>
	                       	<tr>
	                       		<td>Password</td>
	                       		<td><form:password path="password" id="password" placeholder="Password"  maxlength="15" cssStyle="font-size:14px; margin-left :20px " /></td>
	                       	</tr>
	                       </table> --%>
	                       
	                       <div align="center" >		
							 <table style="width: 40%; " class="facultyTable">
							    <tbody>
							    	<tr>
					    				<td>Role</td>
					    				<td>
					    					<html:select path="roleId" id="roleId" onchange="getData('getNextUser',this)">
												<html:option value="0">--Select--</html:option>
												<c:forEach items="${rolesList}" var="role">
											        <option value="${role.role_id}"> ${role.role_name} </option>
											    </c:forEach>
											</html:select>
					    				</td>
					    			</tr>
					    			
					    			<tr>
					    				<td>User</td>
					    				<td>
					    					<html:select  path="properties[personId]" styleId="personId" style="width:180px;">
												<html:option value="0">--Select--</html:option>
													<c:forEach items="${personsList}" var="role">
											        <option value="${role.person_id}"> ${role.person_name} </option>
											    </c:forEach>
											</html:select>
					    				</td>
					    			</tr>
					    			
									<tr>
										<td class="label">User Description</td>
										<td><html:input path="user_desc" size="20" /> </td>
									</tr>
									
									<tr class="label">
										<td colspan=2 align="center" class="first">
											<html:button onclick="return createUser();"/>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
                       
						<div>
							 <input type="submit" name="button" id="button" class="btn btn-danger btn-10px"  value="Sign  in" onclick="return checkValues();" />
						</div>
						</div>	
					</html:form>
    		</div>
	
	 <%--  <html:form action="/userCreation" >
	  		<html:hidden property="mode" styleId="mode"/>
	  		<html:hidden property="property(requestType)" styleId="requestType"/>
	  		
	  		<jsp:include page="/jsp/common/menu.jsp" />
	  		
	  		<div class="container_form">
	  		<div class="header" >
			<h3 style="color:#fff; text-align: center;">User Creation</h3>
			</div>
			<div align="center">
				<font color="red" size="3">
					<logic:present name="msg">
						<bean:write name="msg"/>
					</logic:present>
				</font>
				<br>
				<br>
			</div>
			<div align="center" >		
				 <table style="width: 40%; " class="facultyTable">
				    <tbody>
				    	<tr>
		    				<td>Role</td>
		    				<td>
		    					<html:select  property="roleId" styleId="roleId" style="width:180px;" onchange="getData('getPersons',this)">
									<html:option value="0">--Select--</html:option>
										<logic:notEmpty property="rolesList" name="authenticationForm">
											<html:optionsCollection property="rolesList" />
										</logic:notEmpty>
								</html:select>
		    				</td>
		    			</tr>
		    			
		    			<tr>
		    				<td>User</td>
		    				<td>
		    					<html:select  property="property(userId)" styleId="userId" style="width:180px;">
									<html:option value="0">--Select--</html:option>
										<logic:notEmpty property="personsList" name="authenticationForm">
											<html:optionsCollection property="personsList" />
										</logic:notEmpty>
								</html:select>
		    				</td>
		    			</tr>
		    			
						<tr>
							<td class="label">User Description</td>
							<td><html:text property="user_desc" size="20" name="authenticationForm"/> </td>
						</tr>
						
						<tr class="label">
							<td colspan=2 align="center" class="first">
								<html:submit onclick="return createUser();"/>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			</div>
		</html:form> --%>
		</div>
	</body>
</html>