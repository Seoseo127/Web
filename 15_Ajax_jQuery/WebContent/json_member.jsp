<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax JSON</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	//$(document).ready(function(){});
	//$().ready(function(){});
	//$(function(){});
	$(document).ready(function(){
		$("#getDataBtn").on("click", ajaxGetJsonMembers);
	});
	function ajaxGetJsonMembers() {
		alert(">>ajaxGetJsonMembers() 실행");
		
		$.ajax("getJsonMembers", {
			method : "get", //type 속성 동일
			//data : "name=" + name + "&age=" + age, //서버쪽으로 데이터 전달
			dataType : "json", //응답 받을 데이터 타입
			success : function(respData){
				alert("성공!!! - " + respData);
				console.log("respData : " + respData);
				console.log(respData);
				console.log(respData.list); //배열데이터
				
				//전달받은 JSON 데이터 처리
				let htmlTag = "";
				
				for (member of respData.list) {
					console.log(member);
					htmlTag += "<tr>";
					htmlTag += "<td>" + member.idx + "</td>";
					htmlTag += "<td>" + member.name + "</td>";
					htmlTag += "<td>" + member.age + "</td>";
					htmlTag += "<td>" + member.addr + "</td>";
					htmlTag += "<td>" + member["regdate"] + "</td>";
					htmlTag += "</tr>";
				}
				
				$("#tbody").html(htmlTag);
			},
			error : function(jqXHR, textStatus, errorThrown ){
				alert("Ajax 실패 : \n"
						+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
						+ "textStatus : " + textStatus + "\n"
						+ "errorThrown : " + errorThrown + "\n" );
			}
		});
	}
</script>
</head>
<body>
	<h1>Ajax JSON 데이터 요청 처리</h1>
	<button id="getDataBtn">Ajax 사용 JSON 받아서 화면에 표시</button>
	<hr>
	<table border>
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>주소</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody id="tbody">
			<tr>
				<td>1-샘플</td>
				<td>홍길동</td>
				<td>25</td>
				<td>서울</td>
				<td>2025-06-17</td>
			</tr>
		</tbody>
	</table>
	<hr>
	<div id="myDiv">
		데이터를 표시하기
	</div>
</body>
</html>
