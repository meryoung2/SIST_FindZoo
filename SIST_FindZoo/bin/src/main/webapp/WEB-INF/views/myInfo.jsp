<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div>
			<h2>ȸ�� ����</h2>
			<hr>
			ȸ����ȣ : ${mb.member_num }<br>
			���̵� : ${mb.member_id }<br>	
			��й�ȣ : ${mb.member_pwd }<br>
			�̸� : ${mb.member_name }<br>
			�г��� : ${mb.member_nick }<br>
			��ȭ��ȣ : ${mb.member_phone }<br>
			�̸��� : ${mb.member_email }<br>
			�ּ� : ${mb.member_addr }<br>
			����Ʈ : ${mb.member_point }<br>
			SMS ���� : ${mb.member_sms }<br>
			������ ���� : ${mb.member_admin }<br>
			�α��� ��� : ${mb.social_num }<br>
			<input type="button" value="������ ����" onclick="#">
			<input type="button" value="ȸ��Ż��" onclick="#">
		</div>
		<div>
			<h2>�ݷ����� ����</h2>
			<hr>
			�ݷ�������ȣ : ${pet.pet_num }<br>
			�ݷ������̸� : ${pet.pet_name }<br>
			�ݷ��������� : ${pet.pet_sex }<br>
			�ݷ������� : ${pet.pet_type }<br>
			������Ϲ�ȣ : ${pet.pet_regist_num }<br>
			�ݷ��������� : ${pet.pet_birth }<br>
			ȸ����ȣ : ${mb.member_num }<br>
			<input type="button" value="�ݷ��������� �߰�" onclick="#">
			<input type="button" value="�ݷ��������� ����" onclick="#">
		</div>
	</div>
</body>
</html>