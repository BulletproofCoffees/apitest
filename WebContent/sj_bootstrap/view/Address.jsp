<script>
	

	function chageLangSelect() {
		var sidos = $("select[name='areaCode']").val();
		$("#gungu").empty();

		$.get("../../api_gungn", {
			sido : sidos
		},
				function(data) {
					var obj = data;
					//JQuery
					var jq_obj = $(obj);
					//item
					var items = jq_obj.find("item"); //jquery객체	,items[0]은 script 객체
					console.log(obj);
					console.log("item의 개수 : " + items.length);
					console.log("items의 첫번째 구 이름 : "
							+ $(items[0]).find("name").text());
					
					$("#gungu").append('<option value="">선택 안함</option>');					
					for (var i = 0; i < items.length; i++) {
						$("#gungu").append(
								"<option value="
										+ $(items[i]).find('code').text() + ">"
										+ $(items[i]).find('name').text()
										+ "</option>");
					}
				});
	}

	function search() {
		var areaCodes = $("select[name='areaCode']").val();
		var sigunguCodes = $("select[name='gungu']").val();
		var keywords = $("input[name='keyword']").val();
		var arranges = $("select[name='arrange']").val();
		$(".search").empty();

		$.get("../../tour_proxy", {
			areaCode : areaCodes,
			sigunguCode : sigunguCodes,
			keyword : keywords,
			arrange : arranges
		}, function(data) {
			var obj = data;
			//JQuery
			var jq_obj = $(obj);
			//item
			var items = jq_obj.find("item"); //jquery객체	,items[0]은 script 객체					
			console.log(obj);
			console.log("item의 개수 : " + items.length);
			console
					.log("items의 첫번째 구 이름 : "
							+ $(items[0]).find("addr1").text());

			if (items.length == 0) {

				$(".search").append("<p>검색 결과 없음</p>");

			} else {
				for (var i = 0; i < items.length; i++) {
					console.log("검색 값: " + $(items[i]).find("addr1").text());

					$(".search").append(
							'<div class="col-sm-4 ">' + '<div><img src="'
									+ $(items[i]).find("firstimage").text()
									+ '"  style="width: 300px;"></div>'

									+ "<p>" + $(items[i]).find("addr1").text()
									+ "</p>" + "<p>"
									+ $(items[i]).find("addr2").text() + "</p>"
									+ "</div>");
				}
			}
		});
	}
</script>

<div class="row">

<select name="areaCode" id="select" onchange="chageLangSelect()">
	<option>시선택</option>
	<option value="1">서울</option>
	<option value="2">인천</option>
	<option value="3">대전</option>
	<option value="4">대구</option>
	<option value="5">광주</option>
	<option value="6">부산</option>
	<option value="7">울산</option>
	<option value="8">세종특별자치시</option>
	<option value="31">경기도</option>
	<option value="32">강원도</option>
	<option value="33">충청북도</option>
	<option value="34">충청남도</option>
	<option value="35">경상북도</option>
	<option value="36">경상남도</option>
	<option value="37">전라북도</option>
	<option value="38">전라남도</option>
	<option value="39">제주도</option>
</select> 

    <select name="gungu" id="gungu">
		<option>구선택</option>
	</select>
	 
	<select name="arrange">
		<option>정렬</option>
		<option value="A">제목순</option>
		<option value="B">조회순</option>
		<option value="C">수정일순</option>
		<option value="D">생성일순</option>
		<option>대표이미지 있음</option>
		<option value="O">제목순</option>
		<option value="P">조회순</option>
		<option value="Q">수정일순</option>
		<option value="R">생성일순</option>
	</select> 
	
	<input type="text" class=" form-control col-sm-3" name="keyword"placeholder="키워드" />
	<div><button class="btn btn-primary " onclick="search()">search</button></div>
	</div>
	
	<div class="row search" style="
    margin-top: 20px;
"></div>