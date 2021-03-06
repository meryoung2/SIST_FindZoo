<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link rel="stylesheet" href="../../resources/css/bootstrap.min.css" type="text/css">
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
	
	/* 메인 컨테이너, 사이드바, 컨텐츠 컨테이너 비율 조절 */
	#deleteChangeInfo-container {
		display: flex;
		width: 70%;
		margin: 15%;
		margin-top: 30px;
		margin-bottom: 5%;
		z-index: -1;
	}
	
	#deleteChangeInfo-container #sidebar{
		margin-right: 20px;
	}
	
	#deleteChangeInfo-container #input-container {
		width: 80%;
		margin-bottom: 10px;
		padding: 10px;
	}
	
	#deleteChangeInfo-container #input-container p{
		text-align: left;
	}
	
	/* 부트스트랩 세부 조정 */
	#input-container .form-control {
    	width: 40%;
    	display: inline;
	} 
	
	#input-container .col-form-label {
		width: 85px;
		font-weight: bold;
	}
	
	#input-container .mt-4 {
	    margin-top: 0.8rem!important;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#submit-btn").click(function(){
			var member_num = $("#member_num").val();
			var member_pwd = $("#member_pwd").val();
			var db_pwd = $("#db_pwd").val();
			if(member_pwd != db_pwd) {
				alert("기존 비밀번호가 올바르지 않습니다. 다시 입력해 주세요.");
				$("#member_pwd").val("").select();
				return false;
			}else {
				if(!confirm("정말 탈퇴하시겠습니까?")) { 
					return false;
				}else { 
					// 만약 회원번호 1번의 id가 'hong', pwd가 '1234', 닉네임이 '길동이'라면 
					// 순서대로 'deletedMember1', 'deletedMember1', ''으로 변경된다.
					// SMS 알림서비스는 무조건 '비동의'로 하여 탈퇴 후에도 문자가 전송되는 일이 없게끔 한다.
					$("#member_id").val("deletedMember"+$("#member_num").val());
					$("#member_pwd").val("deletedMember"+$("#member_num").val());
					$("#member_nick").val("");
					$("#member_sms").val("비동의");
					$("#deleteChangeInfoForm").submit();
				}
			}
		})
	})	
</script>
</head>
<body>
	<jsp:include page="./findZoo_Header.jsp"/>
	<div id="deleteChangeInfo-container">
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
			<h2><strong>회원 탈퇴</strong></h2>
			<hr><br>
			<p>
			탈퇴 후에도 각 게시판에 올린 게시글 및 댓글은 자동으로 삭제되지 않습니다. <br>
			삭제를 원하는 게시글이나 댓글이 있다면 반드시 탈퇴 전 삭제하시기 바랍니다. <br>
			탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없으므로 <br>
			게시글 및 댓글을 임의로 삭제해드릴 수 없습니다. <br>
			</p>
			<form action="/member/deleteChangeInfo.do" id="deleteChangeInfoForm" method="post">
				<input type="hidden" id="member_num" name="member_num" value="${mb.member_num }" readonly>
				<input type="hidden" id="member_id" name="member_id" value="${mb.member_id }" readonly>
				<input type="hidden" id="db_pwd" name="db_pwd" value="${mb.member_pwd }" readonly>
				<input type="hidden" id="member_nick" name="member_nick" value="${mb.member_nick }" readonly>
				<input type="hidden" id="member_sms" name="member_sms" value="${mb.member_sms }" readonly>
				
				<label class="col-form-label mt-4" for="inputDefault">비밀번호</label>
				<input type="password" class="form-control" id="member_pwd" name="member_pwd" placeholder="Password"><br>
				<br>
				<input type="button" class="btn btn-primary" id="submit-btn" value="회원 탈퇴">
				<input type="button" class="btn btn-secondary" value="취소" onclick="location.href='/member/myInfo.do'"><br>
			</form>
		</article>
	</div>
	<jsp:include page="../findZoo_Footer.jsp"/>
</body>
</html>