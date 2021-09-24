<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" type="text/css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
	/* 인증코드 발송 */
	#sms-code, #check-code-btn, #cancel-btn, #time, #newPwd-form{
		visibility: hidden;
	} 
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
	#findPwd-container{
		display: flex;
		justify-content: center;
	}
	
	#content{
		display: inline-block;
		width: 50%;
		margin-top: 2%;
	}
</style>
<script type="text/javascript">
////////////////////연락처 변경을 위해 인증코드를 전송하고 값을 비교한다. ////////////////////
$(function(){
	
	
	var userCode;
	var leftTime = (60*2)-1, display = $("#time"); 
	var db_phone = $("#member_phone").val(); 

	
	$("#check-code-btn").click(function(){
		userCode = $("#sms-code").val();
		var code = $("#mycode").val();
		console.log(userCode+'user');
		console.log(code);
		if(userCode == code) {
			alert("인증이 완료되었습니다.");
			$("#send-code-btn").val("인증 완료");
			code = -1;
			//$("#sms-code").val("");
			//$("#send-code-btn, #sms-code, #check-code-btn, #time").css("visibility", "hidden");
			$("#time").css("visibility", "hidden");
			$("#sms-code").attr("required", false);
			//$("#check-code-btn").css("visibility", "hidden");
			$("#newPwd-form").css("visibility", "visible");
			
		}else {
			alert("인증에 실패하였습니다. 코드를 확인해주세요.");				
			$("#sms-code").val("");
		}
	});
	
	////////////////////////////////// submit //////////////////////////////////
	$("#updateInfoForm").submit(function(){	
		var new_pwd  = $("#new_pwd").val();
		
		if (!check_space(new_pwd)) {
            alert("비밀번호에 공백문자를 사용할 수 없습니다. 다시 입력해 주세요.");
            $("#new_pwd").val("");
            $("#new_pwd").focus();
            return false;
        }
        
        if (!check_pw(new_pwd)) {
            alert("비밀번호 규칙에 맞지 않습니다\n영문, 숫자, 특수문자 조합의 8~20자 이내로 입력해 주세요.");
            $("#new_pwd").val("");
            $("#new_pwd").focus();
            return false;
        }
	});
})


	 function check_pw(pw) {
		    var regExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;
		    //
		    if ( ! regExp.test(pw) ) {
		       return false;
		    }
		    //
		    return true;
		 }

		 function check_space(str) {
		    var regExp = /\s/g;
		    //
		    if ( regExp.test(str) ) {
		       return false;
		    }
		    //
		    return true;
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
	
	function checkpwd(){
		
		var code;
		var userCode;
		var leftTime = (60*2)-1, display = $("#time"); 
		var db_phone = $("#member_phone").val(); 
		
		console.log("변경 전 번호: "+db_phone);
		
			clearInterval(x);
			var to = $("#member_phone").val();
			data = {to:to};
			$.ajax({url:"sendNumber.do", data:data, success:function(data){
				code = data;
				$("#mycode").val(code);
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
		
	}
	
	
	function checkInfo(){
		
		var member_id = $("#member_id").val();
		var member_name = $("#member_name").val();
		var member_phone = $("#member_phone").val();
	
		 $.ajax({
				url : '${pageContext.request.contextPath}/user/selectPwd?member_id='+ member_id+'&member_name='+member_name+'&member_phone='+member_phone,
				type : 'get',
				success : function(data) {
					
					if(data == 1){
						
						checkpwd();
						
					}else{
						alert("다시 입력해 주세요.");
					}
				}
		 })
	}

</script>
</head>
<body>
<jsp:include page="findZoo_Header.jsp"/>

	<div id="findPwd-container">
	<div id="content">
	<form action="newPwd.do" id="updateInfoForm" method="post">	
		<br>
		<br>
		<legend>비밀번호 변경하기</legend>
		<hr>
		<br>
		<input type="hidden" id="mycode" value=""/>
			
			<div class="form-group row">
				<label class="form-label mt-4">아이디</label>
				<input class="form-control" type="text" name="member_id" id="member_id" placeholder = "등록한 아이디" required="required">
			</div>
			
			<div class="form-group row">
				<label class="form-label mt-4">이름</label>
				<input class="form-control" type="text" name="member_name" id="member_name" placeholder = "등록한 이름" required="required">
			</div>
			
			<div class="form-group row" id="send-code-container">
				<label class="form-label mt-4">연락처</label>
				<input class="form-control" type="tel" id="member_phone" name="member_phone" placeholder = "휴대폰번호를 '-'없이 입력" required="required" style="width:87%;">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" onclick="checkInfo();" style="width:100px;" class="btn btn-secondary"  value="인증코드 전송">&nbsp;
				<span id="time">02:00</span>
				<input class="form-control" type="tel" id="sms-code" style="width:87%;">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" id="check-code-btn" style="width:100px;" class="btn btn-secondary" value="인증코드 확인">
			</div>
			<div class="form-group row" id="newPwd-form">
				<label class="form-label mt-4">새 비밀번호</label>
				<input class="form-control" type="password" id="new_pwd" name="member_pwd" placeholder = "새로운 비밀번호 입력">
			</div>
		
			<div class="modal-footer">		
				<input type="submit" class="btn btn-primary" value="수정">
				<input type="button" class="btn btn-primary" value="취소" onclick="history.back(-1);">	
		 	</div>
	</form>
	</div>
	</div>
<jsp:include page="findZoo_Footer.jsp"/>
</body>
</html>