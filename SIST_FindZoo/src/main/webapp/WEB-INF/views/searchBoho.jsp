<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보호중이에요!</title>
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
	
	#boho-container{
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
	
	#boho{
		width: 30%;
		height: 30%;
		display: inline-block;
		margin: 1%;
	}
	
	#boho:hover{
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
	
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function btn_start(search_option, keyword){
		location.href = "searchBoho.do?pageNum=1&search_option="+search_option+"&keyword="+keyword;
	}
	
	function btn_end(searchPage, search_option, keyword){
		location.href = "searchBoho.do?pageNum="+searchPage+"&search_option="+search_option+"&keyword="+keyword;
	}
	
	function btn_prev(s_listStart, s_listEnd, search_option, keyword){
		if(s_listStart != 1){
			s_listEnd = s_listStart-1;
		}else{
			s_listStart = 1;
		}
		
		location.href = "searchBoho.do?pageNum="+s_listEnd+"&search_option="+search_option+"&keyword="+keyword;
	}
	
	function btn_next(s_listStart, s_listEnd, searchPage, search_option, keyword){
		if(s_listEnd != searchPage){
			s_listStart += 5;
			
			location.href = "searchBoho.do?pageNum="+s_listStart+"&search_option="+search_option+"&keyword="+keyword;
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
<jsp:include page="findZoo_Header.jsp"/>
	<div id="boho-container">
		<div id="content">
			<h2><a href="boho.do">보호중이에요!</a></h2>
			<h6>(검색 게시글 수 : ${ searchRecord })</h6>
			<hr>
			<div id="board">
				<c:if test="${ list[0].title ne null }">
					<div class="card mb-3" id="boho" onclick="location.href='detailBoho.do?board_num=${ list[0].board_num }'">
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
						${ list[0].boho_find_loc }<br>
						<fmt:parseDate var="strToDate" value="${ list[0].boho_find_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate var="dateToStr" value="${ strToDate }" pattern="yyyy년 MM월 dd일"/>
						<c:out value="${ dateToStr }"/><br><br>
					</div>
				</c:if>
				<c:if test="${ list[1].title ne null }">
					<div class="card mb-3" id="boho" onclick="location.href='detailBoho.do?board_num=${ list[1].board_num }'">
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
						${ list[1].boho_find_loc }<br>
						<fmt:parseDate var="strToDate" value="${ list[1].boho_find_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate var="dateToStr" value="${ strToDate }" pattern="yyyy년 MM월 dd일"/>
						<c:out value="${ dateToStr }"/><br><br>
					</div>
				</c:if>
				<c:if test="${ list[2].title ne null }">
					<div class="card mb-3" id="boho" onclick="location.href='detailBoho.do?board_num=${ list[2].board_num }'">
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
						${ list[2].boho_find_loc }<br>
						<fmt:parseDate var="strToDate" value="${ list[2].boho_find_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate var="dateToStr" value="${ strToDate }" pattern="yyyy년 MM월 dd일"/>
						<c:out value="${ dateToStr }"/><br><br>
					</div>
				</c:if>
				<c:if test="${ list[3].title ne null }">
					<div class="card mb-3" id="boho" onclick="location.href='detailBoho.do?board_num=${ list[3].board_num }'">
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
						${ list[3].boho_find_loc }<br>
						<fmt:parseDate var="strToDate" value="${ list[3].boho_find_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate var="dateToStr" value="${ strToDate }" pattern="yyyy년 MM월 dd일"/>
						<c:out value="${ dateToStr }"/><br><br>
					</div>
				</c:if>
				<c:if test="${ list[4].title ne null }">
					<div class="card mb-3" id="boho" onclick="location.href='detailBoho.do?board_num=${ list[4].board_num }'">
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
						${ list[4].boho_find_loc }<br>
						<fmt:parseDate var="strToDate" value="${ list[4].boho_find_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate var="dateToStr" value="${ strToDate }" pattern="yyyy년 MM월 dd일"/>
						<c:out value="${ dateToStr }"/><br><br>
					</div>
				</c:if>
				<c:if test="${ list[5].title ne null }">
					<div class="card mb-3" id="boho" onclick="location.href='detailBoho.do?board_num=${ list[5].board_num }'">
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
						${ list[5].boho_find_loc }<br>
						<fmt:parseDate var="strToDate" value="${ list[5].boho_find_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate var="dateToStr" value="${ strToDate }" pattern="yyyy년 MM월 dd일"/>
						<c:out value="${ dateToStr }"/><br><br>
					</div>
				</c:if>
				<c:if test="${ list[6].title ne null }">
					<div class="card mb-3" id="boho" onclick="location.href='detailBoho.do?board_num=${ list[6].board_num }'">
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
						${ list[6].boho_find_loc }<br>
						<fmt:parseDate var="strToDate" value="${ list[6].boho_find_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate var="dateToStr" value="${ strToDate }" pattern="yyyy년 MM월 dd일"/>
						<c:out value="${ dateToStr }"/><br><br>
					</div>
				</c:if>
				<c:if test="${ list[7].title ne null }">
					<div class="card mb-3" id="boho" onclick="location.href='detailBoho.do?board_num=${ list[7].board_num }'">
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
						${ list[7].boho_find_loc }<br>
						<fmt:parseDate var="strToDate" value="${ list[7].boho_find_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate var="dateToStr" value="${ strToDate }" pattern="yyyy년 MM월 dd일"/>
						<c:out value="${ dateToStr }"/><br><br>
					</div>
				</c:if>
				<c:if test="${ list[8].title ne null }">
					<div class="card mb-3" id="boho" onclick="location.href='detailBoho.do?board_num=${ list[8].board_num }'">
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
						${ list[8].boho_find_loc }<br>
						<fmt:parseDate var="strToDate" value="${ list[8].boho_find_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate var="dateToStr" value="${ strToDate }" pattern="yyyy년 MM월 dd일"/>
						<c:out value="${ dateToStr }"/><br><br>
					</div>
				</c:if>
				<hr>
				<button class="btn btn-primary" onclick="location.href='insertBoho.do'" style="float: right;">글쓰기</button>
			</div>

			<!-- 페이지 번호 -->
			<div id="page">
				<a href="#" onclick="btn_start()">≪</a>&nbsp; <a href="#"
					onclick="btn_prev(${ s_listStart }, ${ s_listEnd })">[이전]</a>&nbsp;&nbsp;
				<c:forEach var="i" begin="${ s_listStart }" end="${ s_listEnd }">
					<c:choose>
						<c:when test="${ pageNum eq i }">
							<a href="boho.do?pageNum=${ i }"
								style="font-weight: bold; color: #325d88; text-decoration: underline;">[${ i }]</a>&nbsp;&nbsp;
						</c:when>
						<c:otherwise>
							<a href="boho.do?pageNum=${ i }">[${ i }]</a>&nbsp;&nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<a href="#"
					onclick="btn_next(${ s_listStart }, ${ s_listEnd }, ${ searchPage })">[다음]</a>&nbsp;
				<a href="#" onclick="btn_end(${ searchPage })">≫</a>
			</div>

			<!-- 검색창 -->
			<div id="search">
				<form name="searchBoho" method="get" action="searchBoho.do">
					<input type="hidden" name="pageNum" value="1"> <select
						class="form-select" name="search_option"
						style="width: 10%; display: inline-block;">
						<option value="title"
							<c:if test="${map.search_option == 'title'}">selected</c:if>>제목</option>
						<option value="content"
							<c:if test="${map.search_option == 'content'}">selected</c:if>>내용</option>
						<option value="member_nick"
							<c:if test="${map.search_option == 'member_nick'}">selected</c:if>>작성자</option>
						<option value="boho_find_loc"<c:if test="${map.search_option == 'boho_find_loc'}">selected</c:if>>지역</option>
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