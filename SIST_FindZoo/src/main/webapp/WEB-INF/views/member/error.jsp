<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>error</title>
</head>
<body>
	<jsp:include page="./findZoo_Header.jsp"/>
	죄송합니다. 서비스 중에 다음과 같은 문제가 발생하였습니다. 
	<hr>
	${msg }
	<input type="button" class="btn btn-primary" value="메인" onclick="location.href='../main.do'"><br>
	<jsp:include page="../findZoo_Footer.jsp"/>
</body>
</html>