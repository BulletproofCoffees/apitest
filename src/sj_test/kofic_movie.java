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
@WebServlet("/kofic_movie")
public class kofic_movie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public kofic_movie() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	    
		String movieNm = request.getParameter("movieNm");		
		if (Objects.isNull(movieNm)) {			
			movieNm="괴물";			
		}

		/*일별박스오피스*/
		 StringBuilder urlBuilder = new StringBuilder(" http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.xml"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("key","UTF-8") + "=2640ccb3bb3d023c2909d33823112c58");/*key*/
	        urlBuilder.append("&" + URLEncoder.encode("movieNm","UTF-8") + "=" + URLEncoder.encode(movieNm, "UTF-8"));/*조회하고자 하는 날짜를 yyyymmdd 형식으로 입력합니다.*/
	     
	       
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
