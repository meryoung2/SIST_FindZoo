<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾아요!</title>
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
	
	img{
		border: 1px dashed #D3D3D3;
		width: 90%;
		height: 250px;
		margin-top: 5%;
	}
	
	#find-container{
		display: flex;
		justify-content: center;
		margin-bottom: 5%;
	}
	
	#content{
		display: inline-block;
		width: 70%;
		margin-top: 2%;
	}
	
	#board{
		text-align: center;
	}
	
	#find{
		width: 30%;
		height: 30%;
		display: inline-block;
		margin: 1%;
	}
	
	#find:hover{
		cursor: pointer;
		background-color: #D3D3D3;
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
		width: 8%;
		height: 10%;
		text-align: center;
		background-color: white;
		border: 1px black solid;
		overflow: hidden;
		font-size : 12px;
	}
	
	#member_act{
		width: 100%;
		height: 100%;
	}
</style>
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
			
			location.href = "find.do?pageNum="+listStart;
		}else{
			location.reload();
		}
	}
	
	function getPetType(event) {
		document.getElementById('petType').innerText = event.target.value;
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
<jsp:include page="findZoo_Header.jsp"/>
	<div id="find-container">
		<div id="content">
			<h2><a href="find.do">찾아요게시판</a></h2>
			<h6>(전체 게시글 수 : ${ totalRecord })</h6>
			<hr>
			<div id="board">
				<c:if test="${ list[0].title ne null }">
					<div class="card mb-3" id="find" onclick="location.href='detailFind.do?board_num=${ list[0].board_num }'">
						<div id="animal_img">
							<c:if test="${ p[0] ne 'default.jpg'}">
								<img src="${pageContext.request.contextPath}/resources/img/${ p[0] }">
							</c:if>
							<c:if test="${ p[0] eq 'default.jpg'}">
								<img src="${pageContext.request.contextPath}/resources/systems/${ p[0] }">
							</c:if>
						</div>
						<hr>
						<h5>${ list[0].title }</h5>
						${ list[0].find_lost_loc }<br>
						<fmt:parseDate var="strToDate" value="${ list[0].find_lost_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate var="dateToStr" value="${ strToDate }" pattern="yyyy년 MM월 dd일"/>
						<c:out value="${ dateToStr }"/><br>
						<p style="color: red;">사례금 : <fmt:formatNumber value="${ list[0].find_reward }" pattern="#,###,###"/>원</p>
					</div>
				</c:if>
				<c:if test="${ list[1].title ne null }">
					<div class="card mb-3" id="find" onclick="location.href='detailFind.do?board_num=${ list[1].board_num }'">
						<div id="animal_img">
							<c:if test="${ p[3] ne 'default.jpg'}">
								<img src="${pageContext.request.contextPath}/resources/img/${ p[3] }">
							</c:if>
							<c:if test="${ p[3] eq 'default.jpg'}">
								<img src="${pageContext.request.contextPath}/resources/systems/${ p[3] }">
							</c:if>
						</div>
						<hr>
						<h5>${ list[1].title }</h5>
						${ list[1].find_lost_loc }<br>
						<fmt:parseDate var="strToDate" value="${ list[1].find_lost_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate var="dateToStr" value="${ strToDate }" pattern="yyyy년 MM월 dd일"/>
						<c:out value="${ dateToStr }"/><br>
						<p style="color: red;">사례금 : <fmt:formatNumber value="${ list[1].find_reward }" pattern="#,###,###"/>원</p>
					</div>
				</c:if>
				<c:if test="${ list[2].title ne null }">
					<div class="card mb-3" id="find" onclick="location.href='detailFind.do?board_num=${ list[2].board_num }'">
						<div id="animal_img">
							<c:if test="${ p[6] ne 'default.jpg'}">
								<img src="${pageContext.request.contextPath}/resources/img/${ p[6] }">
							</c:if>
							<c:if test="${ p[6] eq 'default.jpg'}">
								<img src="${pageContext.request.contextPath}/resources/systems/${ p[6] }">
							</c:if>
						</div>
						<hr>
						<h5>${ list[2].title }</h5>
						${ list[2].find_lost_loc }<br>
						<fmt:parseDate var="strToDate" value="${ list[2].find_lost_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate var="dateToStr" value="${ strToDate }" pattern="yyyy년 MM월 dd일"/>
						<c:out value="${ dateToStr }"/><br>
						<p style="color: red;">사례금 : <fmt:formatNumber value="${ list[2].find_reward }" pattern="#,###,###"/>원</p>
					</div>
				</c:if>
				<c:if test="${ list[3].title ne null }">
					<div class="card mb-3" id="find" onclick="location.href='detailFind.do?board_num=${ list[3].board_num }'">
						<div id="animal_img">
							<c:if test="${ p[9] ne 'default.jpg'}">
								<img src="${pageContext.request.contextPath}/resources/img/${ p[9] }">
							</c:if>
							<c:if test="${ p[9] eq 'default.jpg'}">
								<img src="${pageContext.request.contextPath}/resources/systems/${ p[9] }">
							</c:if>
						</div>
						<hr>
						<h5>${ list[3].title }</h5>
						${ list[3].find_lost_loc }<br>
						<fmt:parseDate var="strToDate" value="${ list[3].find_lost_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate var="dateToStr" value="${ strToDate }" pattern="yyyy년 MM월 dd일"/>
						<c:out value="${ dateToStr }"/><br>
						<p style="color: red;">사례금 : <fmt:formatNumber value="${ list[3].find_reward }" pattern="#,###,###"/>원</p>
					</div>
				</c:if>
				<c:if test="${ list[4].title ne null }">
					<div class="card mb-3" id="find" onclick="location.href='detailFind.do?board_num=${ list[4].board_num }'">
						<div id="animal_img">
							<c:if test="${ p[12] ne 'default.jpg'}">
								<img src="${pageContext.request.contextPath}/resources/img/${ p[12] }">
							</c:if>
							<c:if test="${ p[12] eq 'default.jpg'}">
								<img src="${pageContext.request.contextPath}/resources/systems/${ p[12] }">
							</c:if>
						</div>
						<hr>
						<h5>${ list[4].title }</h5>
						${ list[4].find_lost_loc }<br>
						<fmt:parseDate var="strToDate" value="${ list[4].find_lost_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate var="dateToStr" value="${ strToDate }" pattern="yyyy년 MM월 dd일"/>
						<c:out value="${ dateToStr }"/><br>
						<p style="color: red;">사례금 : <fmt:formatNumber value="${ list[4].find_reward }" pattern="#,###,###"/>원</p>
					</div>
				</c:if>
				<c:if test="${ list[5].title ne null }">
					<div class="card mb-3" id="find" onclick="location.href='detailFind.do?board_num=${ list[5].board_num }'">
						<div id="animal_img">
							<c:if test="${ p[15] ne 'default.jpg'}">
								<img src="${pageContext.request.contextPath}/resources/img/${ p[15] }">
							</c:if>
							<c:if test="${ p[15] eq 'default.jpg'}">
								<img src="${pageContext.request.contextPath}/resources/systems/${ p[15] }">
							</c:if>
						</div>
						<hr>
						<h5>${ list[5].title }</h5>
						${ list[5].find_lost_loc }<br>
						<fmt:parseDate var="strToDate" value="${ list[5].find_lost_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate var="dateToStr" value="${ strToDate }" pattern="yyyy년 MM월 dd일"/>
						<c:out value="${ dateToStr }"/><br>
						<p style="color: red;">사례금 : <fmt:formatNumber value="${ list[5].find_reward }" pattern="#,###,###"/>원</p>
					</div>
				</c:if>
				<c:if test="${ list[6].title ne null }">
					<div class="card mb-3" id="find" onclick="location.href='detailFind.do?board_num=${ list[6].board_num }'">
						<div id="animal_img">
							<c:if test="${ p[18] ne 'default.jpg'}">
								<img src="${pageContext.request.contextPath}/resources/img/${ p[18] }">
							</c:if>
							<c:if test="${ p[18] eq 'default.jpg'}">
								<img src="${pageContext.request.contextPath}/resources/systems/${ p[18] }">
							</c:if>
						</div>
						<hr>
						<h5>${ list[6].title }</h5>
						${ list[6].find_lost_loc }<br>
						<fmt:parseDate var="strToDate" value="${ list[6].find_lost_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate var="dateToStr" value="${ strToDate }" pattern="yyyy년 MM월 dd일"/>
						<c:out value="${ dateToStr }"/><br>
						<p style="color: red;">사례금 : <fmt:formatNumber value="${ list[6].find_reward }" pattern="#,###,###"/>원</p>
					</div>
				</c:if>
				<c:if test="${ list[7].title ne null }">
					<div class="card mb-3" id="find" onclick="location.href='detailFind.do?board_num=${ list[7].board_num }'">
						<div id="animal_img">
							<c:if test="${ p[21] ne 'default.jpg'}">
								<img src="${pageContext.request.contextPath}/resources/img/${ p[21] }">
							</c:if>
							<c:if test="${ p[21] eq 'default.jpg'}">
								<img src="${pageContext.request.contextPath}/resources/systems/${ p[21] }">
							</c:if>
						</div>
						<hr>
						<h5>${ list[7].title }</h5>
						${ list[7].find_lost_loc }<br>
						<fmt:parseDate var="strToDate" value="${ list[7].find_lost_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate var="dateToStr" value="${ strToDate }" pattern="yyyy년 MM월 dd일"/>
						<c:out value="${ dateToStr }"/><br>
						<p style="color: red;">사례금 : <fmt:formatNumber value="${ list[7].find_reward }" pattern="#,###,###"/>원</p>
					</div>
				</c:if>
				<c:if test="${ list[8].title ne null }">
					<div class="card mb-3" id="find" onclick="location.href='detailFind.do?board_num=${ list[8].board_num }'">
						<div id="animal_img">
							<c:if test="${ p[24] ne 'default.jpg'}">
								<img src="${pageContext.request.contextPath}/resources/img/${ p[24] }">
							</c:if>
							<c:if test="${ p[24] eq 'default.jpg'}">
								<img src="${pageContext.request.contextPath}/resources/systems/${ p[24] }">
							</c:if>
						</div>
						<hr>
						<h5>${ list[8].title }</h5>
						${ list[8].find_lost_loc }<br>
						<fmt:parseDate var="strToDate" value="${ list[8].find_lost_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate var="dateToStr" value="${ strToDate }" pattern="yyyy년 MM월 dd일"/>
						<c:out value="${ dateToStr }"/><br>
						<p style="color: red;">사례금 : <fmt:formatNumber value="${ list[8].find_reward }" pattern="#,###,###"/>원</p>
					</div>
				</c:if>
				<hr>
				<button class="btn btn-primary" onclick="location.href='/member/insertFind.do'" style="float: right;">글쓰기</button>
			</div>

			<!-- 페이지 번호 -->
			<div id="page">
				<a href="#" onclick="btn_start()">≪</a>&nbsp; <a href="#"
					onclick="btn_prev(${ listStart }, ${ listEnd })">[이전]</a>&nbsp;&nbsp;
				<c:forEach var="i" begin="${ listStart }" end="${ listEnd }">
					<c:choose>
						<c:when test="${ pageNum eq i }">
							<a href="find.do?pageNum=${ i }"
								style="font-weight: bold; color: #325d88; text-decoration: underline;">[${ i }]</a>&nbsp;&nbsp;
						</c:when>
						<c:otherwise>
							<a href="find.do?pageNum=${ i }">[${ i }]</a>&nbsp;&nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<a href="#"
					onclick="btn_next(${ listStart }, ${ listEnd }, ${ totalPage })">[다음]</a>&nbsp;
				<a href="#" onclick="btn_end(${ totalPage })">≫</a>
			</div>

			<!-- 검색창 -->
			<div id="search">
				<form name="searchFind" method="get" action="searchFind.do">
					<input type="hidden" name="pageNum" value="1"> <select
						class="form-select" name="search_option"
						style="width: 10%; display: inline-block;">
						<option value="title"
							<c:if test="${map.search_option == 'title'}">selected</c:if>>제목</option>
						<option value="content"
							<c:if test="${map.search_option == 'content'}">selected</c:if>>내용</option>
						<option value="member_nick"
							<c:if test="${map.search_option == 'member_nick'}">selected</c:if>>작성자</option>
						<option value="find_lost_loc"<c:if test="${map.search_option == 'find_lost_loc'}">selected</c:if>>지역</option>
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
<jsp:include page="findZoo_Footer.jsp"/>
</body>
</html>