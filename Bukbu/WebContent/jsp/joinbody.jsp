<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script>
$(function(){
	$(".bt.1").on("click",function(){
		$(".pBoxDiv.1").slideToggle("fast");
	});
	$(".bt.2").on("click",function(){
		$(".pBoxDiv.2").slideToggle("fast");
	});
	$(".bt.3").on("click",function(){
		$(".pBoxDiv.3").slideToggle("fast");
	});
	$(".bt.4").on("click",function(){
		$(".pBoxDiv.4").slideToggle("fast");
	});
});
</script>
<div id="joinContainer">
	<div class="subTit">
		<h2>회원가입</h2>
	</div>
	<div class="joinContent">
		<form action="joinProc.jsp" name="joinForm" class="joinForm" method="post">
			<div class="cont1">
				<div class="title">약관동의</div>
				<div class="agreeList">
					<ul>
						<li>
							<div class="pBox">
								<p class="qTit">
									<input type="checkbox" id="check1" name="check1" class="check1" required="required"/>
									<label for="check1">고유식별정보 제공에 대한 동의</label>
								</p>
								<span class="qBtn">
									<a href="javaascript:" class="bt 1 on">약관 상세보기</a>
								</span>
							</div>
							<div class="pBoxDiv 1">
								<p class="bold">01 개인정보 수집 및 이용주체</p>
								<p>본 홈페이지를 통해 제출하는 서류는 회사(이하 개인정보수집 회사)가 직접 접수하고 관리하며, 향후 서류 관리책임은 개인정보수집회사에 있습니다.</p>
								<p class="bold mt20">02 동의를 거부할 권리 및 동의 거부에 따른 불이익</p>
								<p>
									사용자는 아래 개인정보 제공 등에 관해 동의하지 않을 권리가 있습니다.<br/>
									다만 사용자를 통해 제공받는 정보는 회사의 정보 안내 지원이 제한될 수 있습니다.<br/>
									사용자의 동의 거부 권리 및 거부에 따른 불이익은 아래에 제시되는 모든 동의사항에 해당됩니다.
								</p>
								<p class="bold mt20">03 수집하는 개인정보 항목</p>
								<p>수집항목</p>
								<p>
									- 회원가입 관련 사항 : 이름(국문,영문,한문), 생년월일, 전화번호(휴대폰, 자택, 비상연락처), 주소, 이메일, 지원부문, 근무지, 취미, 특기,<br/>
									&nbsp;&nbsp;혼인여부, 학력, 논문주제, 지도교수, 사진, 병역사항, 가족사항, 어학사항, 자격사항, 면허사항, 경력사항, 교내외 활동, 해외연수 경험, 희망처우, <br/>
									&nbsp;&nbsp;  수상경력, 자기소개, 경력기술, 지원회사, 장애여부, 보훈여부, 	
								</p>
								<p class="txt mt20">개인정보 수집방법 : 북부기술교육원 홈페이지를 통해 입력한 정보</p>
								<p class="txt mt20">
									"-본인인증 시 "
									<span class="redB">나이스신용평가정보</span>
									에서 인증받은 휴대폰 번호를 사용하고 있습니다
								</p>
							</div>
						</li>
						<li>
							<div class="pBox">
								<p class="qTit">
									<input type="checkbox" id="check2" name="check2" required="required" class="check2"/>
									<label for="check2">민감정보 수집에 대한 동의</label>
								</p>
								<span class="qBtn">
									<a href="javaascript:" class="bt 2 on">약관 상세보기</a>
								</span>
							</div>
							<div class="pBoxDiv 2">
								<p class="bold">개인정보 수집 및 이용주체</p>
								<p>
									개인정보보호법에 따른 민감정보 : 등록장애인 여부 및 관련정보, 보훈대상자 여부 및 관련정보<br/>
									(대상자를 우대하기 위해 수집하는 정보로, 원치않는 경우 제공하지 않으셔도 무방하나, 이 경우 우대조건은 적용되지 않습니다.)
								</p>
							</div>
						</li>
						<li>
							<div class="pBox">
								<p class="qTit">
									<input type="checkbox" id="check3" name="check3" required="required" class="check3"/>
									<label for="check3">개인정보 취급업무의 위탁에 대한 동의</label>
								</p>
								<span class="qBtn">
									<a href="javaascript:" class="bt 3 on">약관 상세보기</a>
								</span>
							</div>
							<div class="pBoxDiv 3">
								<p>
									북부기술교육원은 보다 나은 서비스 제공과 정보이용 편의 제공 등 서비스 수행을 원활하게 하기 위하여 외부전문업체에 가입회원의 개인정보에 대한<br/>
									수집·보관·처리·이용·제공·관리·파기 등(이하 "처리")을 위탁할 수 있습니다.
								</p>
								<p class="txt mt20">회사가 외부 전문업체에 가입회원의 개인정보를 처리 위탁하는 경우 그 위탁업무의 내용, 수탁자는 다음 표 와 같습니다.</p>
								<p class="txt mt20">
									회사는 개인정보 처리위탁의 경우 계약 등을 통하여 법령상으로 개인정보 보호규정의 준수, 개인정보에 관한 비밀유지, 제3자 제공 금지 및<br/>
									사고 발생 시의 책임부담, 위탁기간, 개인정보의 반환 및 파기 등을 명확히 규정하고 당해 계약 내용을 서면 또는 전자적으로 보관합니다.
								</p>
								<p class="txt mt20">
									회사는 가입회원의 동의 없이 서비스 제공 이외의 목적으로 개인정보를 처리 위탁하지 않는 것을 원칙으로 합니다. <br/>
									다만, 그러한 필요가 생기는 경우 위탁업무의 내용과 수탁자를 가입회원에게 고지하고 동의를 받습니다.
								</p>
								<div class="t mt20">
									<table summary="개인정보 취급업무의 위탁에 대한 동의">
										<caption>개인정보 취급업무의 위탁에 대한 동의</caption>
										<colgroup>
											<col width="275px">
											<col width="598px">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">위탁업체</th>
												<th scope="col">취급위탁을 하는 업무의 내용</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>벨아이앤에스</td>
												<td>웹사이트 관리, 시스템 및 데이터 관리</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</li>
						<li>
							<div class="pBox">
								<p class="qTit">
									<input type="checkbox" id="check4" name="check4" title="개인정보의 제3자 제공에 대한 동의" required="required"/>
									<label for="check4">개인정보의 제3자 제공에 대한 동의</label>
								</p>
								<span class="qBtn">
									<a href="javaascript:" class="bt 4 on">약관 상세보기</a>
								</span>
							</div>
							<div class="pBoxDiv 4">
								<p class="txt mt20">- 제공 대상 : 한국토익위원회, 출신교, 건강검진기관(소화아동병원, JS메디컬, 용인서울병원), 아이앤드디코리아, 엔잡얼라이언스</p>
								<p>- 제공정보의 이용 목적 : 자격/학력검증, 건강검진, 인적성검사</p>
								<p>- 제공하는 개인정보 항목 : 이름, 주민등록번호</p>
								<p>- 제공 정보의 보유 및 이용 기간 : 정보 확인 완료 후 즉시파기</p>
								<p>- 가입회원은 개인정보의 제3자 제공과 관련하여 동의를 거부할 권리가 있으며, 동의 거부시 회원가입이 제한됩니다. </p>
								<p class="txt mt20">다만, 아래의 경우에는 예외로 합니다.</p>
								<p class="txt mt20">- 가입회원은 사전에 동의한 경우</p>
								<p>령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우</p>
							</div>
						</li>
					</ul>
				</div>
				<p class="allCheck">
					<input type="checkbox" id="check5" name="check5" onclick="allCheck()" required="required" class="checkAll"/>
					<label for="check5">자격사항 확인을 위해 상기 개인정보를 제공/활용하는 것에 동의합니다.</label>
				</p>
			</div>
			<div class="cont2">
				<div class="title">회원정보 입력</div>
				<div class="chkv">모든 항목을 입력하셔야 가입이 완료됩니다.</div>
				<div class="boardType">
					<table summary="이메일주소, 이름, 전화번호, 비밀번호">
						<caption>회원정보입력</caption>
						<colgroup>
							<col width="160px">
							<col width="330px">
							<col width="160px">
							<col width="330px">
						</colgroup>
						<tbody>
							<tr>
								<th>성명</th>
								<td class="ng-binding"><input type="text" name="userName" id="userName" value="" placeholder="이름을 입력하세요." required="required" class="userName"/></td>
								<th>휴대전화번호</th>
								<td>
									<select id="userCellNo1" name="userCellNo1" title="휴대폰번호 국번 입력" required="required" class="userCellNo1">
										<option>선택</option>
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select>
										-
									<input type="text" id="userCellNo2" name="userCellNo2" value="" maxlength="4" title="휴대전화번호 중간 자리" placeholder="중간 자리" required="required" class="userCellNo2"/>
										-
									<input type="text" id="userCellNo3" name="userCellNo3" value="" maxlength="4" title="휴대전화번호 마지막 자리"  placeholder="마지막 자리" required="required" class="userCellNo3"/>
								</td>
							</tr>
							<tr>
								<th><label for="userId">아이디</label></th>
								<td colspan="3">
									<input type="text" id="userId" name="userId" title="아이디 입력" value="" placeholder="아이디를 입력하세요." required="required"/>
									<p class="smallNotice">※아이디는 영문과 숫자를 조합하여 4자 이상, 8자 이하로 설정해주시기 바랍니다.</p>
								</td>
							</tr>
							<tr>
								<th><label for="userPw">비밀번호</label></th>
								<td colspan="3">
									<input type="password" id="userPw" name="userPw" maxlength="12" value="" title="비밀번호 입력" placeholder="비밀번호를 입력하세요." required="required"/>
									<p class="smallNotice">※ 비밀번호는 영문과 숫자를 포함하여 6자 이상, 8자 이하로 설정해주시기 바랍니다.</p>
								</td>
							</tr>
							<tr>
								<th><label for="pwConf">비밀번호 확인</label></th>
								<td colspan="3">
									<input type="password" id="pwConf" name="pwConf" maxlength="12" value="" title="비밀번호 확인" placeholder="비밀번호 확인을 입력하세요." required="required" class="pwConf"/>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="email">이메일</label></th>
								<td colspan="3">
									<input type="text" id="email" name="email" value="" placeholder="이메일을 입력하세요." required="required" class="emailFront"/>
									 @
									<!--<input type="text" id="emailInput" name="emailInput" disabled value="" required="required" class="emailRear"/> -->
									<input type="text" id="emailInput" name="emailInput" value="" required="required" class="emailRear"/>
									<select name="emailSelect" id="emailSelect" required="required" class="addrSelect">
										<option value="" selected>이메일주소 선택</option>
										<option value="naver.com">naver.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="nate.com">nate.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="hotmail.com">hotmail.com</option>
										<option value="lycos.co.kr">lycos.co.kr</option>
										<option value="empal.com">empal.com</option>
										<option value="dreamwiz.com">dreamwiz.com</option>
										<option value="korea.com">korea.com</option>
										<option value="select">직접입력</option>
									</select>
									<p class="smallNotice">※ 로그인 아이디 및 안내메일을 보내드리는데 사용되는 이메일 주소입니다.&nbsp;&nbsp;반드시 실제로 사용하는 이메일 주소를 입력하여 주십시오.</p>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="joinFormBtn">
					<a href="javascript:inputCheck();"><img src="../common/images/join/log_join_btn2.gif" alt="회원가입"/></a>
				</div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
//E-mail 주소 입력방식
$('#emailSelect').change(function(){
   $("#emailSelect option:selected").each(function () {
        
        if($(this).val()== 'select'){ //직접입력일 경우
             $("#emailInput").val('');                        //값 초기화
             //$("#emailInput").attr("disabled",false); //활성화
             document.joinForm.emailInput.focus(); 		//커서 활성화
        }else{ //직접입력이 아닐경우
             //$("#emailInput").val($(this).text());      //선택값 입력 
             $("#emailInput").val($('#emailSelect option:checked').text());
             document.joinForm.emailInput.focus();
             //$("#emailInput").attr("disabled",true); //비활성화
        }
   });
});
</script>
