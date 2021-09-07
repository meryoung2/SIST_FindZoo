<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>자유게시판 목록</h2>
	<hr>
	<a href="insertFree.do">글쓰기</a>
	<hr>
	<table border="1" width="80%">
		<tr>
			<th>글제목</th>
			<th>작성자</th>
			<th width="50">조회수</th>
		</tr>
		
		<c:forEach var="f" items="${ list }">
			<tr>
				<td><a href="detailFree.do?board_num=${ f.board_num }">${ f.title }</a></td>
				<td>${ f.member_nick }</td>
				<td>${ f.views }</td>
			</tr>
		</c:forEach>
	</table>
	
	<c:forEach var="i" begin="1" end="${ totalPage }">
		<a href="free.do?pageNum=${ i }">${ i }</a>&nbsp;
	</c:forEach>
</body>
</html>








