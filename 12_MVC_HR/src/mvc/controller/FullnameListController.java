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

// /fullnameList 요청을 받아 DB에서 검색 후 fullnameList.jsp 응답처리
@WebServlet("/fullnameList")
public class FullnameListController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">>FullnameListController doGet() 실행");
		//1. 전달받은 파라미터 값(성명: fullname) 추출 사용
		String fullname = request.getParameter("fullname");
		
		//2. DB에서 성명(fullname)에 있는 직원 조회(DAO 사용)
		List<EmployeeVO> list = EmployeeDAO.getFullnameList(fullname);
		
		//3. 조회된 데이터를 응답페이지(fullnameList.jsp)에서 사용토록 전달(저장)
		request.setAttribute("list", list);
		
		//4. 응답페이지(deptList.jsp)로 응답 위임처리
		request.getRequestDispatcher("fullnameList.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">>FullnameListController doPost() 실행");
		doGet(request, response);
	}
	
}
