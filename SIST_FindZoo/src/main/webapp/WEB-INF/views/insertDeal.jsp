<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>�ŷ��Խ��� �۾���</h2>
	<hr>
	<form action="insertDeal.do" method="post" enctype="multipart/form-data">
		���� : <input type="text" name="title"><br>
		���� : <input type="text" name="deal_price"><br>
		���� : <textarea rows="10" cols="80" name="content"></textarea><br>
		���� : <input type="file" name="picture_file"><br>
		<input type="submit" value="���">
		<input type="reset" value="���">
	</form>
</body>
</html>