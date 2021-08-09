<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="boardMgr" class="DAO.QnA_Mgr" scope="page" />
<%
	String s_num = request.getParameter("message_num");
	int rs=0;
	String pass = request.getParameter("pass");
	if(pass==""||pass.equals("")){
		%>
		<script type="text/javascript">
			alert("비밀번호를 입력해 주세요");
			location.href="QnA_Detail.jsp?message_num=<%=s_num %>";
		</script>
		<%
	}
	System.out.println("pass 확인 : "+pass);
	System.out.println("delete_num : " + s_num + " pass : " + pass);
	
	if(boardMgr.checkPassword(Integer.parseInt(s_num)).equals(pass)){
		rs=boardMgr.delete( Integer.parseInt(s_num));
		if(rs > 0){
			out.print("게시글이 삭제되었습니다.");
		}else
		{
			out.print("게시글이 삭제처리에 에러가 발생되었습니다.");
		}
		%>
			<script type="text/javascript">
				alert("게시글이 삭제되었습니다. 자료실 목록보기로 돌아갑니다.");
				location.href="QnA_List.jsp";
			</script>
		<%
		}else{
			out.print("비밀번호가 다릅니다.다시 작성해 주세요");
			%>
				<script type="text/javascript">
				alert ("비밀번호가 다릅니다. 다시 작성해 주세요. 게시글 상세보기화면으로 돌아갑니다.");
				location.href="QnA_Detail.jsp?message_num=<%=s_num %>";
				</script>
			<%
		}
	
	 	%>
</body>
</html>