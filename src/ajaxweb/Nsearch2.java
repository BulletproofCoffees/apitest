package ajaxweb;

import java.io.IOException;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class Nsearch
 */
@WebServlet("/nsearch2")
public class Nsearch2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Nsearch2() {
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
		String display = request.getParameter("display");
		String start = request.getParameter("start");
		String sort = request.getParameter("sort");
		
		
		
		
		String json = null;
		if (Objects.isNull(theme) || Objects.isNull(query)) {
			theme = "news";
			query = "방탄";
			display = "1";
		    start = "1";       
		    sort = "sim";
			
		}
		
		// NAVER 에서 JSON 가져오기
		json = Napi.getJson(theme,query,display,start, sort);
		
		// request에 json추가
		request.setAttribute("json", json);
		
		System.out.println("Nsearch2 :  "+json);
		
		
		// forward
		request.getRequestDispatcher("/layout02/json/json.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
