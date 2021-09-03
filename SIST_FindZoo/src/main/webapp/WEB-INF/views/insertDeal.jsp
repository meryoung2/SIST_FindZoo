<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>거래게시판 글쓰기</h2>
	<hr>
	<form action="insertDeal.do" method="post" enctype="multipart/form-data">
		제목 : <input type="text" name="title"><br>
		가격 : <input type="text" name="deal_price"><br>
		내용 : <textarea rows="10" cols="80" name="content"></textarea><br>
		파일 : <input type="file" name="picture_file"><br>
		<input type="submit" value="등록">
		<input type="reset" value="취소">
	</form>
</body>
</html>