<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	
	a{
		color: black;
		text-decoration: none;
	}
	
	a:hover{
		font-weight: bold;
		color: #325d88;
		text-decoration: underline;
	}
	
	table{
		border-right: none;
		border-left: none;
	}
	
	th{
		text-align: center;
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
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function btn_start(member_num){
		location.href = "memberBoard.do?pageNum=1&member_num="+member_num;
	}
	
	function btn_end(totalPage, member_num){
		location.href = "memberBoard.do?pageNum="+totalPage+"&member_num="+member_num;
	}
	
	function btn_prev(listStart, listEnd, member_num){
		if(listStart != 1){
			listEnd = listStart-1;
		}else{
			listStart = 1;
		}
		
		location.href = "memberBoard.do?pageNum="+listEnd+"&member_num="+member_num;
	}
	
	function btn_next(listStart, listEnd, totalPage, member_num){
		if(listEnd != totalPage){
			listStart += 5;
		}
		
		location.href = "memberBoard.do?pageNum="+listStart+"&member_num="+member_num;
	}
</script>
</head>
<body>
<div id="free-container">
		<div id="content">
	<h2>${list[0].member_nick}님의 작성 게시글 목록 (전체 게시글 수 : ${ totalRecord } / 현재 페이지 : ${ pageNum })</h2>
	<hr>
	<table border="1" class="table table-hover">
		<thead class="table-active">
		<tr>
			<th>게시판</th>
			<th>글제목</th>
			<th>조회수</th>
		</tr>
		</thead>
		<c:forEach items="${ list }" var="m">
			<tr>
				<td width="10%" style="text-align: center;">
					<c:choose>
						<c:when test="${ m.board_type_num eq 11}">
							<a href="find.do">찾아요</a>
						</c:when>
						<c:when test="${ m.board_type_num eq 12}">
							<a href="see.do">목격했어요</a>
						</c:when>
						<c:when test="${ m.board_type_num eq 13}">
							<a href="boho.do">보호중이에요</a>
						</c:when>
						<c:when test="${ m.board_type_num eq 21}">
							<a href="volunteer.do">자원봉사</a>
						</c:when>
						<c:when test="${ m.board_type_num eq 22}">
							<a href="doum.do">펫도우미</a>
						</c:when>
						<c:when test="${ m.board_type_num eq 31}">
							<a href="review.do">찾은후기</a>
						</c:when>
						<c:when test="${ m.board_type_num eq 32}">
							<a href="share.do">정보공유</a>
						</c:when>
						<c:when test="${ m.board_type_num eq 33}">
							<a href="deal.do">거래</a>
						</c:when>
						<c:when test="${ m.board_type_num eq 34}">
							<a href="free.do">자유</a>
						</c:when>
						<c:otherwise>
							-
						</c:otherwise>
					</c:choose>
				</td>
				<td width="80%">&nbsp;&nbsp;&nbsp;
					<c:choose>
						<c:when test="${ m.board_type_num eq 11}">
							<a href="detailFind.do?board_num=${ m.board_num }">${ m.title }</a>
						</c:when>
						<c:when test="${ m.board_type_num eq 12}">
							<a href="detailSee.do?board_num=${ m.board_num }">${ m.title }</a>
						</c:when>
						<c:when test="${ m.board_type_num eq 13}">
							<a href="detailBoho.do?board_num=${ m.board_num }">${ m.title }</a>
						</c:when>
						<c:when test="${ m.board_type_num eq 21}">
							<a href="detailVolunteer.do?board_num=${ m.board_num }">${ m.title }</a>
						</c:when>
						<c:when test="${ m.board_type_num eq 22}">
							<a href="detailDoum.do?board_num=${ m.board_num }">${ m.title }</a>
						</c:when>
						<c:when test="${ m.board_type_num eq 31}">
							<a href="detailReview.do?board_num=${ m.board_num }">${ m.title }</a>
						</c:when>
						<c:when test="${ m.board_type_num eq 32}">
							<a href="detailShare.do?board_num=${ m.board_num }">${ m.title }</a>
						</c:when>
						<c:when test="${ m.board_type_num eq 33}">
							<a href="detailDeal.do?board_num=${ m.board_num }">${ m.title }</a>
						</c:when>
						<c:when test="${ m.board_type_num eq 34}">
							<a href="detailFree.do?board_num=${ m.board_num }">${ m.title }</a>
						</c:when>
						<c:otherwise>
							-
						</c:otherwise>
					</c:choose>
				</td>
				<td width="10%" style="text-align: center;">${ m.views }</td>
			</tr>
		</c:forEach>
	</table>
	
	<a href="#" onclick="btn_start(${ member_num })">≪</a>
	<a href="#" onclick="btn_prev(${ listStart }, ${ listEnd }, ${ member_num })">이전</a>
	<c:forEach var="i" begin="${ listStart }" end="${ listEnd }">
		<a href="memberBoard.do?pageNum=${ i }&member_num=${ member_num }">${ i }</a>&nbsp;
	</c:forEach>
	<a href="#" onclick="btn_next(${ listStart }, ${ listEnd }, ${ totalPage }, ${ member_num })">다음</a>
	<a href="#" onclick="btn_end(${ totalPage }, ${ member_num })">≫</a>
	</div>
</div>
</body>
</html>