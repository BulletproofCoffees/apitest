<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.net.URL"%>

<%@page import="java.io.InputStreamReader"%>

<%@page import="java.io.BufferedReader"%>

<%@page import="java.net.URLEncoder"%>

<%@page import="java.net.HttpURLConnection"%>

<main>

<section>

	<article>

		<script>
			var obj =
		<%String clientId = "7yHPfYtTubSiYMKP227s";//애플리케이션 클라이언트 아이디값";

			String clientSecret = "pKfdBXel13";//애플리케이션 클라이언트 시크릿값";

			try {

				String text = URLEncoder.encode("애플", "UTF-8");

				String apiURL = "https://openapi.naver.com/v1/search/news?query=" + text;

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

				//콘솔

				System.out.println(res.toString());

				//buffer 추가

				out.println(res.toString());

			} catch (Exception e) {

				System.out.println(e);

			}%>
			;

			/* var length = obj.items.length

			 $(document).ready(function(){

			 for(var i=0;i<length;i++){

			 $('.news').append("<li><a href='"+obj.items[i].link+"'target='_blank'>" +obj.items[i].title+"</a><p>"+obj.items[i].description+"</p></li>")

			 };

			 }) */

			$(function() {

				for ( var i in obj.items) {

					$('.news').append(
							"<li><a href='"+obj.items[i].link+"'target='_blank'>"
									+ obj.items[i].title + "</a><p>"
									+ obj.items[i].description + ", "
									+ obj.items[i].pubDate + "</p></li>")

				}

			})
		</script>

		<ul class="news">


		</ul>

	</article>

</section>

</main>