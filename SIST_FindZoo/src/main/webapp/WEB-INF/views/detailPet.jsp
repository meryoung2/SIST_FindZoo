<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function confirmDeletePet(pet_num){
		if(confirm("반려동물 정보를 삭제하시겠습니까?")==true){
			location.href = "deletePet.do?pet_num="+pet_num;
		}
	}
</script>
</head>
<body>
	<div>
		<h2>반려동물 정보</h2>
		<hr>
		회원번호 : ${pet.member_num }<br>
		반려동물번호 : ${pet.pet_num }<br>
		반려동물이름 : ${pet.pet_name }<br>
		반려동물성별 : ${pet.pet_sex }<br>
		반려동물타입 : ${pet.pet_type }<br>
		동물등록번호 : ${pet.pet_regist_num }<br>
		반려동물생일 : <fmt:formatDate value="${pet.pet_birth }" pattern="yyyy년 MM월 dd일생" /><br>
		<br>
		<input type="button" value="내 정보" onclick="location.href='myInfo.do?member_num=${pet.member_num}'">
		<input type="button" value="반려동물 삭제" onclick="confirmDeletePet(${pet.pet_num}, ${pet.member_num})">
	</div>
</body>
</html>