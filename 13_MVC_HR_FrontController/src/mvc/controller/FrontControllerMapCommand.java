package mvc.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.command.Command;
import mvc.model.command.DeptCommand;
import mvc.model.command.DeptListCommand;
import mvc.model.command.ListCommand;

//@WebServlet("*.do") : 요청명이 *.do 로 끝나면 매칭 처리
@WebServlet("/controller")
public class FrontControllerMapCommand extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Map<String, Command> commandMap;

	@Override
	public void init(ServletConfig config) throws ServletException {
		commandMap = new HashMap<String, Command>();
		commandMap.put("list", new ListCommand());
		commandMap.put("dept", new DeptCommand());
		commandMap.put("deptList", new DeptListCommand());
		//(실습) fullname, fullnameList, search 요청 처리
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">>FrontControllerCommand doGet() 실행----------------");
		String command = request.getParameter("command");
		System.out.println(":: 요청작업 : " + command);
		
		Command process = commandMap.get(command);
	
		//(실습) process : null 일때 처리 error.jsp 페이지로 이동처리
		// error.jsp : 메시지(잘못된요청) + 이전페이지로 이동
		
		// process null이 아닌 경우
		String path = process.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">>FrontControllerCommand doPost() 실행");
		doGet(request, response);
	}
	
}
