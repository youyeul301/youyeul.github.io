<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="Mgr" class="DAO.Mgr" scope="page" />
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String inputPw = request.getParameter("pw");

	Cookie cookie = new Cookie("LOGIN", "-");
	Cookie loginId = new Cookie("id", "-");
	if(Mgr.checkLogin(id)==null||Mgr.checkLogin(id).equals(null)){
		%>
		<script type="text/javascript">
			alert("아이디와 비밀번호를 확인해 주세요")
			location.href="Login.jsp";
		</script>
		<%
	}
	else if(Mgr.checkLogin(id).equals(inputPw)){
		cookie.setValue("SUCCESS");
		loginId.setValue(id);
		response.addCookie(cookie);
		response.addCookie(loginId);
		session.setAttribute("id", id);
		%>
		<script type="text/javascript">
			location.href="Main.jsp";
		</script>
	<%
	} else {
		%>
			<script type="text/javascript">
				alert("아이디 또는 비밀번호가 틀렸습니다.")
				location.href="Login.jsp";
			</script>
		<%
	}
%>
</body>
</html>