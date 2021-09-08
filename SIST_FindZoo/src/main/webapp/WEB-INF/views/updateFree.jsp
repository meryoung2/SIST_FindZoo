<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>자유게시글 수정</h2>
	<hr> 
	<form action="updateFree.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="board_num" value="${ f.board_num }">
		<input type="hidden" name="picture_fname" value="${ f.picture_fname }">
		제목 : <input type="text" name="title" value="${ f.title }"><br>
		내용 : <textarea rows="10" cols="80" name="content">${ f.content }</textarea><br>
		파일 : ${ f.picture_fname }<input type="file" name="picture_file"><br>
		<input type="submit" value="Submit">
		<input type="reset" value="Reset">
	</form>
</body>
</html>