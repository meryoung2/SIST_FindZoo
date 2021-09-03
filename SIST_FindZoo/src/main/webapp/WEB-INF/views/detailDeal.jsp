<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>거래게시판 상세</h2>
	<hr>
	글번호 : ${d.board_num }<br>
	글제목 : ${d.title }<br>
	작성자 : ${d.member_nick }<br>
	글내용 : <br>
	<textarea rows="10" cols="80" readonly="readonly">${d.content }</textarea><br>
	첨부파일 : <br>
	<img src="${pageContext.request.contextPath}/resources/img/${ d.picture_fname }"><br>
	등록일 : <fmt:formatDate value="${ d.bdate }" pattern="yyyy-MM-dd hh:mm:ss" /><br>
	조회수 : ${d.views }
	<hr>
	<a href="listDeal.do">목록</a>
	<a href="updateDeal.do?board_num=${d.board_num }">수정</a>
	<a href="deleteDeal.do?board_num=${d.board_num }">삭제</a>
</body>
</html>