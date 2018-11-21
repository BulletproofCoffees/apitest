<script>
/* 구글폼 */
  (function() {
    var cx = '009759385012310547636:zvxf8l8uqn4';
    var gcse = document.createElement('script');
    gcse.type = 'text/javascript';
    gcse.async = true;
    gcse.src = 'https://cse.google.com/cse.js?cx=' + cx;
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(gcse, s);
  })();
  
  
 function g_search(){
		
		 var mysearch = $("input[name='gtext']").val(); 	
		 
		 $(".g").empty();
		
			$.get("../../google",				
									{
				search : mysearch,
					},
					function(data) {
						var obj = data;	
						
						console.log(obj);
						for ( var i in obj.items) {
							$(".g")
									.append(
							 '<p>'+obj.items[i].title+'</p>'							
							+'<p>'+obj.items[i].link+'</p>'
							+'<p>'+obj.items[i].displayLink+'</p>'
							
									);
		}			
					});
				}
	 
  
  
  
  
</script>
<gcse:search>
</gcse:search>



<div>
<input type="text" class="form-control" name="gtext"  placeholder="구글검색어">
<button class="btn btn-primary " onclick="g_search()" >검색</button>
</div>


<div class="g"></div>

