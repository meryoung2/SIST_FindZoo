<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>찾아요게시판 글쓰기</h2>
	<hr>
	<form action="insertFind.do" method="post" enctype="multipart/form-data">
		제목 : <input type="text" name="title"><br>
		장소 : <input type="text" name="find_lost_loc"><br>
		날짜 : <input type="date" name="find_lost_date"><br>
		동물 종 :
		<input type="radio" class="form-check-input" name="find_pet" id="find_pet_dog" value="강아지" checked="checked">
		<label for="find_pet_dog">강아지</label>
		<input type="radio" class="form-check-input" name="find_pet" id="find_pet_cat" value="고양이">
		<label for="find_pet_cat">고양이</label>
		<input type="radio" class="form-check-input" name="find_pet" id="find_pet_etc" value="기타">
		<label for="find_pet_etc">기타</label><br>
		사례금
		<input class="form-control" id="disabledInput" type="number" placeholder="사례금을 입력해주세요(없을시에는 0)" name="find_reward" size="20px"><br>
		내용 : <textarea rows="10" cols="80" name="content"></textarea><br>
		파일 : <input type="file" name="picture_file"><br>
		<input type="submit" value="등록">
		<input type="reset" value="취소">
	</form>
</body>
</html>