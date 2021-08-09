<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../common/css/frBoard.css" type="text/css" rel="stylesheet">
<link href="../common/css/header.css?ver=1" rel="stylesheet" />
<link href="../common/css/header-dep1.css?ver=1" rel="stylesheet" />
<link href="../common/css/footer.css?ver=1" rel="stylesheet" />
<script src="../common/js/jquery-3.2.1.min.js"></script>
<script src="../common/js/header-dep1.js"></script>
<script src="../common/js/footer.js"></script>
<title>북부기술교육원 자료실</title>
<%@ page import = "DAO.uploadMgr" %>
<%@ page import = "VO.uploadBean" %>
<%@ page import = "java.util.ArrayList" %>
<jsp:useBean id="upMgr" class="DAO.uploadMgr" scope="page"/>
<%
	request.setCharacterEncoding("UTF-8");

	ArrayList<uploadBean> list = null;
	
	String curPage = null;
	curPage = request.getParameter("select_page");
	if(curPage == null || curPage == "0") curPage = "1";
	upMgr.setCurPage(Integer.parseInt(curPage));
%>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div id="Intro">
		<div class="TxtPos">
			<p class="introTxt">
				<span class="introTit">COMMUNITY</span>
				북부기술교육원  커뮤니티에서 궁금하신 점에 관한 답변을 확인할 수 있습니다.
			</p>
		</div>	
	</div>
	<script type="text/javascript"></script>
	<div id="fr_conts">
		<nav class="commNav">
			<div class="category">커뮤니티</div>
			<ul>
				<li><a href="gongji.jsp">공지사항/학사일정</a></li>
				<li><a href="jaguck.jsp">자격검정안내</a></li>
				<li class="on"><a href="javascript:">자료실</a></li>
				<li><a href="QnA_List.jsp">Q&A</a></li>
				<li><a href="#">FAQ</a></li>
			</ul>		
		</nav>
		<div class="conts">
			<h2>자료실</h2>
			<ul>
				<li>HOME</li>
				<li>커뮤니티</li>
				<li>자료실</li>
			</ul>
			<%
			/*검색*/
			String searchValue = "";
			if(request.getParameter("searchValue") != null && ! "".equals(request.getParameter("searchValue"))){
				searchValue = new String(request.getParameter("searchValue"));
			}
			String searchType = request.getParameter("searchType");
			%>
			<%
			if(searchValue != "") list = upMgr.getBoardSearchList(searchType, searchValue);//검색어 검색	
			else list = upMgr.getBoardList();
			
			int listSize = 0;
			listSize = list.size();
			%>
			<form name="searchForm" class="QnAForm" method="get"><!-- 검색폼 name:QnAForm-->
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
							if("all".equals(searchType) || "".equals(searchType) || searchType == null)
								out.print("selected=\"selected\"");
						%>>전체</option>
						<option value="subject"
						<%
							if("subject".equals(searchType))
								out.print("selected=\"selected\"");
						%>>제목</option>
						<option value="contents"
						<%
							if("contents".equals(searchType))
								out.print("selected=\"selected\"");
						%>>내용</option>
						<option value="writer"
						<%
							if("writer".equals(searchType))
								out.print("selected=\"selected\"");
						%>>글쓴이</option>
					</select>
					<div class="searchBox">
						<input type="text" value="<%=searchValue%>" class="inp_txt" id="searchValue" name="searchValue" title="검색내용입력" />
						<button type="submit" onclick="uploadSearch();" class="search_btn">검색</button>
					</div>
				</div>
				<%//게시글 갯수 처리
				int SHOW_LIST = 5;
				
				if(list.size()%SHOW_LIST != 0)upMgr.setTotPage((list.size()/SHOW_LIST)+1);
				else upMgr.setTotPage((list.size()/SHOW_LIST));
				%>
				<table class="QnA_list">
					<caption>자료실</caption>
					<colgroup>
						<col style="width:10%;"/>
						<col style="width:50%;"/>
						<col style="width:15%;"/>
						<col style="width:15%;"/>
						<col style="width:10%;"/>
					</colgroup>
					<%
						if(list.isEmpty()){
							out.println("등록된 게시물이 없습니다.");
						}else{
					%>
					<thead>
						<tr>
							<th>NO</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>날짜</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
					<%//게시판 페이지 번호 구현
					int start_item = (upMgr.getCurPage() -1) * SHOW_LIST;
					int end_item = upMgr.getCurPage() * SHOW_LIST;
					
					if(end_item > list.size()) end_item = list.size();
					
					//검색 list 불러옴
					for(int i=start_item; i<end_item; i++){
						uploadBean bean = list.get(i);
						int num = bean.getNum();
						
						String writer = bean.getWriter();
						String subject = bean.getSubject();
						String date = bean.getDate();
						int downcount = bean.getDowncount();
						int hit = bean.getHit(); //조회수증가
					%>
						<tr>
							<td><%=num%></td>
							<td class="left"><a href="uploadDetail.jsp?message_num=<%=bean.getNum()%>"><%=subject%></a></td>
							<td><%=writer%></td>
							<td><%=date%></td>
							<td><%=hit%></td>
						</tr>
						<%} //for문%>
					</tbody>
					<% } //if문%>
				</table>
				<div class="paginate">
				 
					<a href="#" class="prev02">처음</a>
					<a href="#" class="prev">이전</a>
				<!--	
					<a href="#" class="on">1</a>
					<a href="#">2</a>
					<a href="#">3</a>
					<a href="#">4</a>
					<a href="#">5</a>
				 -->	
				 <%
				 	for(int i=0; i<upMgr.getTotPage(); i++){%>
				 	<a href="upload.jsp?select_page=<%=i+1%>&&show_list=<%=SHOW_LIST%>"><%=i+1 %></a>
				 	<% } //for문 %>
				 	<a href="#" class="next">다음</a>
					<a href="#" class="next02">마지막</a>
				</div>
				<a class="wr_btn" href="upload_wr.jsp">자료 올리기</a>
			</form>
			<script type="text/javascript">
				function uploadSearch(){
					var form = document.searchForm;
					if(form.searchValue.value == '' || form.searchValue.value == null){
						alert("검색어를 입력하세요.");
						form.searchValue.focus();
						return false;
					}else{
						form.submit();
					}
				}
			</script>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>