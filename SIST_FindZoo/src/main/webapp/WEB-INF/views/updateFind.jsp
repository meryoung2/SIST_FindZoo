<%@page import="com.example.demo.vo.FindVo"%>
<%@page import="com.example.demo.dao.FindDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=589c052a30900321432ed77b38231404&libraries=services"></script>
</head>
<body>
	<h2>게시물 수정</h2>
	<hr>
	<form action="/updateFind.do" method="post" enctype="multipart/form-data" onsubmit="fixLoc();">
		<input type="hidden" name="board_num" value="${f.board_num }">
		<input type="hidden" name="picture_fname1" value="${f.picture_fname1 }">
		<input type="hidden" name="picture_fname2" value="${f.picture_fname2 }">
		<input type="hidden" name="picture_fname3" value="${f.picture_fname3 }">
		<input type="hidden" name="picture_file_num1" value="${f.picture_file_num1 }">
		<input type="hidden" name="picture_file_num2" value="${f.picture_file_num2 }">
		<input type="hidden" name="picture_file_num3" value="${f.picture_file_num3 }">
		
		글제목 : <input type="text" name="title" value="${f.title }"><br>
		
		유실장소 : <span>${f.find_lost_loc}</span><br>
		<input id="addr1" name="addr1" type="text" placeholder="위치 검색 후 '위치변경'버튼을 눌러주세요." readonly="readonly" onclick="findAddr()">
		<input type="hidden" id="addr2" name="addr2" placeholder="상세주소">
		<input id="post"  type="hidden" placeholder="우편번호" readonly="readonly"><button type="button" onclick="getAddr()">위치변경</button><br>
		<input type="hidden" id="old_find_lost_loc" name="old_find_lost_loc" value="${f.find_lost_loc }">
		
		<p style="margin-top: -12px">
			<em class="link"> <a href="javascript:void(0);"
				onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
			</a>
			</em>
		</p>
		<div id="map" style="width: 40%; height: 350px;"></div>

		<script>
		
		$(document).ready(function(){
			var addr1 = $("#addr1").val();
			var addr2 = $("#addr2").val();
			var find_lost_loc = addr1.concat(addr2);
		
			$("#find_lost_loc").val(find_lost_loc);
			console.log(find_lost_loc);
		});

		
		// 다음 주소찾기api 활용 함수
		function findAddr() {
			new daum.Postcode({
				oncomplete : function(data) {

					console.log(data);

					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var jibunAddr = data.jibunAddress; // 지번 주소 변수
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('post').value = data.zonecode;
					if (roadAddr !== '') {
						document.getElementById("addr1").value = roadAddr;
					} else if (jibunAddr !== '') {
						document.getElementById("addr2").value = jibunAddr;
					}
				}
			}).open();
		}
		
		// 위치변경 버튼 클릭시 함수 실행
		function getAddr() {
			var new_input_addr = "";
			var new_find_lost_loc = document.getElementById('addr1').value;
			console.log('가져온 텍스트', new_find_lost_loc);
			document.getElementById("find_lost_loc").value = new_find_lost_loc;
			
			geocoder.addressSearch(new_find_lost_loc,function(result, status) { // 정상적으로 검색이 완료됐으면 
				if (status === kakao.maps.services.Status.OK) { 
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

					// 결과값으로 받은 위치를 마커로 표시합니다
					var marker = new kakao.maps.Marker({
						map : map,
						position : coords
					});

					// 인포윈도우로 장소에 대한 설명을 표시합니다
					var infowindow = new kakao.maps.InfoWindow(
							{
								content : '<div style="width:150px;text-align:center;padding:6px 0;">'+ new_find_lost_loc + '</div>'
							});
					infowindow.open(map, marker);

					// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					map.setCenter(coords);
				}
			});
		}
		
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			var input_addr = "";
			var old_find_lost_loc = document.getElementById("old_find_lost_loc").value;
			console.log(old_find_lost_loc);
			input_addr = old_find_lost_loc;
			
			// 주소로 좌표를 검색합니다
			// 아래는 위치변경을 안했을 시 기존 주소를 그대로 map에 찍어줌
			geocoder.addressSearch(input_addr,function(result, status) { // 정상적으로 검색이 완료됐으면 
				if (status === kakao.maps.services.Status.OK) { 
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

					// 결과값으로 받은 위치를 마커로 표시합니다
					var marker = new kakao.maps.Marker({
						map : map,
						position : coords
					});

					// 인포윈도우로 장소에 대한 설명을 표시합니다
					var infowindow = new kakao.maps.InfoWindow(
							{
								content : '<div style="width:150px;text-align:center;padding:6px 0;">'+ input_addr + '</div>'
							});
					infowindow.open(map, marker);

					// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					map.setCenter(coords);
				}
			});
			
			function fixLoc(){
				var old_find_lost_loc = document.getElementById('old_find_lost_loc').value;
				var find_lost_loc = document.getElementById('find_lost_loc').value;
				
				if(find_lost_loc === ''){
					document.getElementById('find_lost_loc').value = old_find_lost_loc;
				}
			}
			
		</script>
			<input type="hidden" name="find_lost_loc" id="find_lost_loc" value="${f.find_lost_loc }"><br>

		<fmt:parseDate var="strToDate" value="${f.find_lost_date }" pattern="yyyy-MM-dd"/>
		<fmt:formatDate var="dateToStr" value="${strToDate }" pattern="yyyy년 MM월 dd일"/>
		유실날짜 : <c:out value="${dateToStr }"/>&nbsp;<input type="date" name="find_lost_date" required="required"><br>
		동물 종 :
		<c:choose>
			<c:when test="${f.find_pet eq '강아지' }">
				<input type="radio" class="form-check-input" name="find_pet" id="find_pet_dog" value="강아지" checked="checked">
				<label for="find_pet_dog">강아지</label>
				<input type="radio" class="form-check-input" name="find_pet" id="find_pet_cat" value="고양이">
				<label for="find_pet_cat">고양이</label>
				<input type="radio" class="form-check-input" name="find_pet" id="find_pet_etc" value="기타">
				<label for="find_pet_etc">기타</label><br>
			</c:when>
			<c:when test="${f.find_pet eq '고양이' }">
				<input type="radio" class="form-check-input" name="find_pet" id="find_pet_dog" value="강아지">
				<label for="find_pet_dog">강아지</label>
				<input type="radio" class="form-check-input" name="find_pet" id="find_pet_cat" value="고양이" checked="checked">
				<label for="find_pet_cat">고양이</label>
				<input type="radio" class="form-check-input" name="find_pet" id="find_pet_etc" value="기타">
				<label for="find_pet_etc">기타</label><br>
			</c:when>
			<c:otherwise>
				<input type="radio" class="form-check-input" name="find_pet" id="find_pet_dog" value="강아지">
				<label for="find_pet_dog">강아지</label>
				<input type="radio" class="form-check-input" name="find_pet" id="find_pet_cat" value="고양이">
				<label for="find_pet_cat">고양이</label>
				<input type="radio" class="form-check-input" name="find_pet" id="find_pet_etc" value="기타" checked="checked">
				<label for="find_pet_etc">기타</label><br>
			</c:otherwise>
		</c:choose>
		사례금 : <input type="text" name="find_reward" placeholder="사례금을 입력해주세요(없을시에는 0)" value="${f.find_reward }"><br>
		글내용 : <br>
		<textarea rows="10" cols="80" name="content">${f.content}</textarea><br>
		첨부파일1 : ${f.picture_fname1 } / ${ f.picture_file_num1 }<br>
		첨부파일2 : ${f.picture_fname2 } / ${ f.picture_file_num2 }<br>
		첨부파일3 : ${f.picture_fname3 } / ${ f.picture_file_num3 }<br>
		<input type="file" name="picture_file1"><br>
		<input type="file" name="picture_file2"><br>
		<input type="file" name="picture_file3"><br>
		<input type="submit" value="수정">
		<input type="reset" value="취소">		
	</form>
</body>
</html>