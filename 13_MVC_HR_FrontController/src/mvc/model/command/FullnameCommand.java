package mvc.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FullnameCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(":: 이름 검색화면으로 이동");
		//request.getRequestDispatcher("fullname.jsp").forward(request, response);
		
		return "fullname.jsp";
	}

}
