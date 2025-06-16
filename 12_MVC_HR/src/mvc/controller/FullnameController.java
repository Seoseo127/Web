package mvc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// /fullname 요청(GET, POST)을 받아 fullname.jsp 화면이동
@WebServlet("/fullname")
public class FullnameController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">>FullnameController doGet() 실행~");
		// fullname.jsp 화면이동
		request.getRequestDispatcher("fullname.jsp").forward(request, response);
	}
	
}
