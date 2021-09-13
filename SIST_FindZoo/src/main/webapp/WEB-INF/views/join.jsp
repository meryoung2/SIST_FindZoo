<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(document).ready(function () {

    $("#form1").submit(function(){
    	
	   var member_id = $("#member_id").val();
       var member_name = $("member_name").val();
       var member_nick = $("#member_nick").val(); 
       var member_phone = $("#member_phone").val(); 
       
       var email_1 = $("#email_1").val();
       var email_2 = $("#email_2 option:selected").val();
       var member_email = email_1.concat(email_2);
       
       $("#member_email").val(member_email);
       console.log(email_1);
       console.log(email_2);
	   console.log(member_email);
       
       var member_addr1 = $("#member_addr1").val();
       var member_addr2 = $("#member_addr2").val();
       var member_addr = member_addr1.concat(member_addr2);
       
       $("#member_addr").val(member_addr);
       console.log(member_addr);
       
       var member_pwd  = $("#member_pwd"   ).val();
       var member_pwd_check  = $("#member_pwd_check" ).val();

     /*  
      ***널체크
        if(member_id.value==''){
           alert("ID를 입력해주세요.");
           return false;
       }
       if(member_pwd.value==''){ 
           alert("Password를 입력해주세요.");
           return false;
       }
       if(member_pwd_check.value==''){ // 비밀번호 확인 입력여부 검사
           alert("Password를 입력해주세요.");
           return false;
       }
       if(member_name.value == ''){ 
           alert("이름을 입력해주세요.");
           return false;
       }
       if(member_phone.value == ''){ 
           alert("연락처를 입력해주세요.");
           return false;
       }
       if(member_email.value == ''){ 
           alert("이메일을 입력해주세요.");
           return false;
       }
       if(member_addr.value == ''){ 
           alert("주소를 입력해주세요.");
           return false;
       }*/



          var idReg =  /^[A-za-z0-9]{6,20}$/g;
          if( !idReg.test( $("#member_id").val() ) ) {
              alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
              $("#member_id").focus()
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

    });

 });
 
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
</script>
</head>
<body>
	<h2>회원가입</h2>
	<hr>
	<form action="join.do" method="post" id="form1">
		
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" >
		<label for="id">아이디</label>
		<input type="text" id="member_id" name="member_id" required="required">
		<button type="button">중복확인</button><br>
		<span>*아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.</span><br>
		
		
		<label for="pw">비밀번호</label>
		<input type="password" id="member_pwd" name="member_pwd" required="required"><br>
		<label for="check-pw">비밀번호 확인</label> 
		<input type="password" id="member_pwd_check" name="member_pwd_check" required="required">
		<span>*비밀번호는 영문, 숫자, 특수문자 조합의 8~20자 이내로 입력해 주세요.</span><br>
				
				
		<label for="name">이름</label>
		<input type="text" id="member_name" name="member_name" required="required"><br>
		
		
		<label for="nick">닉네임</label>
		<input type="text" id="member_nick" name="member_nick" required="required">
		<button type="button">중복확인</button><br>
		
		
		<label for="phone">연락처</label> 
		<input type="text" name="member_phone" maxlength="12" required="required">
		<span>*숫자만 입력</span><br>
		
		<label for="email">이메일</label> 
        <input type="text" name="email_1" id="email_1" maxlength="30">
             <select name="email_2" id="email_2">
                     <option value="@naver.com">@naver.com</option>
                     <option value="@daum.net">@daum.net</option>
                     <option value="@gmail.com">@gmail.com</option>
                     <option value="@nate.com">@nate.com</option>                        
              </select><br>
              <input type="hidden" id ="member_email" name="member_email" maxlength="30">
    

		<label for="address">주소</label> 
		 <input id="member_addr1" name="member_addr1" type="text" placeholder="주소검색" readonly onclick="findAddr()">
		 <input type="text" id="member_addr2" name="member_addr1" placeholder="상세주소"><br>
		 <input id="member_post"  type="hidden" placeholder="우편번호" readonly">
		 <input type="hidden" id ="member_addr" name="member_addr"><br>

		<label for="sms">알림 서비스</label>
		<input type="radio" id="member_sms-y" name="member_sms" value="동의" checked="checked">동의
		<input type="radio" id="member_sms-n" name="member_sms" value="비동의">비동의<br>

		<input type="hidden" name="member_admin" value="일반">
		<input type="hidden" name="social_num" value="1">
		<input type="submit" value="가입">
		<input type="reset" value="취소">
	</form>
</body>
</html>