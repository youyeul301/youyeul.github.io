<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>게시글 상세보기</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="QnAMgr" class="DAO.QnA_Mgr" scope="page" />
<jsp:useBean id="QnABean" class="VO.QnA_Bean" scope="page" />
<%
int num=Integer.parseInt(request.getParameter("message_num"));
QnABean=QnAMgr.getMessage(num);
System.out.println("Detail->num:"+num);
System.out.println("Detail->QnABean.getContents:"+QnABean.getContents());
System.out.println("Detail->QnABean.getRef:"+QnABean.getRef());
%>
<center>
	<h2>상세보기</h2>
	<form method="post" action="QnA_Update.jsp?message_num=<%=num %>">
		<table border="1" width=1000>
			<tr>
				<th width="80">글쓴이</th>
				<td align="center" colspan="2"><input type="text" name="name" size="40" value="<%=QnABean.getName() %>" readonly /></td>
			</tr>
			<!-- <tr>
				<th width="80">비밀번호</th>
				<td align="center" colspan="2"><input type="text" name="pass" size="40" value=""/></td>
			</tr> -->
			<tr>
				<th width="80">이메일</th>
				<td align="center" colspan="2"><input type="text" name="email" size="40" value="<%=QnABean.getEmail() %>"  /></td>
			</tr>
			<tr>
				<th width="80">제목</th>
				<td align="center" colspan="2"><input type="text" name="subject" size="40" value="<%=QnABean.getSubject() %>"  /></td>
			</tr>
			<tr height="150">
				<th width="80">내용</th>
				<td colspan="2" align="center">
					<textarea name="contents" cols="30" rows="10"  ><%=QnABean.getContents()%></textarea>
				</td>
			</tr>
			
			<tr>
				<td align="left"><a href="QnA_List.jsp"><img src="../images/logo.png" /></a></td><!-- 목록보기 -->
				<td colspan="2" align="right">
					<input type="submit" name="edit" value="수정"/>
					<%if(QnABean.getRef()==0){ %>
					<a href="QnA_Reply.jsp?message_num=<%=num %>">[답변달기]</a>
					<%} %>
				</td>
			</tr>
			</table>
	</form>
		<form name="delform" action="QnA_Delete.jsp" method="get">
			비밀번호를 입력해야 삭제 가능합니다. &nbsp; &nbsp; &nbsp; 비밀번호: &nbsp;&nbsp;
			<input align="left" type="text" name="pass" />
			<input type="hidden" name="delete_num" value="<%=QnABean.getNum() %>" />
			<input align="right" type="submit" name="delete" value="삭제" />
		</form>
</center>
</body>
</html>