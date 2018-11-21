<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>init_parameter.jsp</title>
</head>
<body>
<h1>데이터베이스 접속정보</h1>
<ul>
	<li>아이피 : <%= application.getInitParameter("database_ip") %></li>
	<li>아이디 :  <%= application.getInitParameter("database_id") %></li>
	<li>비밀번호 :  <%= application.getInitParameter("database_pwd") %></li>
</ul>
</body>
</html>




