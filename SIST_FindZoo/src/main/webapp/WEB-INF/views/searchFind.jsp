<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function btn_start(search_option, keyword){
		location.href = "searchFind.do?pageNum=1&search_option="+search_option+"&keyword="+keyword;
	}
	
	function btn_end(searchPage, search_option, keyword){
		location.href = "searchFind.do?pageNum="+searchPage+"&search_option="+search_option+"&keyword="+keyword;
	}
	
	function btn_prev(s_listStart, s_listEnd, search_option, keyword){
		if(s_listStart != 1){
			s_listEnd = s_listStart-1;
		}else{
			s_listStart = 1;
		}
		
		location.href = "searchFind.do?pageNum="+s_listEnd+"&search_option="+search_option+"&keyword="+keyword;
	}
	
	function btn_next(s_listStart, s_listEnd, searchPage, search_option, keyword){
		if(s_listEnd != searchPage){
			s_listStart += 5;
			
			location.href = "searchFind.do?pageNum="+s_listStart+"&search_option="+search_option+"&keyword="+keyword;
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
	<h2>찾아요 게시판 목록 (전체 게시글 수 : ${ searchRecord } / 현재 페이지 : ${ pageNum })</h2>
	<hr>
	<a href="/insertFind.do">글쓰기</a>
	<a href="/find.do">목록</a>
	<hr>
	<c:forEach items="${list }" var="f">
			<div>
				<ul>
					<c:if test="${ f.picture_fname ne 'default.jpg'}">
						<li><a href="detailFind.do?board_num=${f.board_num}"><img src="${pageContext.request.contextPath}/resources/img/${ f.picture_fname }" width="150px"></a></li>
					</c:if>
					<c:if test="${ f.picture_fname eq 'default.jpg'}">
						<li><a href="detailFind.do?board_num=${f.board_num}"><img src="${pageContext.request.contextPath}/resources/systems/${ f.picture_fname }" width="150px"></a></li>
					</c:if>
				</ul>
			</div>
			<div>
				<ul>
					<li>${f.title }</li>
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
	
	<a href="#" onclick="btn_start(${ search_option }, '${ keyword }');">≪</a>
	<a href="#" onclick="btn_prev(${ s_listStart }, ${ s_listEnd }, ${ search_option }, '${ keyword }');">이전</a>
	<c:forEach var="i" begin="${ s_listStart }" end="${ s_listEnd }">
		<a href="searchFind.do?pageNum=${ i }&search_option=${ search_option }&keyword=${ keyword }">${ i }</a>&nbsp;
	</c:forEach>
	<a href='#' onclick="btn_next(${ s_listStart }, ${ s_listEnd }, ${ searchPage }, ${ search_option }, '${ keyword }');">다음</a>
	<a href='#' onclick="btn_end(${ searchPage }, ${ search_option }, '${ keyword }');">≫</a>

	<!-- 검색창 -->
	<form id="search" name="searchFind" method="get" action="searchFind.do">
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