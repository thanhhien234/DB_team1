<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<%@ page import="com.db.DBManager" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Cancel Account</title>
	<link rel="stylesheet" href="../styles/cancelAccount.css">
</head>
<body>
   <h2> ȸ��Ż��</h2>
   <br/>
     <form action="cancelAccount_check.jsp" method="post">
     	<h4> ȸ��Ż�� �Ͻ÷��� ��й�ȣ�� �Է��ϼ���.</h4>
		<input type="password" name="pw" id="pw" placeholder="��й�ȣ"><br>
		<input type="submit" value="ȸ��Ż��">
		<input type="button" value="���" onclick="location.href='../mypage.html'">
	</form>


</body>
</html>