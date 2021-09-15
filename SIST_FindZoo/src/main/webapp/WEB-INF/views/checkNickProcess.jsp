<%@page import="com.example.demo.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" type="text/css">
<style type="text/css">
	/* 폰트 적용 */
	@font-face {
		font-family: 'GmarketSansMedium';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}
	* {
		font-family: 'GmarketSansMedium';
		font-weight: lighter;
	}
	
	/* div */
	#checkNickProcess-form {
		margin: 15px;
	}
</style>
<script type="text/javascript">
	//중복 확인을 완료한 닉네임을 메인창(부모창)에 적용
	function apply(member_nick){
		//부모창 opener
		opener.document.querySelector("#member_nick").value = member_nick;
		window.close();
	}
</script>
</head>
<body>
	<div id="checkNickProcess-form">
		<h4>닉네임 중복 확인</h4>
		<hr>
	<%
		String member_nick = request.getParameter("new_nick");
		System.out.println("변경 할 닉네임: " + member_nick);
		
		// dao의 checkNick() 호출
		MemberDao dao = new MemberDao();
		boolean checkNick = dao.checkNick(member_nick);
	%>
		'<%=member_nick %>'
	<%	
		if(checkNick == true){
			out.println("은(는) 이미 존재하는 닉네임입니다.<br>다른 닉네임을 입력해주세요.<p>");
		}else{
			out.println("은(는) 사용 가능한 닉네임입니다.<p>");
			out.println("<input type='button' value='적용' onclick='javascript:apply(\""+member_nick+"\")'>");
		}
	%>	
		<input type="button" value="다시 검색" onclick="javascript:history.back()">
		<input type="button" value="창 닫기" onclick="javascript:window.close()">
	</div>
</body>
</html>