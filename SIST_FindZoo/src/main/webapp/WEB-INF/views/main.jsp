<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾아주개</title>
<link rel="stylesheet" type="text/css" href="./css/findZoo.css">
<link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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
</style>
</head>
<body>

	<c:if test="${not empty loginM }">
		${loginM.member_name }(${loginM.member_id })님 로그인 하였습니다.
		${loginM.member_num}
		<a href="logout.do">로그아웃</a>
		
		<a href="/member/myInfo.do">마이페이지</a>
	</c:if>
	
	<c:if test="${empty loginM }">
		<a href="login.do">로그인</a>
	</c:if>
	<hr>
	<h2>찾아주개</h2>
	
	<div>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
				<a class="navbar-brand" href="#">찾아요 (최근글)</a>
		</div>
	</nav>
	
	<div class="p" style="display: flex;">
				<div class="card mr-3 col-3" style="display: inline-block; flex: 1;">
					<c:forEach var="f" items="${mainFind }">
	
					
					<!-- 사진파일 -->
					<c:if test="${ f.picture_fname ne null}">
						<img class="card-img-top" src="${pageContext.request.contextPath}/resources/img/${ f.picture_fname }"><br>
					</c:if>
					
					<!-- 글제목 -->
					<div class="card-body">
						<p class="card-text">${f.title }</p>
					</div>

					<!-- 글내용 -->
					<div class="card-body">
						<p class="card-text">${f.content }</p>
					</div>
					
					<!-- 잃어버린 장소 -->
					<div class="card-footer text-muted">	
						<p class="card-text">${f.find_lost_loc }</p>
					</div>
					
					<!-- 작성일 -->
					<div class="card-footer text-muted">	
					작성일 : <fmt:formatDate value="${ f.bdate }" pattern="yyyy-MM-dd hh:mm:ss" /><br>
					</div>
					
					
					</c:forEach>			
	</div>
	</div>
	
	
	<div>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
				<a class="navbar-brand" href="#">보호중 (최근글)</a>
		</div>
	</nav>
	<div class="p" style="display: flex;">
				<div class="card mr-3 col-3" style="display: inline-block; flex: 1;">
					<c:forEach var="f" items="${mainBoho }">
	
					
					<!-- 사진파일 -->
					<c:if test="${ f.picture_fname ne null}">
						<img class="card-img-top" src="${pageContext.request.contextPath}/resources/img/${ f.picture_fname }"><br>
					</c:if>
					
					<!-- 글제목 -->
					<div class="card-body">
						<p class="card-text">${f.title }</p>
					</div>

					<!-- 글내용 -->
					<div class="card-body">
						<p class="card-text">${f.content }</p>
					</div>
					
					<!-- 잃어버린 장소 -->
					<div class="card-footer text-muted">	
						<p class="card-text">${f.boho_find_loc }</p>
					</div>
					
					<!-- 작성일 -->
					<div class="card-footer text-muted">	
					작성일 : <fmt:formatDate value="${ f.bdate }" pattern="yyyy-MM-dd hh:mm:ss" /><br>
					</div>
					
					</c:forEach>			
	</div>
	</div>
	
	
	
	<!--  <table border="1" width="80%">
		<c:forEach var="f" items="${mainFind }">
			<tr>
				<td>${f.title }</td>
				<td>${f.content }</td>
				<td>${f.find_lost_loc }</td>
				<td>${f.bdate }</td>
			</tr>
		</c:forEach>
	</table>
	-->
	
	

<!--  
	<div class="content col-8" style="float: none; margin: 0 auto;">
		<div class="con_find" style="border: 3px gray dashed; margin-top: 3em; margin-bottom: 1.5em;">
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
				<div class="container-fluid">
					<a class="navbar-brand" href="findZoo_Gallary.jsp">찾아요 (최근글)</a>
			    </div>
			</nav>
			<div class="p" style="display: flex;">
				<div class="card mr-3 col-3" style="display: inline-block; flex: 1;">
					<img class="card-img-top" src="./img/dog1.jpg"/>
					<div class="card-body">
						<p class="card-text">글 내용</p>
					</div>
					<div class="card-footer text-muted">1 days ago</div>
					
					
				</div>
				<div class="card col-3" style="display: inline-block; flex: 1;">
					<img class="card-img-top" src="./img/골든2.jpg"/>
					<div class="card-body">
						<p class="card-text">글 내용</p>
					</div>
					<div class="card-footer text-muted">2 days ago</div>
				</div>
				<div class="card col-3" style="display: inline-block; flex: 1;">
					<img class="card-img-top" src="./img/뱅갈2.jpg"/>
					<div class="card-body">
						<p class="card-text">글 내용</p>
					</div>
					<div class="card-footer text-muted">3 days ago</div>
				</div>
			</div>
		</div>
		
		<div class="con_boho" style="border: 3px gray dashed; margin-top: 1.5em; margin-bottom: 3em;">
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
				<div class="container-fluid">
					<a class="navbar-brand" href="findZoo_List.jsp">보호중이에요 (최근글)</a>
			    </div>
			</nav>
			<div class="p" style="display: flex;">
				<div class="card mr-3 col-3" style="display: inline-block; flex: 1;">
					<img class="card-img-top" src="./img/dog4.jpg"/>
					<div class="card-body">
						<p class="card-text">글 내용</p>
					</div>
					<div class="card-footer text-muted">1 days ago</div>
				</div>
				<div class="card col-3" style="display: inline-block; flex: 1;">
					<img class="card-img-top" src="./img/dog5.jpg"/>
					<div class="card-body">
						<p class="card-text">글 내용</p>
					</div>
					<div class="card-footer text-muted">2 days ago</div>
				</div>
				<div class="card col-3" style="display: inline-block; flex: 1;">
					<img class="card-img-top" src="./img/dog6.jpg"/>
					<div class="card-body">
						<p class="card-text">글 내용</p>
					</div>
					<div class="card-footer text-muted">3 days ago</div>
				</div>
			</div>
		</div>
	</div>
	-->
</body>
</html>