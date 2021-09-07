<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>자유게시글 등록</h2>
	<hr> 
	<form action="insertFree.do" method="post" enctype="multipart/form-data">
		제목 : <input type="text" name="title"><br>
		내용 : <textarea rows="10" cols="80" name="content"></textarea><br>
		파일 : <input type="file" name="picture_file"><br>
		<input type="submit" value="Submit">
		<input type="reset" value="Reset">
	</form>
</body>
</html>