 <script type="text/javascript">
//get방식으로 naver api의 json요청
	$(function () { 
     var mytheme = "shop"; 
	 var myquery = "검색어"; 
	 var mydisplay = "10"; 
	 var mystart = "2";
	 var mysort = "sim"; 
	 $(".search").empty();
	//get방식으로 naver api의 json 요청
		$.get("../../nsearch",
				{theme : mytheme,
			     query : myquery,
				 display : mydisplay,
				 start : mystart,
				 sort : mysort},
				function(data) {
			var obj = data;
			
			for ( var i in obj.items) {
					$(".search")
							.append(
									'<img src="'+obj.items[i].image+'" style="width: 300px; height: auto;">'
									+'<a href="'+obj.items[i].link+'">'
									+obj.items[i].title
									+'</a>'+"("
									+obj.items[i].mallName
									+")</p>"+"<p>"
									+obj.items[i].lprice
									+"원</p>");
				}
		});
});	
</script>


 
 <div class="search"> 컴파일</div>
