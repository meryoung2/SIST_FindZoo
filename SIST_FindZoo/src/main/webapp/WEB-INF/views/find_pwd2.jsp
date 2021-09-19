<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
	
</style>
<script type="text/javascript">
function pwd_search() { 
	
	var name = $("#member_name").val();
	 var member_name = decodeURI(name);
	 var member_phone = $("#member_phone").val();
	 console.log(member_name);
	 console.log(member_phone);
	 
	 /*if (member_name.length < 1) {
		  alert("이름을 입력해주세요");
		  return;
		 }

		 if (member_phone.length != 13) {
			  alert("핸드폰번호를 정확하게 입력해주세요");
			  return;
		 }*/
	 
	 $.ajax({
			url : '${pageContext.request.contextPath}/user/findId?member_name='+ member_name+'&member_phone='+member_phone,
			type : 'get',
			success : function(data) {
				
				if(data.code == "200"){
					
					alert("아이디는 "+data.member_id+"입니다");
					
				} else if(data.code == "204"){
					
					alert("아이디를 찾을 수 없습니다. \n올바른 정보를 입력해주세요");
				}
				
			}
	 })
}


</script>
</head>
<body>
	<h2>비밀번호 찾기</h2>
	<hr>
	<form>
			
		<section class = "form-search">
			<div class = "find-id">
				<label>비밀번호</label>
				<input type="text" name="member_id" id="member_id" class = "btn-name" placeholder = "등록한 아이디">
			<br>
			</div>
			<div class = "find-phone">
				<label>번호</label>
				<input type="text" name="member_phone" id="member_phone" class = "btn-phone" placeholder = "휴대폰번호를 '-'없이 입력">
					<input type="button" id="send-code-btn" value="인증코드 전송">&nbsp;
					<span id="time">02:00</span>
					<input type="tel" id="sms-code" size="6" maxlength="6">
					<input type="button" id="check-code-btn" value="인증코드 확인">
					<input type="button" id="cancel-btn" value="취소"><br>
			</div>
			<br>
		</section>
		<div class ="btnSearch">
			<input type="submit" value=""  onClick="pwd_search()">
			<a href="login.do"></a><input type="button" name="cancle" value="돌아가기">/a>
	 	</div>
	</form>
</body>
</html>