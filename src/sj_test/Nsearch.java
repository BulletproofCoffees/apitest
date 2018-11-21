package sj_test;

import java.io.IOException;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ajaxweb.Napi;


/**
 * Servlet implementation class Nsearch
 */
@WebServlet("/nsearch")
public class Nsearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Nsearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 매개변수 처리
		String theme = request.getParameter("theme");
		String query = request.getParameter("query");
		
		
		/*System.out.println(Integer.parseInt(request.getParameter("start")));*/
		
		
		if (Objects.isNull(theme) || Objects.isNull(query)) {
			theme = "local";
			query = "인천국제공항";
			
		}
		
		// NAVER 에서 JSON 가져오기
		String json = null;
		json = Napi.getJson(theme,query);
		
		// request에 json추가
		request.setAttribute("json", json);
		
		System.out.println(json);
		// forward
		request.getRequestDispatcher("/layout02/json/json.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
