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

//@WebServlet("/controller")
public class FrontController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController doGet() 실행~~~");
		String command = request.getParameter("command");
		System.out.println(":: command : " + command);
		
		if ("list".equals(command)) {
			System.out.println(":: 전체목록 검색 후 보여주기");
			//1. DB연결하고 데이터 가져오기
			List<EmployeeVO> list = EmployeeDAO.getList();
			System.out.println("list.size() : " + list.size());
			
			//2. 응답페이지(list.jsp)에 전달(request 객체에 저장 전달)
			request.setAttribute("list", list);
			
			//3. 페이지전환 - 응답할 페이지(list.jsp)로 포워딩(전환)
			request.getRequestDispatcher("list.jsp").forward(request, response);
		}
		if ("dept".equals(command)) {
			System.out.println(":: 부서검색화면으로 이동");
			request.getRequestDispatcher("dept.jsp").forward(request, response);
		}
		if ("deptList".equals(command)) {
			System.out.println(":: 부서코드로 검색후 보여주기");
			//1. 전달받은 파라미터 값(부서코드: deptno) 추출 사용
			int deptno = Integer.parseInt(request.getParameter("deptno"));
			
			//2. DB에서 해당부서(deptno)에 있는 직원 조회(DAO 사용)
			List<EmployeeVO> list = EmployeeDAO.getDeptList(deptno);
			
			//3. 조회된 데이터를 응답페이지(deptList.jsp)에서 사용토록 전달(저장)
			request.setAttribute("list", list);
			
			//4. 응답페이지(deptList.jsp)로 응답 위임처리
			request.getRequestDispatcher("deptList.jsp").forward(request, response);
		}
		if ("fullname".equals(command)) {
			System.out.println(":: 이름 검색화면으로 이동");
			request.getRequestDispatcher("fullname.jsp").forward(request, response);
		}
		if ("fullnameList".equals(command)) {
			System.out.println(":: 이름 검색 후 결과 보여주기");
			//1. 전달받은 파라미터 값(성명: fullname) 추출 사용
			String fullname = request.getParameter("fullname");
			
			//2. DB에서 성명(fullname)에 있는 직원 조회(DAO 사용)
			List<EmployeeVO> list = EmployeeDAO.getFullnameList(fullname);
			
			//3. 조회된 데이터를 응답페이지(fullnameList.jsp)에서 사용토록 전달(저장)
			request.setAttribute("list", list);
			
			//4. 응답페이지(deptList.jsp)로 응답 위임처리
			request.getRequestDispatcher("fullnameList.jsp").forward(request, response);
		}
		if ("search".equals(command)) {
			System.out.println(":: 동적검색 화면이동 또는 검색결과 보여주기");
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
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController doPost() 실행------");
		doGet(request, response);
	}
	
	
}
