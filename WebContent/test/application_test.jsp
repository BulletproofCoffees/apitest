<%@page import="java.util.Objects"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application_test</title>
</head>
<body>
<%
	Object count = application.getAttribute("count");
	int i;
	if(Objects.isNull(count)){
		i = 1;
	} else {
		i = Integer.parseInt(count.toString()) + 1;
	}
	// 출력
	out.println("<h1>"+ i +"번째 방문</h1>");
	application.setAttribute("count", i);
%>
</body>
</html>



