<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.myInfo-container {
		border: 1px solid black;
		margin: 10px;
		padding: 10px;
	}
</style>
</head>
<body>
	<div class="myInfo-container">
		<h2>내 정보</h2>
		<hr>
		회원번호 : ${mb.member_num }<br>
		아이디 : ${mb.member_id }<br>	
		비밀번호 : ${mb.member_pwd }<br>
		이름 : ${mb.member_name }<br>
		닉네임 : ${mb.member_nick }<br>
		전화번호 : ${mb.member_phone }<br>
		이메일 : ${mb.member_email }<br>
		주소 : ${mb.member_addr }<br>
		포인트 : ${mb.member_point }<br>
		SMS 수신동의여부 : ${mb.member_sms }<br>
		관리자 여부 : ${mb.member_admin }<br>
		<c:if test="${mb.social_num == '0'}">로그인 방식 : 웹 로그인<br></c:if>
		<c:if test="${mb.social_num == '1'}">로그인 방식 : 네이버 로그인<br></c:if>
		<c:if test="${mb.social_num == '2'}">로그인 방식 : 카카오 로그인<br></c:if>
		반려동물 정보 : <c:forEach var="pet" items="${listPet }"><a href="detailPet.do?pet_num=${pet.pet_num }">${pet.pet_name }</a>&nbsp;</c:forEach><br>
		<br>
		<input type="button" value="내 정보 수정" onclick="location.href='updateInfo.do?member_num=${mb.member_num}'">
		<input type="button" value="반려동물 추가" onclick="location.href='insertPet.do'">
		<input type="button" value="회원탈퇴" onclick="#">
	</div>
</body>
</html>