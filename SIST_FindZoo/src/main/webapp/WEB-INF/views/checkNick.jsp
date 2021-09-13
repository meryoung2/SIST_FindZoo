<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	// 닉네임 유효성 검사
	function check_regExp(form) {
		var new_nick = form.new_nick.value;
		if(new_nick.length < 2 || new_nick.length > 8) {
			alert("2~8자 이내로 입력해 주세요.");
			document.getElementById("new_nick").value = "";
			return false;
		}
		var regExp = /[0-9]|[a-z]|[A-Z]|[가-힣]/;
		for(var i=0 ; i<=new_nick.length-1 ; i++) {
			if(regExp.test(new_nick.charAt(i))) {
			}else {
				alert("한글, 영문, 숫자만 사용할 수 있습니다.");
				document.getElementById("new_nick").value = "";
				return false;
			}
		}
		document.getElementById("new_nick").value = new_nick;
		return true;
	};
</script>
<body>	
	<h4>닉네임 중복 확인</h4>
	<hr>
	<form method="post" action="checkNickProcess.do" onsubmit="return check_regExp(this)">				 
		<input type="text" id="new_nick" name="new_nick" maxlength="10" autofocus>
		<input type="submit" value="중복 확인">
		<span style = "font-size: 6px;">*공백 및 특수문자는 사용할 수 없습니다.</span><br>
	</form>
</body>
</html>