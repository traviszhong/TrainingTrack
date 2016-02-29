<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>User Sign In</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta name="author" content="Ziyue Zhong" />
		<meta name="charset" content="UTF-8" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/div.css">
		<script type="text/javascript">
			function signincheck(){
				var username = $("#username").val();
				var password = $("#password").val();
				if (username == "") {
        	    	document.getElementById("blankusername").style.display="block";
        	        document.getElementById("username").style.border="solid 1px #ff0000";
        	        return;
        	    }else{
        	        document.getElementById("blankusername").style.display="none";
        	        document.getElementById("username").style.border="solid 1px #000000";
        	    }
        	    if (password == "") {
        	        document.getElementById("blankpassword").style.display="block";
        	        document.getElementById("password").style.border="solid 1px #ff0000";
        	        return;
        	    }else{
        	        document.getElementById("blankpassword").style.display="none";
        	        document.getElementById("password").style.border="solid 1px #000000";
        	    }
        	    if (username != "" && password != ""){
        	    	document.getElementById("signinform").submit();
        	    }
			}
		</script>
	</head>
	

	<body style="background-color: grey">
		<div style="position:absolute;left:30%;top:12%">
			<table>
				<tr>
					<td>
						&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						<img src="<%=basePath%>/sources/john5.jpg">
						<br><br><br><br><br><br>
					</td>
				</tr>
			</table>
			<form action="<%=path%>/signinck" method="post" id="signinform">
				<table>
					<tr>
						<td>
							Username:&nbsp<input type="text" id="username" name="usrname">
						</td>
						<td><div id="blankusername" style="display: none"><a style="color: red">*</a></div></td>
						<td>
							Password:&nbsp<input type="password" id="password" name="psword">
						</td>
						<td><div id="blankpassword" style="display: none"><a style="color: red">*</a></div></td>
						<td>
							&nbsp<input type="button" value="Sign In" onclick="signincheck()">
						</td>
					</tr>
					<tr>
						
					</tr>
					<tr>
						<td>
							
						</td>
					</tr>
				</table>
			</form>
			
		</div>
	</body>
</html>
