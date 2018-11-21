 <script type="text/javascript">

	$(function () { 
     var mytheme = "shop"; 
	 var myquery = "원피스"; 
	 var mydisplay = "10"; 
	 var mystart = "1";
	 var mysort = "sim"; 
	 $(".search").empty();

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
									'<div class="col-sm-3">'
									+'<a href="'+obj.items[i].link+'">'
									+'<img src="'
								+obj.items[i].image
									+'"class=" col-sm-12 rounded-circle" alt="Cinque Terre">'
									+'</a>'
									+'<a href="'+obj.items[i].link+'" >'
									+obj.items[i].title
									+'</a><br>('
									+obj.items[i].mallName
									+")</p><p>"
									+obj.items[i].lprice
									+" &#8361;</p></div>");
				}
		});
});	
</script>


<div class="container">
  <div class="row search ">script</div>

</div>
