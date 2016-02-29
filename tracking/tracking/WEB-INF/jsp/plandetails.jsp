<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Plan Details</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta name="author" content="Ziyue Zhong" />
	<meta name="charset" content="UTF-8" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/div.css">
	<script>
		$(document).ready(function(){
			var json = $("#plan").val();
			var plan = JSON.parse(json);
			$("#planname").html(plan.planname);
			$("#plancontent").html(plan.plancontent);
			$("#completedate").html(plan.completedate);
			$("#pid").val(plan.id);
			var submission = plan.result;
			if(submission == ""){
				$("#notcomplete").css("display","");
				$("#complete").css("display","none");
				$("#submitit").css("display","");
			}else{
				$("#notcomplete").css("display","none");
				$("#complete").css("display","");
				$("#submitit").css("display","none");
				var element = "<tr><td><iframe width=\"560\" height=\"315\" src=\"" + plan.result + "\" frameborder=\"0\" allowfullscreen></iframe></td></tr>";
				$("#plandetails").append(element);
			}
		});
		function submitit(){
			var link = $("#youtubelink").val();
			if (link == ""){
        		document.getElementById("blanklink").style.display="block";
        	    document.getElementById("youtubelink").style.border="solid 1px #ff0000";
        	    return;
        	}else{
        	    document.getElementById("blanklink").style.display="none";
        	    document.getElementById("youtubelink").style.border="solid 1px #000000";
        	    document.getElementById("submitform").submit();
        	}
		}
		function goback(){
			document.getElementById("gobackform").submit();
		}
	</script>
  </head>
  
  <body style="background-color: grey">
  	<form action="goback" id="gobackform" method="post">
  		<table>
  			<tr>
  				<td>
  					<a onclick="goback()" style="border-bottom:1px solid #0FF;color:#00F;cursor:pointer">Go Back</a>
  					<input type="hidden" id="usrname" name="usrname" value="${username}"/>
  				</td>
  			</tr>
  		</table>
  	</form>
    <table id="plandetails">
    	<tr>
    		<td>
    			Plan Name:
    		</td>
    		<td>
    			<span id="planname"></span>
    		</td>
    	</tr>
    	<tr>
    		<td>
    			Plan Content:
    		</td>
    		<td>
    			<span id="plancontent"></span>
    		</td>
    	</tr>
    	<tr>
    		<td>
    			Plan Complete Date:
    		</td>
    		<td>
    			<span id="completedate"></span>
    			<input type="hidden" id="plan" name="plan" value=${plan}>
    		</td>
    	</tr>
    	<tr>
    		<td>
    			Status:
    		</td>
    		<td>
    			<div id="complete"><a style="color:green">Complete</a></div>
    			<div id="notcomplete"><a style="color:red">Not Complete</a></div>
    			
    		</td>
    	</tr>
    </table>
    <div id="submitit">
	    <form action="worksubmit" id="submitform" method="post">
	    	<table>
	    		<tr>
	    			<td>
    					<br><br><br><br>Please submit your video!
    				</td>
    			</tr>
    			<tr>
    				<td>
   		 				YouTube Link:
    				</td>
    				<td>
    					<input tpye="text" id="youtubelink" name="youtubelink">
    					<td><div id="blanklink" style="display: none"><a style="color: red">*required</a></div></td>
    					<input type="hidden" id="pid" name="pid" value=""/>
    					<input type="hidden" id="username" name="username" value="${username}"/>
   		 			</td>
    			</tr>
    			<tr>
    				<td>
    					<input type="button" onclick="submitit()" value="submit">
    				</td>
    			</tr>
    		</table>
    	</form>
    </div>
  </body>
</html>
