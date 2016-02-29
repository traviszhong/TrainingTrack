<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<title>Add A Plan</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta name="author" content="Ziyue Zhong" />
	<meta name="charset" content="UTF-8" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/div.css">
	<script>
		function add(){
			var planname = $("#planname").val();
			var plancontent = $("#plancontent").val();
			var completedate = $("#completedate").val();
			if (planname == "") {
        	    document.getElementById("blankplanname").style.display="block";
        	    document.getElementById("planname").style.border="solid 1px #ff0000";
        	    return;
        	}else{
        	    document.getElementById("blankplanname").style.display="none";
        	    document.getElementById("planname").style.border="solid 1px #000000";
        	}
        	if (plancontent == "") {
        	    document.getElementById("blankcontent").style.display="block";
        	    document.getElementById("plancontent").style.border="solid 1px #ff0000";
        	    return;
        	}else{
        	    document.getElementById("blankcontent").style.display="none";
        	    document.getElementById("plancontent").style.border="solid 1px #000000";
        	}
        	if (completedate == "") {
        	    document.getElementById("blankdate").style.display="block";
        	    document.getElementById("completedate").style.border="solid 1px #ff0000";
        	    return;
        	}else{
        	    document.getElementById("blankdate").style.display="none";
        	    document.getElementById("completedate").style.border="solid 1px #000000";
        	}
        	var date = completedate.split("-");
        	var currentdate = new Date();
        	var year = currentdate.getFullYear();
        	var month = currentdate.getMonth();
        	var day = currentdate.getDate();
        	var currentsum = year * 365 + (month+1) * 30 + day * 1;
        	var plansum = date[0] * 365 + date[1] * 30 + date[2] * 1;
        	if(currentsum > plansum){
        		alert("The date cannot be earlier than current date!");
        		completedate="";
        		document.getElementById("blankdate").style.display="block";
        	    document.getElementById("completedate").style.border="solid 1px #ff0000";
        	    return;
        	}
        	if(planname != "" && plancontent != "" && completedate != ""){
        		document.getElementById("addplanform").submit();
        	}
		}
	</script>
  </head>
  
  <body style="background-color: grey">
  	<div>
  		<form action="<%=path%>/addplanck" method="post" id="addplanform">
  			<table>
  				<tr>
  					<td>
  						Plan Name:
  					</td>
  					<td>
						<input type="text" id="planname" name="planname">
					</td>
					<td><div id="blankplanname" style="display: none"><a style="color: red">*required</a></div></td>
  				</tr>
  				<tr>
  					<td>
  						Plan Content:
  					</td>
  					<td>
						<input type="text" id="plancontent" name="plancontent">
					</td>
					<td><div id="blankcontent" style="display: none"><a style="color: red">*required</a></div></td>
  				</tr>
  				<tr>
  					<td>
  						Complete Date:
  					</td>
  					<td>
  						<input type="date" id="completedate" name="completedate">
  					</td>
  					<td><div id="blankdate" style="display: none"><a style="color: red">*Invalid</a></div></td>
  				</tr>
  				<tr>
  					<td>
  						<input type="hidden" name="username" id="username" value="${username}">
  						<input type="button" onclick="add()" value="Add Plan">
  					</td>
  				</tr>
  			</table>
  		</form>
  	</div>
  </body>
</html>
