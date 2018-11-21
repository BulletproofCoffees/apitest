<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
<script type="text/javascript">

 $(function() {
		
	 var queryv = $("input[name='textarea']").val(); 	 
	
	 
	 $(".search").empty();
	
		$.get("../web/movie",
		
	function(data) {
					var obj = data;
					var jq_obj = $(obj);
					var dailyBoxOffice = jq_obj.find("dailyBoxOffice");
					console.log(obj);
					console.log("dailyBoxOffice의 개수 : " + dailyBoxOffice.length);
					console.log("dailyBoxOffice의 첫번째 movieNm : "+ $(dailyBoxOffice[0]).find("movieNm").text());
					for ( var i=0; i<dailyBoxOffice.length; i++) {
					
						$(".search")
								.append("<p>"
										+ $(dailyBoxOffice[i]).find('movieNm').text()
										+ "</p>"
										 
										
										 );
					}
					

				});
	});
</script>




  
  
 <div class="container color img-thumbnail">
 
  <div class="row search"></div>

</div>

</body>
</html>

