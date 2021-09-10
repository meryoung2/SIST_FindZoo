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
	function confirmFindDelete(board_num){
		var re = confirm("정말 삭제하시겠습니까?");
		if(re==true){
			location.href="deleteFind.do?board_num="+board_num;
		}
	}
</script>
</head>
<body>
	<h2>찾아요게시판 상세</h2>
	<hr>
	글번호 : ${f.find_num }<br>
	글제목 : ${f.title }<br>
	작성자 : ${f.member_nick }<br>
	유실장소 : ${f.find_lost_loc}<br>
	<fmt:parseDate var="strToDate" value="${f.find_lost_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
	<fmt:formatDate var="dateToStr" value="${strToDate }" pattern="yyyy년 MM월 dd일"/>
	유실날짜: <c:out value="${dateToStr }"/><br>
	동물 종: ${f.find_pet }<br>
	사례금 : ${f.find_reward }<br>
	글내용 : <br>
	<textarea rows="10" cols="80" readonly="readonly">${f.content }</textarea><br>
	첨부파일 : <br>
	<c:if test="${ f.picture_fname ne 'default.jpg'}">
		<img src="${pageContext.request.contextPath}/resources/img/${ f.picture_fname }" width="150px">
	</c:if>
	<c:if test="${ f.picture_fname eq 'default.jpg'}">
		<img src="${pageContext.request.contextPath}/resources/systems/${ f.picture_fname }" width="150px">
	</c:if>
	<br>
	등록일 : <fmt:formatDate value="${ f.bdate }" pattern="yyyy-MM-dd hh:mm:ss" /><br>
	조회수 : ${f.views }
	<hr>
	<a href="find.do">목록</a>
	<a href="updateFind.do?board_num=${f.board_num }">수정</a>
	<a href="#" onclick="confirmFindDelete(${f.board_num})">삭제</a>	
	<hr>
	<%@ include file="../views/reply.jsp" %>

</body>
</html>