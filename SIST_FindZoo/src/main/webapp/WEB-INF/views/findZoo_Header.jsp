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
	
	.dropdown:hover .dropdown-menu{
		display: block;
		margin: 0;
	}
	
	a{
		color: black;
		text-decoration: none;
	}
	
	a:hover{
		font-weight: bold;
		color: black;
		text-decoration: none;
	}
	#title{
		diaplay: inline-block;
	}
	#join_login{
		position:absolute;
		top:10px;
		right: 80px;
	}
	
</style>
</head>
<body>
	<header>
		<div id="join_login">
		
		<c:if test="${not empty loginM }">
			<a href="main.do">HOME&nbsp;&nbsp;/&nbsp;</a>
			<a href="logout.do">로그아웃&nbsp;&nbsp;/&nbsp;</a>
			<a href="/member/myInfo.do">마이페이지</a><br>
			${loginM.member_name }(${loginM.member_id })님 로그인 하였습니다.
		</c:if>
	
		<c:if test="${empty loginM }">
			<a href="main.do">HOME&nbsp;&nbsp;/&nbsp;</a>
			<a href="join.do">회원가입&nbsp;&nbsp;/&nbsp;</a>
			<a href="login.do">로그인</a>
		</c:if>

		</div>
		<div class="header-title">
			<a href="main.do"><h1 id="title" style="font-size: 80px; text-align:center;">찾아주개</h1></a>
			<a href="main.do"><h1 id="title" style="font-size: 18px; color: gray; text-align:center;">본격 동물 찾기 프로젝트 findzoo</h1></a>
	     </div>
	</header>
	
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		  <div class="container-fluid">
			<div class="navbar-collapse collapse show" id="navbarColor03" style="">
				<ul class="navbar-nav me-auto">

					<li class="nav-item"><a class="nav-link" href="#" style="font-size: 25px;">&nbsp;찾아주개?&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
					
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" style="font-size: 25px;">실종동물 게시판</a>
			
						<div class="dropdown-menu">
				            <a class="dropdown-item" style="font-size: 20px;" href="find.do" >찾아요</a>
				            <a class="dropdown-item" style="font-size: 20px;" href="boho.do">보호중이에요</a>
				            <a class="dropdown-item" style="font-size: 20px;" href="#">목격했어요</a>
			        	</div>
					</li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"  style="font-size: 25px;">구인공고 게시판</a>
				
						<div class="dropdown-menu">
				            <a class="dropdown-item" style="font-size: 20px;" href="#">자원봉사</a>
				            <a class="dropdown-item" style="font-size: 20px;" href="#">펫도우미</a>
				            <a class="dropdown-item" style="font-size: 20px;" href="#">목격했어요</a>
			        	</div>
					</li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" style="font-size: 25px;">커뮤니티</a>
				
						<div class="dropdown-menu">
				            <a class="dropdown-item" style="font-size: 20px;" href="#">자유</a>
				            <a class="dropdown-item" style="font-size: 20px;" href="#">거래</a>
				            <a class="dropdown-item" style="font-size: 20px;" href="#">정보공유</a>
				            <a class="dropdown-item" style="font-size: 20px;" href="#">찾은후기</a>
			        	</div>
					</li>
				</ul>
				<form class="d-flex">
			        <input class="form-control me-sm-2" type="text" placeholder="Search">
			        <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
			     </form>
			</div>
		</div>
	</nav>
</body>
</html>