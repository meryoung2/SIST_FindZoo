<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="insertReply.do" method="post">
	<table border="1" width="80%">
                   <tr>
                       <td width="500px">
                      
                        이름: <input type="text" name="member_num" style="width:170px;" maxlength="10" placeholder="작성자"/>
                        <input type="submit" value="등록">
                    </td>
                   </tr>
                   <tr>
                       <td>
                           <textarea name="reply_content" rows="4" cols="50" placeholder="댓글을 입력하세요."></textarea>
                       </td>
                   </tr>
               </table>
               </form>
	<table border="1" width="80%">
		<c:forEach var="b" items="${list }">
		<tr>
			<td>
				<c:if test="${b.reply_level>0 }">
					<c:forEach var="i" begin="1" end="${b.reply_level }">
					&nbsp;&nbsp;&nbsp;&nbsp;
					</c:forEach>
				</c:if>
			작성자 : ${b.member_num }</td>
		</tr>
			<tr>
				<td>
				<c:if test="${b.reply_level>0 }">
					<c:forEach var="i" begin="1" end="${b.reply_level }">
					&nbsp;&nbsp;&nbsp;&nbsp;
					</c:forEach>
				</c:if>
					내용 : ${b.reply_content}
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
