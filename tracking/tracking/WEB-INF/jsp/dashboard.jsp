<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
		<title>Dash Board</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta name="author" content="Ziyue Zhong" />
		<meta name="charset" content="UTF-8" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/div.css">
		<script>
			$(document).ready(function(){
				var json = $("#planlist").val();
				var plans = JSON.parse(json);
				var currentdate = new Date();
				var year = currentdate.getFullYear();
        		var month = currentdate.getMonth();
        		var day = currentdate.getDate();
				var currentsum = year * 365 + (month+1) * 30 + day * 1;
				var part1 = "<option value='";
                var part2 = "'>";
                var part3 = "</option>"
				for(i=0;i<plans.length;i++){
					var plan = plans[i];
					var id = plan.id;
					var name = plan.planname;
					var datestring = plan.completedate;
					var date = datestring.split("-");
					var datesum = date[0] * 365 + date[1] * 30 + date[2] * 1;
					if(datesum - currentsum < 5){
						name = name + "*";
					}
					var total = part1 + id + part2 + name + part3;
					$("#planid").append(total);
				}
			});
			function addplan(){
				document.getElementById("addplanform").submit();
			}
			function details(){
				var planid = $("#planid").val();
				if(planid == "blank"){
					alert("Please select a plan!");
					return;
				}
				document.getElementById("plandetailsform").submit();
			}
		</script>
  </head>
  
  <body style="background-color: grey">
  	<input type="hidden" id="planlist" name="planlist" value=${planlist}>
    <form action="<%=path%>/addplan" method="post" id="addplanform">
    	<table>
    		<tr>
    			<td>
    				Hi,${username}
    			</td>
    			<td>
    				<input type="hidden" id="username" name="username" value="${username}">
    				&nbsp&nbsp<input type="button" onclick="addplan()" value="Add A Plan">
    			</td>
    		</tr>
    		<tr>

    		</tr>
    	</table>
    </form>
    <div style="position:absolute;left:30%;top:25%">
    	<form action="<%=path%>/viewplan" method="post" id="plandetailsform">
	    	<table>
	    		<tr>
	    			<td>
	    				&nbspPlease Select a Plan:
	    			</td>
	    			<td>
	    				<input type="hidden" name="username" value="${username}">
	    				&nbsp&nbsp&nbsp
	    				<select id="planid" name="planid">
	    					<option value="blank">Select One</option>
	    				</select>
	    			</td>
	    			<td>
	    				<input type="button" onclick="details()" value="details">
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	    <table>
	    	<tr>
	    		<td>
	    			<img src="<%=basePath%>/sources/govan.jpg">
	    		</td>
	    	</tr>
	    </table>
    </div>
  </body>
</html>
