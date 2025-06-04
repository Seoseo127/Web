	function sel_all() {
		location.href = "selectAll.jsp";
	}
	function sel_one(form) {
		//let id = form.id.value; // form객체의 name 속성 사용
		let id = form.elements["id"].value; // form객체의 name 속성 사용
		alert("id : " + id);
		location.href = "selectOneID.jsp?id=" + id;
	}
	function add_go(form) {
		if (form.id.value.trim().length < 1) {
			alert("아이디(ID)는 필수 입력항목입니다.\n입력하세요");
			form.id.value = "";
			form.id.focus();
			return false;
		}
		//PWD 체크
		form.action = "insertMember.jsp";
		form.submit();
	}	
	function del_go(form) {
		if (form.id.value.trim().length < 1) {
			alert("아이디(ID)는 필수 입력항목입니다.\n입력하세요");
			form.id.value = "";
			form.id.focus();
			return false;
		}
		
		form.action = "deleteMember.jsp";
		form.submit();
	}