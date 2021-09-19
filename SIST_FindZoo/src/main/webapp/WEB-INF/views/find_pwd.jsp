<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
	/* 인증코드 발송 */
	#sms-code, #check-code-btn, #cancel-btn, #time {
		visibility: hidden;
	} 
</style>
<script type="text/javascript">
////////////////////연락처 변경을 위해 인증코드를 전송하고 값을 비교한다. ////////////////////
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
	});
})

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
	<h2>휴대폰 인증으로 비밀번호 변경하기</h2>
	<hr>
	<form action="updateInfo.do" id="updateInfoForm" method="post">	
			
			<div>
				<label>아이디</label>
				<input type="text" name="member_id" id="member_id" class = "btn-name" placeholder = "등록한 아이디">
			</div>
			
			<div>
				<label>이름</label>
				<input type="text" name="member_name" id="member_name" class = "btn-name" placeholder = "등록한 이름">
			</div>
			
			<div id="send-code-container">
				<label>연락처</label>
				<input type="tel" id="member_phone" name="member_phone" size="13" maxlength="12" value="${mb.member_phone }" required>
				<input type="button" id="send-code-btn" value="인증코드 전송">&nbsp;
				<span id="time">02:00</span>
				<input type="tel" id="sms-code" size="6" maxlength="6">
				<input type="button" id="check-code-btn" value="인증코드 확인">
				<input type="button" id="cancel-btn" value="취소"><br>
			</div>
			
			<div>
				<label></label>
			</div>
		
			<div class ="btnSearch">		
				<input type="submit" value="수정">
				<input type="button" value="취소" onclick="history.back(-1);">	
		 	</div>
		 	
	</form>
</body>
</html>