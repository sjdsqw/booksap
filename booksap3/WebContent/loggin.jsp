<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="background-color: yellow; border: 1px solid red; width:100%; height:150px ;float: left; ">  </div>
	<div style="background-color: yellow; border: 1px solid red; width:100%; height:350px;float: left; ">  
	    <div style=" width: 45%;height:100%; background:url(./images/log.png); float: left; margin-left: 70px; " >	 </div>
	
	  <div style=" width: 45%;height:100%; background-color:#611E01; float: left;   " >
	     <div style="float:left;margin-left: 150px; margin-top: 90px;line-height: 50px; " >

	   
	     <form action="admin.form">
	     	     ${information}  <br>
	     	     <% request.setAttribute("information", ""); %>
	   
	     <p1>用户名:&nbsp&nbsp</p1><input type="text" name="id" size="10"><br>
	     <p1>密码: &nbsp &nbsp&nbsp</p1><input type="text" name="password"size="10" ><br>
	     <input type="submit" value="提交">&nbsp &nbsp &nbsp &nbsp     <input type="reset" value="重置">
	     </form>
	     </div>
	  </div>
	</div>
		<div style="background-color: yellow; border: 1px solid red; width:100%; height:150px ; float: left">  </div>
</body>
</html>