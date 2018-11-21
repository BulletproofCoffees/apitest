<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  </head>
  <body>
    
    <script>
    $(function () {	
      var jbString = '서울특별시 영등포구 여의도동 2';
      var jbSplit = jbString.split(" ");
      for ( var i in jbSplit ) {
        document.write(jbSplit[i] + ',' );
      }});    
    </script>
  </body>
</html>
