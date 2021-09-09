<%@page import="com.example.demo.vo.FindVo"%>
<%@page import="com.example.demo.dao.FindDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>게시물 수정</h2>
	<hr>
	<form action="/updateFind.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="board_num" value="${f.board_num }">
		<input type="hidden" name="picture_fname" value="${f.picture_fname }">
		
		글제목 : <input type="text" name="title" value="${f.title }"><br>
		유실장소 : <input type="text" name="find_lost_loc" value="${f.find_lost_loc }"><br>
		<fmt:parseDate var="strToDate" value="${f.find_lost_date }" pattern="yyyy-MM-dd"/>
		<fmt:formatDate var="dateToStr" value="${strToDate }" pattern="yyyy년 MM월 dd일"/>
		유실날짜 : <c:out value="${dateToStr }"/>&nbsp;<input type="date" name="find_lost_date"><br>
		동물 종 :
		<a ></a>
		<c:choose>
			<c:when test="${f.find_pet eq '강아지' }">
				<input type="radio" class="form-check-input" name="find_pet" id="find_pet_dog" value="강아지" checked="checked">
				<label for="find_pet_dog">강아지</label>
				<input type="radio" class="form-check-input" name="find_pet" id="find_pet_cat" value="고양이">
				<label for="find_pet_cat">고양이</label>
				<input type="radio" class="form-check-input" name="find_pet" id="find_pet_etc" value="기타">
				<label for="find_pet_etc">기타</label><br>
			</c:when>
			<c:when test="${f.find_pet eq '고양이' }">
				<input type="radio" class="form-check-input" name="find_pet" id="find_pet_dog" value="강아지">
				<label for="find_pet_dog">강아지</label>
				<input type="radio" class="form-check-input" name="find_pet" id="find_pet_cat" value="고양이" checked="checked">
				<label for="find_pet_cat">고양이</label>
				<input type="radio" class="form-check-input" name="find_pet" id="find_pet_etc" value="기타">
				<label for="find_pet_etc">기타</label><br>
			</c:when>
			<c:otherwise>
				<input type="radio" class="form-check-input" name="find_pet" id="find_pet_dog" value="강아지">
				<label for="find_pet_dog">강아지</label>
				<input type="radio" class="form-check-input" name="find_pet" id="find_pet_cat" value="고양이">
				<label for="find_pet_cat">고양이</label>
				<input type="radio" class="form-check-input" name="find_pet" id="find_pet_etc" value="기타" checked="checked">
				<label for="find_pet_etc">기타</label><br>
			</c:otherwise>
		</c:choose>
		사례금 : <input type="text" name="find_reward" placeholder="사례금을 입력해주세요(없을시에는 0)" value="${f.find_reward }"><br>
		글내용 : <br>
		<textarea rows="10" cols="80" name="content">${f.content}</textarea><br>
		첨부파일 : ${f.picture_fname }<br>
		<input type="file" name="picture_file"><br>
		<input type="submit" value="수정">
		<input type="reset" value="취소">		
	</form>
</body>
</html>