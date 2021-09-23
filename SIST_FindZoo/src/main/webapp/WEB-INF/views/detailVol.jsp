<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	
	a{
		color: black;
		text-decoration: none;
	}
	
	a:hover{
		font-weight: bold;
		color: #325d88;
		text-decoration: underline;
	}
	
	button{
		margin-right: 1%;
	}
	
	#vol-container{
		display: flex;
		justify-content: center;
	}
	
	#content{
		display: inline-block;
		width: 70%;
		margin-top: 2%;
		margin-bottom: 2%;
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=589c052a30900321432ed77b38231404&libraries=services"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	// 삭제 관련 알림 창
	function confirm_del(board_num){
		
		var re = confirm("정말 삭제하시겠습니까?");
		
		if(re){
			location.href = "/deleteVol.do?board_num="+board_num;	
		}
	}
	
	// Textarea 크기에 따라 창을 수정해주는 함수
	function resize(obj) {
		  obj.style.height = "1px";
		  obj.style.height = (12+obj.scrollHeight)+"px";
	}
	
	$(function() {
		
		// 글 내용의 길이에 따라 스크롤을 사용하지 않고 내용 출력
		var ta = $("#ta");
	    if (ta) {
	        ta.each(function(){
	            $(this).height(this.scrollHeight);
	        });
	    }
		
		// 멤버 닉네임 클릭 시
		$('.member_nick').click(function(e) {
			let member_num = $(this).attr("member_num");
			$('#member_board').attr("href", "memberBoard.do?member_num="+member_num);
			
			var divLeft = e.clientX;
			var divTop = e.clientY;
			
			console.log(divLeft, divTop);
			
			$('#member_modal').css({
				"top": divTop,
				"left": divLeft,
				"position": "absolute"
			}).show();
		});
		
		// 모달 창 바깥 클릭 시
		$(document).mouseup(function (e){
			var member_modal = $("#member_modal");
			if(member_modal.has(e.target).length === 0){
				member_modal.hide();
			}
		});
	});
	
	//댓글삭제 스크립트
	function confirmDeleteReply(reply_num, board_num){
	var re = confirm("댓글을 삭제하시겠습니까?");
		if(re==true){
			location.href="volDeleteReply.do?board_num="+board_num+"&reply_num="+reply_num;
		}
	}
	
	//댓글수정 스크립트
	function updateReply(reply_num){
		$('#reply_num').val(reply_num)
	}
	
	//대댓글 스크립트
	function reReply(reply_num){
		$('#reply_number').val(reply_num)
	}
</script>
</head>
<body>
	<div id="vol-container">
		<div id="content">
			<h4>${ v.title }</h4>
			<hr>
			<a class="member_nick" href="#" member_num=${ v.member_num }>${ v.member_nick }</a>&nbsp;|&nbsp;<h6 style="display: inline-block;"><fmt:formatDate value="${ v.bdate }" pattern="yyyy-MM-dd hh:mm:ss" /></h6>
			<h6 style="float: right;">조회수 : ${ v.views }</h6>
			<hr>
			
			기관명&nbsp;|&nbsp;${v.volunteer_cname }<br>
			기관 연락처&nbsp;|&nbsp;${v.volunteer_tel }<br>
			<fmt:parseDate var="strToDate1" value="${v.volunteer_s_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
			<fmt:formatDate var="dateToStr1" value="${strToDate1 }" pattern="yyyy년 MM월 dd일"/>
			<fmt:parseDate var="strToDate2" value="${v.volunteer_e_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
			<fmt:formatDate var="dateToStr2" value="${strToDate2 }" pattern="yyyy년 MM월 dd일"/>
			봉사 시작일자&nbsp;|&nbsp;<c:out value="${dateToStr1 }"/> ~ 봉사 종료일자&nbsp;|&nbsp;<c:out value="${dateToStr2 }"/>
			<hr>
			
			기관 위치 : <span id="volunteer_loc" name="volunteer_loc">${v.volunteer_loc}</span><br>
			<p style="margin-top: -12px">
				<em class="link"> 
				<a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')"></a>
				</em>
			</p>
	
			<div id="map" style="width: 60%; height: 400px;"></div>

			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=589c052a30900321432ed77b38231404&libraries=services"></script>
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
				var volunteer_loc = "${v.volunteer_loc}";
				console.log(volunteer_loc);
				input_addr = volunteer_loc;
				document.getElementById("volunteer_loc").value = input_addr;
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
			<hr>
			
			<c:if test="${ v.picture_fname ne null}">
				<img src="${pageContext.request.contextPath}/resources/img/${ v.picture_fname }"><br>
			</c:if>
			<textarea id="ta" readonly="readonly" style="width: 100%; outline: none; border: none;">${ v.content }</textarea><br>
			<hr>
			<button class="btn btn-primary" onclick="location.href='vol.do'" style="float: left;">목록</button>
			<button class="btn btn-primary" onclick="location.href='updateVol.do?board_num=${ v.board_num }'" style="float: right;">수정</button>
			<button class="btn btn-primary" onclick="confirm_del(${ v.board_num })" style="float: right;">삭제</button>		
		
			<br><br>
			<hr>
			<h3>댓글</h3>
			<table frame=void width="100%">
				<c:forEach var="r" items="${list }">
					<tr>
						<td><c:if test="${r.reply_level>0 }">
								<c:forEach var="i" begin="1" end="${r.reply_level }">
							&nbsp;&nbsp;&nbsp;&nbsp;
						</c:forEach>
							</c:if> <c:choose>
								<c:when test="${r.reply_level eq 0}">
									<a class="member_nick" href="#" member_num=${ v.member_num }>${ v.member_nick }</a>	&nbsp;| &nbsp;
									<button type="button" style=" border: none; outline: none; background: transparent; margin-left:-10px;"
									data-bs-toggle="modal" data-bs-target="#updateReply"
									onclick="updateReply(${r.reply_num })">
									<img src="../../resources/img/edit.png" style="cursor:pointer;width:20px;height:20px;" ></button>
									<button type="button" style=" border: none; outline: none; background: transparent;"
									onclick="confirmDeleteReply(${r.reply_num}, ${v.board_num})">
									<img src="../../resources/img/delete.png" style="cursor:pointer;width:20px;height:20px; margin-left:-20px;" >
									</button>
								</c:when>
								<c:when test="${r.reply_level > 0}">
									<a class="member_nick" href="#" member_num=${ v.member_num }>${ v.member_nick }</a>	&nbsp;| &nbsp;
									<button type="button" style=" border: none; outline: none; background: transparent; margin-left:-10px;"
									data-bs-toggle="modal" data-bs-target="#updateReply"
									onclick="updateReply(${r.reply_num })">
									<img src="../../resources/img/edit.png" style="cursor:pointer;width:20px;height:20px;" ></button>

									<button type="button" style=" border: none; outline: none; background: transparent; margin-left:-20px;"
									onclick="confirmDeleteReply(${r.reply_num}, ${v.board_num})">
									<img src="../../resources/img/delete.png" style="cursor:pointer;width:20px;height:20px;" >
									</button>
								</c:when>
							</c:choose></td>
					</tr>
					<tr>
						<td><c:if test="${r.reply_level>0 }">
								<c:forEach var="i" begin="1" end="${r.reply_level }">
							&nbsp;&nbsp;&nbsp;&nbsp;
						</c:forEach>
							</c:if> ${r.reply_content}
						</td>	
					</tr>
					<tr>
						<td><c:if test="${r.reply_level>0 }">
									<c:forEach var="i" begin="1" end="${r.reply_level }">
									&nbsp;&nbsp;&nbsp;&nbsp;
						</c:forEach>
								</c:if> <c:choose>
							<c:when test="${r.reply_level eq 0}">
							<fmt:formatDate value="${r.reply_date}" pattern="yyyy-MM-dd hh:mm" />&nbsp;&nbsp;
							<a href="#reReply" data-bs-toggle="modal"
							onclick="reReply(${r.reply_num })">답글쓰기</a>
							</c:when>
							<c:when test="${r.reply_level > 0}">
							<fmt:formatDate value="${r.reply_date}" pattern="yyyy-MM-dd hh:mm" />
							</c:when>
							</c:choose>
						<hr></td>
					</tr>	
				</c:forEach>
				<tr>
					<td width="500px">
						<br>
						<form action="volInsertReply.do" method="post">
							<p style="margin-bottom:-37px;">${v.member_nick }</p> <input class="btn btn-dark" type="submit" value="등록"  style="float: right;"> 
							<input type="hidden" name="board_num" value="${v.board_num }"><br>
							<textarea name="reply_content"
								style="border: 1px solid rgb(224, 224, 224); width: 100%" rows="5"
								placeholder="댓글을 입력하세요."></textarea>
						</form>
					</td>
				</tr>
			</table>

		</div>
	</div>




	<!-- 댓글수정 모달 -->
	<div class="modal fade" id="updateReply" tabindex="-1" aria-labelledby="updateReplyLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <form action="/volUpdateReply.do" method="post">
	      <div class="modal-header">
	        <h4 class="modal-title" id="updateReplyLabel">댓글 수정창</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<div class="form-group">
	      		<label for="reply_num">댓글번호</label>
	      		<input class="form-control" id="reply_num" name="reply_num" value="${reply_num }" readonly>
	      	</div>
	      	<div class="form-group">
	      		<label for="member_num">댓글 작성자</label>
	      		<input class="form-control" id="member_nick" name="member_nick" value="${v.member_nick }" readonly>
				<input type="hidden" name="board_num" value="${v.board_num }"><br>
	      	</div>
	      	<div class="form-group">
	      		<label for="reply_content">댓글 내용</label>
	      		<input class="form-control" id="reply_content" name="reply_content" placeholder="댓글 내용을 입력해주세요">
	      	</div>
	      </div>
	      <div class="modal-footer">
	        <button type="submit" class="btn btn-success modalModBtn" onclick="updateReply(${r.reply_num}, ${v.board_num})">수정</button> 
	      </div>
	      </form>
	    </div>
	  </div>
	</div>
	
	
	<!-- 대댓글 모달 -->
	<div class="modal fade" id="reReply" tabindex="-1" aria-labelledby="reReplyLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <form action="/volReReply.do" method="post">
	      <div class="modal-header">
	        <h4 class="modal-title" id="reReplyLabel">답글쓰기</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<div class="form-group">
	      		<label for="reply_num">참조 댓글번호</label>
	      		<input class="form-control" id="reply_number" name="reply_num" value="${reply_num }" readonly>
	      	</div>
	      	<div class="form-group">
	      		<label for="member_nick">답글 작성자</label>
	      		<input class="form-control" id="member_nick" name="member_nick" value="${v.member_nick }" readonly>
				<input type="hidden" name="board_num" value="${v.board_num }"><br>
	      	</div>
	      	<div class="form-group">
	      		<label for="reply_content">답글 내용</label>
	      		<input class="form-control" id="reply_content" name="reply_content" placeholder="답글 내용을 입력해주세요">
	      	</div>
	      </div>
	      <div class="modal-footer">
	        <button type="submit" class="btn btn-success modalModBtn" onclick="reReply(${r.reply_num}, ${v.board_num})">답글쓰기</button> 
	      </div>
	      </form>
	    </div>
	  </div>
	</div>


	<div class="modal" id="member_modal">
		<table class="table table-hover" id="member_act">
			<tr>
				<td><a id="member_board">회원 정보 보기</a></td>
			</tr>
			<tr>
				<td><a>쪽지 보내기</a></td>
			</tr>
		</table>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>