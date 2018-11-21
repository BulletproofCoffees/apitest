기상 정보
<script>
	

	function search() {
		var areaCodes = $("select[name='areaCode']").val();		
		$(".search").empty();
		$.get("../../weather", {
			sidoName : areaCodes,
		
		}, function(data) {
			var obj = data;
			//JQuery
			var jq_obj = $(obj);
			//item
			var items = jq_obj.find("item"); //jquery객체	,items[0]은 script 객체					
			console.log(obj);
			console.log("item의 개수 : " + items.length);
			
			if (items.length == 0) {

				$(".search").append("<p>검색 결과 없음</p>");

			} else {
				for (var i = 0; i < items.length; i++) {
					
					$(".search").append(							
							$(items[i]).find("stationName").text()							
					);
				}
			}
		});
	}
</script>

<div class="row">


	
	<input type="text" class=" form-control col-sm-3" name="keyword"placeholder="키워드" />
	<div><button class="btn btn-primary " onclick="search()">search</button></div>
	</div>
	
	<div class="row search" style="
    margin-top: 20px;
"></div>