<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려동물 정보</title>
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
	#detailPet-container {
		display: flex;
		width: 70%;
		margin: 15%;
		margin-top: 30px;
		margin-bottom: 5%;
	}
	
	#detailPet-container #sidebar{
		margin-right: 20px;
	}
	
	#detailPet-container #input-container {
		width: 80%;
		margin-bottom: 10px;
		padding: 10px;
	}
	
	/* 부트스트랩 세부 조정 */
	#input-container .col-form-label {
		width: 105px;
		font-weight: bold;
	}
	
	.mt-4 {
	    margin-top: 0.8rem!important;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	// 반려동물 삭제 확인
	function confirmDeletePet(pet_num){
		if(confirm("반려동물 정보를 삭제하시겠습니까?")==true){
			location.href = "/member/deletePet.do?pet_num="+pet_num;
		}
	}
</script>
</head>
<body>
	<jsp:include page="./findZoo_Header.jsp"/>
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
			<h2><strong>반려동물(${pet.pet_name }) 정보</strong></h2>
			<hr>
			<label class="col-form-label mt-4" for="inputDefault">반려동물 이름</label>
			|&nbsp;&nbsp;&nbsp;${pet.pet_name }<br>
			
			<label class="col-form-label mt-4" for="inputDefault">반려동물 성별</label>
			|&nbsp;&nbsp;&nbsp;${pet.pet_sex }<br>
			
			<label class="col-form-label mt-4" for="inputDefault">반려동물 타입</label>
			|&nbsp;&nbsp;&nbsp;${pet.pet_type }<br>
			
			<label class="col-form-label mt-4" for="inputDefault">동물 등록번호</label>
			|&nbsp;&nbsp;&nbsp;${pet.pet_regist_num }<br>
			
			<label class="col-form-label mt-4" for="inputDefault">반려동물 생일</label>
			<fmt:parseDate var="strToDate" value="${pet.pet_birth }" pattern="yyyy-MM-dd HH:mm:ss"/>
			<fmt:formatDate var="dateToStr" value="${strToDate }" pattern="yyyy년 MM월 dd일생"/>
			|&nbsp;&nbsp;&nbsp;${dateToStr }<br>
			<br>
			<input type="button" class="btn btn-primary" value="내 정보" onclick="location.href='/member/myInfo.do'">
			<input type="button" class="btn btn-secondary" value="반려동물 삭제" onclick="confirmDeletePet(${pet.pet_num })">
		</article>
	</div>
	<jsp:include page="../findZoo_Footer.jsp"/>
</body>
</html>