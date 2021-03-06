<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 게시글</title>
<link rel="stylesheet" href="../../resources/css/bootstrap.min.css" type="text/css">
<style type="text/css">
	a {
		color: black;
		text-decoration: none;
	}
	a:hover {
		font-weight: bold;
		color: #325d88;
		text-decoration: underline;
	}
	
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
	
	/* 메인 컨테이너, 사이드바, 컨텐츠 컨테이너 비율 조절 */
	#myPost-container {
		display: flex;
		width: 70%;
		margin: 15%;
		margin-top: 30px;
		margin-bottom: 5%;
	}
	
	#myPost-container #sidebar{
		margin-right: 20px;
	}
	
	#myPost-container #table-container {
		width: 80%;
		padding: 10px;
	}
	
	#myPost-container #table-container .table {
		margin-top: 18px;
	}
	
	/* 페이지 이동 관련 버튼들을 가운데에 정렬 */
	#paging-container {
		display: flex;
		justify-content: center;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function btn_start(member_num){
		location.href = "/member/myPost.do?pageNum=1"
	}
	
	function btn_end(totalPage, member_num){
		location.href = "/member/myPost.do?pageNum="+totalPage;
	}
	
	function btn_prev(listStart, listEnd, member_num){
		if(listStart != 1){
			listEnd = listStart-1;
		}else{
			listStart = 1;
		}
		
		location.href = "/member/myPost.do?pageNum="+listEnd;
	}
	
	function btn_next(listStart, listEnd, totalPage, member_num){
		if(listEnd != totalPage){
			listStart += 5;
		}
		
		location.href = "/member/myPost.do?pageNum="+listStart;
	}
</script>
</head>
<body>
	<jsp:include page="./findZoo_Header.jsp"/>
	<div id="myPost-container">
		<aside id="sidebar">
			<div class="accordion" id="accordionExample">
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingOne">
						<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne"
							aria-expanded="false" aria-controls="collapseOne">내 정보</button>
					</h2>
					<div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
						<div class="accordion-body">
							<a href="/member/myInfo.do"> - 내 정보</a><br><br>
							<a href="/member/updateInfo.do"> - 내 정보 수정</a><br><br>
							<a href="/member/deleteChangeInfo.do"> - 회원 탈퇴</a><br>
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingTwo">
						<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo"
							aria-expanded="false" aria-controls="collapseTwo">쪽지함</button>
					</h2>
					<div id="collapseTwo" class="accordion-collapse collapse show" aria-labelledby="headingTwo" data-bs-parent="#accordionExample" style="">
						<div class="accordion-body">
							<a href="/member/sendNoteList.do"> - 보낸 쪽지함</a><br><br>
							<a href="/member/receiveNoteList.do"> - 받은 쪽지함</a><br>
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingThree">
						<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree"
							aria-expanded="false" aria-controls="collapseThree">내가 쓴 글</button>
					</h2>
					<div id="collapseThree" class="accordion-collapse collapse show" aria-labelledby="headingThree" data-bs-parent="#accordionExample" style="">
						<div class="accordion-body">
							<a href="/member/myPost.do?pageNum=1"> - 내가 쓴 게시글</a><br><br>
							<a href="/member/myReply.do?pageNum=1"> - 내가 쓴 댓글</a><br>
						</div>
					</div>
				</div>
			</div>
		</aside>
		<article id="table-container">
			<c:if test="${list[0] == null }">
				<h2><strong>${member_nick }님의 게시글</strong></h2>
				<hr>
				작성하신 게시글이 없습니다. <br>
				<br>
				<input type="button" class="btn btn-primary" value="내 정보" onclick="location.href='/member/myInfo.do'">
			</c:if>
			<c:if test="${list[0] != null }">
				<h2><strong>${member_nick }님의 게시글</strong></h2>
				<table class="table table-hover" width="100%">
					<tr>
						<th class="table-active">게시판</th>
						<th class="table-active">글제목</th>
						<th class="table-active">조회수</th>
					</tr>
					<c:forEach items="${ list }" var="m">
						<tr>
							<td>
								<c:choose>
									<c:when test="${ m.board_type_num eq 11}">
										<a href="../find.do">찾아요</a>
									</c:when>
									<c:when test="${ m.board_type_num eq 13}">
										<a href="../see.do">목격했어요</a>
									</c:when>
									<c:when test="${ m.board_type_num eq 12}">
										<a href="../boho.do">보호중이에요</a>
									</c:when>
									<c:when test="${ m.board_type_num eq 21}">
										<a href="../volunteer.do">자원봉사</a>
									</c:when>
									<c:when test="${ m.board_type_num eq 22}">
										<a href="../doum.do">펫도우미</a>
									</c:when>
									<c:when test="${ m.board_type_num eq 31}">
										<a href="../review.do">찾은후기</a>
									</c:when>
									<c:when test="${ m.board_type_num eq 32}">
										<a href="../share.do">정보공유</a>
									</c:when>
									<c:when test="${ m.board_type_num eq 33}">
										<a href="../deal.do">거래</a>
									</c:when>
									<c:when test="${ m.board_type_num eq 34}">
										<a href="../free.do">자유</a>
									</c:when>
									<c:otherwise>
										-
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${ m.board_type_num eq 11}">
										<a href="../detailFind.do?board_num=${ m.board_num }">${ m.title }</a>
									</c:when>
									<c:when test="${ m.board_type_num eq 12}">
										<a href="../detailSee.do?board_num=${ m.board_num }">${ m.title }</a>
									</c:when>
									<c:when test="${ m.board_type_num eq 13}">
										<a href="../detailBoho.do?board_num=${ m.board_num }">${ m.title }</a>
									</c:when>
									<c:when test="${ m.board_type_num eq 21}">
										<a href="../detailVolunteer.do?board_num=${ m.board_num }">${ m.title }</a>
									</c:when>
									<c:when test="${ m.board_type_num eq 22}">
										<a href="../detailDoum.do?board_num=${ m.board_num }">${ m.title }</a>
									</c:when>
									<c:when test="${ m.board_type_num eq 31}">
										<a href="../detailReview.do?board_num=${ m.board_num }">${ m.title }</a>
									</c:when>
									<c:when test="${ m.board_type_num eq 32}">
										<a href="../detailShare.do?board_num=${ m.board_num }">${ m.title }</a>
									</c:when>
									<c:when test="${ m.board_type_num eq 33}">
										<a href="../detailDeal.do?board_num=${ m.board_num }">${ m.title }</a>
									</c:when>
									<c:when test="${ m.board_type_num eq 34}">
										<a href="../detailFree.do?board_num=${ m.board_num }">${ m.title }</a>
									</c:when>
									<c:otherwise>
										-
									</c:otherwise>
								</c:choose>
							</td>
							<td>${ m.views }</td>
						</tr>
					</c:forEach>
				</table>
				<br>
				<div id="paging-container">
					<a href="#" onclick="btn_start(${ member_num })">≪</a>&nbsp;&nbsp;
					<a href="#" onclick="btn_prev(${ listStart }, ${ listEnd }, ${ member_num })">이전</a>&nbsp;&nbsp;
					<c:forEach var="i" begin="${ listStart }" end="${ listEnd }">
						<a href="/member/myPost.do?pageNum=${ i }">${ i }</a>&nbsp;
					</c:forEach>
					<a href="#" onclick="btn_next(${ listStart }, ${ listEnd }, ${ totalPage }, ${ member_num })">다음</a>&nbsp;&nbsp;
					<a href="#" onclick="btn_end(${ totalPage }, ${ member_num })">≫</a>&nbsp;&nbsp;
				</div>
			</c:if>
		</article>
	</div>
	<jsp:include page="../findZoo_Footer.jsp"/>
</body>
</html>