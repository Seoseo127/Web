package mvc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.command.Command;
import mvc.model.command.DeptCommand;
import mvc.model.command.DeptListCommand;
import mvc.model.command.FullnameCommand;
import mvc.model.command.FullnameListCommand;
import mvc.model.command.ListCommand;
import mvc.model.command.SearchCommand;

//@WebServlet("/controller")
public class FrontControllerCommand extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">>FrontControllerCommand doGet() 실행----------------");
		String command = request.getParameter("command");
		System.out.println(":: 요청작업 : " + command);
		
		Command process = null;
		if ("list".equals(command)) {
			process = new ListCommand();
		}
		if ("dept".equals(command)) {
			process = new DeptCommand();
		}
		if ("deptList".equals(command)) {
			process = new DeptListCommand();
		}
		//(실습) fullname, fullnameList, search 요청 처리
		if ("fullname".equals(command)) {
			process = new FullnameCommand();
		}
		if ("fullnameList".equals(command)) {
			process = new FullnameListCommand();
		}
		if ("search".equals(command)) {
			process = new SearchCommand();
		}
		
		String path = process.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">>FrontControllerCommand doPost() 실행");
		doGet(request, response);
	}
	
}
