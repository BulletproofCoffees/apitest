<script>

$(function ()
{var imgs = [ "https://cdn.crowdpic.net/detail-thumb/thumb_d_A84DF649DEFC1528602E35DD8375D9CD.jpg",
		         "http://ww2.sjkoreancatholic.org/files/testing_image.jpg",			
		         "https://cdn.pixabay.com/photo/2014/12/17/14/20/summer-anemone-571531_960_720.jpg"		
		       ];
 
	var rnd =0;
 for ( var i=0;  i<12; i++) {
	 rnd  = Math.floor( Math.random() * 5);
	 $(".col12")
		.append('<img src="'+imgs[rnd]+'"class="col-sm-1"  style="width: 100%;">');
						} 
 });



$(function () { 
	var mytheme = "news"; 
	 var myquery = "종이"; 
	 var mydisplay = "10"; 
	 var mystart = "1";
	 var mysort = "sim"; 
	 
	 
	 $(".search").empty();
	
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
			}		
		);
	
	
	
	

	     var mytheme = "blog"; 
		 var myquery = "검색어"; 
		 var mydisplay = "10"; 
		 var mystart = "2";
		 var mysort = "sim"; 
		 
		 $(".search2").empty();	
			$.get("../../nsearch",
					{theme : mytheme,
				     query : myquery,
					 display : mydisplay,
					 start : mystart,
					 sort : mysort},
					function(data2) {
				var obj = data2;				
				for ( var i in obj.items) {
						$(".search2")
								.append('<a href="'+obj.items[i].link+'">'+obj.items[i].title+'</a>'
										+obj.items[i].pubDat+"<p>"+obj.items[i].description+"</p>");
					}
			});
	});	 
</script>




    <div class="col12" style="background-color:lavender;"></div>
    <div class="row">
    
     <div class="col-sm-3"><div class="search2" ></div></div>
      <div class="col-sm-9"><div class="search" ></div>

 