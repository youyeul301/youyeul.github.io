<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항/학사일정</title>
<link href="../common/css/googji.css" type="text/css" rel="stylesheet">
<link href="../common/css/header.css?ver=1" rel="stylesheet" />
<link href="../common/css/header-dep1.css?ver=1" rel="stylesheet" />
<link href="../common/css/footer.css?ver=1" rel="stylesheet" />
<script src="../common/js/jquery-3.2.1.min.js"></script>
<script src="../common/js/header-dep1.js"></script>
<script src="../common/js/footer.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
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
				<li class="on"><a href="#">공지사항/학사일정</a></li>
				<li><a href="jaguck.jsp">자격검정안내</a></li>
				<li><a href="upload.jsp">자료실</a></li>
				<li ><a href="QnA_List.jsp">Q&A</a></li>
				<li><a href="#">FAQ</a></li>
			</ul>		
		</nav>
		<div class="conts">
			<h2>공지사항/학사일정</h2>
			<ul>
				<li>HOME</li>
				<li>커뮤니티</li>
				<li>공지사항/학사일정</li>
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
				<table class="QnA_list">
					<caption>공지사항/학사일정</caption>
					<colgroup>
						<col style="width:10%;"/>
						<col style="width:50%;"/>
						<col style="width:15%;"/>
						<col style="width:15%;"/>
						<col style="width:10%;"/>
					</colgroup>
				<tr>
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
						<tr style="background:#F9F9F9">
							<td>중요</td>
							<td class="left">
								<a href="#">11월 재직자 향상(주말)과정 무료교육 안내</a>
							</td>
							<td>관리자</td>
							<td>2017-06-01</td>
							<td>23192</td>
						</tr>
						<tr style="background:#F9F9F9">
							<td>중요</td>
							<td class="left">
								<a href="#">재직자 주말 향상과정 교육생 준비사항</a>
							</td>
							<td>관리자</td>
							<td>2017-05-28</td>
							<td>1283</td>
						</tr>
						<tr style="background:#F9F9F9">
							<td>중요</td>
							<td class="left">
								<a href="#">11월 - 12월 주요 학사일정</a>
							</td>
							<td>관리자</td>
							<td>2017-05-28</td>
							<td>1386</td>
						</tr>
						<tr>
							<td>6</td>
							<td class="left">
								<a href="#">2018년도 지산맞 채용예정자 및 재직자훈련 수요조사</a>
							</td>
							<td>관리자</td>
							<td>2017-07-03</td>
							<td>682</td>
						</tr>
						<tr>
							<td>5</td>
							<td class="left">
								<a href="#">2017학년도 무료 교육생 모집 안내(지역·산업맞춤형 인력양성사업)</a>
							</td>
							<td>관리자</td>
							<td>2017-12-28</td>
							<td>17658</td>
						</tr>
						<tr>
							<td>4</td>
							<td class="left">
								<a href="#">11월 재직자 향상(주말)과정 무료교육 안내</a>
							</td>
							<td>관리자</td>
							<td>2017-06-01</td>
							<td>23196</td>
						</tr>
						<tr>
							<td>3</td>
							<td class="left">
								<a href="#">재직자 주말 향상과정 교육생 준비사항</a>
							</td>
							<td>관리자</td>
							<td>2017-05-29</td>
							<td>1284</td>
						</tr>
						<tr>
							<td>2</td>
							<td class="left">
								<a href="#">11 - 12월 주요 학사일정</a>
							</td>
							<td>관리자</td>
							<td>2017-05-29</td>
							<td>1389</td>
						</tr>
						<tr>
							<td>1</td>
							<td class="left">
								<a href="#">교육생 차량 교육원내 진입금지</a>
							</td>
							<td>관리자</td>
							<td>2015-11-09</td>
							<td>4675</td>
						</tr>
					</tbody>
				</table>
				<div class="paginate">
				
					<a href="#" class="prev02">처음</a>
					<a href="#" class="prev">이전</a>
				
					<!-- <a href="#" class="on">1</a>
					<a href="#">2</a>
					<a href="#">3</a>
					<a href="#">4</a>
					<a href="#">5</a> -->
					
					<a class="on" href="#">1</a>

							
				
					<a href="#" class="next">다음</a>
					<a href="#" class="next02">마지막</a>
					
				</div>
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