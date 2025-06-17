<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax XML</title>
</head>
<body>
	<h1>Ajax XML 데이터 요청 처리</h1>

<script>
	//1. XMLHttpRequest 객체 생성
	let request = new XMLHttpRequest();
	
	request.onreadystatechange = function(){
		console.log("readyState: " + request.readyState 
				+ ", status: " + request.status);
		if (request.readyState == 4 && request.status == 200) {//정상응답완료
			alert("성공] 리턴받은 값(문자열) : " + request.responseXML);
			console.log(request.responseXML);
			
			// XML 데이터 추출
			let xml = request.responseXML;
			let products = xml.getElementsByTagName("product");
			console.log(products);
			
			// 데이터 사용
			let htmlTag = "";
			for (const product of products) {
				console.log(product);
				let name = product.querySelector("name").innerHTML;
				let price = product.querySelector("price").textContent;
				console.log("name: " + name + ", price: " + price);
				htmlTag += "<h2>" + name + ", " + price + "</h2>";
			}
			document.body.innerHTML += htmlTag;
			
			
		} else if (request.readyState == 4 && request.status != 200) {
			alert("[오류] 오류발생 - " + request.status);
		}
	};
	
	//2. open("전송방식", "요청정보", 비동기여부)
	request.open("GET", "data.xml", true);
	
	//3. send() 실행
	request.send();
	
</script>	
</body>
</html>