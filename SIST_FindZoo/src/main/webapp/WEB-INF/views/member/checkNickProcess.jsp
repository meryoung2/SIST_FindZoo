<%@page import="com.example.demo.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>닉네임 변경</title>
<link rel="stylesheet" href="../../resources/css/bootstrap.min.css" type="text/css">
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
		margin: 30px;
	}
</style>
<script type="text/javascript">
	// 중복 확인을 완료한 닉네임을 메인창(부모창)에 적용
	function apply(member_nick){
		// opener(부모창)의 id가 member_nick인 칸에 해당 member_nick을 넣는다.
		opener.document.querySelector("#member_nick").value = member_nick;
		window.close();
	}
</script>
</head>
<body>
	<div id="checkNickProcess-form">
		<h4><strong>닉네임 중복 확인</strong></h4>
		<hr><br>
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
			out.println("은(는) 이미 존재하는 닉네임입니다.<br>다른 닉네임을 입력해주세요.<p><br>");
		}else{
			out.println("은(는) 사용 가능한 닉네임입니다.<p><br>");
			out.println("<input type='button' class='btn btn-primary' value='적용' onclick='javascript:apply(\""+member_nick+"\")'>");
		}
	%>	
		<input type="button" class="btn btn-secondary" value="다시 검색" onclick="javascript:history.back()">
	</div>
</body>
</html>