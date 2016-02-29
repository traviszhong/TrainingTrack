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
		<title>Training Track System</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta name="author" content="Ziyue Zhong" />
		<meta name="charset" content="UTF-8" />
		<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/div.css">
	</head>

	<body style="background-color: grey">
		<div class="divcenter">
			<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
			<img src="<%=basePath%>/sources/logo.jpg">
            <p>This site allows all users to track their training process.<br/>users may make better use of their time by using this system</p>
            <p>You can start by<br/><a href="<%=path%>/signup">Sign Up</a></p>
            <p>If you have the account already, please click here to<br/><a href="<%=path%>/signin">Sign In</a></p>
        </div>
	</body>
</html>
