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
	a {
		color: black;
		text-decoration: none;
	}
	a:hover {
		font-weight: bold;
		color: #325d88;
		text-decoration: underline;
	}
	
	/* 폰트 적용 */
	@font-face {
		font-family: 'GmarketSansMedium';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}
	* {
		font-family: 'GmarketSansMedium';
		font-weight: lighter;
	}
	
	/* 내 정보 전체 수정 */
	#updateInfo-container {
		display: flex;
		position: absolute;
		width: 70%; 
		margin: 15%;
		margin-top: 20px;
		margin-bottom: 20px;
		border: 1px solid black;
	}
			
	#updateInfo-container #sidebar {
		width: 15%;
		margin: 10px;
		border: 1px solid black;
	}
	
	#updateInfo-container #input-container {
		margin-top: 10px;
		margin-bottom: 10px;
		padding: 20px;
		border: 1px solid black;
	}
	
	/* 인증코드 발송 */
	#sms-code, #check-code-btn, #cancel-btn, #time {
		visibility: hidden;
	} 
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	///////////// DB 주소 데이터를 member_addr1, member_addr2에 각각 불러온다. /////////////
	$(function(){
		if($("#member_addr").val() != "") {
			var db_addr = $("#member_addr").val().split(", ");
			$("#member_addr1").val(db_addr[0]);
			$("#member_addr2").val(db_addr[1]);
			console.log("변경 전 주소: "+$("#member_addr1").val()+", "+$("#member_addr2").val());
		} 
	}) 
	
	//////////////////// 연락처 변경을 위해 인증코드를 전송하고 값을 비교한다. ////////////////////
	$(function(){
		var code;
		var userCode;
		var leftTime = (60*2)-1, display = $("#time"); 
		var db_phone = $("#member_phone").val(); 
		console.log("변경 전 번호: "+db_phone);
		$("#send-code-btn").click(function(){
			clearInterval(x);
			var to = $("#member_phone").val();
			data = {to:to};
			$.ajax({url:"sendCode.do", data:data, success:function(data){
				code = data;
				alert("인증코드를 발송하였습니다. 유효시간은 2분입니다.");
				$("#send-code-btn").val("재전송");
				$("#member_phone").attr("readonly", true);
				$("#sms-code, #check-code-btn, #cancel-btn, #time").css("visibility", "visible"); 
				$("#sms-code").attr("required", true);
				console.log("전송된 코드: "+code);
				startTimer(leftTime, display);
			}});
			setTimeout(function() { 
				code = -1;
				console.log("변경된 코드: "+code);
			}, 120000); 
		});
		$("#check-code-btn").click(function(){
			userCode = $("#sms-code").val();
			if(userCode == code) {
				alert("인증이 완료되었습니다.");
				$("#send-code-btn").val("인증 완료");
				code = -1;
				$("#sms-code").val("");
				$("#send-code-btn, #sms-code, #check-code-btn, #cancel-btn, #time").css("visibility", "hidden");
				$("#sms-code").attr("required", false);
			}else {
				alert("인증에 실패하였습니다. 코드를 확인해주세요.");				
				$("#sms-code").val("");
			}
		});
		$("#cancel-btn").click(function(){
			code = -1;
			$("#member_phone").val(db_phone);
			$("#send-code-btn").val("인증번호 전송");
			$("#member_phone").attr("readonly", false);
			$("#sms-code").val("");
			$("#sms-code, #check-code-btn, #cancel-btn, #time").css("visibility", "hidden");
		}); 
		
		////////////////////////////////// submit //////////////////////////////////
		$("#updateInfoForm").submit(function(){	
			if( ($("#member_phone").val() != db_phone) && ($("#send-code-btn").val() == "인증코드 전송") ) {
				$("#send-code-btn").trigger("click");
				return false;
			}else if($("#send-code-btn").val() == "재전송") {
				alert("인증에 실패하였습니다. 코드를 확인해주세요.");
				$("#sms-code").val("");
				return false;
			}
			
			if($("#member_addr2").val() == "") {
				$("#member_addr").val($("#member_addr1").val());				
			}else {
				$("#member_addr").val($("#member_addr1").val()+", "+$("#member_addr2").val());
			}
			console.log("변경 할 주소: "+$("#member_addr").val());
		});
	})
	
	/////////////////// 카카오 주소 API를 이용하여 검색 결과를 addr에 담는다. ///////////////////
	function findAddr(){
		new daum.Postcode({
		oncomplete: function(data) {
	    	console.log(data);
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var roadAddr = data.roadAddress; // 도로명 주소 변수
			var jibunAddr = data.jibunAddress; // 지번 주소 변수
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			// 만약 addr1 주소가 새로 입력되었다면 addr2은 비워준다.
			document.getElementById('member_post').value = data.zonecode;
			if(roadAddr !== ''){
				document.getElementById("member_addr1").value = roadAddr;
				document.getElementById("member_addr2").value = "";
			} 
			else if(jibunAddr !== ''){
				document.getElementById("member_addr1").value = jibunAddr;
				document.getElementById("member_addr2").value = "";
			}
		}}).open();
	}	
	
	///////////////////// 닉네임 중복 확인 팝업창을 화면 가운데에 위치시킨다. /////////////////////
	function checkNick() {
		var popupX = (document.body.offsetWidth/2)-(450/2);
		var popupY= (window.screen.height/2)-(300/2);
		window.open("checkNick.do", "_blank", "width=450, height=300, left="+popupX+", top="+popupY);
	}
	
	var x;

	////////////////////////////// 인증코드 유효시간(타이머) ///////////////////////////////
	function startTimer(leftTime, display) {
	    var time = leftTime;
	    var isRunning = false;
	    var min = "";
	    var sec = "";
	   	x = setInterval(function () {
	   		min = parseInt(time/60);
	    	sec = parseInt(time%60);

	    	min = min < 10 ? "0" + min : min;
	    	sec = sec < 10 ? "0" + sec : sec;
	        
	        display.text(min+":"+sec);
			time--;
	        
	        if(time < 0) {
				clearInterval(x);
				isRunning = false;
	        }
	    }, 1000);
	}
</script>
</head>
<body>
	<div id="updateInfo-container">
		<aside id="sidebar">
			<div class="list-group">
				<a href="myInfo.do?member_num=${mb.member_num}" class="list-group-item list-group-item-action">내 정보</a>
				<a href="myNote.do?member_num=${mb.member_num}" class="list-group-item list-group-item-action">쪽지함</a>
				<a href="memberBoard.do?pageNum=1&member_num=${mb.member_num}" class="list-group-item list-group-item-action">내 게시글</a>
				<a href="#" class="list-group-item list-group-item-action">내 댓글</a>
			</div>
		</aside>
		<article id="input-container">
			<h2>내 정보 수정</h2>
			<hr>
			<form action="updateInfo.do" id="updateInfoForm" method="post">
				* 확인 후 hidden 값으로 변경<br>
				관리자 여부 <input type="text" name="member_admin" value="${mb.member_admin }" readonly><br>
				회원 번호 <input type="text" name="member_num" value="${mb.member_num }" readonly><br>
				포인트 <input type="text" name="member_point" value="${mb.member_point }" readonly><br>
				로그인 방식 <input type="text" name="social_num" value="${mb.social_num }" readonly><br><br>
				
				<label>아이디</label>
				<input type="text" name="member_id" value="${mb.member_id }" readonly><br>
			
				<label>비밀번호</label> 
				<input type="text" name="member_pwd" value="${mb.member_pwd }" readonly><br>
			
				<label>이름</label>
				<input type="text" name="member_name" value="${mb.member_name }" readonly><br>
			
				<label>닉네임</label>
				<input type="text" id="member_nick" name="member_nick" size="13" value="${mb.member_nick }" readonly required>
				<input type="button" value="닉네임 변경" onclick="checkNick()"><br>
				
				<div id="send-code-container">
					<label>연락처</label>
					<input type="tel" id="member_phone" name="member_phone" size="13" maxlength="12" value="${mb.member_phone }" required>
					<input type="button" id="send-code-btn" value="인증코드 전송">&nbsp;
					<span id="time">02:00</span>
					<input type="tel" id="sms-code" size="6" maxlength="6">
					<input type="button" id="check-code-btn" value="인증코드 확인">
					<input type="button" id="cancel-btn" value="취소"><br>
				</div>
				
				<label>이메일</label>
				<input type="email" name="member_email" value="${mb.member_email }" size="30" maxlength="30" required><br>
		
				<label>주소</label>
				<input type="text" id="member_addr1" name="member_addr1" placeholder="주소검색" size="30" readonly="readonly" required onclick="findAddr()">
				<input type="text" id="member_addr2" name="member_addr2" placeholder="상세주소">
				<input type="hidden" id="member_post" placeholder="우편번호" readonly="readonly">
				<input type="hidden" id="member_addr" name="member_addr" value="${mb.member_addr }"><br>
				<span style="font-size: 6px;">*주소 변경을 원하시면 첫번째 칸을 눌러주세요.</span><br>
			
				<label>알림 서비스</label>
				<c:if test="${mb.member_sms == '동의'}">
					<input type="radio" name="member_sms" value="동의" checked>동의
					<input type="radio" name="member_sms" value="비동의">비동의<br>		
				</c:if>
				<c:if test="${mb.member_sms == '비동의'}">
					<input type="radio" name="member_sms" value="동의">동의
					<input type="radio" name="member_sms" value="비동의" checked>비동의<br>			
				</c:if>
				
				<br>	
					
				<input type="submit" value="수정">
				<input type="button" value="취소" onclick="history.back(-1);">
			</form>
		</article>
	</div>
</body>
</html>