<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		// 비밀번호 변경 확인
		if($("#updateInfoForm").submit(function(){
			if($("#old_pwd").val().trim() != $("#db_pwd").val()) {
				alert("기존 비밀번호가 올바르지 않습니다.");
				$("#old_pwd").val("").select();
				return false;
			}else if($("#member_pwd").val().trim().length < 4 || $("#member_pwd").val().trim().length > 12) {
				alert("비밀번호를 4~12자 이내로 입력하세요.");
				$("#member_pwd").val("").select();
				return false;
			}else if($("#member_pwd").val() !== $("#member_pwd_check").val()) {
				alert("새 비밀번호가 서로 일치하지 않습니다.");
				$("#member_pwd").val("").select();
				$("#member_pwd_check").val("");
				return false;
			}else if($("#member_pwd").val().trim() !== $("#member_pwd").val()) {
				alert("공백은 입력이 불가능합니다.");
				return false;
			}
		}));
	})
</script>
</head>
<body>
	<h2>내 정보 수정</h2>
	<hr>
	<div id="update-info-container">
		<form action="updateInfo.do" id="updateInfoForm" method="post">
			<input type="hidden" name="member_num" value="${mb.member_num }"> 
			<input type="hidden" id="db_pwd" value="${mb.member_pwd }">
			<p>
				<label>아이디</label>
				<input type="text" name="member_id" value="${mb.member_id }" disabled="disabled">
			</p>
			<p>
				<label>기존 비밀번호</label>
				<input type="text" name="old_pwd" id="old_pwd" required>
			</p>
			<p>
				<label>새 비밀번호</label> 
				<input type="text" name="member_pwd" id="member_pwd" required>
			</p>
			<p>
				<label>비밀번호 확인</label>
				<input type="text" name="member_pwd_check" id="member_pwd_check" required>
			</p>
			<p>
				<label>이름</label>
				<input type="text" name="member_name" value="${mb.member_name }" disabled="disabled">
			</p>
			<p>
				<label>닉네임</label>
				<input type="text" name="member_nick" value="${mb.member_nick }">
			</p>
			<p> <%-- 너나우리 인증? --%>
				<label>전화번호</label>
				<input type="number" name="member_phone" value="${mb.member_phone }">
				<input type="button" value="인증코드 전송">
			</p>
			<p> <%-- 이메일도 인증 코드? --%>
				<label>이메일</label>
				<input type="email" name="member_email" value="${mb.member_email }">
				<input type="button" value="인증코드 전송">
			</p>
			<p>
				<label>주소</label>
				<input type="text" name="member_addr" value="${mb.member_addr }">
			</p>
			<p>
				<label>SMS 수신동의여부</label>
				<c:if test="${mb.member_sms == '동의'}">
					<label><input type="radio" name="member_sms" value="동의" checked>동의</label>
					<label><input type="radio" name="member_sms" value="비동의">비동의</label>				
				</c:if>
				<c:if test="${mb.member_sms == '비동의'}">
					<label><input type="radio" name="member_sms" value="동의">동의</label>
					<label><input type="radio" name="member_sms" value="비동의" checked>비동의</label>				
				</c:if>
			</p>
			<br>
			<input type="submit" value="수정">
			<input type="reset" value="취소" onclick="history.back(-1);">
		</form>
	</div>
</body>
</html>