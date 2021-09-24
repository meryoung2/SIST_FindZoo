<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>아이디 찾기</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" type="text/css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
	#findId-container{
		display: flex;
		justify-content: center;
	}
	
	#content{
		display: inline-block;
		width: 70%;
		margin-top: 2%;
	}
	.btnSearch{
		text-align: center;
	}
</style>

<script type="text/javascript">
function id_search() { 
	
	var name = $("#member_name").val();
	 var member_name = decodeURI(name);
	 var member_phone = $("#member_phone").val();
	 console.log(member_name);
	 console.log(member_phone);
	 
	 /*if (member_name.length < 1) {
		  alert("이름을 입력해주세요");
		  return;
		 }

		 if (member_phone.length != 13) {
			  alert("핸드폰번호를 정확하게 입력해주세요");
			  return;
		 }*/
	 
	 $.ajax({
			url : '${pageContext.request.contextPath}/user/findId?member_name='+ member_name+'&member_phone='+member_phone,
			type : 'get',
			success : function(data) {
				
				if(data.code == "200"){
					
					alert("아이디는 "+data.member_id+"입니다");
					
				} else if(data.code == "204"){
					
					alert("아이디를 찾을 수 없습니다. \n올바른 정보를 입력해주세요");
				}
				
			}
	 })
}


</script>
</head>
<body>
<jsp:include page="findZoo_Header.jsp"/>

	<div id="findId-container">
	<div id="content">
	<form>
		<fieldset>
		<br>
		<br>
		<legend>아이디 찾기</legend>
		<hr>
		<br>
			<div class="form-group row">
				<label class="form-label mt-4">이름</label>
				<input type="text" name="member_name" id="member_name" class="form-control" placeholder = "등록한 이름" required="required">
			<br>
			</div>
			<div class="form-group row">
				<label class="form-label mt-4">연락처</label>
				<input type="text" name="member_phone" id="member_phone" class="form-control" placeholder = "휴대폰번호를 '-'없이 입력" required="required">
			</div>
	</form>
		<div class="modal-footer">
			<input type="button" name="enter" class="btn btn-primary" value="아이디 찾기"  onClick="id_search()">
			<a href="find_pwd.do"><input type="button" class="btn btn-primary" name="cancle" value="비밀번호 찾기"></a>
			<a href="login.do"><input type="button" class="btn btn-primary" name="cancle" value="로그인"></a>
	 	</div>
	 	</fieldset>
	</div>
	</div>
<jsp:include page="findZoo_Footer.jsp"/>
</body>
</html>