<style>
ui {
	
}

li {
	list-style: none;
}

.movie {
box-shadow: 0 1px 3px rgba(0, 0, 0, 1), 0 1px 2px rgba(0, 0, 0, 1);
	width: 300px;
	background-color: #727272;
	padding: 15px;
}

.movietext {
	color: #d1d1d1;
}

.movie2 {
	border-top-width: 1px;
	padding-bottom: 10px;
	padding-top: 10px;
}

.movie2:hover {
	background-color: #8c8c8c;
}
.fff:hover {color: #e0e0e0;}

.a_text{ font-size: 20px;}
</style>
<script type="text/javascript">

 $(function() {	
		$.get("../../movie",		
	function(data) {
					var obj = data;
					var jq_obj = $(obj);
					var dailyBoxOffice = jq_obj.find("dailyBoxOffice");					
					for ( var i=0; i<dailyBoxOffice.length; i++) {	
						
						 var myquery = $(dailyBoxOffice[i]).find('movieNm').text();						
							$.get("../../n_movie",				
												{query : myquery,},
									function(data) {
										var obj = data;				
											$(".n_movie").append(
													
													'<div class="row container img-thumbnail" style="margin-bottom: 15px;">'														
													+'<div class=" col-sm-4">'
													+'<img src="'+obj.items[0].image+'" style="width: 150px; box-shadow: 0 1px 3px rgba(0, 0, 0, 0.5), 0 1px 2px rgba(0, 0, 0, 0.25);">'
													+'</div>'
													+'<div class=" col-sm-8">'
													+"<p><a href='"+ obj.items[0].link + "' target='_blank' class='a_text'>"+ obj.items[0].title + "</a>"
													+'('+obj.items[0].pubDate +')</p>'
													+'<p>'+obj.items[0].director +'</p>'
													+'<p> 네이버 평점 :'+obj.items[0].userRating+'</p>'
													+'</div>'
													+'</div>');					
									});
						
						if ($(dailyBoxOffice[i]).find('rankOldAndNew').text() == 'NEW') {
							$(".search").append(										
									'<li><div class="movie2 movietest rounded"><div class="row">'
							+"<a  href='javascript:Map_search();'class='fff col-sm-9 movietext' id='furuit' value='"
							+$(dailyBoxOffice[i]).find('movieNm').text()+"'>"+ $(dailyBoxOffice[i]).find('movieNm').text()+"</a>"													
									+'<a class="col-sm-3">'+$(dailyBoxOffice[i]).find('rankOldAndNew').text()+'</a>'
									+'</div></div></li>'
									 );
						} else {
						$(".search").append(										
								'<li><div class="movie2 movietext rounded"><div class="row">'
							+"<a  href='javascript:Map_search();'class='fff col-sm-9 movietext' id='furuit' value='"
							+$(dailyBoxOffice[i]).find('movieNm').text()+"'>"+ $(dailyBoxOffice[i]).find('movieNm').text()+"</a>"													
								+'</div></div></li>'
								 );
						}					
					}					
				});		
	});
 
 
 $(document).on("click",".fff",function N_search(){
	
	 var myquery = $(this).attr('value'); 
	
	 console.log("dd  "+myquery);
	 
	 $(".n_movie").empty();
	
		$.get("../../n_movie",				
								{
				query : myquery,
				},
				function(data) {
					var obj = data;				
						$(".n_movie").append(
								'<div class="row container img-thumbnail" style="margin-bottom: 15px;">'
								+'<div class=" col-sm-4">'
								+'<img src="'+obj.items[0].image+'" style="width: 150px; box-shadow: 0 1px 3px rgba(0, 0, 0, 0.5), 0 1px 2px rgba(0, 0, 0, 0.25);">'
								+'</div>'
								+'<div class=" col-sm-8">'
								+"<p><a href='"+ obj.items[0].link + "' target='_blank' class='a_text'>"+ obj.items[0].title + "</a>"
								+'('+obj.items[0].pubDate +')</p>'
								+'<p>'+obj.items[0].director +'</p>'
								+'<p> 네이버 평점 :'+obj.items[0].userRating+'</p>'
								+'</div>'
								+'</div>');					
				});
			});
 
 
 function n_movie_search() {		
	 var myquery = $("input[name='textarea']").val(); 	 
	
	 $(".n_movie").empty();	

		$.get("../../n_movie",				
								{
				query : myquery,
				},
				function(data) {
					var obj = data;	
					for ( var i in obj.items) {
						$(".n_movie").append(
								'<div class="row container img-thumbnail" style="margin-bottom: 15px;">'
								+'<div class=" col-sm-4">'
								+'<img src="'+obj.items[i].image+'" style="width: 150px; box-shadow: 0 1px 3px rgba(0, 0, 0, 0.5), 0 1px 2px rgba(0, 0, 0, 0.25);">'
								+'</div>'
								+'<div class=" col-sm-8">'
								+"<p><a href='"+ obj.items[i].link + "' target='_blank' class='a_text'>"+ obj.items[i].title + "</a>"
								+'('+obj.items[i].pubDate +')</p>'
								+'<p>'+obj.items[i].director +'</p>'
								+'<p> 네이버 평점 :'+obj.items[i].userRating+'</p>'
								+'</div>'
								+'</div>');		
					}
				});
 }
 
 /*미완성  */
function kofic_movie_search() {
		
	 var mymovieNm = $("input[name='textarea2']").val(); 	 
	
	 
	 $(".n_movie").empty();
	
		$.get("../../kofic_movie",				
				{
			movieNm : mymovieNm,
			},
	function(data) {
					var obj = data;
					var jq_obj = $(obj);
					var movieList = jq_obj.find("movieList");
					console.log(obj);
					console.log("dailyBoxOffice의 개수 : " + movieList.length);
					console.log(" 첫번째 movieNm : "+ $(movieList[0]).find("movieNm").text());
					for ( var i=0; i<movieList.length; i++) {
						
						$(".n_movie")
								.append('<div class="row container img-thumbnail" style="margin-bottom: 15px;">'
										+'<div class=" col-sm-4">'
										+ $(movieList[i]).find("movieNm").text()
										+'</div>'
										+'</div>'
										 
										
										 );
					
					}
					

				});
	}
 
</script>

<div class="row" style="margin: 20px;">
<input type="text" class=" form-control" name="textarea" placeholder="네이버 영화검색" style="width: 226px;">
	<button class="btn btn-primary " onclick="n_movie_search()">검색</button>
</div>

<!-- <div class="row" style="margin: 20px;">
<input type="text" class=" form-control" name="textarea2" placeholder="영화진흥위원회 영화검색" style="width: 226px;">
	<button class="btn btn-primary " onclick="kofic_movie_search()">검색</button>xxxxxx
</div> -->
  
  
<div class="row">
<div class="container rounded n_movie col-sm-8" ></div>


<div  class=" col-sm-4">
<div class=" movie rounded ">
	<div class="movietext">
		<p>일일 박스오피스</p>
	</div>
	<ul class="search" style="padding-left: 0px;">


	</ul>

</div>
</div>

</div>
 
