<%@page import="java.util.Objects"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session_test.jsp</title>
</head>
<body>
<%
	Object count = session.getAttribute("count");
	int i;
	if(Objects.isNull(count)){
		i = 1;
	} else {
		i = Integer.parseInt(count.toString()) + 1;
	}
	// 출력
	out.println("<h1>"+ i +"번째 방문</h1>");
	session.setAttribute("count", i);
%>
</body>
</html>





