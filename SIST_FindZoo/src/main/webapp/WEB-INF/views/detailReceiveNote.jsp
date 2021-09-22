<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	
	/* 메인 컨테이너 */
	#detailReceiveNote-container {
		margin: 15px;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	// 쪽지 삭제 확인
	function confirmDeleteNote(note_num){
		if(confirm("쪽지를 삭제하시겠습니까?")==true){
			location.href = "deleteNote.do?note_num="+note_num;
		}
	}
</script>
</head>
<body>
	<div id="detailReceiveNote-container">
		<h4>받은 쪽지</h4>
		<hr>
		보낸 사람 ${nt.member_nick }<br>
		<fmt:parseDate var="strToDate" value="${nt.note_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
		<fmt:formatDate var="dateToStr" value="${strToDate }" pattern="yyyy.MM.dd HH:mm"/>
		받은 날짜 <c:out value="${dateToStr }"/><br>
		<br>
		<textarea rows="6" cols="40" readonly="readonly">${nt.note_content }</textarea><br>
		<br>
		<input type="button" value="답장" onclick="location.href='sendReplyNote.do?note_num=${nt.note_num }&note_receiver_num=${nt.note_receiver_num}'">
		<input type="button" value="삭제" onclick="confirmDeleteNote(${nt.note_num })">
	</div>
</body>
</html>