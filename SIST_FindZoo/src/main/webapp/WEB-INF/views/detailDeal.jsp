<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function confirmDealDelete(board_num){
		var re = confirm("정말 삭제하시겠습니까?");
		if(re==true){
			location.href="deleteDeal.do?board_num="+board_num;
		}
	}
</script>
</head>
<body>
	<h2>거래게시판 상세</h2>
	<hr>
	글번호 : ${d.board_num }<br>
	글제목 : ${d.title }<br>
	작성자 : ${d.member_nick }<br>
	글내용 : <br>
	<textarea rows="10" cols="80" readonly="readonly">${d.content }</textarea><br>
	첨부파일 : <br>
	<c:if test="${d.picture_fname ne 'null' }">
	<img src="${pageContext.request.contextPath}/resources/img/${ d.picture_fname }">
	</c:if>
	<br>
	등록일 : <fmt:formatDate value="${ d.bdate }" pattern="yyyy-MM-dd hh:mm:ss" /><br>
	조회수 : ${d.views }
	<hr>
	<a href="deal.do">목록</a>
	<a href="updateDeal.do?board_num=${d.board_num }">수정</a>
	<a href="#" onclick="confirmDealDelete(${d.board_num})">삭제</a>
</body>
</html>