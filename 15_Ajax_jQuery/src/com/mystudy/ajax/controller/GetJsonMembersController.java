package com.mystudy.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.ajax.dao.MemberDAO;
import com.mystudy.ajax.vo.MemberVO;

@WebServlet("/getJsonMembers")
public class GetJsonMembersController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">>GetJsonMembersController doGet() 실행---------");
		
		// DB 데이터 가져오기
		List<MemberVO> list = MemberDAO.getList();
		System.out.println("list : " + list);
		
		//JSON 형식 문자열 만들기
		// {"list" : [{}, {}, ..., {}] }
		String result = makeJson(list);
		
		//응답처리 ------------------
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(result.toString());
	}
	
	private String makeJson(List<MemberVO> list) {
		/* {"list" : [{}, {}, ..., {}] }
		{ "list" : [
			{
				"idx" : 1,
				"name" : "홍길동",
				"age" : 25,
				"addr" : "서울",
				"regdate" : "2025-06-17"
			},
			{}, {}, ...,{}, {}
		]} 
		***********************/
		//JSON 형식 문자열 만들기
		StringBuilder result = new StringBuilder();
		result.append("{ \"list\" : [");
		
		for (MemberVO vo : list) {
			result.append("{");
			result.append("\"idx\" : " + vo.getIdx() + ",");
			result.append("\"name\" : \"" + vo.getName() + "\",");
			result.append("\"age\" : " + vo.getAge() + ",");
			result.append("\"addr\" : \"" + vo.getAddr() + "\",");
			result.append("\"regdate\" : \"" + vo.getRegdate() + "\"");
			result.append("},");
		}
		result.deleteCharAt(result.length() - 1);
		result.append("]}");
		
		return result.toString();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">>GetJsonMembersController doPost() 실행---------");
		request.setCharacterEncoding("UTF-8"); //한글깨짐 해결
		doGet(request, response);
	}

}
