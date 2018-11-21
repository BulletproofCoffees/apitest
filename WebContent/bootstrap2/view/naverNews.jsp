 <script type="text/javascript">
//get방식으로 naver api의 json요청
	$(function () { 
	 var myquery = "방탄"; 
	 var mydisplay = "100"; 
	 var mystart = "1";
	 var mysort = "sim"; 
	 $(".search").empty();
	//get방식으로 naver api의 json 요청
		$.get("../../nsearch",
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
  
 <div class="search">컴파일</div>

