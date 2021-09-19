<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" type="text/css">
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
	#sendReplyNote-container {
		margin: 15px;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function selfCloseSubmit() {
	    var f = document.forms.sendReplyNoteForm;
	    opener.name = "receiveNoteList"; // 부모창의 이름을 설정한다. (유니크한 이름이어야 한다.)
	    f.target = opener.name; // 해당 form의 타겟을 부모창으로 설정한다.
	    f.submit();
	    self.close();
	}
</script>
</head>
<body>
	<div id="sendReplyNote-container">
		<h4>쪽지 답장</h4>
		<hr>
		<form method="post" name="sendReplyNoteForm" action="sendReplyNote.do">
			* 확인 후 hidden으로 변경<br>
			<%-- 받은 쪽지 상세 조회에서 '보낸 사람'이 답장 시에는 '받는 사람'이 된다 --%>
			보내는 사람(<input type="text" name="note_sender_num" value="${nt.note_receiver_num }" size="3" readonly>)&nbsp;
			받는 사람(<input type="text" name="note_receiver_num" value="${nt.note_sender_num }" size="3" readonly>)<br>
			
			받는 사람 <input type="text" name="member_nick" value="${nt.member_nick }" readonly><br>
			<br>
			<textarea rows="6" cols="40" name="note_content"></textarea><br>
			<br>
			<input type="button" value="전송" onclick="javascript:selfCloseSubmit();">
			<input type="button" value="취소" onclick="javascript:window.close()"><br>
		</form>
	</div>
</body>
</html>