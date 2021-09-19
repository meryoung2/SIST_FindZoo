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
	a {
		color: black;
		text-decoration: none;
	}
	a:hover {
		font-weight: bold;
		color: #325d88;
		text-decoration: underline;
	}
	
	/* 폰트 적용 */
	@font-face {
		font-family: 'GmarketSansMedium';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}
	* {
		font-family: 'GmarketSansMedium';
		font-weight: lighter;
	}
	
	/* 메인 컨테이너, 사이드바, 컨텐츠 컨테이너 비율 조절 */
	#detailPet-container {
		display: flex;
		position: absolute;
		width: 70%;
		margin: 15%;
		margin-top: 20px;
		margin-bottom: 20px;
		border: 1px solid black;
	}
	
	#detailPet-container #sidebar{
		width: 20%;
		margin: 10px;
		border: 1px solid black;
	}
	
	#detailPet-container #input-container {
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
	<div id="detailPet-container">
		<aside id="sidebar">
			<div class="accordion" id="accordionExample">
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingOne">
						<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne"
							aria-expanded="false" aria-controls="collapseOne">내 정보</button>
					</h2>
					<div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
						<div class="accordion-body">
							<a href="myInfo.do?member_num=${pet.member_num}"> - 내 정보</a><br>
							<a href="updateInfo.do?member_num=${pet.member_num}"> - 내 정보 수정</a><br>
							<a href="deleteChangeInfo.do?member_num=${pet.member_num}&member_pwd=${mb.member_pwd}"> - 회원 탈퇴</a><br>
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingTwo">
						<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo"
							aria-expanded="false" aria-controls="collapseTwo">쪽지함</button>
					</h2>
					<div id="collapseTwo" class="accordion-collapse collapse show" aria-labelledby="headingTwo" data-bs-parent="#accordionExample" style="">
						<div class="accordion-body">
							<a href="sendNoteList.do?note_sender_num=${pet.member_num}"> - 보낸 쪽지함</a><br>
							<a href="receiveNoteList.do?note_receiver_num=${pet.member_num}"> - 받은 쪽지함</a><br>
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingThree">
						<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree"
							aria-expanded="false" aria-controls="collapseThree">내가 쓴 글</button>
					</h2>
					<div id="collapseThree" class="accordion-collapse collapse show" aria-labelledby="headingThree" data-bs-parent="#accordionExample" style="">
						<div class="accordion-body">
							<a href="memberBoard.do?pageNum=1&member_num=${pet.member_num}"> - 내가 쓴 게시글</a><br>
							<a href="#"> - 내가 쓴 댓글</a><br>
						</div>
					</div>
				</div>
			</div>
		</aside>
		<article id="input-container">
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
			<input type="button" value="반려동물 삭제" onclick="confirmDeletePet(${pet.pet_num })">
		</article>
	</div>
</body>
</html>