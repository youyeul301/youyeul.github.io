<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div id="header">
		<div class="bluezone">
			<div class="h_contain">
				<div class="h_left">
					<ul class="maindep">
						<li>
							<span>교육원 소개</span>
							<ul class="subdep">
								<li><a href="#none">인사말</a></li>
								<li><a href="#none">연혁</a></li>
								<li><a href="#none">조직도</a></li>
								<li><a href="#none">전화번호안내</a></li>
								<li><a href="#none">부대시설</a></li>
							</ul>
						</li>
						<li>
							<span>학과 및 입학 안내</span>
							<ul class="subdep2">
								<li><a href="#none">주간과정</a></li>
								<li><a href="#none">야간과정</a></li>
								<li><a href="#none">모집일정/지원자격</a></li>
								<li><a href="#none">모집공고</a></li>
							</ul>
						</li>
						<li>
							<span>커뮤니티</span>
							<ul class="subdep3">
								<li><a href="gongji.jsp">공지사항</a></li>
								<li><a href="jaguck.jsp">자격검정안내</a></li>
								<li><a href="upload.jsp">자료실</a></li>
								<li><a href="QnA_List.jsp">Q&A</a></li>
								<li><a href="#none">FAQ</a></li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="h_right">
					<ul class="signdep">
						<li><a href="Main.jsp" >HOME</a></li>
						<%if(session.getAttribute("id")==null){ %>
						<li><a href="join.jsp">SIGNUP</a></li>
						<li><a href="Login.jsp">LOGIN</a></li>
						<%}else{ %>
						<li><a href=""><%=session.getAttribute("id") %></a></li>
						<li><a href="logoutProc.jsp">LOGOUT</a></li>
						<%} %>
						<li><a href="">SITEMAP</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="whitezone">
			<div>
				<a href="Main.jsp">
					<h1>
						<img src="../common/images/logo.gif" alt="메인로고"/>
					</h1>
				</a>
			</div>
		</div>
	</div>