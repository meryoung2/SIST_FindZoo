<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 보내기</title>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" type="text/css">
<style type="text/css">
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
	
	/* div */
	#sendNewNote-container {
		margin: 30px;
	}
	
	/* 부트스트랩 세부 조정 */	
	#sendNewNote-container .form-control {
		width: 20%;
    	display: inline;
	}
	
	#sendNewNote-container .col-form-label {
		width: 85px;
		font-weight: bold;
	}
	
	#sendNewNote-container .mt-4 {
	    margin-top: 0.8rem!important;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		$("#ajaxBt").on('click', function() {
			ajaxNote();
		});
	});
	
	function ajaxNote() {
	    $.ajax({
	        url: "/member/sendNewNote.do",
	        type: "POST",
	        data: {
	        	nsn:$("#nsn").val(),
	        	nrn:$("#nrn").val(),
	        	noteText:$("#noteText").val(),
	        },
	        success: function(data){
	            window.close();
	        },
	        error: function(){
	            alert("err");
	        }
	  	});
	}
</script>
</head>
<body>
	<div id="sendNewNote-container">
		<h4><strong>쪽지 보내기</strong></h4>
		<hr>
		<form method="post" name="sendNewNoteForm" action="#">
			<%-- 받은 쪽지 상세 조회에서 '보낸 사람'이 답장 시에는 '받는 사람'이 된다 --%>
			<input id="nsn" type="hidden" name="note_sender_num" value="${nt.note_sender_num }" size="3" readonly>
			<input id="nrn" type="hidden" name="note_receiver_num" value="${nt.note_receiver_num }" size="3" readonly>
			
			<label class="col-form-label mt-4" for="inputDefault">받는 사람</label>
			<input type="text" class="form-control" id="readOnlyInput" name="member_nick" value="${nt.member_nick }" readonly><br>
			
			<br>
			
			<textarea id="noteText" rows="6" cols="40" name="note_content"></textarea><br><br>
			
			<input id="ajaxBt" type="button" class="btn btn-primary" value="전송">
			<input type="button" class="btn btn-secondary" value="취소" onclick="javascript:window.close()"><br>
		</form>
	</div>
</body>
</html>