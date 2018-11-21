package sj_test;

import java.io.BufferedReader;
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
 * Servlet implementation class google
 */
@WebServlet("/google")
public class google extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public google() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		
		String search = request.getParameter("search");	
		if ( Objects.isNull(search)) {search = "검색어";}		
		try {
/*			GET https://www.googleapis.com/customsearch/v1?key=API키값&cx=검색엔진ID&q=검색어*/	
			StringBuilder urlBuilder = new StringBuilder
					("https://www.googleapis.com/customsearch/v1");
	        urlBuilder.append("?" + URLEncoder.encode("key","UTF-8") 
	        + "=AIzaSyCHB4wFMSS067PsIk4UZBSbqg4yQLIS3U8");
	        urlBuilder.append("&" + URLEncoder.encode("cx","UTF-8") 
	        + "=" + URLEncoder.encode("009759385012310547636:zvxf8l8uqn4", "UTF-8"));
	        urlBuilder.append("&" + URLEncoder.encode("q","UTF-8") 
	        + "=" + URLEncoder.encode(search, "UTF-8"));
	       
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
	        request.setAttribute("json", sb.toString());
	        System.out.println(sb.toString());
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
