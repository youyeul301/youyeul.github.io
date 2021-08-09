<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Q&A 게시판</title>
<link href="../common/css/QnAboard.css" type="text/css" rel="stylesheet">
<link href="../common/css/header.css?ver=1" rel="stylesheet" />
<link href="../common/css/header-dep1.css?ver=1" rel="stylesheet" />
<link href="../common/css/footer.css?ver=1" rel="stylesheet" />
<script src="../common/js/jquery-3.2.1.min.js"></script>
<script src="../common/js/header-dep1.js"></script>
<script src="../common/js/footer.js"></script>
<%@page import="DAO.QnA_Mgr" %>
<%@page import="VO.QnA_Bean" %>
<%@page import="java.util.*" %>

<jsp:useBean id="bMgr" class="DAO.QnA_Mgr" />
<%
	request.setCharacterEncoding("utf-8");
	int listSize=0; // 현재 읽어온 게시물의 수
	ArrayList<QnA_Bean> list = null;
	String curPage=null;
	curPage= request.getParameter("select_page");
	if(curPage == null || curPage=="0") curPage="1";
	bMgr.setCurPage(Integer.parseInt( curPage));
	
%>
<jsp:include page="header.jsp" />
</head>
<body>
	<div id="Intro">
		<div class="TxtPos">
			<p class="introTxt">
				<span class="introTit">COMMUNITY</span>
				북부기술교육원  커뮤니티에서 궁금하신 점에 관한 답변을 확인할 수 있습니다.
			</p>
		</div>	
	</div>
	<script type="text/javascript"></script>
	<div id="QnA_conts">
		<nav class="commNav">
			<div class="category">커뮤니티</div>
			<ul>
				<li><a href="gongji.jsp">공지사항/학사일정</a></li>
				<li><a href="jaguck.jsp">자격검정안내</a></li>
				<li><a href="upload.jsp">자료실</a></li>
				<li class="on"><a href="#">Q&A</a></li>
				<li><a href="#">FAQ</a></li>
			</ul>		
		</nav>
		<div class="conts">
			<h2>QnA</h2>
			<ul>
				<li>HOME</li>
				<li>커뮤니티</li>
				<li>QnA</li>
			</ul>
			
			<%
			/** 검색 처리 ***/
			String word = "";
			if ( request.getParameter ("word") != null && ! "".equals(request.getParameter("word"))){
				//한글 깨짐 방지
				//word = new String(request.getParameter("word").getBytes("ISO-8859-1"),"utf-8");
				word = new String(request.getParameter("word"));
			}
			String searchType = request.getParameter("searchType");
			%>
			
			<form name="searchForm" class="QnAForm" method="post" action="">
				<!-- <ul class="tabWrap">
					<li class="tab01 on">
						<a href="javascript:void(0);">전체</a>
					</li>
					<li class="tab02">
						<a href="javascript:void(0);">제목</a>
					</li>
					<li class="tab03">
						<a href="javascript:void(0);">내용</a>
					</li>
					<li class="tab04">
						<a href="javascript:void(0);">글쓴이</a>
					</li>
				</ul> -->
				
				<div class="searchDiv">
				
					<select id="searchKey" class="selectBox" name="searchType">
						<option value="all"
						<%
						if ("all".equals(searchType) || "".equals(searchType) || searchType == null)
							out.print("selected=\"selected\"");
						%>>전체</option>
						<option value="subject"
						<%
						if ("subject".equals(searchType))
							out.print("selected=\"selected\"");
						%>>제목</option>
						<option value="name"
						<%
						if ("name".equals(searchType))
							out.print("selected=\"selected\"");
						%>>글쓴이</option>
						<option value="contents"
						<%
						if ("contents".equals(searchType))
							out.print("selected=\"selected\"");
						%>>내용</option>
						
					</select>
					<!-- 
					<a href="#" class="selectBox show" title>
						<span class="label">전체</span>
						<span class="icon"></span>
					</a>
					 -->
					<div class="searchBox">
						<input type="text" class="inp_txt" id="searchValue" name="word" value="<%=word %>"/>
						<button type="submit" onclick="searchCheck();" class="search_btn">검색</button>
					</div>
				</div>
				<%
					if(word!="") list=bMgr.getBoardSearchList( searchType, word);
					else list = bMgr.getBoardList();
				
					listSize = list.size();//브라우저 화면에 보여질 게시물갯수
					/* 게시글 갯수 처리 */
					int SHOW_LIST=5;
					
					if(list.size()%SHOW_LIST != 0) bMgr.setTotPage((list.size()/SHOW_LIST)+1);
					else bMgr.setTotPage((list.size()/SHOW_LIST));
					
				%>
				<table class="QnA_list">
					<caption>QnA</caption>
					<colgroup>
						<col style="width:10%;"/>
						<col style="width:50%;"/>
						<col style="width:15%;"/>
						<col style="width:15%;"/>
						<col style="width:10%;"/>
					</colgroup>
				<tr>
					<%
						if (list.isEmpty()) {
							out.println("등록된 게시물이 없습니다.");
						} else {
					%>
					<thead>
						<tr>
							<th>NO</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>날짜</th>
							<th>조회수</th>
						</tr>
						<%
						int start_item= (bMgr.getCurPage()-1)* SHOW_LIST;
						int end_item= bMgr.getCurPage()*SHOW_LIST;
						if(end_item > list.size()) end_item=list.size();
						
						for ( int i = start_item ; i< end_item ; i++) {
							QnA_Bean bean = list.get(i);
							int num = bean.getNum();
							String name = bean.getName();
							String subject = bean.getSubject();
							String regdate = bean.getDate();
							int count = bean.getCount();
						%>
					</thead>
					<tbody>
						<tr>
							<td><%=num %></td>
							<td class="left">
							<% if(bean.getRef()!=0){ %>
							->
							<%} %>
							<a href="QnA_Detail.jsp?message_num=<%=bean.getNum() %>"><%=subject %>
							</a></td>
							<td><%=name %></td>
							<td><%=regdate %></td>
							<td><%=count %></td>
						</tr>
						<%} %>
					</tbody><%
						}
					%>
				</table>
				<div class="paginate">
				
					<a href="#" class="prev02">처음</a>
					<a href="#" class="prev">이전</a>
				
					<!-- <a href="#" class="on">1</a>
					<a href="#">2</a>
					<a href="#">3</a>
					<a href="#">4</a>
					<a href="#">5</a> -->
					
					<%
					for (int i=0; i< bMgr.getTotPage(); i++){ %>
						<a class="on" href="QnA_List.jsp?select_page=<%=i+1 %>"><%= (i+1) %></a>
					<% } %>
							
				
					<a href="#" class="next">다음</a>
					<a href="#" class="next02">마지막</a>
					
				</div>
				<a class="wr_btn" href="../jsp/QnA_Write글쓰기.jsp">질문하기</a>
			</form>
		</div>
		
		<!-- 페이지 넘버링 -start -->
		<%-- <table align="center" border="0" width="80%">
			<tr>
				<td align="center">
				<%
					for (int i=0; i< bMgr.getTotPage(); i++){ %>
						<a href="QnA_List.jsp?select_page=<%=i+1 %>">[<%= (i+1) %>]</a>
					<% } %>
				</td>
			</tr>
		</table> --%>
		<!-- 페이지 넘버링 -end -->
		
		<script type="text/javascript">
		function searchCheck(){
			var form = document.searchForm;
			if (form.word.value == " || form.word.value == null"){
				alert('검색어를 입력하세요.');
				form.word.focus();
				return false;
			} else {
				form.submit;
			}
		}
		</script>
	
	</div>
<jsp:include page="footer.jsp" />
</body>
</html>