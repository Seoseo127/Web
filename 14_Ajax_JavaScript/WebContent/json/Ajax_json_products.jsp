<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax JSON</title>
</head>
<body>
	<h1>Ajax JSON 데이터 요청 처리</h1>

<script>
	//1. XMLHttpRequest 객체 생성
	let request = new XMLHttpRequest();
	
	request.onreadystatechange = function(){
		console.log("readyState: " + request.readyState 
				+ ", status: " + request.status);
		if (request.readyState == 4 && request.status == 200) {//정상응답완료
			alert("성공] 리턴받은 값(문자열) : " + request.responseText);
			console.log(request.responseText);
			
			// JSON.parse() 사용 : JSON문자열 -> JS 객체화
			let json = JSON.parse(request.responseText);
			alert("JSON.parse() 후 : " + json);
			console.log(json);
			console.log(json.products);
			
			//JSON 데이터 추출
			let htmlTag = "";
			
			for (const product of json.products) {
				htmlTag += "<h2>";
				htmlTag += product.name + " : " + product["price"];
				htmlTag += "</h2>";
			}
			
			document.body.innerHTML += htmlTag;
			
		} else if (request.readyState == 4 && request.status != 200) {
			alert("[오류] 오류발생 - " + request.status);
		}
	};
	
	//2. open("전송방식", "요청정보", 비동기여부)
	request.open("GET", "products.json", true);
	
	//3. send() 실행
	request.send();
	
</script>	
</body>
</html>