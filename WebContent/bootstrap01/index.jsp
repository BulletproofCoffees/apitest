<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>



 <script type="text/javascript">
//get방식으로 naver api의 json요청
	$(function () { 
	 var myquery = "검색어"; 
	 var mydisplay = "10"; 
	 var mystart = "2";
	 var mysort = "sim"; 
	 $(".search").empty();
	//get방식으로 naver api의 json 요청
		$.get("../nsearch",
				{theme : "news",
				query : myquery,
				display : mydisplay,
				start : mystart,
				sort : mysort},
				function(data) {
			var obj = data;
			console.log(obj);
			for ( var i in obj.items) {
					$(".search")
							.append(
									"<h5><a href='"+ obj.items[i].link + "' target='_blank'>"
											+ obj.items[i].title
											+ "</a></h5><p>"
											+ obj.items[i].pubDate
											+ "</p>"
											+ "<p>"
											+ obj.items[i].description
											+ "</p>");
				}
		});
});	
</script>


</head>
<body>

<div class="jumbotron text-center">
  <h1>My js WEBSITE</h1>  
  <a href="${pageContext.request.contextPath}/#">HOME</a>
  <a href="${pageContext.request.contextPath}/#">HOME</a>       
</div>
 
 
 
  
<div class="container">
 

  <div class="row">
  <div class="search">
  </div>
  </div>
</div>




<div class="jumbotron text-center" >
  
  <p>COPYRIGHT &COPY; GSS WEBSITE</p> 
</div>

</body>
</html>