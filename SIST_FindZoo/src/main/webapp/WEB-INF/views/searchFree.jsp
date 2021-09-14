<%@page import="com.example.demo.util.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" type="text/css">
<style type="text/css">
	@font-face {
	    font-family: 'GmarketSansMedium';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}

	*{
		font-family: 'GmarketSansMedium';
		font-weight: lighter;
	}
	
	table{
		border-right: none;
		border-left: none;
	}
	
	th{
		text-align: center;
	}
	
	a{
		color: black;
		text-decoration: none;
	}
	
	a:hover{
		font-weight: bold;
		color: #325d88;
		text-decoration: underline;
	}
	
	#free-container{
		display: flex;
		justify-content: center;
	}
	
	#content{
		display: inline-block;
		width: 70%;
		margin-top: 2%;
	}

	#page{
		text-align: center;
		margin-top: 5%;
	}
	
	#search{
		text-align: center;
	}
	
	#member_modal{
		position: absolute;
		display: none;
		width: 10%;
		height: 20%;
		text-align: center;
		background-color: white;
		border: 1px black solid;
		overflow: hidden;
	}
	
	#member_act{
		width: 100%;
		height: 100%;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
	
	$(function() {
		// 멤버 닉네임 클릭 시
		$('.member_nick').click(function(e) {
			let member_num = $(this).attr("member_num");
			$('#member_board').attr("href", "memberBoard.do?member_num="+member_num);
			
			var divLeft = e.clientX;
			var divTop = e.clientY;
			
			console.log(divLeft, divTop);
			
			$('#member_modal').css({
				"top": divTop,
				"left": divLeft,
				"position": "absolute"
			}).show();
		});
		
		// 모달 창 바깥 클릭 시
		$(document).mouseup(function (e){
			var member_modal = $("#member_modal");
			if(member_modal.has(e.target).length === 0){
				member_modal.hide();
			}
		});
	});
</script>
</head>
<body>
	<div id="free-container">
		<div id="content">
			<h2>자유게시판</h2>
			<h6>(검색 게시글 수 : ${ searchRecord })</h6>
			<hr>
			<div id="board">
				<table border="1" class="table table-hover">
					<thead class="table-active">
						<tr>
							<th width="60%">제목</th>
							<th width="30%">작성자</th>
							<th width="10%">조회수</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="s_f" items="${ list }">
							<tr>
								<td width="60%">&nbsp;&nbsp;&nbsp;<a
									href="detailFree.do?board_num=${ s_f.board_num }">${ s_f.title }</a>
								</td>
								<td width="30%" style="text-align: center;">
									<a class="member_nick" href="#" member_num=${ s_f.member_num }>${ s_f.member_nick }</a>
								</td>
								<td width="10%" style="text-align: center;">${ s_f.views }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<button class="btn btn-primary" onclick="location.href='insertFree.do'" style="float: right;">글쓰기</button>
			</div>
			
			<!-- 페이지 번호 -->
			<div id="page">
				<a href="#" onclick="btn_start(${ search_option }, '${ keyword }')">≪</a>&nbsp; <a href="#"
					onclick="btn_prev(${ s_listStart }, ${ s_listEnd }, ${ search_option }, '${ keyword }')">[이전]</a>&nbsp;
				<c:forEach var="i" begin="${ s_listStart }" end="${ s_listEnd }">
					<c:choose>
						<c:when test="${ pageNum eq i }">
							<a href="searchFree.do?pageNum=${ i }&search_option=${ search_option }&keyword=${ keyword }" style="font-weight: bold; color: #325d88; text-decoration: underline;">[${ i }]</a>&nbsp;&nbsp;
						</c:when>
						<c:otherwise>
							<a href="searchFree.do?pageNum=${ i }&search_option=${ search_option }&keyword=${ keyword }">[${ i }]</a>&nbsp;&nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<a href="#" onclick="btn_next(${ s_listStart }, ${ s_listEnd }, ${ searchPage }, ${ search_option }, '${ keyword }')">[다음]</a>&nbsp;
				<a href="#" onclick="btn_end(${ searchPage }, ${ search_option }, '${ keyword }')">≫</a>
			</div>
			
			<!-- 검색창 -->
			<div id="search">
				<form name="searchFree" method="get" action="searchFree.do">
					<input type="hidden" name="pageNum" value="1"> <select
						class="form-select" name="search_option"
						style="width: 10%; display: inline-block;">
						<option value="title"
							<c:if test="${map.search_option == 'title'}">selected</c:if>>제목</option>
						<option value="content"
							<c:if test="${map.search_option == 'content'}">selected</c:if>>내용</option>
						<option value="member_nick"
							<c:if test="${map.search_option == 'member_nick'}">selected</c:if>>작성자</option>
						<option value="all"
							<c:if test="${map.search_option == 'all'}">selected</c:if>>전체</option>
					</select> <input class="form-control" name="keyword" value="${map.keyword}"
						onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"
						required="required" style="width: 40%; display: inline-block;">
					<input class="btn btn-primary" type="submit" value="검색">
				</form>
			</div>
		</div>
	</div>

	<div class="modal" id="member_modal">
		<table class="table table-hover" id="member_act">
			<tr>
				<td><a>회원 정보 보기</a></td>
			</tr>
			<tr>
				<td><a id="member_board">작성 글 보기</a></td>
			</tr>
			<tr>
				<td><a>쪽지 보내기</a></td>
			</tr>
		</table>
	</div>
</body>
</html>