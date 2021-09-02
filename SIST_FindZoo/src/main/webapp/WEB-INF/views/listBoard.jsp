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
	<table border="1" width="80%">
		<tr>
			<th width="50">글번호</th>
			<th>글제목</th>
			<th width="100">작성자</th>
		</tr>
		
		<c:forEach var="b" items="${ list }">
			<tr>
				<td>${ b.board_num }</td>
				<td>${ b.title }</td>
				<td>${ b.member_name }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>








