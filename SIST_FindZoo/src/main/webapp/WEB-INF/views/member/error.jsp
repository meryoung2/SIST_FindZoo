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
	�˼��մϴ�. ���� �߿� ������ ���� ������ �߻��Ͽ����ϴ�. 
	<hr>
	${msg }
	<input type="button" class="btn btn-primary" value="����" onclick="location.href='../main.do'"><br>
	<jsp:include page="../findZoo_Footer.jsp"/>
</body>
</html>