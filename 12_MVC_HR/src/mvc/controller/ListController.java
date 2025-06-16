package mvc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.dao.EmployeeDAO;
import mvc.model.vo.EmployeeVO;

@WebServlet("/list")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		System.out.println("> ListController doGet() 실행~~");
		System.out.println("request.getContextPath() : " + request.getContextPath());
		
		//1. DB연결하고 데이터 가져오기
		List<EmployeeVO> list = EmployeeDAO.getList();
		System.out.println("list.size() : " + list.size());
		
		//2. 응답페이지(list.jsp)에 전달(request 객체에 저장 전달)
		request.setAttribute("list", list);
		
		//3. 페이지전환 - 응답할 페이지(list.jsp)로 포워딩(전환)
		request.getRequestDispatcher("list.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> ListController doPost() 실행~~");
		doGet(request, response);
	}

}









