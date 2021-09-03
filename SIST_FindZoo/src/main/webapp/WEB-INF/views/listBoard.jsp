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
	<h2>Board List</h2>
	<hr>
	<a href="insertBoard.do">글쓰기</a>
	<hr>
	<table border="1" width="80%">
		<tr>
			<th width="50">글번호</th>
			<th>글제목</th>
			<th>작성자</th>
			<th width="50">조회수</th>
		</tr>
		
		<c:forEach var="b" items="${ list }">
			<tr>
				<td>${ b.board_num }</td>

				<td>
				<a href="">${ b.title }</a>
				</td>
				<td>
				<a href="detailBoard.do?board_num=${ b.board_num }">${ b.title }</a>
				</td>
				<td>${ b.member_nick }</td>
				<td>${ b.views }</td>
			</tr>
		</c:forEach>
	</table>
	
	<c:forEach var="i" begin="1" end="${ totalPage }">
		<a href="listBoard.do?pageNum=${ i }">${ i }</a>&nbsp;
	</c:forEach>
</body>
</html>








