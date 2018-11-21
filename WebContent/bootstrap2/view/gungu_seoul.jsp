<script type="text/javascript">
//get방식으로 naver api의 json요청
	$(function() {
		$.get("../../apiexpsvl", function(data) {
			//alert(data);
			var obj = data;
			console.log(obj);
			// news를 화면에 출력
			for ( var i in obj.items) {
			/* 	$('#list').append(obj) */
			}
			

		});
	});
</script>
<!-- CONTENT -->

<h1>시군구 코드</h1>
<select name="list">
            <option value="1">서울</option>
            


</select>
	
