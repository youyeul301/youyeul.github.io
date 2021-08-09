<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="VO.Bean, DAO.Mgr, java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="Mgr" class="DAO.Mgr" scope="page" />
<jsp:useBean id="Bean" class="VO.Bean" scope="page" />
<jsp:setProperty property="*" name="Bean" />
<jsp:getProperty name="Bean" property="email" />
<%if(request.getParameter("userCellNo1").equals("선택")){
	%>
	<script type="text/javascript">
		alert("휴대폰 번호 앞자리를 선택 해주세요.");
		location.href="join.jsp";
	</script>
<%
}
%>

<%
	if(Mgr.regiInsert(Bean)>0){
		%>
			<script type="text/javascript">
				location.href="joinComplete.jsp";
			</script>
		<%
	} else {
		%>
			<script type="text/javascript">
				alert("회원가입 에러 다시 작성해 주세요.");
				location.href="join.jsp";
			</script>
		<%
	}
%>
</body>
</html>