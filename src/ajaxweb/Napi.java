package ajaxweb;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class Napi {
	// 주제와 쿼리를 주면 json 결과값을 리턴
	public static String getJson(String theme, String query) {
		
		String clientId = "5djPcjQzntPM6Ah5tCPv";//애플리케이션 클라이언트 아이디값";
		String clientSecret = "canGVSDvpq";//애플리케이션 클라이언트 시크릿값";
		try {
			String text = URLEncoder.encode(query, "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/search/"+ theme+"?query=" + text;  // json 결과
			// String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text;
			// // xml 결과
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
			
			// json결과 리턴
			return res.toString();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	public static String getJson(String theme, String query,String display, String start,String sort) {

		String clientId = "5djPcjQzntPM6Ah5tCPv";//애플리케이션 클라이언트 아이디값";
		String clientSecret = "canGVSDvpq";//애플리케이션 클라이언트 시크릿값";
		
		  
		try {
			 String text = URLEncoder.encode(query, "UTF-8");
	            String apiURL = "https://openapi.naver.com/v1/search/"+theme+"?query=" + text 
	            		+ "&display=" + display
	            		+ "&start=" + start
	            		+ "&sort=" + sort
	            		;
			// String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text;
			// // xml 결과
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
			
			// json결과 리턴
			return res.toString();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}


	
	
}
