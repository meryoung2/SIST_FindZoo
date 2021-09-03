<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>거래 게시판</h2>
	<hr>
	<table border="1" width="80%">
		<tr>
			<th>글번호</th>
			<th>글제목</th>
			<th>작성자</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${list }" var="d">
			<tr>
				<td>${d.board_num }</td>
				<td>${d.title }</td>
				<td>${d.member_nick }</td>
				<td>${d.views }</td>
			</tr>
		</c:forEach>
	</table>
	<a href="insertDeal.do">글쓰기</a>
</body>
</html>