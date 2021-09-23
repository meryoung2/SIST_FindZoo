<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려동물 등록</title>
<link rel="stylesheet" href="../../resources/css/bootstrap.min.css" type="text/css">
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
	#insertPet-container {
		display: flex;
		width: 70%;
		margin: 15%;
		margin-top: 30px;
		margin-bottom: 5%;
	}
	
	#insertPet-container #sidebar{
		margin-right: 20px;
	}
	
	#insertPet-container #input-container {
		width: 80%;
		margin-bottom: 10px;
		padding: 10px;
	}
	
	/* 부트스트랩 세부 조정 */
	#input-container .form-control {
    	width: 40%;
    	display: inline;
	} 
	
	#input-container .col-form-label {
		width: 105px;
		font-weight: bold;
	}
	
	#input-container .mt-4 {
	    margin-top: 0.8rem!important;
	}
	
	#input-container .form-check-input {
	    vertical-align: middle; 
	    margin: 5px; 
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="./findZoo_Header.jsp"/>
	<div id="insertPet-container">
		<aside id="sidebar">
			<div class="accordion" id="accordionExample">
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingOne">
						<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne"
							aria-expanded="false" aria-controls="collapseOne">내 정보</button>
					</h2>
					<div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
						<div class="accordion-body">
							<a href="/member/myInfo.do"> - 내 정보</a><br><br>
							<a href="/member/updateInfo.do"> - 내 정보 수정</a><br><br>
							<a href="/member/deleteChangeInfo.do"> - 회원 탈퇴</a><br>
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
							<a href="/member/sendNoteList.do"> - 보낸 쪽지함</a><br><br>
							<a href="/member/receiveNoteList.do"> - 받은 쪽지함</a><br>
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
							<a href="/member/myPost.do?pageNum=1"> - 내가 쓴 게시글</a><br><br>
							<a href="/member/myReply.do?pageNum=1"> - 내가 쓴 댓글</a><br>
						</div>
					</div>
				</div>
			</div>
		</aside>
		<article id="input-container">
			<h2><strong>반려동물 등록</strong></h2>
			<hr>
			<form action="/member/insertPet.do" id="insert-pet-form" method="post">
				<input type="hidden" name="member_num" value="${mb.member_num }">
				
				<label class="col-form-label mt-4" for="inputDefault">반려동물 이름</label>
				<input type="text" class="form-control" name="pet_name" required><br>
				
				<label class="col-form-label mt-4" for="inputDefault">반려동물 성별</label>
				<input type="radio" class="form-check-input" name="pet_sex" value="암컷" checked="checked">암컷
				<input type="radio" class="form-check-input" name="pet_sex" value="수컷">수컷<br>
				
				<label class="col-form-label mt-4" for="inputDefault">반려동물 타입</label>
				<input type="radio" class="form-check-input" name="pet_type" value="강아지" checked="checked">강아지
				<input type="radio" class="form-check-input" name="pet_type" value="고양이">고양이
				<input type="radio" class="form-check-input" name="pet_type" value="기타">기타<br>
				
				<label class="col-form-label mt-4" for="inputDefault">동물 등록번호</label>
				<input type="text" class="form-control" name="pet_regist_num"><br>
				
				<label class="col-form-label mt-4" for="inputDefault">반려동물 생일</label>
				<input type="date" class="form-control" name="pet_birth" id="pet_birth" max="9999-12-31"><br>
				<br>
				<input type="submit" class="btn btn-primary" value="등록">
				<input type="button" class="btn btn-secondary" value="취소" onclick="history.back(-1);">
			</form>
		</article>
	</div>
	<jsp:include page="../findZoo_Footer.jsp"/>
</body>
</html>