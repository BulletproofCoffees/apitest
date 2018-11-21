<script>
$(function () {
	$.get(
		"../../api_sido"
		, {}
		,function(data){
			var obj = data;
			console.log(obj);
 			var itemarr = $(obj).find("item"); //제이쿼리 컬렉션객체
 			for(var i=0; i < itemarr.length; i++){
			$("select[name='sido']").append("<option value='" 
					+ $(itemarr[i]).children("code").text() + "'>"
					+ $(itemarr[i]).children("name").text() + "</option>");
 			}
		}
	);
	gungu("0");
});

function gungu(val) {
	$("select[name='gungu']").empty();
	$("select[name='gungu']").append("<option value='0'>전체</option>");
	if( val != 0){
	$.get(
			"../../api_gungu"
			, {sido : val}
			,function(data){
				var obj = data;
				console.log(obj);
	 			var itemarr = $(obj).find("item");
	 			for(var i=0; i < itemarr.length; i++){
				$("select[name='gungu']").append("<option value='" 
						+ $(itemarr[i]).children("code").text() + "'>"
						+ $(itemarr[i]).children("name").text() + "</option>");
	 			}
			}
		);
	}
}

function search() {
	$(".search").empty();
	var msido = $("select[name='sido']").val();
	var mgungu = $("select[name='gungu']").val();
	var mkeyword = $("input[name='keyword']").val();
	if(mkeyword == ""){
		mkeyword = " ";
	}
	$.get(
			"../../tour_proxy"
			, {areaCode : msido,
				sigunguCode : mgungu,
				keyword : mkeyword}
			,function(data){
				var obj = data;
				console.log(obj);
	 			var itemarr = $(obj).find("item");
	 			for(var i=0; i < itemarr.length; i++){
				$(".search").append("<div class='card flex-row flex-wrap' style='margin: 10px 0; width: 100%;'>"
						+ "<div class='card-header border-0'><img alt='' src='"
						+ $(itemarr[i]).children("firstimage").text() + "'></div><div class='card-block px-2'><h3 style='margin-top: 10px;'>"
						+ $(itemarr[i]).children("title").text() + "</h3>"
						+ "<p style='color: gray;'>" +$(itemarr[i]).children("tel").text() + "</p>"
						+ "<p>" +$(itemarr[i]).children("addr1").text() + "</p>"
						+"</div>"
						+ "<div class='card-footer w-100 text-muted'>위치 : "+ $(itemarr[i]).children("mapx").text() + ", "
						+ $(itemarr[i]).children("mapy").text()
				        +"</div></div>"		
				);
	 			
	 			}
	 			
	 			
	 			
	 			
	 			
			}
		);
}
</script>

<div class="container">
<div class="jumbotron text-center">
  <h1>관광지 검색</h1>
		<select name="sido" onchange="gungu(this.value)">
			<option value="0">전국</option>
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
		<select name="gungu"><option value="0">전체</option><option value="1">강남구</option><option value="2">강동구</option><option value="3">강북구</option><option value="4">강서구</option><option value="5">관악구</option><option value="6">광진구</option><option value="7">구로구</option><option value="8">금천구</option><option value="9">노원구</option><option value="10">도봉구</option><option value="11">동대문구</option><option value="12">동작구</option><option value="13">마포구</option><option value="14">서대문구</option><option value="15">서초구</option><option value="16">성동구</option><option value="17">성북구</option><option value="18">송파구</option><option value="19">양천구</option><option value="20">영등포구</option><option value="21">용산구</option><option value="22">은평구</option><option value="23">종로구</option><option value="24">중구</option><option value="25">중랑구</option></select>
<input type="text" name="keyword">
<button class="btn btn-primary" onclick="search()">검색</button>
  </div>
  <div class="row search">
  </div>
  <div class="row search"><div class="card flex-row flex-wrap" style="margin: 10px 0; width: 100%;"><div class="card-header border-0"><img alt="" src="../imgs/noimage.jpg"></div><div class="card-block px-2"><h3 style="margin-top: 10px;">강남 마이스 관광특구</h3><p style="color: gray;"></p><p>서울특별시 강남구 영동대로 513</p></div><div class="card-footer w-100 text-muted">위치 : 127.0591318945, 37.5118092746</div></div><div class="card flex-row flex-wrap" style="margin: 10px 0; width: 100%;"><div class="card-header border-0"><img alt="" src="http://tong.visitkorea.or.kr/cms/resource/79/1867579_image2_1.jpg"></div><div class="card-block px-2"><h3 style="margin-top: 10px;">뉴 힐탑 관광호텔</h3><p style="color: gray;">02-540-1121, 02-514-3616</p><p>서울특별시 강남구 논현로 645</p></div><div class="card-footer w-100 text-muted">위치 : 127.0314233254, 37.5111033028</div></div><div class="card flex-row flex-wrap" style="margin: 10px 0; width: 100%;"><div class="card-header border-0"><img alt="" src="http://tong.visitkorea.or.kr/cms/resource/24/2497224_image2_1.JPG"></div><div class="card-block px-2"><h3 style="margin-top: 10px;">미라이안경[한국관광품질인증/Korea Quality]</h3><p style="color: gray;">02-517-1478</p><p>서울특별시 강남구 압구정로 228</p></div><div class="card-footer w-100 text-muted">위치 : 127.0328227001, 37.5286901743</div></div><div class="card flex-row flex-wrap" style="margin: 10px 0; width: 100%;"><div class="card-header border-0"><img alt="" src="http://tong.visitkorea.or.kr/cms/resource/24/2497324_image2_1.JPG"></div><div class="card-block px-2"><h3 style="margin-top: 10px;">브릿지안경[한국관광품질인증/Korea Quality]</h3><p style="color: gray;">02-543-6846</p><p>서울특별시 강남구 압구정로 132</p></div><div class="card-footer w-100 text-muted">위치 : 127.0232125896, 37.5242599610</div></div><div class="card flex-row flex-wrap" style="margin: 10px 0; width: 100%;"><div class="card-header border-0"><img alt="" src="http://tong.visitkorea.or.kr/cms/resource/59/2497359_image2_1.JPG"></div><div class="card-block px-2"><h3 style="margin-top: 10px;">세인트제임스 서울[한국관광품질인증/Korea Quality]</h3><p style="color: gray;">02-543-4628</p><p>서울특별시 강남구 논현로175길 94</p></div><div class="card-footer w-100 text-muted">위치 : 127.0216349856, 37.5231933895</div></div><div class="card flex-row flex-wrap" style="margin: 10px 0; width: 100%;"><div class="card-header border-0"><img alt="" src="http://tong.visitkorea.or.kr/cms/resource/87/2497587_image2_1.JPG"></div><div class="card-block px-2"><h3 style="margin-top: 10px;">스킨푸드 가로수길지점 [한국관광품질인증/Korea Quality]</h3><p style="color: gray;">070-8668-4191</p><p>서울특별시 강남구 압구정로12길 37</p></div><div class="card-footer w-100 text-muted">위치 : 127.0229460227, 37.5215824892</div></div><div class="card flex-row flex-wrap" style="margin: 10px 0; width: 100%;"><div class="card-header border-0"><img alt="" src="http://tong.visitkorea.or.kr/cms/resource/91/1358991_image2_1.jpg"></div><div class="card-block px-2"><h3 style="margin-top: 10px;">트리아 관광호텔</h3><p style="color: gray;">02-553-2471~4</p><p>서울특별시 강남구 테헤란로33길 16</p></div><div class="card-footer w-100 text-muted">위치 : 127.0393895002, 37.5028655136</div></div><div class="card flex-row flex-wrap" style="margin: 10px 0; width: 100%;"><div class="card-header border-0"><img alt="" src="http://tong.visitkorea.or.kr/cms/resource/37/2496537_image2_1.JPG"></div><div class="card-block px-2"><h3 style="margin-top: 10px;">플랫폼 플레이스(신사점)[한국관광품질인증/Korea Quality]</h3><p style="color: gray;">010-4084-3680</p><p>서울특별시 강남구 압구정로42길 47</p></div><div class="card-footer w-100 text-muted">위치 : 127.0346003981, 37.5257877659</div></div><div class="card flex-row flex-wrap" style="margin: 10px 0; width: 100%;"><div class="card-header border-0"><img alt="" src="../imgs/noimage.jpg"></div><div class="card-block px-2"><h3 style="margin-top: 10px;">한국국제관광전 2018</h3><p style="color: gray;">02-757-6161</p><p>서울특별시 강남구 영동대로 513</p></div><div class="card-footer w-100 text-muted">위치 : 127.0591874466, 37.5117592813</div></div><div class="card flex-row flex-wrap" style="margin: 10px 0; width: 100%;"><div class="card-header border-0"><img alt="" src="http://tong.visitkorea.or.kr/cms/resource/19/1867919_image2_1.jpg"></div><div class="card-block px-2"><h3 style="margin-top: 10px;">힐탑관광호텔</h3><p style="color: gray;">02-540-3458</p><p>서울특별시 강남구 논현로 647</p></div><div class="card-footer w-100 text-muted">위치 : 127.0314677537, 37.5115310320</div></div><div class="card flex-row flex-wrap" style="margin: 10px 0; width: 100%;"><div class="card-header border-0"><img alt="" src="../imgs/noimage.jpg"></div><div class="card-block px-2"><h3 style="margin-top: 10px;">강남 마이스 관광특구</h3><p style="color: gray;"></p><p>서울특별시 강남구 영동대로 513</p></div><div class="card-footer w-100 text-muted">위치 : 127.0591318945, 37.5118092746</div></div><div class="card flex-row flex-wrap" style="margin: 10px 0; width: 100%;"><div class="card-header border-0"><img alt="" src="http://tong.visitkorea.or.kr/cms/resource/79/1867579_image2_1.jpg"></div><div class="card-block px-2"><h3 style="margin-top: 10px;">뉴 힐탑 관광호텔</h3><p style="color: gray;">02-540-1121, 02-514-3616</p><p>서울특별시 강남구 논현로 645</p></div><div class="card-footer w-100 text-muted">위치 : 127.0314233254, 37.5111033028</div></div><div class="card flex-row flex-wrap" style="margin: 10px 0; width: 100%;"><div class="card-header border-0"><img alt="" src="http://tong.visitkorea.or.kr/cms/resource/24/2497224_image2_1.JPG"></div><div class="card-block px-2"><h3 style="margin-top: 10px;">미라이안경[한국관광품질인증/Korea Quality]</h3><p style="color: gray;">02-517-1478</p><p>서울특별시 강남구 압구정로 228</p></div><div class="card-footer w-100 text-muted">위치 : 127.0328227001, 37.5286901743</div></div><div class="card flex-row flex-wrap" style="margin: 10px 0; width: 100%;"><div class="card-header border-0"><img alt="" src="http://tong.visitkorea.or.kr/cms/resource/24/2497324_image2_1.JPG"></div><div class="card-block px-2"><h3 style="margin-top: 10px;">브릿지안경[한국관광품질인증/Korea Quality]</h3><p style="color: gray;">02-543-6846</p><p>서울특별시 강남구 압구정로 132</p></div><div class="card-footer w-100 text-muted">위치 : 127.0232125896, 37.5242599610</div></div><div class="card flex-row flex-wrap" style="margin: 10px 0; width: 100%;"><div class="card-header border-0"><img alt="" src="http://tong.visitkorea.or.kr/cms/resource/59/2497359_image2_1.JPG"></div><div class="card-block px-2"><h3 style="margin-top: 10px;">세인트제임스 서울[한국관광품질인증/Korea Quality]</h3><p style="color: gray;">02-543-4628</p><p>서울특별시 강남구 논현로175길 94</p></div><div class="card-footer w-100 text-muted">위치 : 127.0216349856, 37.5231933895</div></div><div class="card flex-row flex-wrap" style="margin: 10px 0; width: 100%;"><div class="card-header border-0"><img alt="" src="http://tong.visitkorea.or.kr/cms/resource/87/2497587_image2_1.JPG"></div><div class="card-block px-2"><h3 style="margin-top: 10px;">스킨푸드 가로수길지점 [한국관광품질인증/Korea Quality]</h3><p style="color: gray;">070-8668-4191</p><p>서울특별시 강남구 압구정로12길 37</p></div><div class="card-footer w-100 text-muted">위치 : 127.0229460227, 37.5215824892</div></div><div class="card flex-row flex-wrap" style="margin: 10px 0; width: 100%;"><div class="card-header border-0"><img alt="" src="http://tong.visitkorea.or.kr/cms/resource/91/1358991_image2_1.jpg"></div><div class="card-block px-2"><h3 style="margin-top: 10px;">트리아 관광호텔</h3><p style="color: gray;">02-553-2471~4</p><p>서울특별시 강남구 테헤란로33길 16</p></div><div class="card-footer w-100 text-muted">위치 : 127.0393895002, 37.5028655136</div></div><div class="card flex-row flex-wrap" style="margin: 10px 0; width: 100%;"><div class="card-header border-0"><img alt="" src="http://tong.visitkorea.or.kr/cms/resource/37/2496537_image2_1.JPG"></div><div class="card-block px-2"><h3 style="margin-top: 10px;">플랫폼 플레이스(신사점)[한국관광품질인증/Korea Quality]</h3><p style="color: gray;">010-4084-3680</p><p>서울특별시 강남구 압구정로42길 47</p></div><div class="card-footer w-100 text-muted">위치 : 127.0346003981, 37.5257877659</div></div><div class="card flex-row flex-wrap" style="margin: 10px 0; width: 100%;"><div class="card-header border-0"><img alt="" src="../imgs/noimage.jpg"></div><div class="card-block px-2"><h3 style="margin-top: 10px;">한국국제관광전 2018</h3><p style="color: gray;">02-757-6161</p><p>서울특별시 강남구 영동대로 513</p></div><div class="card-footer w-100 text-muted">위치 : 127.0591874466, 37.5117592813</div></div><div class="card flex-row flex-wrap" style="margin: 10px 0; width: 100%;"><div class="card-header border-0"><img alt="" src="http://tong.visitkorea.or.kr/cms/resource/19/1867919_image2_1.jpg"></div><div class="card-block px-2"><h3 style="margin-top: 10px;">힐탑관광호텔</h3><p style="color: gray;">02-540-3458</p><p>서울특별시 강남구 논현로 647</p></div><div class="card-footer w-100 text-muted">위치 : 127.0314677537, 37.5115310320</div></div></div>
</div>