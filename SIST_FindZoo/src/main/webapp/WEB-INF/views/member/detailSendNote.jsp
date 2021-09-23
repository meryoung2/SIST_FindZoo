<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보낸 쪽지</title>
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
	#detailSendNote-container {
		margin: 30px;
	}
	
	/* 부트스트랩 세부 조정 */	
	#detailSendNote-container .col-form-label {
		width: 85px;
		font-weight: bold;
	}
	
	#detailSendNote-container .mt-4 {
	    margin-top: 0.8rem!important;
	}
</style>
</head>
<body>
	<div id="detailSendNote-container">
		<h4><strong>보낸 쪽지</strong></h4>
		<hr>
		<label class="col-form-label mt-4" for="inputDefault">받는 사람</label>
		|&nbsp;&nbsp;&nbsp;${nt.member_nick }<br>
		
		<fmt:parseDate var="strToDate" value="${nt.note_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
		<fmt:formatDate var="dateToStr" value="${strToDate }" pattern="yyyy.MM.dd HH:mm"/>
		<label class="col-form-label mt-4" for="inputDefault">보낸 날짜</label>
		|&nbsp;&nbsp;&nbsp;<c:out value="${dateToStr }"/><br>
		
		<br>
		
		<textarea rows="6" cols="40" readonly="readonly">${nt.note_content }</textarea><br><br>
		
		<input type="button" class="btn btn-primary" value="창 닫기" onclick="window.close()">
	</div>
</body>
</html>