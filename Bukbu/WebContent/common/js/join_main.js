
function inputCheck(){
//약관동의 유효성 검사	
	var joinForm = document.joinForm;
	
	if(!joinForm.check1.checked){
		alert("고유식별정보 제공에 대한 동의는 필수입니다.");
		joinForm.check1.focus();
		return;
	}
	if(!joinForm.check2.checked){
		alert("민감정보 수집에 대한 동의는 필수입니다.");
		joinForm.check2.focus();
		return;
	}
	if(!joinForm.check3.checked){
		alert("개인정보 취급업무의 위탁에 대한 동의는 필수입니다.");
		joinForm.check3.focus();
		return;
	}
	if(!joinForm.check4.checked){
		alert("개인정보의 제3자 제공에 대한 동의는 필수입니다.");
		joinForm.check4.focus();
		return;
	}
//회원가입 양식 체크
    if(document.joinForm.userName.value==""){
        alert("이름을 입력하세요.");
        document.joinForm.userName.focus();
        return;
     }
    if(document.joinForm.userCellNo1.value==""){
        alert("전화번호 앞 세 자리를 선택하세요.");
        document.joinForm.userCellNo1.focus();
        return;
     }
    if(document.joinForm.userCellNo2.value==""){
        alert("전화번호 중간 자리를 입력하세요.");
        document.joinForm.userCellNo2.focus();
        return;
     }
    if(document.joinForm.userCellNo3.value==""){
        alert("전화번호 마지막 자리를 입력하세요.");
        document.joinForm.userCellNo3.focus();
        return;
     }
    
    if(document.joinForm.userId.value==""){
       alert("아이디를 입력하세요.");
       document.joinForm.userId.focus();
       return;
    }
    if(document.joinForm.userPw.value==""){
       alert("비밀번호를 입력하세요.");
       document.joinForm.userPw.focus();
       return;
    }
    if(document.joinForm.userPw.value != document.joinForm.pwConf.value){
      alert("비밀번호를 동일하게 입력하세요.");
      document.joinForm.pwConf.value="";
      document.joinForm.pwConf.focus();
      return;
    }
    
    if(document.joinForm.userId.value == document.joinForm.userPw.value){
    	alert("아이디와 비밀번호를 일치하지 않도록 입력하세요.");
    	document.joinForm.userPw.focus();
    	return;
    }
    if(document.joinForm.email.value==""){
        alert("이메일을 입력하세요.");
        document.joinForm.email.focus();
        return;
     }
    if(document.joinForm.emailInput.value==""){
        alert("이메일 주소를 입력하세요.");
        document.joinForm.emailInput.focus();
        return;
     }
   
    var str = document.joinForm.emailInput.value;
    var phNo2 = document.joinForm.userCellNo2.value;
    var phNo3 = document.joinForm.userCellNo3.value;
    var phNo2Size = phNo2.length;
    var phNo3Size = phNo3.length;
    var countph=0;
    var arrayph=[];
    for(var i=0;i<phNo2Size;i++){
    	arrayph[i]=phNo2.charAt(i);
    	if((arrayph[i]>="1"&&arrayph[i]<="9")){
    		countph++;
    	}
    }
    
    var countph2=0;
    var arrayph2=[];
    for(var i=0;i<phNo3Size;i++){
    	arrayph2[i]=phNo3.charAt(i);
    	if((arrayph2[i]>="1"&&arrayph2[i]<="9")){
    		countph2++;
    	}
    }
    
    
    var idstr = document.joinForm.userId.value;
    var idSize = idstr.length;
    var engid=0;
    var numid=0;
    var arrayid=[];
    for(var i=0;i<idSize;i++){
    	arrayid[i]=idstr.charAt(i);
    	if((arrayid[i]>="A"&&arrayid[i]<="Z")||(arrayid[i] >= "a" && arrayid[i] <= "z")){
    		engid++;
    	}
    	if((arrayid[i]>="1"&&arrayid[i]<="9")){
    		numid++;
    	}
    }
    
    
    var pwstr = document.joinForm.userPw.value;
    var pwSize = pwstr.length;
    var engpw=0;
    var numpw=0;
    var arraypw=[];
    for(var i=0;i<pwSize;i++){
    	arraypw[i]=pwstr.charAt(i);
    	if((arraypw[i]>="A"&&arraypw[i]<="Z")||(arraypw[i] >= "a" && arraypw[i] <= "z")){
    		engpw++;
    	}
    	if((arraypw[i]>="1"&&arraypw[i]<="9")){
    		numpw++;
    	}
    }
    
    var atPos = str.indexOf('@');
    var atLastPos = str.lastIndexOf('@');
    var dotPos = str.indexOf('.');
    var spacePos = str.indexOf(' ');
    var commaPos = str.indexOf(',');
    var eMailSize = str.length;
    
    
    

//아이디 형식 유효성 검사
    if((engid!=idSize&&numid!=idSize) && (idSize > 3 && idSize < 9)){
    	;}
    else{	
    	alert("아이디 형식에 맞지 않습니다. \n\r영문/숫자를 조합하여 4~8자 이내로 입력하세요.");
    	document.joinForm.userId.focus();
    	return;
    }
//비밀번호 형식 유효성 검사
    if((engpw!=pwSize&&numpw!=pwSize) && (pwSize > 5 && pwSize < 9)){;}
    else{
    	alert("비밀번호 형식에 맞지 않습니다. \n\r영문/숫자를 조합하여 6~8자 이내로 입력하세요.");
    	document.joinForm.userPw.focus();
    	return;
    }  
//휴대전화번호 형식 유효성 검사
    if(countph==phNo2Size && phNo2Size > 2){;}
    else{
    	alert(phNo2);
    	alert("휴대전화번호 형식에 맞지 않습니다. \n\r다시 입력해주세요.");
    	document.joinForm.userCellNo2.focus();
    	return;
    }
    if(countph2 ==phNo3Size && phNo3Size > 3){;}
    else{
    	alert(phNo3);
    	alert("휴대전화번호 형식에 맞지 않습니다. \n\r 다시 입력해주세요.");
    	document.joinForm.userCellNo3.focus();
    	return;
    }
    
//이메일 형식 유효성 검사    
    if(dotPos > 3 && spacePos == -1 && commaPos == -1
          && (dotPos + 1) < eMailSize){;}
    else{
       alert('E-mail주소 형식이 맞지 않습니다. \n\r 다시 입력해주세요.');
       document.joinForm.email.value="";
       document.joinForm.email.focus();
       return;
       }
       document.joinForm.submit();
}

//모든 약관동의 체크/해제 
function allCheck(){
	with(document.joinForm){
		if(check5.checked){
			for(var i=0; i<length; i++){
				if(elements[i].type == "checkbox"){
					elements[i].checked = true;
				}
			}
		}else{
			for(var i=0; i<length; i++){
				if(elements[i].type == "checkbox"){
					elements[i].checked = false;
				}
			}
		}
	}
}
