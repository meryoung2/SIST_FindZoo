<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>회원가입</title>
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
	
	#join-container{
		display: flex;
		justify-content: center;
	}
	
	#content{
		display: inline-block;
		width: 50%;
		margin-top: 2%;
	}
	
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(document).ready(function () {

    $("#form1").submit(function(){
    	
	   var member_id = $("#member_id").val();
       var member_name = $("member_name").val();
       var member_phone = $("member_phone").val();
       var member_nick = $("#member_nick").val(); 
       var member_pwd  = $("#member_pwd").val();
       var member_pwd_check = $("#member_pwd_check").val();
       
       var email_1 = $("#email_1").val();
       var email_2 = $("#email_2 option:selected").val();
       var member_email = email_1.concat(email_2);
       $("#member_email").val(member_email);
       
       
       var member_addr1 = $("#member_addr1").val();
       var member_addr2 = $("#member_addr2").val();
       var member_addr = member_addr1.concat(member_addr2);
       $("#member_addr").val(member_addr);


          var idReg =  /^[a-z]+[a-z0-9]{5,19}$/g;
          if( !idReg.test( $("#member_id").val() ) ) {
              alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
              $("#member_id").focus()
              return false;
          }
          
          var nameReg = /[ㄱ-ㅎㅏ-ㅣ가-힣]/g;
          if(!nameReg.test($("#member_name").val())){
        	  alert("한글 이름을 입력해 주세요.");
        	  $("#member_name").focus();
              return false;
          }
          
          
          if(!check_phone(member_phone)){
        	  alert("올바른 휴대폰 번호를 입력해 주세요.");
        	  $("#member_phone").val("");
        	  $("#member_phone").focus();
              return false;
          }
          

          if (member_pwd != member_pwd_check) {
              alert("비밀번호가 일치하지 않습니다. 다시 입력해 주세요.");
              $("#member_pwd, #member_pwd_check").val("");
              $("#member_pwd").focus();
              return false;
          }
          
          if (!check_space(member_pwd)) {
              alert("비밀번호에 공백문자를 사용할 수 없습니다. 다시 입력해 주세요.");
              $("#member_pwd, #member_pwd_check").val("");
              $("#member_pwd").focus();
              return false;
          }
          
          if (!check_pw(member_pwd)) {
              alert("비밀번호 규칙에 맞지 않습니다\n영문, 숫자, 특수문자 조합의 8~20자 이내로 입력해 주세요.");
              $("#member_pwd, #member_pwd_check").val("");
              $("#member_pwd").focus();
              return false;
          }
          
          if($("#idChk").val()!= 'Y'){
        	  
        	  alert("아이디 중복확인을 해주세요.");
        	  return false;
          }
          
 		 if($("#nickChk").val()!= 'Y'){
        	  
        	  alert("닉네임 중복확인을 해주세요.");
        	  return false;
          }
    });

 });
		
		
		function check_phone(phone){
			var regExp = /[^0-9]/g;
				
			if( !regExp.test(phone)){
				return false;
			}
			return true;
		}

		 function check_pw(pw) {
		    var regExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;
		    //
		    if ( ! regExp.test(pw) ) {
		       return false;
		    }
		    //
		    return true;
		 }

		 function check_space(str) {
		    var regExp = /\s/g;
		    //
		    if ( regExp.test(str) ) {
		       return false;
		    }
		    //
		    return true;
		 }

		 
		 
		 function findAddr(){
				new daum.Postcode({
			        oncomplete: function(data) {
			        	
			        	console.log(data);
			        	
			            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
			            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			            var roadAddr = data.roadAddress; // 도로명 주소 변수
			            var jibunAddr = data.jibunAddress; // 지번 주소 변수
			            // 우편번호와 주소 정보를 해당 필드에 넣는다.
			            document.getElementById('member_post').value = data.zonecode;
			            if(roadAddr !== ''){
			                document.getElementById("member_addr1").value = roadAddr;
			            } 
			            else if(jibunAddr !== ''){
			                document.getElementById("member_addr1").value = jibunAddr;
			            }
			        }
			    }).open();
			}
		 
		 function dupCheck(){
			
			var member_id = $("#member_id").val();
			var idReg =  /^[a-z]+[a-z0-9]{5,19}$/g;
			 
			 
			 if(member_id == ""){
					alert("아이디를 입력해주세요.");
				  	return;
				 }else if(!idReg.test(member_id)){
			              alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
			              $("#member_id").focus()
			              return;
	         	 }
			 
			 
			 $.ajax({
					url : '${pageContext.request.contextPath}/user/idCheck?member_id='+ member_id,
					type : 'get',
					success : function(data) {
						
						 if(data == 409){
							 alert("이미 등록된 아이디입니다.");
							 $("#member_id").val("");
							 return false;
							 
						 }else{
							 alert("사용 가능한 아이디입니다.");
							 $("#idChk").val('Y');
						 }
					}
			 })
			 
		 }
		 
		 function nickdupCheck(){
			 
			 var member_nick = $("#member_nick").val();
			 var nickReg =  /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,20}$/;
			// 한글 또는 영문 사용하기(혼용X)
			
			
			 
			 	if(member_nick == ""){
					alert("닉네임을 입력해주세요.");
				  	return false;
				 }if(!nickReg.test(member_nick)){
			              alert("닉네임은 2~10자의 한글, 영문, 숫자만 사용할 수 있습니다.");
			              $("#member_nick").focus();
			              return false;
	         	 }
			 
			 	//alert("hello"+member_nick);
			 
			 $.ajax({
					url : '${pageContext.request.contextPath}/user/nickCheck?member_nick='+ member_nick,
					type : 'get',
					success : function(data) {
						 if(data == 409){
							 alert("이미 등록된 닉네임입니다.");
							 $("#member_nick").val("");
							 return false;
							 
						 }else{
							 alert("사용 가능한 닉네임입니다.");
							 $("#nickChk").val('Y');
						 }
					}
			 })
			 
		} 
		 
</script>
</head>
<body>
<jsp:include page="findZoo_Header.jsp"/>
	
	<div id="join-container">
	<div id="content">
	<form action="join.do" method="post" id="form1">
	  <fieldset>
	  	<br>
	    <legend>회원가입</legend>
		<hr>
		<br>
		<div class="form-group">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" >
			<label for="id" class="form-label mt-4">아이디</label>
			<button type="button" onclick="dupCheck();" class="btn btn-secondary" style="float:right; margin-top:15px;">아이디 확인</button><br>
			<input type="text" id="member_id" name="member_id" required="required" class="form-control"">
			<input type="hidden" id="idChk">
			
			<small id="emailHelp" class="form-text text-muted">*아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.</small>
		</div>

		<div class="form-group">
			<label for="pw" class="form-label mt-4">비밀번호</label>
			<input type="password" class="form-control" id="member_pwd" name="member_pwd" required="required"><br>
			<label for="check-pw" class="form-label mt-4">비밀번호 확인</label> 
			<input type="password" class="form-control" id="member_pwd_check" name="member_pwd_check" required="required">
			<small class="form-text text-muted">*비밀번호는 영문, 숫자, 특수문자 조합의 8~20자 이내로 입력해 주세요.</small>
		</div>		
		
		<div class="form-group">		
			<label for="name" class="form-label mt-4">이름</label>
			<input type="text" class="form-control" id="member_name" name="member_name" required="required"><br>
		</div>
		
		<div class="form-group">
			<label for="nick" class="form-label mt-4">닉네임</label>
			<button type="button" onclick="nickdupCheck();" class="btn btn-secondary" style="float:right; margin-top:15px;">닉네임 확인</button><br>
			<input type="text" class="form-control" id="member_nick" name="member_nick" required="required">
			<input type="hidden" id="nickChk">
		</div>
		
		<div class="form-group">
			<label for="phone" class="form-label mt-4">연락처</label> 
			<input type="text" class="form-control" name="member_phone" id="member_phone" maxlength="12" required="required">
			<small class="form-text text-muted">*'-'없이 숫자만 입력해 주세요.</small>
		</div>
		
		<div class="form-group">
		<label for="email" class="form-label mt-4">이메일</label> 
        <input type="text" class="form-control" name="email_1" id="email_1" maxlength="30" style="width:50%;">&nbsp;&nbsp;&nbsp;
             <select class="form-select" name="email_2" id="email_2" style="width:50%; float:right; margin-top:-38px;">
                     <option value="@naver.com">@naver.com</option>
                     <option value="@daum.net">@daum.net</option>
                     <option value="@gmail.com">@gmail.com</option>
                     <option value="@nate.com">@nate.com</option>                        
              </select>
              <input type="hidden" id ="member_email" name="member_email" maxlength="30">
    	</div>

		<div class="form-group">
			<label for="address" class="form-label mt-4">주소</label> 
			 <input class="form-control" id="member_addr1" name="member_addr1" type="text" placeholder="주소검색" readonly onclick="findAddr()" required="required" style="width:50%;">&nbsp;&nbsp;&nbsp;
			 <input class="form-control" type="text" id="member_addr2" name="member_addr1" placeholder="상세주소" required="required" style="width:50%; float:right; margin-top:-38px;"><br>
			 <input id="member_post"  type="hidden" placeholder="우편번호" readonly">
			 <input type="hidden" id ="member_addr" name="member_addr"><br>
		</div>
		
		<div class="form-group">
			<label class="form-label mt-4" for="sms">알림 서비스</label><br>
			<input type="radio" id="member_sms-y" name="member_sms" value="동의" checked="checked">동의
			&nbsp;&nbsp;<input type="radio" id="member_sms-n" name="member_sms" value="비동의">비동의<br>
		</div>
		
		<input type="hidden" name="member_admin" value="일반">
		<input type="hidden" name="social_num" value="1">
		
		
	<div style="text-align: center"> 개인정보취급방침 </div> <br>
	 <form onsubmit="return send(this)"> 
	 <table border="0" cellspacing="0" cellpadding="2" align="center"> 
	 	<tr align="center" height="10"> 
	 	<td> 
 	
	 	<textarea cols="100" rows="14" readonly>
찾아주개는 관련 서비스를 운영함에있어 아래와같은 개인정보취급방침을 준수합니다.

찾아주개는 본 홈페이지를 이용하는 방문자들의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다.

찾아주개는 개인정보취급방침을 통하여 보호센터를 이용하면서 제공하는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.

1. 개인정보 수집에 대한 동의

가. "찾아주개"는 이용자의 개인정보를 수집하는 경우에는 [위의 개인정보취급방침에 동의합니다]의 체크박스에 체크하는 절차를 마련하고 있으며, [위의 개인정보취급방침에 동의합니다]의 체크박스에 체크하였을 경우 개인정보 수집에 대하여 동의한 것으로 봅니다.

나. "찾아주개"는 다음 사항에 해당하는 경우에 이용자의 별도 동의 없이 개인정보를 수집.이용할 수 있습니다.

- 찾아주개 서비스의 제공과 관련된 이행을 위하여 필요한 개인정보로서 경제적.기술적인 사유로 통상의 동의를 받는 것이 현저히 곤란한 경우

- 찾아주개 서비스의 제공과 관련된 민원처리를 위해 불가피한 경우

2. 수집하는 개인정보 항목

찾아주개는 웹 서비스의 원활한 서비스 제공을 위해 아래와 같은 개인정보를 수집하고 있습니다.

가. 수집항목 : 유기동물신고, 기타 서비스와 관련된 일반정보

나. 개인정보 수집방법 : 홈페이지(신고등록정보, 보호센터 서비스를 이용하기 위한 자의적 등록정보)

3. 개인정보의 수집 및 이용목적

찾아주개는 수집한 개인정보를 다음의 목적을 위해 활용합니다.

가. 서비스 제공(컨텐츠)에 따른 이행

나. 본인확인, 개인 식별, 불만처리 등 민원처리 , 고지사항 전달

4. 개인정보의 보유 및 이용기간

원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 보호센터는 아래와 같이 관계법령에서 정한 일정한 기간 동안 정보를 보관합니다.

가. 유기동물신고등록 후 등록자가 해당 게시물을 종료처리를 하면, 등록자의 개인정보(이름, 이메일, 전화번호, 홈페이지)와 상세설명(특징,사연,상세설명)은 게시물 목록에서 자동삭제됩니다.

나. 유기동물신고등록의 완전삭제를 요청하시면 본인확인후 지체없이 해당 글을 완전삭제처리합니다.

다. 유기동물신고등록 이외의 서비스를 이용하기 위한 자의적 등록정보는 언제든 본인이 삭제할 수 있습니다.

라. 보존 항목 : 유기동물신고등록과 관련된 일반정보

마. 보존 근거 : 전자상거래등에서의 소비자보호에 관한 법률

바. 보존 기간 : 5년

5. 개인정보의 파기절차 및 방법

보호센터는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다.

가. 파기절차

유기동물신고, 기타 서비스를 이용하기위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어집니다. 

별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다. 

나. 파기방법 

전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.

6. 개인정보 제공

찾아주개는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.

가. 이용자들이 사전에 동의한 경우

나. 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우

다. 찾아주개 서비스의 제공과 관련된 민원처리를 위해 불가피한 경우

7. 수집한 개인정보의 위탁

찾아주개는 이용자의 동의없이 이용자의 정보를 외부 업체에 위탁하지 않습니다. 향후 그러한 필요가 생길 경우, 위탁 대상자와 위탁 업무 내용에 대해 이용자에게 통지하고 필요한 경우 사전 동의를 받도록 하겠습니다.

8. 개인정보에 관한 민원서비스

찾아주개는 이용자의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보관리책임자를 지정하고 있습니다. 

개인정보관리책임자 성명 : 에러에 질수없조

전화번호 : 010-7777-7777

이메일 : tlswlsthf123@naver.com

귀하께서는 보호센터의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 동물보호센터 대표 이메일로 신고하실 수 있습니다. 보호센터는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다. 

기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다. 

1.개인분쟁조정위원회 (http://www.1336.or.kr/1336) 

2.정보보호마크인증위원회 (http://www.eprivacy.or.kr/02-580-0533~4) 

3.대검찰청 인터넷범죄수사센터 (http://icic.sppo.go.kr/02-3480-3600) 

4.경찰청 사이버테러대응센터 (http://www.ctrc.go.kr/02-392-0330) 
	 	 </textarea> 
 	 </td> 
 	 </tr> 
 	 </table> 
 	 
 	 <div style="text-align: center"> 
 	 	 <input class="form-check-input" type="checkbox" name="agree" id="agree" checked="checked" required="required"> 
 	  		위 개인정보취급방침에 동의합니다 
 	 </div> 
 	 </form> 
		
		<div class="modal-footer">
			<input type="submit" class="btn btn-primary" value="가입">
			<input type="reset" class="btn btn-secondary" data-bs-dismiss="modal" value="취소">
		</div>
		</fieldset>
	</form>
	</div>
</div>

<jsp:include page="findZoo_Footer.jsp"/>
</body>
</html>