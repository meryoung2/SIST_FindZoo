<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>거래게시판 상세</h2>
	<hr>
	글번호 : ${d.deal_num }<br>
	글제목 : ${d.title }<br>
	작성자 : ${d.member_nick }<br>
	글내용 : <br>
	<textarea rows="10" cols="80" readonly="readonly">${d.content }</textarea><br>
	등록일 : ${d.bdate }
	조회수 : ${d.views }
	<!--첨부파일 : ${d.picture_fname }  -->
	<hr>
	<a href="updateDeal.do?deal_num=${d.deal_num }">수정</a>
	<a href="deleteDeal.do?deal_num=${d.deal_num }">삭제</a>
</body>
</html>