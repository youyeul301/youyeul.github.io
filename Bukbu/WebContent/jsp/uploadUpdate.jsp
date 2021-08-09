<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="upMgr" class="DAO.uploadMgr" scope="page"/>
<jsp:useBean id="upBean" class="VO.uploadBean" scope="page"/>
<jsp:setProperty property="*" name="upBean"/>
<!-- 에러수정 name:uploadBean -> name:upBean -->
<!-- 액선태그 setProperty의 속성 name 속성값은 useBean의 id속성값과 같다 -->
<%
String num = request.getParameter("message_num");
System.out.println("Edit jsp : message_num = " + num);
upBean.setNum(Integer.parseInt(num));
System.out.println("Edit jsp : upBean.getPw()= " + upBean.getPw());

/* delete 처리부분 start**************************************************************/
String delete = request.getParameter("delete");//삭제 input 태그의 속성  name="delete"값
if(delete != null)
{
	if(upMgr.checkPassword(upBean.getNum()).equals(upBean.getPw())){
%>
	<script type="text/javascript">
	location.href = "uploadDelete.jsp?message_num=<%=upBean.getNum()%>";
	</script>
<%		
	}else{
		//out.print("비밀번호가 다릅니다. 다시 작성해주세요.");
%>	
		<script type="text/javascript">
		alert("비밀번호가 다릅니다. 다시 작성해주세요.\n게시글 상세보기 화면으로 돌아갑니다.");
		location.href = "uploadDetail.jsp?message_num=<%=upBean.getNum()%>";
		</script>			
<%
	}	
	return;// 해당 조건문을 거치지 않고 edit처리코드(아래)로 넘어가는 오류가 있어 return문으로 강제종료시킴. 
}/* delete 처리부분 END****************************************************************/

/** edit 처리부분 start**/
if(upMgr.checkPassword(upBean.getNum()).equals(upBean.getPw())){
	if(upMgr.updateMessage2(upBean) > 0){  
		//out.print("수정되었습니다.");
%> 
	<script type="text/javascript">
		alert("수정되었습니다. 자료실 게시판 리스트로 돌아갑니다.");
		location.href="upload.jsp";
	</script>
<%	
	}else{
		//out.print("자료실 게시글 수정에 에러가 있습니다. 다시 작성해주세요.");
%>
	<script type="text/javascript">
		alert("자료실 게시글 수정에 에러가 있습니다. 비밀번호를 확인하세요.");
		location.href = "uploadDetail.jsp?message_num=<%=upBean.getNum()%>";
	</script>	
<%
	}
}
else
{
%>
	<script type="text/javascript">
		alert("자료실 게시물 작성시 사용한 비밀번호가 다릅니다. 다시 작성해 주세요.");
		location.href = "uploadDetail.jsp?message_num=<%=upBean.getNum()%>";
	</script>
<%
}
%>
</body>
</html>