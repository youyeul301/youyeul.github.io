<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>북부기술교육원 자료실 작성하기</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="upMgr" class="DAO.uploadMgr" scope="page"/>

<%
	if(upMgr.insertMessage(request) > 0){
		//out.print("등록되었습니다.");
%>
<script type="text/javascript">
	alert("게시물이 정상적으로 등록되었습니다.");
	location.href="upload.jsp";
</script>
<%		
	}else{
		//out.print("게시글 등록에 에려가 발생하였습니다.");
%>
<script type="text/javascript">
	alert("에러가 발생하였습니다.\n\r관리자에게 문의하세요.");
</script>

<%		
		
	}
%>
<!-- 
<script type="text/javascript">
	alert("자료실 목록으로 돌아갑니다.");
	location.href="upload.jsp";
</script>
 -->
</body>
</html>