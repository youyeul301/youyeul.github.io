<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>북부기술교육원 로그인</title>
<link href="../common/css/Login.css?ver=1" type="text/css" rel="stylesheet">
<link href="../common/css/header.css?ver=1" rel="stylesheet" />
<link href="../common/css/footer.css?ver=1" rel="stylesheet" />
<script src="../common/js/jquery-3.2.1.min.js"></script>
<script src="../common/js/header.js"></script>
<script src="../common/js/footer.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="loginContainer">
		<form method="post" action="loginProc.jsp">
			<h1>로그인</h1><br />
			<hr><br />
			<input type="text" name="id" id="id" size="40" placeholder="아이디를 입력하세요" /><br />
			<input type="password" name="pw" id="pw" size="40" placeholder="비밀번호를 입력하세요" /><br />
			<input type="submit" value="" id="loginBtn" /><br />
			<a href="join.jsp" id="joinBtn"><input type="button" id="membershipJoin" /></a><br />
			<p><small>회원정보가 없으신 분들은 회원가입을 먼저 해주시기 바랍니다.</small></p>
		</form>
	</div>
	<jsp:include page="footer.jsp" />	
</body>
</html>