<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en"><head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



  <title>Bootstrap 4 Website Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="/web_dh/project_dh/css/global.css">
  <style>
  .fakeimg {
      height: 200px;
      background: #aaa;
  }
  </style>

   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
   <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
		
	<title> youtube api test </title>
	<style>
		p.box { border:1px solid #000; }
	</style>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		function fnGetList(sGetToken){
			var $getval = $("#search_box").val();
			if($getval==""){
				alert("검색어를 입력하세요.");
				$("#search_box").focus();
				return;
			}
			$("#get_view").empty();
			$("#nav_view").empty()


			var sTargetUrl = "https://www.googleapis.com/youtube/v3/search?part=snippet&order=relevance"
								+ "&q="+ encodeURIComponent($getval) +"&key=AIzaSyAXgAil5ZDB0KYFM7cvYDy7iPHcUQeY2bg";
			if(sGetToken){
				sTargetUrl += "&pageToken="+sGetToken;
			}
			$.ajax({
				type: "POST",
				url: sTargetUrl,
				dataType: "jsonp",
				success: function(jdata) {
					console.log(jdata);

					$(jdata.items).each(function(i){
						//console.log(this.snippet.channelId);
						$("#get_view").append("<p class='box'><a href='https://youtu.be/"+this.id.videoId+"' target='_blank'><img src='"+this.snippet.thumbnails.default.url+"'><span>"+this.snippet.title+"</span></a></p>");
					}).promise().done(function(){
						if(jdata.prevPageToken){
							$("#nav_view").append("<a href='javascript:fnGetList(\""+jdata.prevPageToken+"\");'><이전페이지></a>");
						}
						if(jdata.nextPageToken){
							$("#nav_view").append("<a href='javascript:fnGetList(\""+jdata.nextPageToken+"\");'><다음페이지></a>");
						}
					});
				},
				error:function(xhr, textStatus) {
					console.log(xhr.responseText);
					alert("지금은 시스템 사정으로 인하여 요청하신 작업이 이루어지지 않았습니다.\n잠시후 다시 이용하세요.[2]");
					return;
				}
			});
		}
	</script>



	<form name="form1" method="post" onsubmit="return false;">
		<input type="text" id="search_box"><button onclick="fnGetList();">유튜브 검색</button>
	</form>
	<div id="get_view"></div>
	<div id="nav_view"></div>




</body></html>