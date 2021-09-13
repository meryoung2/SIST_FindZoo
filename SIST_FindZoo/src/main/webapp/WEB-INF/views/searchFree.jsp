<%@page import="com.example.demo.util.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function btn_start(search_option, keyword){
		location.href = "searchFree.do?pageNum=1"+"&search_option="+search_option+"&keyword="+keyword;
	}
	
	function btn_end(searchPage, search_option, keyword){
		location.href = "searchFree.do?pageNum="+searchPage+"&search_option="+search_option+"&keyword="+keyword;
	}
	
	function btn_prev(s_listStart, s_listEnd, search_option, keyword){
		if(s_listStart != 1){
			s_listEnd = s_listStart-1;
		}else{
			s_listStart = 1;
		}
		
		location.href = "searchFree.do?pageNum="+s_listEnd+"&search_option="+search_option+"&keyword="+keyword;
	}
	
	function btn_next(s_listStart, s_listEnd, searchPage, search_option, keyword){
		if(s_listEnd != searchPage){
			s_listStart += 5;
			
			location.href = "searchFree.do?pageNum="+s_listStart+"&search_option="+search_option+"&keyword="+keyword;
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
	<h2>자유게시판 목록 (검색 게시글 수 : ${ searchRecord } / 현재 페이지 : ${ pageNum })</h2>
	<hr>
	<a href="insertFree.do">글쓰기</a>
	<hr>
	<table border="1" width="80%">
		<tr>
			<th>글제목</th>
			<th>작성자</th>
			<th width="50">조회수</th>
		</tr>
		
		<c:forEach var="s_f" items="${ list }">
			<tr>
				<td>
					<a href="detailFree.do?board_num=${ s_f.board_num }">${ s_f.title }</a>
				</td>
				<td>
					<a href="memberBoard.do?member_num=${ s_f.member_num }">${ s_f.member_nick }</a>
				</td>
				<td>${ s_f.views }</td>
			</tr>
		</c:forEach>
	</table>

	<a href="#" onclick="btn_start(${ search_option }, '${ keyword }')">≪</a>
	<a href="#" onclick="btn_prev(${ s_listStart }, ${ s_listEnd }, ${ search_option }, '${ keyword }')">이전</a>
	<c:forEach var="i" begin="${ s_listStart }" end="${ s_listEnd }">
		<a href="searchFree.do?pageNum=${ i }&search_option=${ search_option }&keyword=${ keyword }">${ i }</a>&nbsp;
	</c:forEach>
	<a href="#" onclick="btn_next(${ s_listStart }, ${ s_listEnd }, ${ searchPage }, ${ search_option }, '${ keyword }')">다음</a>
	<a href="#" onclick="btn_end(${ searchPage }, ${ search_option }, '${ keyword }')">≫</a>
	
	<!-- 검색창 -->
	<form name="searchFree" method="get" action="searchFree.do">
	<input type="hidden" name="pageNum" value="1">
    <select name="search_option">
		<option value="title"<c:if test="${map.search_option == 'title'}">selected</c:if>>제목</option>
		<option value="content" <c:if test="${map.search_option == 'content'}">selected</c:if>>내용</option>
        <option value="member_nick"<c:if test="${map.search_option == 'member_nick'}">selected</c:if>>작성자</option>
		<option value="all"<c:if test="${map.search_option == 'all'}">selected</c:if>>전체</option>
	</select>
    <input name="keyword" value="${map.keyword}" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);" required="required">
    <input type="submit" value="검색">
</body>
</html>