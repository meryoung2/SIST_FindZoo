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
	/* 내 정보 전체 수정 */
	.updateInfo-container {
		display: flex;
		position: absolute;
		width: 1000px;
		margin: auto;
		margin-top: 20px;
		margin-bottom: 20px;
	}
			
	.updateInfo-container .list-group{
		width: 200px;
		margin: 10px;
		border: 1px solid black;
	}
	
	.updateInfo-container .input-container {
		float: right;
		margin: 10px;
		padding: 20px;
		border: 1px solid black;
	}
	
	/* <input type="number"> 화살표 삭제 (Chrome, Safari, Edge, Opera) */
	input::-webkit-outer-spin-button,
	input::-webkit-inner-spin-button {
	  -webkit-appearance: none;
	  margin: 0;
	}
	
	/* <input type="number"> 화살표 삭제 (Firefox) */
	input[type=number] {
	  -moz-appearance: textfield;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	$(function(){
		// 기존에 입력한 주소 데이터를 addr1, addr2에 각각 불러온다.
		if($("#member_addr").val() != "") {
			var db_addr = $("#member_addr").val().split(", ");
			$("#member_addr1").val(db_addr[0]);
			$("#member_addr2").val(db_addr[1]);
			console.log("변경 전 주소: "+$("#member_addr1").val()+", "+$("#member_addr2").val());
		} 
		
		$("#updateInfoForm").submit(function(){		       
			// 변경 된 addr1과 addr2를 합친 값을 addr에 넣는다.		
			if($("#member_addr2").val() == "") {
				$("#member_addr").val($("#member_addr1").val());				
			}else {
				$("#member_addr").val($("#member_addr1").val()+", "+$("#member_addr2").val());
			}
			console.log("변경 할 주소: "+$("#member_addr").val());
		});
		
	}) 
	
	// 주소 변경 API
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
	
	// 닉네임 중복 확인 팝업창을 화면 가운데에 띄운다.
	function checkNick() {
		var popupX = (document.body.offsetWidth/2)-(450/2);
		var popupY= (window.screen.height/2)-(300/2);
		window.open("checkNick.do", "_blank", "width=450, height=300, left="+popupX+", top="+popupY);
	}
</script>
</head>
<body>
	<div class="updateInfo-container">
		<aside class="sidebar">
			<div class="list-group">
				<a href="myInfo.do?member_num=${mb.member_num}" class="list-group-item list-group-item-action">내 정보</a>
				<a href="#" class="list-group-item list-group-item-action">1:1 문의</a>
				<a href="myNote.do?member_num=${mb.member_num}" class="list-group-item list-group-item-action">쪽지함</a>
				<a href="memberBoard.do?pageNum=1&member_num=${mb.member_num}" class="list-group-item list-group-item-action">내 게시물</a>
				<a href="#" class="list-group-item list-group-item-action">내 댓글</a>
			</div>
		</aside>
		<article class="input-container">
			<h2>내 정보 수정</h2>
			<hr>
			<form action="updateInfo.do" id="updateInfoForm" method="post">
				* 확인 후 hidden 값으로 변경<br>
				관리자 여부: <input type="text" name="member_admin" value="${mb.member_admin }" readonly><br>
				회원 번호: <input type="text" name="member_num" value="${mb.member_num }" readonly><br>
				포인트: <input type="text" name="member_point" value="${mb.member_point }" readonly><br>
				로그인 방식: <input type="text" name="social_num" value="${mb.social_num }" readonly><br><br>
				
				<label>아이디</label>
				<input type="text" name="member_id" value="${mb.member_id }" readonly><br>
			
				<label>비밀번호</label> 
				<input type="text" name="member_pwd" value="${mb.member_pwd }" readonly><br>
			
				<label>이름</label>
				<input type="text" name="member_name" value="${mb.member_name }" readonly><br>
			
				<label>닉네임</label>
				<input type="text" id="member_nick" name="member_nick" value="${mb.member_nick }" readonly required>
				<input type="button" value="닉네임 변경" onclick="checkNick()"><br>
				
				<%-- 너나우리 인증? --%>
				<label>연락처</label>
				<input type="number" name="member_phone" value="${mb.member_phone }" required>
				<input type="button" value="인증코드 전송"><br>
			
				<label>이메일</label>
				<input type="email" name="member_email" value="${mb.member_email }" maxlength="30" required><br>
		
				<label>주소</label>
				<input type="text" id="member_addr1" name="member_addr1" placeholder="주소검색" size="30" readonly required onclick="findAddr()">
				<input type="text" id="member_addr2" name="member_addr2" placeholder="상세주소">
				<input type="hidden" id="member_post" placeholder="우편번호" readonly="readonly">
				<input type="hidden" id="member_addr" name="member_addr" value="${mb.member_addr }">
				<span style = "font-size: 6px;">*주소 변경을 원하시면 첫번째 칸을 눌러주세요.</span><br>
			
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
				<input type="reset" value="취소" onclick="history.back(-1);">
			</form>
		</article>
	</div>
</body>
</html>