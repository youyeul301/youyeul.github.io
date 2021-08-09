<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../common/css/Write.css" type="text/css" rel="stylesheet"/>
<title>Insert title here</title>
<link href="../common/css/header.css?ver=1" rel="stylesheet" />
<link href="../common/css/header-dep1.css?ver=1" rel="stylesheet" />
<link href="../common/css/footer.css?ver=1" rel="stylesheet" />
<script src="../common/js/jquery-3.2.1.min.js"></script>
<script src="../common/js/header-dep1.js"></script>
<script src="../common/js/footer.js"></script>
</head>
<body>
<jsp:include page="header.jsp" />
	<div id="content">
       <div class="form_list">
       	  <form action="../jsp/QnA_Write.jsp" method="post">
               <table>
                   <colgroup>
                       <col style="width:17%;">
                       <col style="width:83%;">
                   </colgroup>
                   <tbody>
                       <tr>
                           <th scope="row"><label for="b_write">글쓴이</label></th>
                           <td><input type="text" class="inp_text" id="b_write" name="name" style="width:330px"></td>
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
                               <input type="text" class="inp_text" style="width:330px" id="b_mail" name="email">
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
               </div>
	                <!-- btn_area -->
	                <ul class="btn_area">
	                    <li>
	                        <!-- <a href="javascript:void(0);" onclick="javascript:fnSubmit();" class="btn">등록</a> -->
	                        <!-- <a href="javascript:location.reload();" class="btn close_bt">취소</a> -->
	                        <input type="submit" value="등록" class="btn"/>
	                        <input type="reset" value="다시쓰기" class="btn close_bt" />
	                    </li>
	                    <li class="right mt">
	                        <a href="../jsp/QnA_List.jsp" class="btn result_bt">목록보기</a>
	                    </li>
	                </ul>
	                <!-- //btn_area -->
            </div>
            <!-- //cont_area -->
            
 		</form>
<jsp:include page="footer.jsp" />
</body>
</html>