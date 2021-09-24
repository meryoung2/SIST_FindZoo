<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾아주개</title>
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
	
	#main-container{
		display: flex;
		justify-content: center;
		margin-bottom: 5%;
	}
	
	#content{
		display: inline-block;
		width: 70%;
		margin-top: 2%;
	}
	
	#right-sidebar {
		display: inline-block;
		width: 15%;
		margin-left: 2%;
	}

	#right-sidebar img{
		width: 100%;
		height: 55%; /* ''banner01.jpg'면 40%; */
		margin-top: 80%;
	}
	
	#find-board, #boho-board{
		text-align: center;
	}
	
	#find, #boho{
		width: 30%;
		height: 30%;
		display: inline-block;
		margin: 1%;
	}
	
	#find:hover, #boho:hover{
		cursor: pointer;
		background-color: #D3D3D3;
	}
	.txt_c mb80{
		text-align: center;
	}
</style>
</head>
<body>
<jsp:include page="findZoo_Header.jsp"/>

	<div id="main-container">
		<div id="content">
			<br>
			<br>
			<br>
			<h2><a href="find.do">찾아요게시판</a></h2>
			<hr>
			<div id="find-board">
			
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
			</div>
			
				<br>
				<br>
				<br>
				<br>
				<h2><a href="boho.do">보호중게시판</a></h2>
				<hr>
				<div id="boho-board">
					<c:if test="${ boholist[0].title ne null }">
						<div class="card mb-3" id="boho" onclick="location.href='detailBoho.do?board_num=${ boholist[0].board_num }'">
							<div id="animal_img">
								<c:if test="${ bohop[0] ne 'default.jpg'}">
									<img src="${pageContext.request.contextPath}/resources/img/${ bohop[0] }">
								</c:if>
								<c:if test="${ bohop[0] eq 'default.jpg'}">
									<img src="${pageContext.request.contextPath}/resources/systems/${ bohop[0] }">
								</c:if>
							</div>
							<hr>
							<h5>${ boholist[0].title }</h5>
							${ boholist[0].boho_find_loc }<br>
							<fmt:parseDate var="strToDate" value="${ boholist[0].boho_find_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:formatDate var="dateToStr" value="${ strToDate }" pattern="yyyy년 MM월 dd일"/>
							<c:out value="${ dateToStr }"/><br>
						</div>
					</c:if>
					
					<c:if test="${ boholist[1].title ne null }">
						<div class="card mb-3" id="boho" onclick="location.href='detailBoho.do?board_num=${ boholist[1].board_num }'">
							<div id="animal_img">
								<c:if test="${ bohop[3] ne 'default.jpg'}">
									<img src="${pageContext.request.contextPath}/resources/img/${ bohop[3] }">
								</c:if>
								<c:if test="${ bohop[3] eq 'default.jpg'}">
									<img src="${pageContext.request.contextPath}/resources/systems/${ bohop[3] }">
								</c:if>
							</div>
							<hr>
							<h5>${ boholist[1].title }</h5>
							${ boholist[1].boho_find_loc }<br>
							<fmt:parseDate var="strToDate" value="${ boholist[1].boho_find_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:formatDate var="dateToStr" value="${ strToDate }" pattern="yyyy년 MM월 dd일"/>
							<c:out value="${ dateToStr }"/><br>
						</div>
					</c:if>
					
					<c:if test="${ boholist[2].title ne null }">
						<div class="card mb-3" id="boho" onclick="location.href='detailBoho.do?board_num=${ boholist[2].board_num }'">
							<div id="animal_img">
								<c:if test="${ bohop[6] ne 'default.jpg'}">
									<img src="${pageContext.request.contextPath}/resources/img/${ bohop[6] }">
								</c:if>
								<c:if test="${ bohop[6] eq 'default.jpg'}">
									<img src="${pageContext.request.contextPath}/resources/systems/${ bohop[6] }">
								</c:if>
							</div>
							<hr>
							<h5>${ boholist[2].title }</h5>
							${ boholist[2].boho_find_loc }<br>
							<fmt:parseDate var="strToDate" value="${ boholist[2].boho_find_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:formatDate var="dateToStr" value="${ strToDate }" pattern="yyyy년 MM월 dd일"/>
							<c:out value="${ dateToStr }"/><br>
						</div>
					</c:if>
					
					<c:if test="${ boholist[3].title ne null }">
						<div class="card mb-3" id="boho" onclick="location.href='detailBoho.do?board_num=${ boholist[3].board_num }'">
							<div id="animal_img">
								<c:if test="${ bohop[9] ne 'default.jpg'}">
									<img src="${pageContext.request.contextPath}/resources/img/${ bohop[9] }">
								</c:if>
								<c:if test="${ bohop[9] eq 'default.jpg'}">
									<img src="${pageContext.request.contextPath}/resources/systems/${ bohop[9] }">
								</c:if>
							</div>
							<hr>
							<h5>${ boholist[3].title }</h5>
							${ boholist[3].boho_find_loc }<br>
							<fmt:parseDate var="strToDate" value="${ boholist[3].boho_find_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:formatDate var="dateToStr" value="${ strToDate }" pattern="yyyy년 MM월 dd일"/>
							<c:out value="${ dateToStr }"/><br>
						</div>
					</c:if>
					
					<c:if test="${ boholist[4].title ne null }">
						<div class="card mb-3" id="boho" onclick="location.href='detailBoho.do?board_num=${ boholist[4].board_num }'">
							<div id="animal_img">
								<c:if test="${ bohop[12] ne 'default.jpg'}">
									<img src="${pageContext.request.contextPath}/resources/img/${ bohop[12] }">
								</c:if>
								<c:if test="${ bohop[12] eq 'default.jpg'}">
									<img src="${pageContext.request.contextPath}/resources/systems/${ bohop[12] }">
								</c:if>
							</div>
							<hr>
							<h5>${ boholist[4].title }</h5>
							${ boholist[4].boho_find_loc }<br>
							<fmt:parseDate var="strToDate" value="${ boholist[4].boho_find_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:formatDate var="dateToStr" value="${ strToDate }" pattern="yyyy년 MM월 dd일"/>
							<c:out value="${ dateToStr }"/><br>
						</div>
					</c:if>
					
					<c:if test="${ boholist[5].title ne null }">
						<div class="card mb-3" id="boho" onclick="location.href='detailBoho.do?board_num=${ boholist[5].board_num }'">
							<div id="animal_img">
								<c:if test="${ bohop[15] ne 'default.jpg'}">
									<img src="${pageContext.request.contextPath}/resources/img/${ bohop[15] }">
								</c:if>
								<c:if test="${ bohop[15] eq 'default.jpg'}">
									<img src="${pageContext.request.contextPath}/resources/systems/${ bohop[15] }">
								</c:if>
							</div>
							<hr>
							<h5>${ boholist[5].title }</h5>
							${ boholist[5].boho_find_loc }<br>
							<fmt:parseDate var="strToDate" value="${ boholist[5].boho_find_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:formatDate var="dateToStr" value="${ strToDate }" pattern="yyyy년 MM월 dd일"/>
							<c:out value="${ dateToStr }"/><br>
						</div>
					</c:if>
				
				
				</div>
			
			
		</div>
		
		<!-- 사이드 배너 -->
		<div id="right-sidebar">
			<a href="https://www.animal.go.kr/front/index.do" target='_blank'>
				<img src="./resources/systems/banner02.png"/>
			</a>
		</div>
	</div>   
<jsp:include page="findZoo_Footer.jsp"/>
</body>
</html>