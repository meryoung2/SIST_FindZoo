<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>�ŷ��Խ��� ��</h2>
	<hr>
	�۹�ȣ : ${d.deal_num }<br>
	������ : ${d.title }<br>
	�ۼ��� : ${d.member_nick }<br>
	�۳��� : <br>
	<textarea rows="10" cols="80" readonly="readonly">${d.content }</textarea><br>
	����� : ${d.bdate }
	��ȸ�� : ${d.views }
	<!--÷������ : ${d.picture_fname }  -->
	<hr>
	<a href="updateDeal.do?deal_num=${d.deal_num }">����</a>
	<a href="deleteDeal.do?deal_num=${d.deal_num }">����</a>
</body>
</html>