<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
			function signupcheck(){
				var username = $("#username").val();
				var password = $("#password").val();
				var firstname = $("#firstname").val();
				var lastname = $("#lastname").val();
				var email = $("#email").val();
				var emailReg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
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
        	    if (firstname == "") {
        	        document.getElementById("blankfirstname").style.display="block";
        	        document.getElementById("firstname").style.border="solid 1px #ff0000";
        	        return;
        	    }else{
        	        document.getElementById("blankfirstname").style.display="none";
        	        document.getElementById("firstname").style.border="solid 1px #000000";
        	    }
        	    if (lastname == "") {
        	        document.getElementById("blanklastname").style.display="block";
        	        document.getElementById("lastname").style.border="solid 1px #ff0000";
        	        return;
        	    }else{
        	        document.getElementById("blanklastname").style.display="none";
        	        document.getElementById("lastname").style.border="solid 1px #000000";
        	    }
        	    if (email == "") {
        	        document.getElementById("blankemail").style.display="block";
        	        document.getElementById("email").style.border="solid 1px #ff0000";
        	        return;
        	    }else{
        	        document.getElementById("blankemail").style.display="none";
        	        document.getElementById("email").style.border="solid 1px #000000";
        	    }
        	    if (!emailReg.test(email) && email != "") {
                    alert("It's not a valid email!");
                    document.getElementById("email").value = "";
                    email = "";
                    document.getElementById("blankemail").style.display="block";
                    document.getElementById("email").style.border="solid 1px #ff0000";
                }
                if(!checkPwd(password)){
                	return;
                }
        	    if (username != "" && password != "" && firstname != "" && lastname != "" && email != ""){
        	    	alert("Thanks for Signing Up");
        	    	document.getElementById("signupform").submit();
        	    }
			}
			function checkPwd(pwd) {
                //code
                var regLowCsLtr = /[a-z]+/;
                var regUpCsLtr = /[A-Z]+/;
                var regDigit = /\d+/;
                var regSpChar = /[~!@#\$%^&*\(\)\{\};,.\?\/'"]+/;
                if (!regLowCsLtr.test(pwd)) {
                    //code
                    alert("Password should contain at least 1 lower case letter");
                    document.getElementById("password").style.border="solid 1px #ff0000";
                    return false;
                }
                if (!regUpCsLtr.test(pwd)) {
                    //code
                    alert("Password should contain at least 1 upper case letter");
                    document.getElementById("password").style.border="solid 1px #ff0000";
                    return false;
                }
                if (!regDigit.test(pwd)) {
                    //code
                    alert("Password should contain at least 1 digit");
                    document.getElementById("password").style.border="solid 1px #ff0000";
                    return false;
                }
                if (!regSpChar.test(pwd)) {
                    //code
                    alert("Password should contain at least 1 special character");
                    document.getElementById("password").style.border="solid 1px #ff0000";
                    return false;
                }
                if (pwd.length < 8) {
                    //code
                    alert("Password should contain at least 8 characters");
                    document.getElementById("password").style.border="solid 1px #ff0000";
                    return false;
                }
                return true;
            }
		</script>
  </head>
  <body style="background-color: grey">
		<div>
			<form action="<%=path%>/signupck" method="post" id="signupform">
				<table>
					<tr>
						<td>
							<!-- for logo -->
						</td>
					</tr>
					<tr>
						<td>
							Username:
						</td>
						<td>
							<input type="text" id="username" name="usrname">
						</td>
						<td><div id="blankusername" style="display: none"><a style="color: red">*required</a></div></td>
					</tr>
					<tr>
						<td>
							Password:
						</td>
						<td>
							<input type="password" id="password" name="psword">
						</td>
						<td><div id="blankpassword" style="display: none"><a style="color: red">*required</a></div></td>
					</tr>
					<tr>
						<td>
							First Name:
						</td>
						<td>
							<input type="text" id="firstname" name="firstname">
						</td>
						<td><div id="blankfirstname" style="display: none"><a style="color: red">*required</a></div></td>
					</tr>
					<tr>
						<td>
							Last Name:
						</td>
						<td>
							<input type="text" id="lastname" name="lastname">
						</td>
						<td><div id="blanklastname" style="display: none"><a style="color: red">*required</a></div></td>
					</tr>
					<tr>
						<td>
							E-mail:
						</td>
						<td>
							<input type="text" id="email" name="email">
						</td>
						<td><div id="blankemail" style="display: none"><a style="color: red">*required</a></div></td>
					</tr>
					<tr>
						<td>
							<input type="button" value="Sign Up" onclick="signupcheck()">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>
