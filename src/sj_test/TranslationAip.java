package sj_test;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TranslationAip2
 */
@WebServlet("/translationaip")
public class TranslationAip extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TranslationAip() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	
		String texts = request.getParameter("text");
		String source = request.getParameter("source");		
		String target=  request.getParameter("target"); 
		
		if (Objects.isNull(texts)) {
			texts = "안녕 자바";			
		}
		
	/*	if (Objects.isNull(source)) {
			source = "ko"; 번역 소스 텍스트의 언어 설정: (ko:한국어, en:영어, ja:일본어, zh-CN:중국어(간체), zh-TW:중국어(번체)			
		}
		
		if (Objects.isNull(target)) {
			target = "en";			
		}*/
		
		
		 String clientId = "TfHlys8UXtXWSe2Ru7Wb";//애플리케이션 클라이언트 아이디값";
	        String clientSecret = "RBndZ6UMId";//애플리케이션 클라이언트 시크릿값";
	        try {
	            String text = URLEncoder.encode(texts, "UTF-8");
	            String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
	            URL url = new URL(apiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("POST");
	            con.setRequestProperty("X-Naver-Client-Id", clientId);
	            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	            // post request
	            String postParams = "source="+source+"&target="+target+"&text=" + text;
	            con.setDoOutput(true);
	            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
	            wr.writeBytes(postParams);
	            wr.flush();
	            wr.close();
	            int responseCode = con.getResponseCode();
	            BufferedReader br;
	            if(responseCode==200) { // 정상 호출
	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	            } else {  // 에러 발생
	                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	            }
	            String inputLine;
	            StringBuffer response1 = new StringBuffer();
	            while ((inputLine = br.readLine()) != null) {
	                response1.append(inputLine);
	            }
	            br.close();
	            System.out.println(response1.toString());
	       
	        	request.setAttribute("json", response1.toString());	    		
	    		// forward
	    		request.getRequestDispatcher("/layout02/json/json.jsp").forward(request, response);
	    		
	        } catch (Exception e) {
	            System.out.println(e);
	        }
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
