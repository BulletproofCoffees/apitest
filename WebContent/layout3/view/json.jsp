<!-- CONTENT -->
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<li>
	<ul>
		<li>
			<h1>JSON</h1>
		</li>
		<li><script>
			var obj =
		<%
		String clientId = "bRRpAUbjUSu2ENdAzq3v";//애플리케이션 클라이언트 아이디값";
			String clientSecret = "gLEtFlAq72";//애플리케이션 클라이언트 시크릿값";
			try {
				String text = URLEncoder.encode("그린팩토리", "UTF-8");
				String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text; // json 결과
				//String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
				URL url = new URL(apiURL);
				HttpURLConnection con = (HttpURLConnection) url.openConnection();
				con.setRequestMethod("GET");
				con.setRequestProperty("X-Naver-Client-Id", clientId);
				con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
				int responseCode = con.getResponseCode();
				BufferedReader br;
				if (responseCode == 200) { // 정상 호출
					br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				} else { // 에러 발생
					br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				}
				String inputLine;
				StringBuffer res = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
					res.append(inputLine);
				}
				br.close();
				// 콘솔에 출력
				System.out.println(res.toString());
				// buffer에 추가
				out.println(res.toString());
			} catch (Exception e) {
				System.out.println(e);
			}%>
			;
			// alert(obj.items);
			// List 만들기
			$(function(){
				for ( var i in obj.items) {
					console.log(i);
					$("#ulList").append("<li><h5>"+ obj.items[i].title +" ( <a href='"+ obj.items[i].bloggerlink +"' target='_blank'>"+ obj.items[i].bloggername +"</a> ) </h5><a href='"+ obj.items[i].link +"' target='_blank'>BLOG로 이동 (전문보기)</a><p>"+ obj.items[i].description +"</p></li>");
				}
			})
			
		</script></li>
		<li><h1>BLOG LIST</h1>
			<ul id="ulList">
				
			</ul>
		</li>
	</ul>
</li>
