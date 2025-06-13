<%@page import="com.mystudy.bbs.dao.BbsDAO"%>
<%@page import="com.mystudy.bbs.vo.BbsVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터를 DB에 저장하고, list.jsp 이동 --%>
<%
	request.setCharacterEncoding("UTF-8");
%>
	<%-- enctype="multipart/form-data" 사용시 useBean, setProperty 값 설정 안됨 --%>
	<jsp:useBean id="testVO" class="com.mystudy.bbs.vo.BbsVO" />
	<jsp:setProperty property="*" name="testVO"/>
	\${testVO} : ${testVO}
	<hr>
	\${param.subject} : ${param.subject}
<%
	//파일저장 위치
	String path = "c:/MyStudy/temp";
	System.out.println("> path : " + path);
	
	File fileDir = new File(path);
	if (!fileDir.exists()) {
		fileDir.mkdirs();
	}
	
	MultipartRequest mr = new MultipartRequest(
			request, path, (10 * 1024 * 1024),
			"UTF-8", new DefaultFileRenamePolicy());
	
	BbsVO bvo = new BbsVO();
	bvo.setSubject(mr.getParameter("subject"));
	bvo.setWriter(mr.getParameter("writer"));
	bvo.setContent(mr.getParameter("content"));
	bvo.setPwd(mr.getParameter("pwd"));
	
	bvo.setIp(request.getRemoteAddr());
	
	System.out.println("> write_ok.jsp bvo : " + bvo);
	
	//첨부파일 데이터 처리
	if (mr.getFile("filename") != null) { //첨부파일 있으면
		bvo.setFileName(mr.getFilesystemName("filename"));
		bvo.setOriName(mr.getOriginalFileName("filename"));
	} else {
		bvo.setFileName("");
		bvo.setOriName("");
	}
	
	// DB에 입력(저장) 처리
	BbsDAO.insert(bvo);
	
	// 화면전환(목록페이지로 이동 - 첫페이지로 이동)
	response.sendRedirect("list.jsp");
	
%>	









