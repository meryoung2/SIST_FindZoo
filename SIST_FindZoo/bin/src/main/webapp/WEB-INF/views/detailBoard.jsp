<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Detail Board</h2>
	<hr>
	<a href="deleteBoard.do?board_num=${ b.board_num }">삭제</a>
	<hr>
	번호 : ${ b.board_num }<br>
	제목 : ${ b.title }<br>
	작성자 : ${ b.member_nick }<br>
	내용 <br>
	<textarea rows="10" cols="80" readonly="readonly">${ b.content }</textarea><br>
	<img src="${pageContext.request.contextPath}/resources/img/${ b.picture_fname }">
	등록일 : <fmt:formatDate value="${ b.bdate }" pattern="yyyy-MM-dd hh:mm:ss" /><br>
	조회수 : ${ b.views }<br>
	${ b.picture_fname }
</body>
</html>