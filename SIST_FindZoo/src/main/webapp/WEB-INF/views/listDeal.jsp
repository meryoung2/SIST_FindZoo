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
	<h2>�ŷ� �Խ���</h2>
	<hr>
	<table border="1" width="80%">
		<tr>
			<th>�۹�ȣ</th>
			<th>������</th>
			<th>�ۼ���</th>
			<th>��ȸ��</th>
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
	<a href="insertDeal.do">�۾���</a>
</body>
</html>