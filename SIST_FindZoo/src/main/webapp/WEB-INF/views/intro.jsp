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
	
	#btnSearch, #btnClear, #btnlast{
    display: inline-block;
    vertical-align: top;
}
</style>
</head>
<body>
<jsp:include page="findZoo_Header.jsp"/>

	<div id="main-container">
		<div id="content">
		
			<div class="card border-light mb-3" style="width: 100%;">
				<div class="card-body">
					<p class="card-text"><em>
					<br>
					<br>
              	  	<span class="text-info">>찾아주개</span>는 인간에 의해 관리되는 모든 동물들이 인도적인 대우를 받게 하고자 하며,<br>
               		 더 나아가 인간에 의해 이용되거나, 삶의 터전을 잃어가는 동물의 수(數)와 종(種)을 줄여나감으로써,<br>
               		 인간과 동물이 생태적 · 윤리적 조화를 이루며 살아가는 것을 목표로 합니다.</em></p>
 				</div>
			</div>
		
			<div style="text-align:center;">
				<img alt="" src="/resources/systems/system_01.png" style="width:700px;">
				<br>
				<br>
				<br>
				<br>
				
					<dl class="gr_explan">
						<dt>동물학대를 방지하고 생명존중의 문화를 꽃피웁니다.</dt>
						<dd>
							국민소득이 늘고 핵가족이 보편화되면서 개나 고양이 같은 반려동물을 키우는 가정이 크게 늘었습니다.<br>
							그러나 소유자의 부주의로 인해 동물을 잃어버리거나 경제적인 이유 등으로 동물을 버리는 사례도 늘고 있습니다.  <br>
							또한 반려동물에 대한 관리 소홀로 도시미관이나 공중위생을 해치고 이웃에 피해를 주는 사례도 적지 않습니다.  <br>
							게다가 우리 사회에는 아직도 잔인한 방법으로 동물을 죽이거나 상해를 입히는 동물학대 행위가 때때로 발생하는 등 <br> 
							성숙한 동물 보호·관리 문화가 완전히 정착하지 못한 상황입니다.
						</dd>
						<dd>
							동물보호법은 동물학대를 방지하는 등 동물을 보호·관리하고 공중위생상의 위해를 막기 위하여 필요한 사항을 법으로 정함으로써,  <br>
							동물의 생명과 안전을 보호하고 복지를 증진하며 사람과 동물이 더불어 사는 생명존중의 사회를 구현하고자 합니다. <br>
						</dd>
					</dl>
			</div>
			<br>
			<br>
			<hr>
			<br>
			<br>
			<h2 class="text-primary" style="text-align:center;"><em>유기견, 유기묘 등 유기동물관련 사이트</em></h2>
			<table class="table table-hover" style="text-align:center;">
  			<thead>
			<tr class="table-light">
		      <td>[전국공통]</td>
		      <td>APMS 동물보호관리시스템</td>
		      <td>http://animal.go.kr</td>
		    </tr>
			<tr class="table-light">
		      <td>[전국공통]</td>
		      <td>동물보호센터</td>
		      <td>http://www.angel.or.kr</td>
		    </tr>
			<tr class="table-light">
		      <td>[전국공통]</td>
		      <td>동물학대방지연합</td>
		      <td>http://www.foranimal.or.kr</td>
		    </tr>
			<tr class="table-light">
		      <td>[전국공통]</td>
		      <td>동물자유연대</td>
		      <td>http://www.animals.or.kr</td>
		    </tr>
			<tr class="table-light">
		      <td>[전국공통]</td>
		      <td>동물사랑실천협회</td>
		      <td>http://www.fromcare.org</td>
		    </tr>
			<tr class="table-light">
		      <td>[전국공통]</td>
		      <td>동물보호센터 다음카페</td>
		      <td>http://cafe.daum.net/forangels</td>
		    </tr>
			<tr class="table-light">
		      <td>[서울,경기,인천]</td>
		      <td>한국동물구조관리협회</td>
		      <td>http://www.karama.or.kr</td>
		    </tr>
			<tr class="table-light">
		      <td>[대구,경북]</td>
		      <td>한국동물보호협회</td>
		      <td>http://koreananimals.or.kr</td>
		    </tr>
			<tr class="table-light">
		      <td>[서울,경기,인천]</td>
		      <td>한국동물구조관리협회</td>
		      <td>http://www.karama.or.kr</td>
		    </tr>
			<tr class="table-light">
		      <td>[부산,울산,경남]</td>
		      <td>동물학대방지연합 부산지부</td>
		      <td>http://www.animallife.or.kr</td>
		    </tr>
			<tr class="table-light">
		      <td>[광주,전남]</td>
		      <td>광주동물보호소</td>
		      <td>http://www.kcanimal.or.kr</td>
		    </tr>
			<tr class="table-light">
		      <td>[대전,충남]</td>
		      <td>대전광역시 동물보호소</td>
		      <td>https://www.daejeon.go.kr/ani/index.do</td>
		    </tr>
			<tr class="table-light">
		      <td>[충북]</td>
		      <td>한국동물보호협회</td>
		      <td>http://koreananimals.or.kr</td>
		    </tr>
			</tbody>
			</table>	
			
			<hr>
			 <div class="d-grid gap-2" style="text-align:center;">
				<a href="https://www.animal.go.kr/front/awtis/public/publicList.do?menuNo=1000000055" onclick="window.open(this.href);return false;"><button id="btnSearch" class="btn btn-lg btn-primary" type="button" style="width:33%;">구조동물공고 매일매일 확인하는 곳!</button></a>
			    <a href="https://www.animal.go.kr/front/awtis/institution/institutionList.do?menuNo=1000000059" onclick="window.open(this.href);return false;"><button id="btnClear" class="btn btn-lg btn-primary" type="button" style="width:33%;">해당지역 보호소 확인후 메모하세요!</button></a>
			    <a href="https://www.animal.go.kr/front/awtis/shop/hospitalList.do?menuNo=6000000002" onclick="window.open(this.href);return false;"><button id="btnlast" class="btn btn-lg btn-primary" type="button" style="width:33%;">해당지역 동물병원 확인후 메모하세요!</button></a>
			</div>	
			
		</div>
	</div>   
<jsp:include page="findZoo_Footer.jsp"/>
</body>
</html>