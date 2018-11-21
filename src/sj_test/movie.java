package sj_test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class movie
 */
@WebServlet("/movie")
public class movie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public movie() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 하루 전
		Calendar day = Calendar.getInstance();
		day.add(Calendar.DATE, -1);
		String beforeDate = new java.text.SimpleDateFormat("yyyyMMdd").format(day.getTime());

	    
		String targetDt = request.getParameter("targetDt");		
		if (Objects.isNull(targetDt)) {
			targetDt = beforeDate;
		}

		/*일별박스오피스*/
		 StringBuilder urlBuilder = new StringBuilder
				 ("http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("key","UTF-8") + "=2640ccb3bb3d023c2909d33823112c58");/*key*/
	        urlBuilder.append("&" + URLEncoder.encode("targetDt","UTF-8") + "=" + URLEncoder.encode(targetDt, "UTF-8"));
	        /*조회하고자 하는 날짜를 yyyymmdd 형식으로 입력합니다.*/
	        urlBuilder.append("&" + URLEncoder.encode("itemPerPage","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); 
	        /*결과 ROW 의 개수를 지정합니다.(default : “10”, 최대 : “10“)*/
	        urlBuilder.append("&" + URLEncoder.encode("multiMovieYn	","UTF-8") + "=" + URLEncoder.encode("N", "UTF-8")); 
	        /*다양성 영화/상업영화를 구분지어 조회할 수 있습니다.“Y” : 다양성 영화 “N” : 상업영화 (default : 전체)*/
	        urlBuilder.append("&" + URLEncoder.encode("repNationCd	","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); 
	        /*한국/외국 영화별로 조회할 수 있습니다.“K: : 한국영화 “F” : 외국영화 (default : 전체)*/
	        urlBuilder.append("&" + URLEncoder.encode("wideAreaCd	","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); 
	        /*상영지역별로 조회할 수 있으며, 지역코드는 공통코드 조회 서비스에서 “0105000000” 로서 조회된 지역코드입니다. (default : 전체)*/
	       
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode()); 
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        System.out.println(sb.toString());
	        
	        request.setAttribute("json", sb.toString());
			
			System.out.println(sb.toString());
			// forward
			request.getRequestDispatcher("/json.jsp").forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
