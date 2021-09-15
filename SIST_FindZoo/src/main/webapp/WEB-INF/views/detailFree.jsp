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
	
	#free-container{
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
		width: 10%;
		height: 20%;
		text-align: center;
		background-color: white;
		border: 1px black solid;
		overflow: hidden;
	}
	
	#member_act{
		width: 100%;
		height: 100%;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	// 삭제 관련 알림 창
	function confirm_del(board_num){
		
		var re = confirm("정말 삭제하시겠습니까?");
		
		if(re){
			location.href = "/deleteFree.do?board_num="+board_num;	
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
</script>
</head>
<body>
	<div id="free-container">
		<div id="content">
			<h4>${ f.title }</h4>
			<hr>
			<a class="member_nick" href="#" member_num=${ f.member_num }>${ f.member_nick }</a>&nbsp;|&nbsp;<h6 style="display: inline-block;"><fmt:formatDate value="${ f.bdate }" pattern="yyyy-MM-dd hh:mm:ss" /></h6>
			<h6 style="float: right;">조회수 : ${ f.views }</h6><hr>
			<c:if test="${ f.picture_fname ne null}">
				<img src="${pageContext.request.contextPath}/resources/img/${ f.picture_fname }"><br>
			</c:if>
			<textarea id="ta" readonly="readonly" style="width: 100%; outline: none; border: none;">${ f.content }</textarea><br>
			<hr>
			<button class="btn btn-primary" onclick="location.href='free.do'" style="float: left;">목록</button>
			<button class="btn btn-primary" onclick="location.href='updateFree.do?board_num=${ f.board_num }'" style="float: right;">수정</button>
			<button class="btn btn-primary" onclick="confirm_del(${ f.board_num })" style="float: right;">삭제</button>		
		</div>
	</div>

	<div class="modal" id="member_modal">
		<table class="table table-hover" id="member_act">
			<tr>
				<td><a>회원 정보 보기</a></td>
			</tr>
			<tr>
				<td><a id="member_board">작성 글 보기</a></td>
			</tr>
			<tr>
				<td><a>쪽지 보내기</a></td>
			</tr>
		</table>
	</div>
</body>
</html>