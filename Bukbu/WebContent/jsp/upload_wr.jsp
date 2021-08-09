<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../common/css/upload_wr.css" rel="stylesheet" type="text/css"/>
<link href="../common/css/header.css?ver=1" rel="stylesheet" />
<link href="../common/css/header-dep1.css?ver=1" rel="stylesheet" />
<link href="../common/css/footer.css?ver=1" rel="stylesheet" />
<script src="../common/js/jquery-3.2.1.min.js"></script>
<script src="../common/js/header-dep1.js"></script>
<script src="../common/js/footer.js"></script>
<title>북부기술교육원 자료실 작성하기</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="content">
       <div class="form_list">
       	  <form action="uploadProc.jsp" method="post" name="formUpload" enctype="multipart/form-data">
               <table>
                   <colgroup>
                       <col style="width:17%;">
                       <col style="width:83%;">
                   </colgroup>
                   <tbody>
                       <tr>
                           <th scope="row"><label for="b_write">작성자</label></th>
                           <td><input type="text" class="inp_text" id="b_write" name="writer" style="width:330px"></td>
                       </tr>
                       <tr>
                           <th scope="row"><label for="b_pw">비밀번호</label></th>
                           <td>
                               <input type="password" class="inp_text" id="b_pw" name="pw" style="width:330px">
                               <p class="txt_guide">홈페이지에서 직접 처리결과를 확인하기 위한 비밀번호를 입력해 주세요.</p>
                           </td>
                       </tr>
                       <tr>
                           <th scope="row"><label for="b_mail">FILE</label></th>
                           <td>
                               <input type="file" name="uploadfile" class="inp_text" style="width:330px" id="b_mail">
                           </td>
                       </tr>
                       <tr>
                           <th scope="row"><label for="b_title">제목</label></th>
                           <td><input type="text" class="inp_text" id="b_title" name="subject" style="width:535px"></td>
                       </tr>
                       <tr>
                           <th scope="row"><label for="b_cont">내용</label></th>
                           <td>
                               <textarea cols="80" rows="7" class="textarea" id="b_cont" name="contents" style="width:535px;height:170px;"></textarea>
                           </td>
                       </tr>
                   </tbody>
               </table>
               <div>
	                <!-- btn_area -->
	                <ul class="btn_area">
	                    <li>
	                        <input type="submit" value="등록" class="btn"/>
	                    </li>
	                    <li class="right mt">
	                        <a href="upload.jsp" class="btn result_bt">목록보기</a>
	                    </li>
	                </ul>
	                <!-- //btn_area -->
               </div>
            <!-- //cont_area -->  
 		 </form>
	   </div>
	</div>	
	<jsp:include page="footer.jsp" />    		 
</body>
</html>