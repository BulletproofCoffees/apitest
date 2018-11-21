<script>

	function chageLangSelect() {
		
		var sidos = $("select[name='seoul_gu']").val();
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

					for (var i = 0; i < items.length; i++) {
						$("#gungu").append(
								"<option value="
										+ $(items[i]).find('code').text()
										+ ">"
										+ $(items[i]).find('name').text()
										+ "</option>");
					}

				});
	}
	
	

	
</script>
<!-- CONTENT -->

<select name="seoul_gu" id="select" onchange="chageLangSelect()">
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

	
	
	<select id="gungu">
	 <option >구선택</option>
	 </select>
