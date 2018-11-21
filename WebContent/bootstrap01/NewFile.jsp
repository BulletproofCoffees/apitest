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
function search() { 
	 var myquery = $("input[name='query']").val(); 
	 var mydisplay = "10"; 
	 var mystart = "1";
	 var mysort = "sim"; 
	 $(".row").empty();
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
					$(".row")
							.append(
									"<div class='col-sm-4'><h3><a href='"+ obj.items[i].link + "' target='_blank'>"
											+ obj.items[i].title
											+ "</a></h3><p>"
											+ obj.items[i].pubDate
											+ "</p>"
											+ "<p>"
											+ obj.items[i].description
											+ "</p>"
											+ "</div>");
				}
		});
}
	
	


</script>
</head>
<body>
<!-- TOP -->
<div class="jumbotron text-center">
  <h1>YCJ WEBSITE NAVER NEWS</h1>
  <p><input type="text" name="query"> <input type="button" class="btn btn-primary " value="검색" onclick="search()"></p> 
</div>
  <!-- CONTENT -->
<div class="container">
  <div class="row">
  </div>
</div>

<!-- BOTTOM -->
<div class="jumbotron text-center">
  <h6>YCJ COMPANY</h6>
  <p>All rights reserved © YCJ</p> 
</div>


</body>
</html>