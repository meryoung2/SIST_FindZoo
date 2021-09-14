<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

	//댓글삭제 스크립트
	function confirmDeleteReply(reply_num, board_num){
	var re = confirm("댓글을 삭제하시겠습니까?");
	if(re==true){
		location.href="deleteReply.do?board_num="+board_num+"&reply_num="+reply_num;
	}
}
	
	//댓글수정 스크립트
	function updateReply(reply_num){
		$('#reply_num').val(reply_num)
	}
	
	//대댓글 스크립트
	function reReply(reply_num){
		$('#reply_number').val(reply_num)
	}
</script>
</head>
<body>
	<table border="1" width="80%">
		<c:forEach var="r" items="${list }">
			<tr>
				<td>
				<c:if test="${r.reply_level>0 }">
						<c:forEach var="i" begin="1" end="${r.reply_level }">
							&nbsp;&nbsp;&nbsp;&nbsp;
						</c:forEach>
					</c:if>
					
					<c:choose> 
						<c:when test="${r.reply_level eq 0}">
							작성자 : ${d.member_nick }
							<span><button type="button"  class="btn btn-primary" onclick="confirmDeleteReply(${r.reply_num}, ${d.board_num})">삭제</button></span>
							<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#updateReply" onclick="updateReply(${r.reply_num })">수정</button>
							<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#reReply" onclick="reReply(${r.reply_num })">답글</button>
						 </c:when>
    					<c:when test="${r.reply_level > 0}">
    						작성자 : ${d.member_nick }
    						<span><button type="button"  class="btn btn-primary" onclick="confirmDeleteReply(${r.reply_num}, ${d.board_num})">삭제</button></span>
							<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#updateReply" onclick="updateReply(${r.reply_num })">수정</button>
						</c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td>
					<c:if test="${r.reply_level>0 }">
						<c:forEach var="i" begin="1" end="${r.reply_level }">
							&nbsp;&nbsp;&nbsp;&nbsp;
						</c:forEach>
					</c:if>
					내용 : ${r.reply_content}
					<hr>
				</td>
			</tr>
		</c:forEach>
		<tr>
        	<td width="500px">
        	<form action="insertReply.do" method="post">
                        작성자 : ${d.member_nick }
                        <input type="submit" value="등록">
                        <input type="hidden" name="board_num" value="${d.board_num }"><br>
                       <textarea name="reply_content" rows="4" cols="50" placeholder="댓글을 입력하세요."></textarea>
                        </form>
            </td>
		</tr>
	</table>
	

<!-- 댓글수정 모달 -->
<div class="modal fade" id="updateReply" tabindex="-1" aria-labelledby="updateReplyLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <form action="/updateReply.do" method="post">
      <div class="modal-header">
        <h4 class="modal-title" id="updateReplyLabel">댓글 수정창</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<div class="form-group">
      		<label for="reply_num">댓글번호</label>
      		<input class="form-control" id="reply_num" name="reply_num" value="${reply_num }" readonly>
      	</div>
      	<div class="form-group">
      		<label for="member_num">댓글 작성자</label>
      		<input class="form-control" id="member_nick" name="member_nick" value="${d.member_nick }" readonly>
			<input type="hidden" name="board_num" value="${d.board_num }"><br>
      	</div>
      	<div class="form-group">
      		<label for="reply_content">댓글 내용</label>
      		<input class="form-control" id="reply_content" name="reply_content" placeholder="댓글 내용을 입력해주세요">
      	</div>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-success modalModBtn" onclick="updateReply(${r.reply_num}, ${d.board_num})">수정</button> 
      </div>
      </form>
    </div>
  </div>
</div>


<!-- 대댓글 모달 -->
<div class="modal fade" id="reReply" tabindex="-1" aria-labelledby="reReplyLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <form action="/reReply.do" method="post">
      <div class="modal-header">
        <h4 class="modal-title" id="reReplyLabel">답글달기</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<div class="form-group">
      		<label for="reply_num">참조 댓글번호</label>
      		<input class="form-control" id="reply_number" name="reply_num" value="${reply_num }" readonly>
      	</div>
      	<div class="form-group">
      		<label for="member_nick">답글 작성자</label>
      		<input class="form-control" id="member_nick" name="member_nick" value="${d.member_nick }" readonly>
			<input type="hidden" name="board_num" value="${d.board_num }"><br>
      	</div>
      	<div class="form-group">
      		<label for="reply_content">답글 내용</label>
      		<input class="form-control" id="reply_content" name="reply_content" placeholder="댓글 내용을 입력해주세요">
      	</div>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-success modalModBtn" onclick="reReply(${r.reply_num}, ${d.board_num})">답글작성</button> 
      </div>
      </form>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>