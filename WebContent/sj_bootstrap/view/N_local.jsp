

<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=lr8hH3EclsedpXn7HvJ0&submodules=geocoder"></script>



<style>
.text {
	font-size: 12px;
}
</style>

<script type="text/javascript">
	$(function() {
		$(".map").empty();
		var map = new naver.maps.Map('map');
		var myaddress = "";// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
		naver.maps.Service
				.geocode(
						{
							address : myaddress
						},
						function(status, response) {
							if (status !== naver.maps.Service.Status.OK) {
								return alert(myaddress
										+ '의 검색 결과가 없거나 기타 네트워크 에러');
							}
							var result = response.result;
							// 검색 결과 갯수: result.total
							// 첫번째 결과 결과 주소: result.items[0].address
							// 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
							var myaddr = new naver.maps.Point(
									result.items[0].point.x,
									result.items[0].point.y);
							map.setCenter(myaddr); // 검색된 좌표로 지도 이동
							// 마커 표시
							var marker = new naver.maps.Marker({
								position : myaddr,
								map : map
							});
							// 마커 클릭 이벤트 처리
							naver.maps.Event.addListener(marker, "click",
									function(e) {
										if (infowindow.getMap()) {
											infowindow.close();
										} else {
											infowindow.open(map, marker);
										}
									});
							// 마크 클릭시 인포윈도우 오픈
							var infowindow = new naver.maps.InfoWindow(
									{
										content : '<h4>아직안함</h4><a href="https://developers.naver.com" target="_blank"><img src="https://developers.naver.com/inc/devcenter/images/nd_img.png"></a>'
									});
						});
	});
	$(function() {
		var queryv = "네이버";
		var themev = "local";
		$(".search").empty();
		$
				.get(
						"../../nsearch",
						{
							theme : themev,
							query : queryv,
						},
						function(data) {
							var obj = data;
							console.log(obj);
							for ( var i in obj.items) {
								$(".search")
										.append(
												'<div class="container img-thumbnail" style="margin-bottom: 15px;">'
														+ "<h5><a  href='javascript:Map_search();'class='fff' id='furuit' value='"
														+ obj.items[i].address
														+ "'>"
														+ obj.items[i].title
														+ "</a></h5>"
														+ "<p>"
														+ "<a href='"+ obj.items[i].link + "' target='_blank'>"
														+ obj.items[i].link
														+ "</a>"
														+ "</p>"
														+ "<p class ='text'> 분류 : "
														+ obj.items[i].category
														+ "</p>"
														+ "<p class ='text'>지번 주소 : "
														+ obj.items[i].address
														+ "</p>"
														+ "<p class ='text'> 도로명 주소 : "
														+ obj.items[i].roadAddress
														+ "</p>"

														/* +"<p>"+obj.items[i].description  +"</p>" */
														+ "</div>");
							}
						});
	});

	function search() {
		var queryv = $("input[name='textarea']").val();
		var themev = "local";
		$(".search").empty();
		$
				.get(
						"../../nsearch",
						{
							theme : themev,
							query : queryv,
						},
						function(data) {
							var obj = data;
							console.log(obj);
							for ( var i in obj.items) {
								$(".search")
										.append(
												'<div class="container img-thumbnail" style="margin-bottom: 15px;">'
														+ "<h5><a  href='javascript:Map_search();'class='fff' id='furuit' value='"
														+ obj.items[i].address
														+ "'>"
														+ obj.items[i].title
														+ "</a></h5>"
														+ "<p>"
														+ "<a href='"+ obj.items[i].link + "' target='_blank'>"
														+ obj.items[i].link
														+ "</a>"
														+ "</p>"
														+ "<p class ='text'> 분류 : "
														+ obj.items[i].category
														+ "</p>"
														+ "<p class ='text'>지번 주소 : "
														+ obj.items[i].address
														+ "</p>"
														+ "<p class ='text'> 도로명 주소 : "
														+ obj.items[i].roadAddress
														+ "</p>"

														/* +"<p>"+obj.items[i].description  +"</p>" */
														+ "</div>");
							}
						});
	}

	$(document).on(
			"click",
			".fff",
			function Map_search() {
				$(".map").empty();
				var map = new naver.maps.Map('map');
				var myaddress = $(this).attr('value');// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)

				naver.maps.Service.geocode({
					address : myaddress
				}, function(status, response) {
					if (status !== naver.maps.Service.Status.OK) {
						return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
					}
					var result = response.result;
					// 검색 결과 갯수: result.total
					// 첫번째 결과 결과 주소: result.items[0].address
					// 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
					var myaddr = new naver.maps.Point(result.items[0].point.x,
							result.items[0].point.y);
					map.setCenter(myaddr); // 검색된 좌표로 지도 이동
					// 마커 표시
					var marker = new naver.maps.Marker({
						position : myaddr,
						map : map
					});
					// 마커 클릭 이벤트 처리
					naver.maps.Event.addListener(marker, "click", function(e) {
						if (infowindow.getMap()) {
							infowindow.close();
						} else {
							infowindow.open(map, marker);
						}
					});
					// 마크 클릭시 인포윈도우 오픈
					var infowindow = new naver.maps.InfoWindow({
						content : '<h4>' + myaddress + '</h4>'
					});
				});
			});
</script>






<div class="container">
	<div class="row">

		<div class="col-sm-4">

			<form method="post" onsubmit="return false;">
				<div class="row" style="margin: 20px;">
					<input type="text" class=" form-control" name="textarea"
						placeholder="검색어 입력" style="width: 226px;" />
					<button class="btn btn-primary " onclick="search()">검색</button>
				</div>
			</form>

			<div class="search" style="height: 100%;"></div>
		</div>


		<div class="col-sm-8" id="map" style="width: 100%; height: 600px;"></div>
	</div>
</div>

