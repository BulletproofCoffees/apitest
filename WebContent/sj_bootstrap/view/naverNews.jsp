 <script type="text/javascript">

 function search() {
		
	 var queryv = $("input[name='textarea']").val(); 	 
	 var themev = "news";	 
	 var displayv = "30"; 	 	
	 var sortv = $("input[name='order']").val();; 
	 var startv = "1";
	 
	 $(".search").empty();
	
		$.get("../../nsearch2",
							{
								theme : themev,
								query : queryv,
								display : displayv,
								start : startv,
								sort : sortv
							},
							function(data) {
								var obj = data;
								console.log(obj);
								for ( var i in obj.items) {
									$(".search")
											.append(
													'<div class="col-sm-3 news img-thumbnail">'
															+ "<h5><a href='"+ obj.items[i].link + "' target='_blank'>"
															+ obj.items[i].title
															+ "</a></h5><p>"
															+ obj.items[i].pubDate
															+ "</p>"
															+ "<p>"
															+ obj.items[i].description
															+ "</p></div>");
								}
							});
		}
	</script>


<div class="row">
	<div><input type="text" class=" form-control" name="textarea"placeholder="검색어 입력" /></div>
	<div><button class="btn btn-primary " onclick="search()">검색</button></div>
</div>

  <div class="checkbox" style="margin-bottom:0;">
  <label><input type="checkbox" value="date" name='order'>유사도순</label>
  </div>
  <div class="checkbox disabled">
  <label><input type="checkbox" value="sim" name='order'> 날짜순</label>
  </div>

  
  
  
 <div class="container color img-thumbnail">
 
  <div class="row search"></div>

</div>

