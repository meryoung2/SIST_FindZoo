<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	/* $(function(){
		$("#insert-pet-form").submit(function(){
			var pet_birth = $("#pet_birth").val();
			pet_birth
		});
	});
	$(function(){
		document.getElementById("pet_birth").value = new Date().toISOString().substring(0, 10);	
	}); */  
	$(function(){
		$('#pet_birth').change(function(){
            var pet_birth = $('#pet_birth').val();
	        console.log("pet_birth: "+pet_birth);
        });
	});
</script>
</head>
<body>
	<h2>반려동물정보 등록</h2>
	<hr>
	<div id="insert-pet-container">
		<form action="insertPet.do" id="insert-pet-form" method="post">
			회원번호 : <input type="text" name="member_num" value="${mb.member_num }"><br>
			반려동물이름 : <input type="text" name="pet_name"><br>
			반려동물성별 : <input type="radio" name="pet_sex" value="암컷" checked="checked">암컷
						<input type="radio" name="pet_sex" value="수컷">수컷<br>
			반려동물타입 : <input type="radio" name="pet_type" value="강아지" checked="checked">강아지
						<input type="radio" name="pet_type" value="고양이">고양이
						<input type="radio" name="pet_type" value="기타">기타<br>
			동물등록번호 : <input type="text" name="pet_regist_num"><br>
			반려동물생일 : <input type="date" name="pet_birth" id="pet_birth" max="9999-12-31"><br>
			<br>
			<input type="submit" value="등록">
			<input type="reset" value="취소">
		</form>
	</div>
</body>
</html>