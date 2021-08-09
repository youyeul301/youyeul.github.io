<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>질문하기</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="QnAMgr" class="DAO.QnA_Mgr" scope="page" />
<jsp:useBean id="QnABean" class="VO.QnA_Bean" scope="page" />
<jsp:setProperty property="*" name="QnABean"/>
<%
System.out.println(QnABean.getContents());
if(QnAMgr.insertMessage(QnABean) > 0){
	out.print(" 등록되었습니다.");
%>
<script type="text/javascript">
	alert("게시판목록으로 돌아갑니다.");
	location.href="QnA_List.jsp";
</script>
<%
}else {
	out.print("에러에러 게시글 등록에 에러가 발생하였습니다.");
}
%>
<script type="text/javascript">
	alert("게시판목록으로 돌아갑니다.");
	location.href="QnA_List.jsp";
</script>
</body>
</html>