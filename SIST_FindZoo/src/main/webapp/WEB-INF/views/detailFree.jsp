<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function confirm_del(board_num){
		
		var re = confirm("정말 삭제하시겠습니까?");
		
		if(re){
			location.href = "/deleteFree.do?board_num="+board_num;	
		}
	}
</script>
</head>
<body>
	<h2>자유게시글 상세</h2>
	<hr>
	번호 : ${ f.board_num }<br>
	제목 : ${ f.title }<br>
	작성자 : ${ f.member_nick }<br>
	내용 <br>
	<textarea rows="10" cols="80" readonly="readonly">${ f.content }</textarea><br>
	<c:if test="${ f.picture_fname ne null}">
		<img src="${pageContext.request.contextPath}/resources/img/${ f.picture_fname }"><br>
	</c:if>
	등록일 : <fmt:formatDate value="${ f.bdate }" pattern="yyyy-MM-dd hh:mm:ss" /><br>
	조회수 : ${ f.views }<br>
	<hr>
	<a href="free.do">목록</a>
	<a href="updateFree.do?board_num=${ f.board_num }">수정</a>
	<a href="#" onclick="confirm_del(${ f.board_num })">삭제</a>
</body>
</html>