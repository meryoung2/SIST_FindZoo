<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function btn_start(){
		location.href = "deal.do?pageNum=1";
	}
	
	function btn_end(totalPage){
		location.href = "deal.do?pageNum="+totalPage;
	}
	
	function btn_prev(listStart, listEnd){
		if(listStart != 1){
			listEnd = listStart-1;
		}else{
			listStart = 1;
		}
		
		location.href = "deal.do?pageNum="+listEnd;
	}
	
	function btn_next(listStart, listEnd, totalPage){
		if(listEnd != totalPage){
			listStart += 5;
			
			location.href = "deal.do?pageNum="+listStart;
		}else{
			location.reload();
		}
	}
	
	// 검색창에 공백 입력 시 공백 자동 제거
	function noSpaceForm(obj) 
    {             
        var str_space = /\s/;               // 공백 체크
        
        if(str_space.exec(obj.value)) 
        {     // 공백 체크
            alert("검색어에는 공백을 사용할 수 없습니다.");
            obj.focus();
            obj.value = obj.value.replace(' ',''); // 공백제거
            return false;
        }
    }
</script>
</head>
<body>
	<h2>거래 게시판 목록 (전체 게시글 수 : ${ totalRecord } / 현재 페이지 : ${ pageNum })</h2>
	<hr>
	<a href="/insertDeal.do">글쓰기</a>
	<table border="1" width="80%">
		<tr>
			<th>글제목</th>
			<th>작성자</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${list }" var="d">
			<tr>
				<td>
					<a href="detailDeal.do?board_num=${d.board_num}">${d.title }</a>
				</td>
				<td>
					<a href="memberBoard.do?member_num=${ d.member_num }">${ d.member_nick }</a>
				</td>
				<td>${d.views }</td>
			</tr>
		</c:forEach>
	</table>
	
	<a href="#" onclick="btn_start()">≪</a>
	<a href="#" onclick="btn_prev(${ listStart }, ${ listEnd })">이전</a>
	<c:forEach var="i" begin="${ listStart }" end="${ listEnd }">
		<a href="deal.do?pageNum=${ i }">${ i }</a>&nbsp;
	</c:forEach>
	<a href="#" onclick="btn_next(${ listStart }, ${ listEnd }, ${ totalPage })">다음</a>
	<a href="#" onclick="btn_end(${ totalPage })">≫</a>
	
	<!-- 검색창 -->
	<form name="searchDeal" method="get" action="searchDeal.do">
	<input type="hidden" name="pageNum" value="1">
    <select name="search_option">
		<option value="title"<c:if test="${map.search_option == 'title'}">selected</c:if>>제목</option>
		<option value="content" <c:if test="${map.search_option == 'content'}">selected</c:if>>내용</option>
        <option value="member_nick"<c:if test="${map.search_option == 'member_nick'}">selected</c:if>>작성자</option>
		<option value="all"<c:if test="${map.search_option == 'all'}">selected</c:if>>전체</option>
	</select>
    <input name="keyword" value="${map.keyword}" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);" required="required">
    <input type="submit" value="검색">
</form>
	
</body>
</html>