<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Q&A 답글</title>
<link href="../common/css/Write.css" type="text/css" rel="stylesheet"/>
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
QnABean=QnAMgr.getReplyMessage(num);
System.out.println("Refply-> num :" + num);
%>
<h2>답글달기</h2>
	<div id="content">
       <div class="form_list">
       	  <form method="post" action="QnA_ReplyProc.jsp?message_num=<%=num %>">
               <table>
                   <colgroup>
                       <col style="width:17%;">
                       <col style="width:83%;">
                   </colgroup>
                   <tbody>
                       <tr>
                           <th scope="row"><label for="b_write">글쓴이</label></th>
                           <td><input type="text" class="inp_text" id="b_write" name="name" style="width:330px" value="<%=QnABean.getName() %>"></td>
                       </tr>
                       <tr>
                           <th scope="row"><label for="b_pw">비밀번호</label></th>
                           <td>
                               <input type="password" class="inp_text" id="b_pw" name="pass" style="width:330px" value="">
                           </td>
                       </tr>
                       <tr>
                           <th scope="row"><label for="b_mail">이메일</label></th>
                           <td>
                               <input type="text" class="inp_text" style="width:330px" id="b_mail" name="email" value="<%=QnABean.getEmail() %>">
                           </td>
                       </tr>
                       <tr>
                           <th scope="row"><label for="b_title">제목</label></th>
                           <td><input type="text" class="inp_text" id="b_title" name="subject" style="width:535px" value="답글:<%=QnABean.getSubject() %>"></td>
                       </tr>
                       <tr>
                           <th scope="row"><label for="b_cont">내용</label></th>
                           <td>
                               <textarea cols="80" rows="7" class="textarea" id="b_cont" name="contents" style="width:535px;height:170px;"><%=QnABean.getContents() %>&nbsp;&nbsp;답변내용:</textarea>
                           </td>
                       </tr>
                   </tbody>
               </table>
               		<ul class="btn_area">
            		   <li>
	                        <input type="submit" value="답변달기" class="btn"/>
	                    </li>
	                    <li class="right mt">
	                        <a href="../jsp/QnA_List.jsp" class="btn result_bt">목록보기</a>
	                    </li>
	             	</ul>
            	</form>
             </div>
          </div>
	<jsp:include page="footer.jsp" />
</body>
</html>