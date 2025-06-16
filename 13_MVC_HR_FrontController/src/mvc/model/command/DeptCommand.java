package mvc.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeptCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(":: 부서검색화면으로 이동");
		//request.getRequestDispatcher("dept.jsp").forward(request, response);
		
		return "dept.jsp";
	}

}
