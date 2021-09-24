<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목격했어요!</title>
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
	
	img .box{
		border: 1px dashed #D3D3D3;
		width: 100%;
		height: 400px;
	}
	
	button{
		margin-right: 1%;
	}
	
	#slide_and_map{
		text-align: center;
		display: flex;
		justify-content: center;
		width: 100%;
	}
	
	#see-container{
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
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
<script type="text/javascript">
	// 삭제 관련 알림 창
	function confirm_del(board_num){
		
		var re = confirm("정말 삭제하시겠습니까?");
		
		if(re){
			location.href = "/deleteSee.do?board_num="+board_num;	
		}
	}
	
	// Textarea 크기에 따라 창을 수정해주는 함수
	function resize(obj) {
		  obj.style.height = "1px";
		  obj.style.height = (12+obj.scrollHeight)+"px";
	}
	
	// 쪽지 보내기 팝업창을 띄운다.
	function sendNewNote(member_num) {
		var popupX = (document.body.offsetWidth/2)-(800/2);
		var popupY = (window.screen.height/2)-(370/2);
		window.open("/member/sendNewNote.do?member_num="+member_num, "_blank", "width=420, height=370, left="+popupX+", top="+popupY);
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
			$('#member_info').attr("href", "memberInfo.do?member_num="+member_num);
			$('#send_new_note').attr("href", "window.open('/member/sendNewNote.do?member_num='+member_num, '_blank', 'width=420, height=370, left='+popupX+', top='+popupY)");
			
			var divLeft = e.pageX;
			var divTop = e.pageY;
			
			console.log(divLeft, divTop);
			
			$('#member_modal').css({
				"top": divTop,
				"left": divLeft,
				"position": "absolute"
			}).show();
			return false;
		});
		
		// 모달 창 바깥 클릭 시
		$(document).mouseup(function (e){
			var member_modal = $("#member_modal");
			if(member_modal.has(e.target).length === 0){
				member_modal.hide();
			}
		});
<<<<<<< HEAD
		// 비로그인 시 회원 닉네임 클릭 시 알람 팝업 출력
		$('.login_pls_alert').click(function(e){
			alert("회원 정보를 보려면 로그인을 해야 합니다!");
=======
		
		// 비로그인 시 회원 닉네임 클릭 시 알람 팝업 출력
		$('.login_pls_alert').click(function(e){
			alert("로그인이 필요합니다!");
>>>>>>> branch 'master' of https://github.com/meryoung2/SIST_FindZoo.git
		});
	});

	
	//댓글삭제 스크립트
	function confirmDeleteReply(reply_num, board_num){
	var re = confirm("댓글을 삭제하시겠습니까?");
		if(re==true){
			location.href="seeDeleteReply.do?board_num="+board_num+"&reply_num="+reply_num;
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
<jsp:include page="findZoo_Header.jsp"/>
	<div id="see-container">
		<div id="content">
			<h4>${ s.title }</h4>
			<hr>
			<c:if test="${ member_num eq 0 }">
				<a href="#a" class="login_pls_alert">${ s.member_nick }</a>&nbsp;|&nbsp;
			</c:if>
			<c:if test="${ member_num ne 0 }">
				<a class="member_nick" href="#a" member_num=${ s.member_num }>${ s.member_nick }</a>&nbsp;|&nbsp;
			</c:if>
			<h6 style="display: inline-block;">
				<fmt:formatDate value="${ s.bdate }" pattern="yyyy-MM-dd hh:mm:ss" />
			</h6>
			<h6 style="float: right;">조회수 : ${ s.views }</h6>
			<hr>
			
			<div id="slide_and_map">
				<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" style="width: 50%; border: 1px dashed #D3D3D3;">
					<div>
						<c:if test="${ s.picture_fname ne 'default2.png'}">
							<img src="${pageContext.request.contextPath}/resources/img/${ s.picture_fname }" class="box">
						</c:if>
						<c:if test="${ s.picture_fname eq 'default2.png'}">
							<img src="${pageContext.request.contextPath}/resources/systems/${ s.picture_fname }" class="box">
						</c:if>
					</div>
				</div>
				
				<input type="hidden" id="see_find_loc" name="see_find_loc" value="${s.see_find_loc}">
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
					var see_find_loc = "${s.see_find_loc}";
					console.log(see_find_loc);
					input_addr = see_find_loc;
					document.getElementById("see_find_loc").value = input_addr;
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
			</div>
			<hr>
			<table border="1px solid #D3D3D3;" class="table table-hover" style="text-align: center;">
				<tbody>
					<tr>
						<td>동물종</td>
						<td>${s.see_pet }</td>
					</tr>
					<tr>
						<td>목격날짜</td>
						<td><fmt:parseDate var="strToDate" value="${s.see_find_date }" pattern="yyyy-MM-dd HH:mm:ss"/><fmt:formatDate var="dateToStr" value="${strToDate }" pattern="yyyy년 MM월 dd일"/><c:out value="${dateToStr }"/></td>
					</tr>
					<tr>
						<td>목격장소</td>
						<td>${s.see_find_loc }</td>
					</tr>
				</tbody>
			</table>
			<br>
			<textarea id="ta" readonly="readonly" style="width: 100%; outline: none; border: none;">${ s.content }</textarea><br>
			<hr>
			<button class="btn btn-primary" onclick="location.href='see.do'" style="float: left;">목록</button>
			<c:if test="${ member_num ne 0 and member_num eq s.member_num }">
				<button class="btn btn-primary" onclick="location.href='/member/updateSee.do?board_num=${ s.board_num }'" style="float: right;">수정</button>
				<button class="btn btn-primary" onclick="confirm_del(${ s.board_num })" style="float: right;">삭제</button>		
			</c:if>
			<br>
			<hr>
			<h3>댓글</h3>
			<table frame=void width="100%">
				<c:forEach var="r" items="${list }">
					<tr>
						<td><c:if test="${r.reply_level>0 }">
								<c:forEach var="i" begin="1" end="${r.reply_level }">
							&nbsp;&nbsp;&nbsp;&nbsp;
						</c:forEach>
							</c:if> 
							<c:choose>
								<c:when test="${r.reply_level eq 0}">
									<c:if test="${ member_num eq 0 }">
										<a href="#a" class="login_pls_alert">${ r.member_nick }</a>
									</c:if>
									<c:if test="${ member_num ne 0 }">
										<a class="member_nick" href="#a" member_num=${ r.member_num }>${ r.member_nick }</a>
									</c:if>
									<c:if test="${loginM.member_num ne 0 and loginM.member_num eq r.member_num }">
									&nbsp;| &nbsp;
										<button type="button" style=" border: none; outline: none; background: transparent; margin-left:-10px;"
										data-bs-toggle="modal" data-bs-target="#updateReply"
										onclick="updateReply(${r.reply_num })">
										<img src="../../resources/systems/edit.png" class="aa" style="cursor:pointer;width:20px;height:20px;" ></button>
										
										<button type="button" style=" border: none; outline: none; background: transparent;"
										onclick="confirmDeleteReply(${r.reply_num}, ${s.board_num})">
										<img src="../../resources/systems/delete.png" style="cursor:pointer;width:20px;height:20px; margin-left:-10px;" >
										</button>
									</c:if>
								</c:when>
								<c:when test="${r.reply_level > 0}">
										<c:if test="${ member_num eq 0 }">
											<a href="#a" class="login_pls_alert">${ r.member_nick }</a>
										</c:if>
										<c:if test="${ member_num ne 0 }">
											<a class="member_nick" href="#a" member_num=${ r.member_num }>${ r.member_nick }</a>
										</c:if>
										<c:if test="${loginM.member_num ne 0 and loginM.member_num eq r.member_num }">
										&nbsp;| &nbsp;
										<button type="button" style=" border: none; outline: none; background: transparent; margin-left:-10px;"
										data-bs-toggle="modal" data-bs-target="#updateReply"
										onclick="updateReply(${r.reply_num })">
										<img src="../../resources/systems/edit.png" style="cursor:pointer;width:20px;height:20px;" ></button>
	
										<button type="button" style=" border: none; outline: none; background: transparent; margin-left:-10px;"
										onclick="confirmDeleteReply(${r.reply_num}, ${s.board_num})">
										<img src="../../resources/systems/delete.png" style="cursor:pointer;width:20px;height:20px;" >
										</button>
									</c:if>
								</c:when>
							</c:choose>
							</td>
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
								</c:if> 
								<c:choose>
								<c:when test="${r.reply_level eq 0}">
								<fmt:formatDate value="${r.reply_date}" pattern="yyyy-MM-dd hh:mm" />&nbsp;&nbsp;
								<c:if test="${loginM.member_num > 0}">
								<a href="#reReply" data-bs-toggle="modal"
								onclick="reReply(${r.reply_num })">답글쓰기</a>
								</c:if>
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
					<c:if test="${loginM.member_num > 0}">
						<form action="/member/seeInsertReply.do" method="post">
							<br>
							<p style="margin-bottom:-37px; text-align:left;">${loginM.member_nick }</p> <input class="btn btn-dark" type="submit" value="등록"  style="float: right;"> 	
							<textarea name="reply_content"
								style="border: 1px solid rgb(224, 224, 224); width: 100%" rows="5"
								placeholder="댓글을 입력하세요."></textarea>
							<input type="hidden" name="board_num" value="${s.board_num }">
							<input type="hidden" name="member_num" value="${loginM.member_num }">
							<input type="hidden" name="member_nick" value="${loginM.member_nick }">
						</form>
					</c:if>
					<c:if test="${loginM.member_num eq null}">
						<br>
						<textarea readonly name="reply_content"
							style="border: 1px solid rgb(224, 224, 224); width: 100%" rows="5"
							placeholder="댓글을 작성하려면 로그인 해주세요."></textarea>
						<input type="hidden" name="board_num" value="${s.board_num }">
						<input type="hidden" name="member_num" value="${loginM.member_num }">
						<input type="hidden" name="member_nick" value="${loginM.member_nick }">
					</c:if>
					</td>
				</tr>
			</table>

		</div>
	</div>




	<!-- 댓글수정 모달 -->
	<div class="modal fade" id="updateReply" tabindex="-1" aria-labelledby="updateReplyLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <form action="/member/seeUpdateReply.do" method="post">
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
	      		<input class="form-control" id="member_nick" name="member_nick" value="${loginM.member_nick }" readonly>
				<input type="hidden" name="board_num" value="${s.board_num }"><br>
	      	</div>
	      	<div class="form-group">
	      		<label for="reply_content">댓글 내용</label>
	      		<input class="form-control" id="reply_content" name="reply_content" placeholder="댓글 내용을 입력해주세요">
	      	</div>
	      </div>
	      <div class="modal-footer">
	        <button type="submit" class="btn btn-success modalModBtn" onclick="updateReply(${r.reply_num}, ${s.board_num})">수정</button> 
	      </div>
	      </form>
	    </div>
	  </div>
	</div>
	
	
	<!-- 대댓글 모달 -->
	<div class="modal fade" id="reReply" tabindex="-1" aria-labelledby="reReplyLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <form action="/member/seeReReply.do" method="post">
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
	      		<input class="form-control" id="member_nick" name="member_nick" value="${loginM.member_nick }" readonly>
				<input type="hidden" name="board_num" value="${s.board_num }">
				<input type="hidden" name="member_num" value="${loginM.member_num }"><br>
	      	</div>
	      	<div class="form-group">
	      		<label for="reply_content">답글 내용</label>
	      		<input class="form-control" id="reply_content" name="reply_content" placeholder="답글 내용을 입력해주세요">
	      	</div>
	      </div>
	      <div class="modal-footer">
	        <button type="submit" class="btn btn-success modalModBtn" onclick="reReply(${r.reply_num}, ${s.board_num})">답글쓰기</button> 
	      </div>
	      </form>
	    </div>
	  </div>
	</div>


	<div class="modal" id="member_modal">
		<table class="table table-hover" id="member_act">
			<tr>
				<td><a id="member_info">회원 정보 보기</a></td>
			</tr>
			<tr>
				<td><a href="#" onclick="sendNewNote(${s.member_num})">쪽지 보내기</a></td>
			</tr>
		</table>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<jsp:include page="findZoo_Footer.jsp"/>
</body>
</html>