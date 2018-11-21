<%@page import="java.io.InputStreamReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>realpath_test.jsp</title>
</head>
<body>
	<%
		String respath = "/test/test.txt";
		String rpath = application.getRealPath(respath);
		out.println("리얼패스 : " + rpath);

		char[] buff = new char[128];
		int len = -1;

		out.print("<h1>");
		try (InputStreamReader br = new InputStreamReader(application.getResourceAsStream(respath), "utf-8")) {
			while ((len = br.read(buff)) != -1) {
				out.print(new String(buff, 0, len));
			}
		} catch(Exception e){
			out.println("예외 : " + e.getMessage());			
		}
		out.print("</h1>");
	%>
</body>
</html>