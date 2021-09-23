<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>받은 쪽지함</title>
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
	#receiveNoteList-container {
		display: flex;
		width: 70%;
		margin: 15%;
		margin-top: 30px;
		margin-bottom: 5%;
	}
	
	#receiveNoteList-container #sidebar{
		margin-right: 20px;
	}
	
	#receiveNoteList-container #input-container {
		width: 80%;
		margin-bottom: 10px;
		padding: 10px;
	}
 
	#input-container #check-all-btn { 
		width: 16px; 
		height: 16px;
		position: relative;
		top: 4px;
		margin-right: 5px;
	}
	
	#input-container #note-list-table {
		margin-top: 18px; 
	}

	#note-list-table #td-center, #note-list-table th {
		text-align: center;
		padding: 5px;
	}
	
	#note-list-table td, #note-list-table #td-left {
		text-align: left;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		// 전체 선택 및 일부 선택
		$("#checkAll").click(function(){ 
			// <th>에 있는 체크박스(전체 선택)를 클릭하면 이 체크박스가 현재 체크 상태인지 아닌지를 판단하여
			if($("#checkAll").prop("checked")) { 
				// 체크 상태면 모든 <tb> 체크박스들을 checked로 변경하고
				$("input[name=checkOne]").prop("checked", true); 
			}else { 
				// 그렇지 않다면 checked를 해제시킨다.
				$("input[name=checkOne]").prop("checked", false); 
			} 
		})
		$("input[name=checkOne]").click(function(){
			// <th>에 있는 체크박스가 아닌 <td>의 체크박스를 클릭하면
			// 전체 체크박스 갯수와 현재 체크된 체크박스 갯수를 비교해서 <th>에 있는 체크박스의 체크 여부를 판단한다.
			var allCnt = $("input[name=checkOne]").length;
			var checkedCnt = $("input[name=checkOne]:checked").length;             
			console.log("allCnt: "+allCnt);
			console.log("checkedCnt: "+checkedCnt);
			if(allCnt == checkedCnt) {
				$("#checkAll").prop("checked", true);
			}else {
				$("#checkAll").prop("checked", false);
			}
		})
		
		// 선택 삭제
		$("#delete-selected-btn").click(function(){
			if(confirm("선택한 쪽지를 삭제하시겠습니까?")) {
				var note_receiver_num = ${list[0].note_receiver_num};
				var arr = new Array();
				$("input[name='checkOne']:checked").each(function(){
					// 선택된 <td>들을 arr에 담는다.
					arr.push($(this).attr("data-note-num"));
					console.log(arr);
				});				    
				$.ajax({
					url : "/hideReceiveNoteArray.do",
					type : "post",
					// 여기서 'checkedArr'은 ajax를 통해 컨트롤러의 value(="checkedArr[]")에 전달되는 배열 값이다.(대소문자 구분)
					data : {checkedArr : arr},
					success : function(re){
						if(re == 1) {
							// 성공적으로 삭제 되었다면 새로고침
							location.href = "/member/ReceiveNoteList.do";
						}else {
							alert("쪽지 삭제에 실패하였습니다.");
						}
					}
				});
			}
		})
	})
	
	// 쪽지 상세보기 팝업창을 화면 가운데에 위치시킨다.
	function detailReceiveNote(note_num) {
		var popupX = (document.body.offsetWidth/2)-(800/2);
		var popupY = (window.screen.height/2)-(370/2);
		window.open("/member/detailReceiveNote.do?note_num="+note_num, "_blank", "width=420, height=370, left="+popupX+", top="+popupY);
	}
</script>
</head>
<body>
	<jsp:include page="./findZoo_Header.jsp"/>
	<div id="receiveNoteList-container">
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
			<h2><strong>받은 쪽지함</strong></h2>
			<table class="table table-hover" id="note-list-table">
				<tr>
					<th class="table-active" width="30"><input type="checkbox" id="checkAll"></th>
					<th class="table-active" width="80">쪽지 번호</th>
					<th class="table-active">쪽지 내용</th>
					<th class="table-active">받은 날짜</th>
				</tr>
				<c:forEach var="nt" items="${list }">
					<tr>
						<%-- 선택 삭제시 해당 note_num을 보다 쉽게 전달하기 위해, 각 <td>의 체크박스에 커스텀 속성인 'data-[사용자 문자]'를 추가한다. --%>
						<td id="td-center"><input type="checkbox" name="checkOne" data-note-num="${nt.note_num}"></td>
						<td id="td-center">${nt.note_num }</td>
						<td id="td-left"><a href="javascript:void(0);" onclick="detailReceiveNote(${nt.note_num }); return false;">${nt.note_content }</a></td>
						<td id="td-center">
							<fmt:parseDate var="strToDate" value="${nt.note_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:formatDate var="dateToStr" value="${strToDate }" pattern="yyyy.MM.dd"/>
							<c:out value="${dateToStr }"/>
						</td>
					</tr>
				</c:forEach>
			</table>
			<input type="button" class="btn btn-primary" id="delete-selected-btn" value="선택 삭제"><br>
		</article>
	</div>
	<jsp:include page="../findZoo_Footer.jsp"/>
</body>
</html>