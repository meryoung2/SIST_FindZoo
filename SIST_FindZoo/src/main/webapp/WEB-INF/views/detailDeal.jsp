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
	<h2>�ŷ��Խ��� ��</h2>
	<hr>
	�۹�ȣ : ${d.board_num }<br>
	������ : ${d.title }<br>
	�ۼ��� : ${d.member_nick }<br>
	�۳��� : <br>
	<textarea rows="10" cols="80" readonly="readonly">${d.content }</textarea><br>
	÷������ : <br>
	<img src="${pageContext.request.contextPath}/resources/img/${ d.picture_fname }"><br>
	����� : <fmt:formatDate value="${ d.bdate }" pattern="yyyy-MM-dd hh:mm:ss" /><br>
	��ȸ�� : ${d.views }
	<hr>
	<a href="listDeal.do">���</a>
	<a href="updateDeal.do?board_num=${d.board_num }">����</a>
	<a href="deleteDeal.do?board_num=${d.board_num }">����</a>
</body>
</html>