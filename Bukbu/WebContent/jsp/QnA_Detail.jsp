<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../common/css/Detail.css" type="text/css" rel="stylesheet"/>
<title>Q&A 게시글</title>
<link href="../common/css/header.css?ver=1" rel="stylesheet" />
<link href="../common/css/header-dep1.css?ver=1" rel="stylesheet" />
<link href="../common/css/footer.css?ver=1" rel="stylesheet" />
<script src="../common/js/jquery-3.2.1.min.js"></script>
<script src="../common/js/header-dep1.js"></script>
<script src="../common/js/footer.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
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

<h2>상세보기</h2>
	<div id="content">
	<form action="" method="post" name="form">
               <div class="form_list">
               <table>
                   <colgroup>
                       <col style="width:17%;">
                       <col style="width:83%;">
                   </colgroup>
                   <tbody>
                       <tr>
                           <th scope="row"><label for="b_write">글쓴이</label></th>
                           <td><input type="text" class="inp_text" id="b_write" name="name" style="width:330px" maxlength="15" value="<%=QnABean.getName() %>" readonly></td>
                       </tr>
                       <tr>
                           <th scope="row"><label for="b_pw">비밀번호</label></th>
                           <td>
                               <input type="password" class="inp_text" id="b_pw" name="pass" style="width:330px">
                               <p class="txt_guide">홈페이지에서 직접 처리결과를 확인하기 위한 비밀번호를 입력해 주세요.</p>
                           </td>
                       </tr>
                       <tr>
                           <th scope="row"><label for="b_mail">이메일</label></th>
                           <td>
                               <input type="text" class="inp_text" style="width:330px" id="b_mail" name="email" maxlength="20" value="<%=QnABean.getEmail() %>">
                           </td>
                       </tr>
                       <tr>
                           <th scope="row"><label for="b_title">제목</label></th>
                           <td><input type="text" class="inp_text" id="b_title" name="subject" style="width:535px" value="<%=QnABean.getSubject() %>"></td>
                       </tr>
                       <tr>
                           <th scope="row"><label for="b_cont">내용</label></th>
                           <td>
                               <textarea cols="80" rows="7" class="textarea" id="b_cont" name="contents" style="width:535px;height:170px;"><%=QnABean.getContents()%></textarea>
                           </td>
                       </tr>
                   </tbody>
               </table>
               </div>
	                <!-- btn_area -->
	                <ul class="btn_area">
	                    <li>
	                    		<input type="button" name="edit" value="수정" class="btn" onclick="move(01);"/>
	                    		<input type="hidden" name="edit_num" value="<%=num %>" />
								<input align="right" type="button" name="delete" value="삭제" class="btn" onclick="move(02);"/>
								<input type="hidden" name="delete_num" value="<%=num%>" />
	                    </li>
	                    <li class="right mt">
	                    	<a href="QnA_Reply.jsp?message_num=<%=num %>" class="btn result_bt">답변달기</a>
	                        <a href="QnA_List.jsp" class="btn result_bt">목록보기</a>
	                    </li>
	                </ul>
	                <!-- //btn_area -->
            </form>
<script>
function Pass(){
	document.form.Pass.value="<%=QnABean.getPass()%>";
	document.form.num.value="<%=QnABean.getNum()%>";
	document.form.submit();
}
function move(mode){
	var theForm = document.form;
	if(mode == "01")
	{
	theForm.method = "post"; 
	theForm.target = "_self";
	 theForm.action = "QnA_Update.jsp?message_num=<%=num%>";
	}
	else if(mode == "02")
	{
	 	theForm.method = "post";
	 	theForm.target = "_self";
	 	theForm.action = "QnA_Delete.jsp?message_num=<%=num%>";
	}
	theForm.submit();
}
<%-- function move(){
	document.form.action = "QnA_Delete.jsp?message_num=<%=num%>";
	 document.form.submit()
} --%>
</script>
            </div>
	<jsp:include page="footer.jsp" />	
</body>
</html>