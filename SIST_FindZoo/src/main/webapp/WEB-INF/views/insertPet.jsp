<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/bootstrap.css" type="text/css">
<style type="text/css">
	/* 반려동물 추가 */
	.insertPet-container {
		display: flex;
		position: absolute;
		width: 1000px;
		margin: auto;
		margin-top: 20px;
		margin-bottom: 20px;
	}
	
	.insertPet-container .list-group{
		width: 200px;
		margin: 10px;
		border: 1px solid black;
	}
	
	.insertPet-container .input-container {
		float: right;
		margin: 10px;
		padding: 20px;
		border: 1px solid black;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="insertPet-container">
		<aside class="sidebar">
			<div class="list-group">
				<a href="myInfo.do?member_num=${mb.member_num}" class="list-group-item list-group-item-action active">내 정보</a>
				<a href="#" class="list-group-item list-group-item-action active">1:1 문의</a>
				<a href="myNote.do?member_num=${mb.member_num}" class="list-group-item list-group-item-action active">쪽지함</a>
				<a href="#" class="list-group-item list-group-item-action active">내 게시물</a>
				<a href="#" class="list-group-item list-group-item-action active">내 댓글</a>
			</div>
		</aside>
		<article class="input-container">
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
				<input type="reset" value="취소" onclick="history.back(-1);">
			</form>
		</article>
	</div>
</body>
</html>