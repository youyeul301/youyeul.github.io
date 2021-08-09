<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자격검정안내</title>
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
				<li ><a href="gongji.jsp">공지사항/학사일정</a></li>
				<li class="on"><a href="#">자격검정안내</a></li>
				<li><a href="upload.jsp">자료실</a></li>
				<li ><a href="QnA_List.jsp">Q&A</a></li>
				<li><a href="#">FAQ</a></li>
			</ul>		
		</nav>
		<div class="conts">
			<h2>자격검정안내</h2>
			<ul>
				<li>HOME</li>
				<li>커뮤니티</li>
				<li>자격검정안내</li>
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
								<a href="#">2016년도 국가자격시험 시행 공고</a>
							</td>
							<td>한국산업인력공단</td>
							<td>2015-12-04</td>
							<td>4838</td>
						</tr>
						<tr>
							<td>10</td>
							<td class="left">
								<a href="#">2016전산세무회계자격 시험일정</a>
							</td>
							<td>국가공인자격시험</td>
							<td>2016-01-28	</td>
							<td>3575</td>
						</tr>
						<tr>
							<td>9</td>
							<td class="left">
								<a href="#">2016년도 국가자격시험 시행 공고</a>
							</td>
							<td>한국산업인력공단</td>
							<td>2015-12-04</td>
							<td>4838</td>
						</tr>
						<tr>
							<td>8</td>
							<td class="left">
								<a href="#">조경기능사, 기사(산업기사) 제도판 안내</a>
							</td>
							<td>한국산업인력공단</td>
							<td>2015-06-16</td>
							<td>4568</td>
						</tr>
						<tr>
							<td>7</td>
							<td class="left">
								<a href="#">전자기사 실기시험 장비 안내</a>
							</td>
							<td>북부기술교육원</td>
							<td>2014-07-02</td>
							<td>3362</td>
						</tr>
						<tr>
							<td>6</td>
							<td class="left">
								<a href="#">배관기능사 장비 및 프로그램 안내</a>
							</td>
							<td>북부기술교육원</td>
							<td>2013-10-18</td>
							<td>4216</td>
						</tr>
						<tr>
							<td>5</td>
							<td class="left">
								<a href="#">전자출판기능사(매킨토시) 장비 및 프로그램 안내</a>
							</td>
							<td>북부기술교육원</td>
							<td>2013-10-18</td>
							<td>3532</td>
						</tr>
						<tr>
							<td>4</td>
							<td class="left">
								<a href="#">전자캐드기능사 장비 및 프로그램 안내</a>
							</td>
							<td>북부기술교육원</td>
							<td>2010-02-18</td>
							<td>10630</td>
						</tr>
						<tr>
							<td>3</td>
							<td class="left">
								<a href="#">컴퓨터그래픽스운용기능사 프로그램 안내</a>
							</td>
							<td>북부기술교육원</td>
							<td>2009-10-23</td>
							<td>7535</td>
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