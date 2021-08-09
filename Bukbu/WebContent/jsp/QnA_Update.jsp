<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Q&A 수정</title>
</head>
<body>
<jsp:useBean id="Mgr" class="DAO.QnA_Mgr" scope="page"></jsp:useBean>
<jsp:useBean id="bBean" class="VO.QnA_Bean" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="bBean"/>
<%
request.setCharacterEncoding("utf-8");
System.out.println(bBean.getName()+bBean.getEmail()+bBean.getPass());
String num = request.getParameter("message_num");
String pass=request.getParameter("pass");
System.out.println("pass란 : "+request.getAttribute("editpass"));
//QnA_Bean bBean = new QnA_Bean();
bBean.setNum(Integer.parseInt(num));
//주석
System.out.println("bean num ="+bBean.getNum());
if(pass==""||pass.equals("")){
	%>
	<script type="text/javascript">
		alert("비밀번호를 입력해 주세요");
		location.href="QnA_Detail.jsp?message_num=<%=num %>";
	</script>
	<%
}
int result = Mgr.updateMessage(bBean);

if( result == 0){ // 비밀번호 에러
	//기타에러
		out.print("비밀번호가 다릅니다. 다시 입력해 주세요");
		%>
		<script type="text/javascript">
			alert ("비밀번호가 다릅니다. 다시 입력해 주세요. 게시글 수정 화면으로 돌아갑니다.");
			location.href="QnA_Detail.jsp?message_num=<%=num %>";
		</script>
		<%
	}else if (result > 0 ) { // 에러 없음
		out.print("수정 완료");
		%>
		<script type="text/javascript">
			alert ("수정 완료. 게시글 목록으로 돌아갑니다.");
			location.href="QnA_List.jsp";
		</script>
		<%
	}else{
		//기타에러
		out.print("게시글 등록에 에러가 발생하였습니다.");
		%>
		<script type="text/javascript">
			alert("게시글 등록에 에러가 발생하였습니다. 게시글 수정 화면으로 돌아갑니다.");
			location.href="QnA_Detail.jsp?message_num=<%=num %>";
		</script>
		<%
	}
	%>
</body>
</html>