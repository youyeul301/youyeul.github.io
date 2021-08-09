<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../common/css/upload_wr.css" type="text/css" rel="stylesheet"/>
<link href="../common/css/header.css?ver=1" rel="stylesheet" />
<link href="../common/css/header-dep1.css?ver=1" rel="stylesheet" />
<link href="../common/css/footer.css?ver=1" rel="stylesheet" />
<script src="../common/js/jquery-3.2.1.min.js"></script>
<script src="../common/js/header-dep1.js"></script>
<script src="../common/js/footer.js"></script>
<title>북부기술교육원 자료실</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="upMgr" class="DAO.uploadMgr" scope="page"/>
<jsp:useBean id="upBean" class="VO.uploadBean" scope="page"/>

<%
int num = Integer.parseInt(request.getParameter("message_num"));
upBean = upMgr.getMessage(num);
/* upMgr.setcount(upBean.getHit(), num); */

%>
	<jsp:include page="header.jsp" />
	<div id="content">
	   <h3>상세보기</h3>
       <div class="form_list">
       	  <form method="get" action="uploadUpdate.jsp?message_num=<%=num%>" >
               <table>
                   <colgroup>
                       <col style="width:17%;">
                       <col style="width:45%;">
                       <col style="width:10%;">
                       <col style="width:13%;">
                       <col style="width:15%;">
                   </colgroup>
                   <tbody>
                       <tr>
                           <th scope="row"><label for="b_write">작성자</label></th>
                           <td colspan='4'><%=upBean.getWriter()%></td> 
                       </tr>
                       <tr>
                           <th scope="row"><label for="b_pw">비밀번호</label></th>
                           <td colspan='4'>
                               <input type="text" name="pw" class="inp_text" id="b_title" placeholder="홈페이지에서 직접 처리결과를 확인하기 위한 비밀번호를 입력해 주세요." style="width:535px;" >
                               <!-- <p class="txt_guide">홈페이지에서 직접 처리결과를 확인하기 위한 비밀번호를 입력해 주세요.</p> -->
                           </td>
                       </tr>
                       <tr>
                           <th scope="row"><label for="b_mail">FILE</label></th>
                           <% if(upBean.getOrigfname()==null){ %>
                           <td>파일없음</td>
                           <% }else{ %>
                           <td><%=upBean.getOrigfname() %></td>
                           <% } %>
                           <td><%=upBean.getFilesize() %> &nbsp; [Kbyte]</td>
                           <td><% if (upBean.getOrigfname() != null) { %><a href="javascript:download()">[다운로드]</a><% }%></td>
                           <td>다운로드 수<%=upBean.getDowncount() %></td>
                       </tr>
                       <tr>
                           <th scope="row"><label for="b_title">제목</label></th>
                           <td colspan='4'><input type="text" class="inp_text" id="b_title" name="subject" value="<%=upBean.getSubject() %>" style="width:535px"></td>
                       </tr>
                       <tr>
                           <th scope="row"><label for="b_cont">내용</label></th>
                           <td colspan='4'>
                               <textarea cols="80" rows="7" class="textarea" id="b_cont" name="contents" style="width:535px;height:170px;"><%=upBean.getContents() %></textarea>
                           </td>
                       </tr>
                   </tbody>
               </table>
               <div>
	               <!-- btn_area -->
	               <ul class="btn_area">
	                   <li>
	                   	   <input type="hidden" name="message_num" value="<%=upBean.getNum()%>"/>
	                       <input type="submit" name="edit" value="수정" class="btn"/>
	                       <input type="submit" name="delete" value="삭제" class="btn"/>
	                   </li>
	                   <li style="text-align:right;">
	                   	<a href="upload.jsp" class="btn result_bt">목록보기</a>
	                   </li>
	               </ul>
	               <!-- //btn_area -->
               </div>
            <!-- //cont_area -->
 		  </form>
 		  <form name="downform" action="uploadDownload.jsp" method="post">
			 <input type="hidden" name="origfname"/>
			 <input type="hidden" name="num"/>
 		  </form>
 		</div> 
 	</div>
 	<jsp:include page="footer.jsp" />	
</body>
<script type="text/javascript">
	function download(){
		document.downform.origfname.value = "<%=upBean.getOrigfname()%>";
		document.downform.num.value = "<%=upBean.getNum()%>";
		document.downform.submit();
	}
</script>
</html> 