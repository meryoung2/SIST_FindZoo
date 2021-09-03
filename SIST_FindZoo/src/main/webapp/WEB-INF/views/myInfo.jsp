<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div>
			<h2>회원 정보</h2>
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
			SMS 수신 : ${mb.member_sms }<br>
			관리자 여부 : ${mb.member_admin }<br>
			로그인 방식 : ${mb.social_num }<br>
			<input type="button" value="내정보 수정" onclick="#">
			<input type="button" value="회원탈퇴" onclick="#">
		</div>
		<div>
			<h2>반려동물 정보</h2>
			<hr>
			반려동물번호 : ${pet.pet_num }<br>
			반려동물이름 : ${pet.pet_name }<br>
			반려동물성별 : ${pet.pet_sex }<br>
			반려동물종 : ${pet.pet_type }<br>
			동물등록번호 : ${pet.pet_regist_num }<br>
			반려동물생일 : ${pet.pet_birth }<br>
			회원번호 : ${mb.member_num }<br>
			<input type="button" value="반려동물정보 추가" onclick="#">
			<input type="button" value="반려동물정보 삭제" onclick="#">
		</div>
	</div>
</body>
</html>