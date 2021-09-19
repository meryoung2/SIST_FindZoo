<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=589c052a30900321432ed77b38231404&libraries=services"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function confirmFindDelete(board_num){
		var re = confirm("정말 삭제하시겠습니까?");
		if(re==true){
			location.href="deleteFind.do?board_num="+board_num;
		}
	}
</script>
</head>
<body>
	<h2>찾아요게시판 상세</h2>
	<hr>
	글번호 : ${f.find_num }<br>
	글제목 : ${f.title }<br>
	작성자 : ${f.member_nick }<br>
	유실장소 : <span id="find_lost_loc" name="find_lost_loc">${f.find_lost_loc}</span><br>

	<p style="margin-top: -12px">
		<em class="link"> <a href="javascript:void(0);"
			onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
		</a>
		</em>
	</p>
	<div id="map" style="width: 40%; height: 350px;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=589c052a30900321432ed77b38231404&libraries=services"></script>
	<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	   		 mapOption = {
	       		 center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	      		  level: 3 // 지도의 확대 레벨
	  		  };  
	
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			var input_addr = "";
			var find_lost_loc = "${f.find_lost_loc}";
			console.log(find_lost_loc);
			input_addr = find_lost_loc;
			document.getElementById("find_lost_loc").value = input_addr;
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(input_addr, function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+input_addr+'</div>'
			        });
			        infowindow.open(map, marker);
			
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
		</script>

	<fmt:parseDate var="strToDate" value="${f.find_lost_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
	<fmt:formatDate var="dateToStr" value="${strToDate }" pattern="yyyy년 MM월 dd일"/>
	유실날짜: <c:out value="${dateToStr }"/><br>
	동물 종: ${f.find_pet }<br>
	사례금 : ${f.find_reward }<br>
	글내용 : <br>
	<textarea rows="10" cols="80" readonly="readonly">${f.content }</textarea><br>
	첨부파일 : <br>
	<c:if test="${ f.picture_fname1 ne 'default.jpg'}">
		<img src="${pageContext.request.contextPath}/resources/img/${ f.picture_fname1 }" width="150px">
	</c:if>
	<c:if test="${ f.picture_fname1 eq 'default.jpg'}">
		<img src="${pageContext.request.contextPath}/resources/systems/${ f.picture_fname1 }" width="150px">
	</c:if>
	<c:if test="${ f.picture_fname2 ne 'default.jpg'}">
		<img src="${pageContext.request.contextPath}/resources/img/${ f.picture_fname2 }" width="150px">
	</c:if>
	<c:if test="${ f.picture_fname2 eq 'default.jpg'}">
		<img src="${pageContext.request.contextPath}/resources/systems/${ f.picture_fname2 }" width="150px">
	</c:if>
	<c:if test="${ f.picture_fname3 ne 'default.jpg'}">
		<img src="${pageContext.request.contextPath}/resources/img/${ f.picture_fname3 }" width="150px">
	</c:if>
	<c:if test="${ f.picture_fname3 eq 'default.jpg'}">
		<img src="${pageContext.request.contextPath}/resources/systems/${ f.picture_fname3 }" width="150px">
	</c:if>
	
	<br>
	등록일 : <fmt:formatDate value="${ f.bdate }" pattern="yyyy-MM-dd hh:mm:ss" /><br>
	조회수 : ${f.views }
	<hr>
	<a href="find.do">목록</a>
	<a href="updateFind.do?board_num=${f.board_num }">수정</a>
	<a href="#" onclick="confirmFindDelete(${f.board_num})">삭제</a>	
	<hr>
</body>
</html>