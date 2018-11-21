
<script type="text/javascript">
//get방식으로 naver api의 json요청
	$(function() {
		$.get("../../nsearch", { "theme" : "news", "query": "방탄" }, function(data) {
			// alert(data);
			var obj = data;
			console.log(obj);
			// news를 화면에 출력
			for ( var i in obj.items) {

				$('#newslist').append(obj.items[i].link+"'target='_blank'>"
								+ obj.items[i].title + "</a><p>"
								+ obj.items[i].description + ", "
								+ obj.items[i].pubDate + "</p></li>")

			}

		});
	});
</script>
<!-- CONTENT -->
<li>
	<h1>NEWS LIST : AJAX GET</h1>
	<ul id="newslist"></ul>
</li>
