<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>북부기술교육원 자료실</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); 
out.clear();
out=pageContext.pushBody();%>
<jsp:useBean id="upMgr" class="DAO.uploadMgr" scope="page"/>
<% upMgr.downLoad(request, response, out, pageContext); %>
</body>
</html>