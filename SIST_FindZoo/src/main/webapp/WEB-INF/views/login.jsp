<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h1>로그인</h1>
	<form action="/login.do" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">	
			<input placeholder="아이디를 입력하세요" type="text" name="username">
			<input placeholder="비밀번호를 입력하세요" type="password" name="password">
			<input type="submit" value="로그인">
			<input type="reset" value="취소">
	</form>
</body>
</html>