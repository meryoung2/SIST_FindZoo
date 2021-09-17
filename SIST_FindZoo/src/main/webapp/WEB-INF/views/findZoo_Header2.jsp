<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		color: #325d88;
		text-decoration: none;
	}
	#join-login-btn{
		float: right;
		margin-top:9px;
	}
	#title{
		diaplay: inline-block;
	}
	
</style>
</head>
<body>
	<header>
		<div class="header-title">
			<a href="main.do"><h1 id="title" style="font-size: 80px; text-align:center;">찾아주개</h1></a>
			<a href="main.do"><h1 id="title" style="font-size: 18px; color: gray; text-align:center;">본격 동물 찾기 프로젝트 findzoo</h1></a>
			
			
		<span id="join-login-btn" style="margin-right:20px;">
			<a href="join.jsp"><button type="button" class="btn btn-dark">회원가입</button></a>
		 	<a href="login.jsp"><button type="button" class="btn btn-dark">로그인</button></a>
	     </span>
	     </div>
	</header>
	
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary" style="margin-right:30px;">
		  <div class="container-fluid">
			<div class="navbar-collapse collapse show" id="navbarColor03" style="">
				<ul class="navbar-nav me-auto">

					<li class="nav-item"><a class="nav-link" href="#" style="font-size: 30px;">찾아주개?</a></li>
					
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" style="font-size: 30px;">실종동물 게시판</a>
			
						<div class="dropdown-menu">
				            <a class="dropdown-item" style="font-size: 20px;" href="#" >찾아요</a>
				            <a class="dropdown-item" style="font-size: 20px;" href="#">보호중이에요</a>
				            <a class="dropdown-item" style="font-size: 20px;" href="#">목격했어요</a>
			        	</div>
					</li>
					
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"  style="font-size: 30px;">구인공고 게시판</a>
				
						<div class="dropdown-menu">
				            <a class="dropdown-item" style="font-size: 20px;" href="#">자원봉사</a>
				            <a class="dropdown-item" style="font-size: 20px;" href="#">펫도우미</a>
				            <a class="dropdown-item" style="font-size: 20px;" href="#">목격했어요</a>
			        	</div>
					</li>
					
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" style="font-size: 30px;">커뮤니티</a>
				
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