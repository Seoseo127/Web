package mvc.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.dao.EmployeeDAO;
import mvc.model.vo.EmployeeVO;

public class SearchCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(":: 동적검색 화면이동 또는 검색결과 보여주기");
		String idx = request.getParameter("idx");
		String keyword = request.getParameter("keyword");
		
		//단순 페이지전환 또는 DB데이터 검색요청 인지 구분
		if (keyword == null || keyword.trim().equals("")) {
			System.out.println(":: 단순 페이지전환 - search.jsp 페이지로 이동");
			//request.getRequestDispatcher("search.jsp").forward(request, response);
			
			return "search.jsp";
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
		//request.getRequestDispatcher("searchList.jsp").forward(request, response);
		
		return "searchList.jsp";
	}

}
