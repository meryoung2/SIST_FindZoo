<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
 $(function(){
	 if($("#re").val()=="0"){
		 alert("아이디 혹은 비밀번호를 다시 확인해주세요");
	 }
	 
 })
</script>
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
	
	#free-container{
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
function goFindId(){
	location.href="/find_id.do";
}


</script>
</head>
<body>
<jsp:include page="findZoo_Header.jsp"/>

	<div id="free-container">
	<div id="content">
	<form action="login.do" method="post">
		<fieldset>
		<br>
		<br>
	    <legend>로그인</legend>
	    <hr>
		<br>
		    <div class="form-group">
		    	<label for="id" class="form-label mt-4">아이디</label>
		    	<input type="text" id="member_id" name="member_id" required="required" class="form-control">
		    	
		    	<label for="pw" class="form-label mt-4">비밀번호</label>
			<input type="password" class="form-control" id="member_pwd" name="member_pwd" required="required" placeholder="Password">

			</div>
	</form>
		<div class="modal-footer">
			<input type="submit" class="btn btn-primary" value="로그인"><br>
			<a href="join.do"><input type="button" class="btn btn-primary" value="회원가입"></a>
			<a href="find_id.do"><input type="button" class="btn btn-primary" value="아이디 찾기"></a>
			<a href="find_pwd.do"><input type="button" class="btn btn-primary" value="비밀번호 찾기"></a>
		</div>
		</fieldset>
	</div>
	</div>
	<input type="hidden" id="re" value="${re}">
<jsp:include page="findZoo_Footer.jsp"/>
</body>
</html>