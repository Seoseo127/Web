package mvc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.event.SwingPropertyChangeSupport;

import mvc.model.dao.EmployeeDAO;
import mvc.model.vo.EmployeeVO;

@WebServlet("/search")
public class SearchController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> SearchController doGet() 실행~");
		String idx = request.getParameter("idx");
		String keyword = request.getParameter("keyword");
		
		//단순 페이지전환 또는 DB데이터 검색요청 인지 구분
		if (keyword == null || keyword.trim().equals("")) {
			System.out.println(":: 단순 페이지전환 - search.jsp 페이지로 이동");
			request.getRequestDispatcher("search.jsp").forward(request, response);
			return;
		}
		// DB데이터 검색요청 : 검색후 searchList.jsp 페이지로 이동
		System.out.println(":: DB데이터 검색요청 : 검색후 searchList.jsp 페이지로 이동");
		
		//전달받은 idx, keyword값 사용 DB 검색 후 searchList.jsp 페이지로 이동
		List<EmployeeVO> list = EmployeeDAO.search(idx, keyword) ;
		
		// 검색 옵션 확인
		String option = "";
		switch (idx) {
			case "0" : option = "사번"; break;
			case "1" : option = "이름"; break;
			case "2" : option = "직종"; break;
			case "3" : option = "부서"; break;
		}
		
		//응답페이지(list.jsp)에 전달(request 객체에 저장 전달)
		request.setAttribute("list", list);
		request.setAttribute("option", option);
		
		//페이지전환 - 응답할 페이지(list.jsp)로 포워딩(전환)
		request.getRequestDispatcher("searchList.jsp").forward(request, response);
		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> SearchController doPost() 실행~");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
}



