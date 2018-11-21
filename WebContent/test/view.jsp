<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view.jsp</title>
</head>
<body>
<h1>REQUEST PARAMETER</h1>
<ul>
	<li>이름 : ${param.name}</li>
	<li>나이 : ${param.age}</li>
</ul>
<h1>REQUEST ATTRIBUTE</h1>
<ul>
	<li>이름 : ${requestScope.req_name}</li>
	<li>나이 : ${requestScope.req_age}</li>
</ul>
<ul>
	<li>이름 : ${req_name}</li>
	<li>나이 : ${req_age}</li>
</ul>
<h1>SESSION ATTRIBUTE</h1>
<ul>
	<li>이름 : ${sess_name}</li>
	<li>나이 : ${sess_age}</li>
</ul>
<h1>APPLICATIN ATTRIBUTE</h1>
<ul>
	<li>이름 : ${applicationScope.app_name}</li>
	<li>나이 : ${applicationScope.app_age}</li>
</ul>

</body>
</html>