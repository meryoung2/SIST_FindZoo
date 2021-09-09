<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>게시물 수정</h2>
	<hr>
	<form action="/updateDeal.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="board_num" value="${d.board_num }">
		<input type="hidden" name="picture_fname" value="${d.picture_fname }">
		
		글제목 : <input type="text" name="title" value="${d.title }"><br>
		가격 : <input type="text" name="deal_price" value="${d.deal_price }"><br>
		글내용 : <br>
		<textarea rows="10" cols="80" name="content">${d.content}</textarea><br>
		첨부파일 : ${d.picture_fname }<br>
		<input type="file" name="picture_file"><br>
		<input type="submit" value="수정">
		<input type="reset" value="취소">		
	</form>
</body>
</html>