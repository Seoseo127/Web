<%@page import="com.mystudy.bbs.common.Paging"%>
<%@page import="com.mystudy.bbs.vo.BbsVO"%>
<%@page import="java.util.List"%>
<%@page import="com.mystudy.bbs.dao.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%-- 현재 페이지에 표시할 데이터를 화면 표시
	1. 페이징 처리를 위한 객체(Paging) 생성해서 필요한 데이터 사용
	2. 페이징 객체에 설정할 데이터 저장
	3. (DB) 전체 데이터 건수 조회
	4. (DB) 현재 페이지에 표시할 게시글 데이터 조회
	5. 데이터 화면 표시(화면컨트롤 - 스타일 지정)
--%>
<%
	// Paging 사용 : 직접 설정값을 구하고 설정
	Paging p = new Paging();

	//1. 전체 게시물 수량 구하기
	p.setTotalRecord(BbsDAO.getTotalCount());
	p.setTotalPage();
	System.out.println("> 전체 게시글 수 : " + p.getTotalRecord());
	System.out.println("> 전체 페이지 수 : " + p.getTotalPage());
	
	//2. 현재 페이지 구하기
	String cPage = request.getParameter("cPage");
	if (cPage != null) {
		p.setNowPage(Integer.parseInt(cPage));
	}
	System.out.println("> param cPage : " + cPage);
	System.out.println("> paging nowPage : " + p.getNowPage());

	//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
	p.setEnd(p.getNowPage() * p.getNumPerPage());
	p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
	System.out.println(">> 시작번호(begin) : " + p.getBegin());
	System.out.println(">> 끝번호(end) : " + p.getEnd());
	
	//(조정) 끝번호(end)가 전체 데이터 건수보다 크면 끝번호를 전체데이터건수로 설정
	
	//--- 블록(block) 계산하기 ---------
	//4. 블록 시작페이지(beginPage), 끝페이지(endPage) 구하기
	int nowBlock = (p.getNowPage() - 1) / p.getPagePerBlock() + 1;
	p.setNowBlock(nowBlock);
	p.setEndPage(nowBlock * p.getPagePerBlock());
	p.setBeginPage(p.getEndPage() - p.getPagePerBlock() + 1);
	
	//(조정) 끝페이지(endPage)가 전체페이지(totalPage) 보다 크면
	// 끝페이지를 전체페이지 수로 변경 처리
	if (p.getEndPage() > p.getTotalPage()) {
		p.setEndPage(p.getTotalPage());
	}
	System.out.println(">> beginPage : " + p.getBeginPage());
	System.out.println(">> endPage : " + p.getEndPage());
	
	// 시작번호, 끝번호로 표시할 데이터 조회
	List<BbsVO> list = BbsDAO.getList(p.getBegin(), p.getEnd());
	System.out.println(">> 현재페이지 글목록 : " + list);
	
	//====================
	//EL, JSTL 사용을 위해 scope에 등록(page 영역)
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("pvo", p);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글목록</title>
<style>
	#bbs table {
		width: 600px;
		border-collapse: collapse;
	}
	#bbs caption { font-size: 20px; font-weight: bold; }
	#bbs thead { background-color: #ccc; }
	#bbs th, #bbs td {
		border: 1px solid black;
		padding: 4px 10px;
		text-align: center;
	}
	#bbs .align-left { text-align: left; }
	
	/*** 페이지 표시영역 스타일 ***/
	.paging { list-style: none; }
	.paging li { float: left; margin-left: 8px; }
	.paging li a {
		border: 1px solid black;
		text-decoration: none; 
		display: block;
		padding: 3px 7px;
		font-weight: bold;
		color: black;
	}
	.paging .disable {
		border: 1px solid silver;
		padding: 3px 7px;
		color: silver;
	}
	.paging .now {
		border: 1px solid magenta;
		background-color: magenta;
		padding: 3px 7px;
		color: white;
	}
</style>
</head>
<body>

<div id="bbs">
	<table>
		<caption>게시글 목록</caption>
		<thead>
			<tr>
				<th width="10%">번호</th>
				<th>제목</th>
				<th width="15%">작성자</th>
				<th width="20%">날짜</th>
				<th width="10%">조회수</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="vo" items="${list }">
			<tr>
				<td>${vo.bbsIdx }</td>
				<td class="align-left">
					<a href="view.jsp?bbsIdx=${vo.bbsIdx }&cPage=${pvo.nowPage}">${vo.subject }</a>
				</td>
				<td>${vo.writer }</td>
				<td>${vo.writeDate.substring(0, 10) }</td>
				<td>${vo.hit }</td>
			</tr>
		</c:forEach>
		<c:if test="${empty list }">
			<tr>
				<td colspan="5">데이터가 없습니다</td>
			</tr>
		</c:if>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="4">
					<ol class="paging">
					<%--[이전]에 대한 사용여부 처리 --%>
					<c:if test="${pvo.beginPage != 1 }">
						<li><a href="list.jsp?cPage=${pvo.beginPage - 1 }">이전</a></li>
					</c:if>
					<c:if test="${pvo.beginPage == 1 }">
						<li class="disable">이전</li>
					</c:if>
					
					<%--블록내에 표시할 페이지 태그 작성(시작페이지 ~ 끝페이지) --%>
					<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
					<c:if test="${pageNo == pvo.nowPage }">
						<li class="now">${pageNo }</li>
					</c:if>	
					<c:if test="${pageNo != pvo.nowPage }">
						<li><a href="list.jsp?cPage=${pageNo }">${pageNo }</a></li>
					</c:if>			
					</c:forEach>	
					
					<%--[다음]에 대한 사용여부 처리 --%>
					<c:if test="${pvo.endPage < pvo.totalPage }">
						<li><a href="list.jsp?cPage=${pvo.endPage + 1 }">다음</a></li>
					</c:if>	
					<c:if test="${pvo.endPage >= pvo.totalPage }">
						<li class="disable">다음</li>
					</c:if>
					</ol>
				</td>
				<td>
					<input type="button" value="글쓰기"
						onclick="javascript:location.href='write.jsp'">
				</td>
			</tr>
		</tfoot>
	</table>
</div>

</body>
</html>









