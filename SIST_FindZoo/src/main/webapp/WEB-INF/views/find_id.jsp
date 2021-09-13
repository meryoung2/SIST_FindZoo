<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function findId(){
	 var member_name = $("#member_name").val();
	 var member_phone = $("#member_phone").val();
	 $.ajax({
			url : '${pageContext.request.contextPath}/user/findId?member_name='+ member_name+'&member_phone='+member_phone,
			type : 'get',
			success : function(data) {
				alert(data);
				 /*if(data != null){
					 alert("");
					 $("#member_id").val("");
					 return false;
				 }else{
					 alert("사용 가능한 아이디입니다.");
				 }*/
			}
	 })
	 
}

</script>
</head>
<body>
	<h2>아이디 찾기</h2>
	<hr>
	<form action="findId.do" method="post">
		이름 : <input type="text" name="member_name"><br>
		연락처 : <input type="text" name="member_phone"><br>
		<button id="find-id" onclick="findId();">아이디 찾기</button>
		<hr>
		<button id="find-id" onclick="location='join.jsp'">회원가입</button>
		<button id="find-id" onclick="location=windows.open('find_pwd.jsp')">비밀번호 찾기</button>
	</form>
</body>
</html>