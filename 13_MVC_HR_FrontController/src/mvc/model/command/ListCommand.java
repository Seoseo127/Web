package mvc.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.dao.EmployeeDAO;
import mvc.model.vo.EmployeeVO;

public class ListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(":: 전체목록 검색 후 보여주기");
		List<EmployeeVO> list = EmployeeDAO.getList();
		System.out.println("list.size() : " + list.size());
		
		//2. 응답페이지(list.jsp)에 전달(request 객체에 저장 전달)
		request.setAttribute("list", list);
		
		//3. 페이지전환 - 응답할 페이지(list.jsp)로 포워딩(전환)
		//request.getRequestDispatcher("list.jsp").forward(request, response);
		
		return "list.jsp";
	}

}




