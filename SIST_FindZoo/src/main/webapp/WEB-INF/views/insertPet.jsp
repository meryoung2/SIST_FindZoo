<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	/* 반려동물 추가 */
	#insertPet-container {
		display: flex;
		position: absolute;
		width: 70%;
		margin: 15%;
		margin-top: 20px;
		margin-bottom: 20px;
		border: 1px solid black;
	}
	
	#insertPet-container #sidebar{
		width: 20%;
		margin: 10px;
		border: 1px solid black;
	}
	
	#insertPet-container #input-container {
		float: right;
		margin: 10px;
		padding: 20px;
		border: 1px solid black;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div id="insertPet-container">
		<aside id="sidebar">
			<div class="list-group">
				<a href="myInfo.do?member_num=${pet.member_num}" class="list-group-item list-group-item-action">내 정보</a>
				<a href="myNote.do?member_num=${pet.member_num}" class="list-group-item list-group-item-action">쪽지함</a>
				<a href="memberBoard.do?pageNum=1&member_num=${pet.member_num}" class="list-group-item list-group-item-action">내 게시글</a>
				<a href="#" class="list-group-item list-group-item-action">내 댓글</a>
			</div>
		</aside>
		<article id="input-container">
			<h2>반려동물 등록</h2>
			<hr>
			<form action="insertPet.do" id="insert-pet-form" method="post">
				<input type="hidden" name="member_num" value="${mb.member_num }"><br>
				반려동물이름: <input type="text" name="pet_name"><br>
				반려동물성별: <input type="radio" name="pet_sex" value="암컷" checked="checked">암컷
							<input type="radio" name="pet_sex" value="수컷">수컷<br>
				반려동물타입: <input type="radio" name="pet_type" value="강아지" checked="checked">강아지
							<input type="radio" name="pet_type" value="고양이">고양이
							<input type="radio" name="pet_type" value="기타">기타<br>
				동물등록번호: <input type="text" name="pet_regist_num"><br>
				반려동물생일: <input type="date" name="pet_birth" id="pet_birth" max="9999-12-31"><br>
				<br>
				<input type="submit" value="등록">
				<input type="button" value="취소" onclick="history.back(-1);">
			</form>
		</article>
	</div>
</body>
</html>