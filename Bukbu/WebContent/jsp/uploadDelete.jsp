<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="upMgr" class="DAO.uploadMgr" scope="page"/>

<%
	String num = request.getParameter("message_num");
	int rs = 0;
	rs = upMgr.delete(Integer.parseInt(num));
	if(rs > 0){
		//out.print("자료실 게시글이 삭제되었습니다.");
%>
	<script type="text/javascript">
		alert("자료실 게시글이 삭제되었습니다.\n자료실 목록으로 돌아갑니다."); 
		location.href="upload.jsp"; 
	</script>
<%		
	}else{
		out.print("자료실 게시글 삭제처리에 에러가 발생돠었습니다.");
	
		%>
		<script type="text/javascript">
		alert("자료실 게시글 삭제처리에 에러가 발생돠었습니다.\n자료실 게시글 상세보기로 돌아갑니다."); 
		location.href="uploadDetail.jsp?message_num=<%=Integer.parseInt(num)%>"; 
		</script>
<%		
	}
%>
<!-- 
	<script type="text/javascript">
	alert("자료실 게시판 목록보기로 돌아갑니다.");
	location.href = "upload.jsp";
	</script>
 -->
</body>
</html>