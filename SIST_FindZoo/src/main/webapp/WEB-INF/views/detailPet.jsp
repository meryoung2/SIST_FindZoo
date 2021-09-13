<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" type="text/css">
<style type="text/css">
	/* 반려동물 정보 상세 조회 */
	.detailPet-container {
		display: flex;
		position: absolute;
		width: 1000px;
		margin: auto;
		margin-top: 20px;
		margin-bottom: 20px;
	}
	
	.detailPet-container .list-group{
		width: 200px;
		margin: 10px;
		border: 1px solid black;
	}
	
	.detailPet-container .input-container {
		float: right;
		margin: 10px;
		padding: 20px;
		border: 1px solid black;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	// 반려동물 삭제 확인
	function confirmDeletePet(pet_num){
		if(confirm("반려동물 정보를 삭제하시겠습니까?")==true){
			location.href = "deletePet.do?pet_num="+pet_num;
		}
	}
</script>
</head>
<body>
	<div class="detailPet-container">
		<aside class="sidebar">
			<div class="list-group">
				<a href="myInfo.do?member_num=${mb.member_num}" class="list-group-item list-group-item-action">내 정보</a>
				<a href="#" class="list-group-item list-group-item-action">1:1 문의</a>
				<a href="myNote.do?member_num=${mb.member_num}" class="list-group-item list-group-item-action">쪽지함</a>
				<a href="memberBoard.do?pageNum=1&member_num=${mb.member_num}" class="list-group-item list-group-item-action">내 게시물</a>
				<a href="#" class="list-group-item list-group-item-action">내 댓글</a>
			</div>
		</aside>
		<article class="input-container">
			<h2>반려동물(${pet.pet_name }) 정보</h2>
			<hr>
			회원번호: ${pet.member_num }<br>
			반려동물번호: ${pet.pet_num }<br>
			반려동물이름: ${pet.pet_name }<br>
			반려동물성별: ${pet.pet_sex }<br>
			반려동물타입: ${pet.pet_type }<br>
			동물등록번호: ${pet.pet_regist_num }<br> 
			<fmt:parseDate var="strToDate" value="${pet.pet_birth }" pattern="yyyy-MM-dd HH:mm:ss"/>
			<fmt:formatDate var="dateToStr" value="${strToDate }" pattern="yyyy년 MM월 dd일생"/>
			반려동물생일: <c:out value="${dateToStr }"/><br>
			<br>
			<input type="button" value="내 정보" onclick="location.href='myInfo.do?member_num=${pet.member_num}'">
			<input type="button" value="반려동물 삭제" onclick="confirmDeletePet(${pet.pet_num })">
		</article>
	</div>
</body>
</html>