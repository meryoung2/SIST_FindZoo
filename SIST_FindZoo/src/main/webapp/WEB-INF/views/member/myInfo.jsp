<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
<link rel="stylesheet" href="../../resources/css/bootstrap.min.css" type="text/css">
<style type="text/css">
	a {
		color: black;
		text-decoration: none;
	}
	a:hover {
		font-weight: bold;
		color: #325d88;
		text-decoration: none;
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
	
	/* 메인 컨테이너, 사이드바, 컨텐츠 컨테이너 비율 조절 */
	#myInfo-container {
		display: flex;
		width: 70%;
		margin: 15%;
		margin-top: 30px;
		margin-bottom: 5%;
		z-index: -1;
	}
	
	#myInfo-container #sidebar{
		margin-right: 20px;
	}
	
	#myInfo-container #input-container {
		width: 80%;
		margin-bottom: 10px;
		padding: 10px;
	}
	
	#myInfo-container #input-container a {
		font-weight: 600;
	}
	
	/* 비밀번호 변경을 위한 모달창 */
	#myInfo-container .modal {
		display: none; /* 처음엔 모달창이 보이지 않도록 숨긴다. */
		position: fixed;
		top: 180px;
	    width: 470px;
	    height: 450px;
	    left: 33%;
		z-index: 2; /* 우선순위: 모달창 -> bgLayer -> myInfo-container순 */
	}
	
	#myInfo-container .modal-content {
		padding: 10px;
	}
	
	#myInfo-container .modal #close-updatePwd-modal {
		display: inline-block;
	}
	
	#myInfo-container .updatePwd-modal-bgLayer {
		display: none; /* 처음엔 bgLayer이 보이지 않도록 숨긴다. */
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background: rgba(0, 0, 0, 0.5); /* 모달 창 뒷 배경을 어둡게 설정한다. (검은색에 투명도 50%) */
		z-index: 1; 
	}
	
	/* 부트스트랩 세부 조정 */
	#input-container .form-control {
    	width: 35%;
    	display: inline;
	} 
	
	#input-container .col-form-label {
		width: 90px;
		font-weight: bold;
	}
	
	.mt-4 {
	    margin-top: 0.8rem!important;
	}
	
	.modal .form-control {
    	width: 50%;
    	display: inline;
	} 
	
	.modal .col-form-label {
		width: 105px;
		font-weight: bold;
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
		// '비밀번호 변경'을 클릭하면 모달창을 띄우고 배경을 어둡게 한다.
		$("#open-updatePwd-modal").click(function(){
			$(".modal").show();
			$(".updatePwd-modal-bgLayer").attr("style", "display: block");
		});
		// 모달창 바깥이나 '취소', 'x'를 클릭하면 모달창을 숨긴다.
		$("#close-updatePwd-modal, .btn-close, .updatePwd-modal-bgLayer").mouseup(function(){
			$("#old_pwd").val("");
			$("#member_pwd").val("");
			$("#member_pwd_check").val("");
			$(".modal").hide();
			$(".updatePwd-modal-bgLayer").attr("style", "display: none");
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
			alert("비밀번호 변경이 완료되었습니다.\n로그인 화면으로 이동합니다.");
		})
	})
</script>
</head>
<body>
	<jsp:include page="./findZoo_Header.jsp"/>
	<div id="myInfo-container">
		<aside id="sidebar">
			<div class="accordion" id="accordionExample">
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingOne">
						<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne"
							aria-expanded="false" aria-controls="collapseOne">내 정보</button>
					</h2>
					<div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
						<div class="accordion-body">
							<a href="/member/myInfo.do"> - 내 정보</a><br><br>
							<a href="/member/updateInfo.do"> - 내 정보 수정</a><br><br>
							<a href="/member/deleteChangeInfo.do"> - 회원 탈퇴</a><br>
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingTwo">
						<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo"
							aria-expanded="false" aria-controls="collapseTwo">쪽지함</button>
					</h2>
					<div id="collapseTwo" class="accordion-collapse collapse show" aria-labelledby="headingTwo" data-bs-parent="#accordionExample" style="">
						<div class="accordion-body">
							<a href="/member/sendNoteList.do"> - 보낸 쪽지함</a><br><br>
							<a href="/member/receiveNoteList.do"> - 받은 쪽지함</a><br>
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingThree">
						<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree"
							aria-expanded="false" aria-controls="collapseThree">내가 쓴 글</button>
					</h2>
					<div id="collapseThree" class="accordion-collapse collapse show" aria-labelledby="headingThree" data-bs-parent="#accordionExample" style="">
						<div class="accordion-body">
							<a href="/member/myPost.do?pageNum=1"> - 내가 쓴 게시글</a><br><br>
							<a href="/member/myReply.do?pageNum=1"> - 내가 쓴 댓글</a><br>
						</div>
					</div>
				</div>
			</div>
		</aside> 
		<article id="input-container">
			<h2><strong>내 정보</strong></h2>
			<hr>
			<label class="col-form-label mt-4" for="inputDefault">아이디</label>
			|&nbsp;&nbsp;&nbsp;${mb.member_id }<br>
			
			<label class="col-form-label mt-4" for="inputDefault">비밀번호</label>
			|&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-outline-primary" id="open-updatePwd-modal" value="비밀번호 변경"><br>
			
			<label class="col-form-label mt-4" for="inputDefault">이름</label>
			|&nbsp;&nbsp;&nbsp;${mb.member_name }<br>
			
			<label class="col-form-label mt-4" for="inputDefault">닉네임</label>
			|&nbsp;&nbsp;&nbsp;${mb.member_nick }<br>
			
			<label class="col-form-label mt-4" for="inputDefault">연락처</label>
			|&nbsp;&nbsp;&nbsp;${mb.member_phone }<br>
			
			<label class="col-form-label mt-4" for="inputDefault">이메일</label>
			|&nbsp;&nbsp;&nbsp;${mb.member_email }<br>
			
			<label class="col-form-label mt-4" for="inputDefault">포인트</label>
			|&nbsp;&nbsp;&nbsp;${mb.member_point }point<br>
			
			<label class="col-form-label mt-4" for="inputDefault">알림 서비스</label>
			|&nbsp;&nbsp;&nbsp;${mb.member_sms }<br>
			
			<label class="col-form-label mt-4" for="inputDefault">반려동물</label>
			|&nbsp;&nbsp;&nbsp;
			<c:forEach var="pet" items="${listPet }"><a href="/member/detailPet.do?pet_num=${pet.pet_num }">${pet.pet_name }</a>&nbsp;</c:forEach>
			<input type="button" class="btn btn-outline-primary" value="반려동물 추가" onclick="location.href='/member/insertPet.do'"><br>
			<label class="col-form-label mt-4" for="inputDefault"></label>
			<span style="font-size: 15px;">*이름을 누르시면 해당 반려동물정보 페이지로 이동합니다.</span><br>
		</article>
		<div class="modal">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title"><strong>비밀번호 변경</strong></h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
		      		</div>
					<div class="modal-body">
						<form action="/member/updatePwd.do" id="updatePwd-modal-content" method="post">
							<input type="hidden" name="member_num" value="${mb.member_num }">
							<input type="hidden" name="db_pwd" id="db_pwd" value="${mb.member_pwd }">
							
							<label class="col-form-label mt-4" for="inputDefault">기존 비밀번호</label>
							<input type="text" class="form-control" name="old_pwd" id="old_pwd" required><br>
							
							<label class="col-form-label mt-4" for="inputDefault">새 비밀번호</label> 
							<input type="text" class="form-control" name="member_pwd" id="member_pwd" required><br>
							
							<label class="col-form-label mt-4" for="inputDefault">비밀번호 확인</label>
							<input type="text" class="form-control" name="member_pwd_check" id="member_pwd_check" required><br>
							<span style = "font-size: 15px;">*영문, 숫자, 특수문자 조합의 8~20자 이내로 입력해 주세요.</span><br>
							<br>
							<input type="submit" class="btn btn-primary" value="수정">
							<input type="button" class="btn btn-secondary" data-bs-dismiss="modal" value="취소" id="close-updatePwd-modal">					
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="updatePwd-modal-bgLayer"></div>
	</div> 
	<jsp:include page="../findZoo_Footer.jsp"/>
</body>
</html>