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
	/* 내 정보 상세 조회 */
	#myInfo-container {
		display: flex;
		justify-content: center;
	}
	
	#content{
		display: inline-block;
		width: 70%;
		margin-top: 2%;
	}
	
	#myInfo-container #sidebar{
		width: 10%;
		border: 1px solid black;
	}
	
	#myInfo-container #input-container {
		width: 50%;
		border: 1px solid black;
	}
	
	/* 비밀번호 변경 */
	.modal {
		display: none; /* 처음엔 모달이 보이지 않도록 숨긴다. */
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		z-index: 1;
	}
	
	.modal #close-updatePwd-modal {
		display: inline-block;
	}
	
	body .updatePwd-modal-bgLayer {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background: rgba(0, 0, 0, 0.5); 모달 창 뒷 배경을 어둡게 설정한다. (검은색에 투명도 50%) */
		z-index: -2; /* z-index 값을 부여하여 bgLayer가 가장 앞에 나올 수 있도록 설정한다.*/
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function check_pwd(pwd) {
		var regExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;
		if(!regExp.test(pwd)) {
			return false;
		}
		return true;
	};
	function check_space(str) {
		var regExp = /\s/g;
		if(regExp.test(str)) {
			return false;
		}
		return true;
	};

	$(function(){
		// '비밀번호 변경'을 클릭하면 모달 창을 띄운다.
		$("#open-updatePwd-modal").click(function(){
			// $(".modal").attr("style", "display: block");
			$(".modal").show();
			// $(".modal").fadeIn();
			$("body").append("<div class='updatePwd-modal-bgLayer'><div>");			
		});
		
		// '취소'를 클릭하면 모달 창을 숨긴다.
		$("#close-updatePwd-modal, .btn-close").click(function(){
			// $(".modal").attr("style", "display: none");
			$(".modal").hide();
			// $(".modal").fadeOut();
			$(".updatePwd-modal-bgLayer").remove();
		});
		
		$("#updatePwd-modal-content").submit(function(){	     
			if($("#old_pwd").val().trim() != $("#db_pwd").val()) {
				alert("기존 비밀번호가 올바르지 않습니다. 다시 입력해 주세요.");
				$("#old_pwd").val("").select();
				return false;
			}else if($("#old_pwd").val() != "" && $("#member_pwd").val() == "") {
				alert("새 비밀번호를 입력해 주세요.");
				$("#member_pwd").val().select();
				return false;						
			}else if(!check_space($("#old_pwd").val())) {
				alert("공백 문자는 사용할 수 없습니다. 다시 입력해 주세요.");
				$("#old_pwd").val("").select();
				return false;
			}else if(!check_pwd($("#member_pwd").val())) {
				alert("비밀번호 규칙에 맞지 않습니다\n영문, 숫자, 특수문자 조합의 8~20자 이내로 입력해 주세요.");
				$("#member_pwd").val("").select();
				return false;
			}else if(!check_space($("#member_pwd").val())) {
				alert("공백 문자는 사용할 수 없습니다. 다시 입력해 주세요.");
				$("#member_pwd").val("").select();
				return false;
			}else if($("#member_pwd").val() !== $("#member_pwd_check").val()) {
				alert("새 비밀번호가 일치하지 않습니다. 다시 입력해 주세요.");
				$("#member_pwd_check").val("").select();
				return false;
			}
		})
	})
</script>
</head>
<body>
	<div id="myInfo-container">
		<div id="content">
			<aside id="sidebar">
				<div class="list-group">
					<%-- class에 active를 지워야 모달 창 열었을 때 bgLayer가 적용된다. --%>
					<a href="myInfo.do?member_num=${mb.member_num}" class="list-group-item list-group-item-action">내 정보</a>
					<a href="#" class="list-group-item list-group-item-action">1:1 문의</a>
					<a href="myNote.do?member_num=${mb.member_num}" class="list-group-item list-group-item-action">쪽지함</a>
					<a href="memberBoard.do?pageNum=1&member_num=${mb.member_num}" class="list-group-item list-group-item-action">내 게시물</a>
					<a href="#" class="list-group-item list-group-item-action">내 댓글</a>
				</div>
			</aside>
			<article id="input-container">
				<h2>내 정보</h2>
				<hr>
				회원번호: ${mb.member_num }<br>
				아이디: ${mb.member_id }<br>	
				비밀번호: ${mb.member_pwd }&nbsp;<input type="button" id="open-updatePwd-modal" value="비밀번호 변경"><br>
				이름: ${mb.member_name }<br>
				닉네임: ${mb.member_nick }<br>
				전화번호: ${mb.member_phone }<br>
				이메일: ${mb.member_email }<br>
				주소: ${mb.member_addr }<br>
				포인트: ${mb.member_point }point<br>
				알림 서비스: ${mb.member_sms }<br>
				관리자 여부: ${mb.member_admin }<br>
					<c:if test="${mb.social_num == '0'}">로그인 방식: 웹 로그인<br></c:if>
					<c:if test="${mb.social_num == '1'}">로그인 방식: 네이버 로그인<br></c:if>
					<c:if test="${mb.social_num == '2'}">로그인 방식: 카카오 로그인<br></c:if>
				반려동물 정보: 
					<c:forEach var="pet" items="${listPet }"><a href="detailPet.do?pet_num=${pet.pet_num }">${pet.pet_name }</a>&nbsp;</c:forEach>
					<input type="button" value="반려동물 추가" onclick="location.href='insertPet.do?member_num=${mb.member_num}'"><br>
				<br>
				<input type="button" value="내 정보 수정" onclick="location.href='updateInfo.do?member_num=${mb.member_num}'">
				<input type="button" value="회원 탈퇴" onclick="#">
			</article>
		</div>
	</div> <!-- 
	<div class="updatePwd-modal">
		<form action="updatePwd.do" id="updatePwd-modal-content" method="post">
			<h2>비밀번호 변경</h2>
			<hr>
			* 확인 후 hidden 값으로 변경<br>
			회원 번호: <input type="text" name="member_num" value="${mb.member_num }"><br>
			DB 비번: <input type="text" name="db_pwd" id="db_pwd" value="${mb.member_pwd }"><br><br>
			<label>기존 비밀번호</label>
			<input type="text" name="old_pwd" id="old_pwd" required><br>
			<label>새 비밀번호</label> 
			<input type="text" name="member_pwd" id="member_pwd" required><br>
			<label>비밀번호 확인</label>
			<input type="text" name="member_pwd_check" id="member_pwd_check" required><br>
			<span style = "font-size: 6px;">*영문, 숫자, 특수문자 조합의 8~20자 이내로 입력해 주세요.</span><br>
			<br>
			<input type="submit" value="수정">
			<input type="button" value="취소" id="close-updatePwd-modal">					
		</form>
	</div> -->
	<div class="modal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">비밀번호 변경</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
						<span aria-hidden="true"></span>
					</button>
	      		</div>
				<div class="modal-body">
					<form action="updatePwd.do" id="updatePwd-modal-content" method="post">
						* 확인 후 hidden 값으로 변경<br>
						회원 번호: <input type="text" name="member_num" value="${mb.member_num }"><br>
						DB 비번: <input type="text" name="db_pwd" id="db_pwd" value="${mb.member_pwd }"><br><br>
						<label>기존 비밀번호</label>
						<input type="text" name="old_pwd" id="old_pwd" required><br>
						<label>새 비밀번호</label> 
						<input type="text" name="member_pwd" id="member_pwd" required><br>
						<label>비밀번호 확인</label>
						<input type="text" name="member_pwd_check" id="member_pwd_check" required><br>
						<span style = "font-size: 6px;">*영문, 숫자, 특수문자 조합의 8~20자 이내로 입력해 주세요.</span><br>
						<br>
						<input type="submit" class="btn btn-primary" value="수정">
						<input type="button" class="btn btn-secondary" data-bs-dismiss="modal" value="취소" id="close-updatePwd-modal">					
					</form>
				</div>
			</div>
		</div>
	</div>	
</body>
</html>