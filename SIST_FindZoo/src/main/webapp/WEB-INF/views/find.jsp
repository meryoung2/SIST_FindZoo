<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function btn_start(){
		location.href = "find.do?pageNum=1";
	}
	
	function btn_end(totalPage){
		location.href = "find.do?pageNum="+totalPage;
	}
	
	function btn_prev(listStart, listEnd){
		if(listStart != 1){
			listEnd = listStart-1;
		}else{
			listStart = 1;
		}
		
		location.href = "find.do?pageNum="+listEnd;
	}
	
	function btn_next(listStart, listEnd, totalPage){
		if(listEnd != totalPage){
			listStart += 5;
		}
		
		location.href = "find.do?pageNum="+listStart;
	}
	
	function getPetType(event) {
		document.getElementById('petType').innerText = event.target.value;
	}
	
</script>
</head>
<body>
	<h2>찾아요 게시판</h2>
	<hr>
	<a href="/insertFind.do">글쓰기</a>
	<hr>
	<c:forEach items="${list }" var="f">
			<div>
				<ul>
					<li><a href="detailFind.do?board_num=${f.board_num}"><img src="${pageContext.request.contextPath}/resources/img/${ f.picture_fname }"></a></li>
				</ul>
			</div>
			<div>
				<ul>
					<li id="petType">동물종: ${f.find_pet}</li>
					<li>사례금: ${f.find_reward}</li>
					<li>유실지역: ${f.find_lost_loc}</li>
					<li><fmt:parseDate var="strToDate" value="${f.find_lost_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:formatDate var="dateToStr" value="${strToDate }" pattern="yyyy년 MM월 dd일"/>
					유실날짜: <c:out value="${dateToStr }"/>
					</li>
				</ul>
			</div>
	</c:forEach>
	
	<a href="#" onclick="btn_start()">≪</a>
	<a href="#" onclick="btn_prev(${ listStart }, ${ listEnd })">이전</a>
	<c:forEach var="i" begin="${ listStart }" end="${ listEnd }">
		<a href="find.do?pageNum=${ i }">${ i }</a>&nbsp;
	</c:forEach>
	<a href="#" onclick="btn_next(${ listStart }, ${ listEnd }, ${ totalPage })">다음</a>
	<a href="#" onclick="btn_end(${ totalPage })">≫</a>
	
	<!-- 거래게시판 검색창 -->
	<form name="searchFind" method="post" action="searchFind.do">
    <select name="search_option">
        <option value="member_nick"
			<c:if test="${map.search_option == 'member_nick'}">selected</c:if>
			   >작성자</option>
			
			        <option value="title" 
			<c:if test="${map.search_option == 'title'}">selected</c:if>
			        >제목</option>
			
			        <option value="content" 
			<c:if test="${map.search_option == 'content'}">selected</c:if>
			        >내용</option>
			
			        <option value="all" 
			<c:if test="${map.search_option == 'all'}">selected</c:if>
			        >작성자+내용+제목</option>
			    </select>
    <input name="keyword" value="${map.keyword}">
    <input type="submit" value="검색">
</form>
	
</body>
</html>