<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
/*
function findId(){
	 var member_name = $("#member_name").val();
	 var member_phone = $("#member_phone").val();
	 $.ajax({
			url : '${pageContext.request.contextPath}/user/findId?member_name='+ member_name,
			type : 'get',
			success : function(data) {
				 if(data == 409){
					 alert("이미 등록된 아이디입니다.");
					 $("#member_id").val("");
					 return false;
				 }else{
					 alert("사용 가능한 아이디입니다.");
				 }
			}
	 })
	 
}
*/

</script>
</head>
<body>
	<h2>아이디 찾기</h2>
	<hr>
	<form action="findId.do" method="post">
		이름 : <input type="text" name="member_name"><br>
		연락처 : <input type="text" name="member_phone"><br>
		<input type="submit" value="아이디 찾기">
		<a href="join.jsp">회원가입</a>
		<button id="find-id" onclick="findId();">아이디 찾기</button>
		<button id="find-pw" onclick="findPwd();">비밀번호 찾기</button>
	</form>
</body>
</html>