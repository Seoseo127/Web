<%@page import="java.io.File"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터 사용해서 파일 다운로드 처리 --%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");

	//전달받은 파라미터 값 확인(추출)
	String path = request.getParameter("path"); //저장된 폴더(디렉토리)명
	String filename = request.getParameter("filename"); //물리적 저장파일명
	System.out.println("> path : " + path);
	System.out.println("> filename : " + filename);
	
	//실제 파일이 저장된 경로 확인
	String realPath = this.getServletContext().getRealPath(path);
	System.out.println("> realPath : " + realPath);
	
	//응답데이터가 바이너리임을 알리고, 화면에 표시하지 않고 다운로드하도록 알림
	response.setContentType("application/octet-stream"); //바이너리 데이터임을 알림
	//브라우저에게 응답을 어떻게 처리할지 지시, 파일 다운로드 처리
	response.setHeader("Content-Disposition", "attachment;filename=" + filename);
	
	//실제 다운로드 처리
	FileInputStream fis = null;
	BufferedInputStream bis = null;
	
	BufferedOutputStream bos = null;
	
	File file = new File(realPath + "/" + filename);
	
	try {
		// 파일 읽기 객체 생성
		fis = new FileInputStream(file);
		bis = new BufferedInputStream(fis);
		
		// 파일 쓰기 객체 생성
		bos = new BufferedOutputStream(response.getOutputStream());
		
		//파일 읽고, 쓰기
		int readValue = bis.read();
		while (readValue != -1) {
			bos.write(readValue);
			readValue = bis.read();
		}
		// JSP 출력스트림과 서블릿의 출력스트림이 겹처서 발생하는 오류 해결
		out.clear();
		out = pageContext.pushBody();
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		bos.close();
		bis.close();
	}
	
%>
