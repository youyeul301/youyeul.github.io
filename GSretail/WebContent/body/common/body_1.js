	$(function(){
		var list=$("#banner"); // id가 banner인 요소들 즉 8개의 li의 속성을 list라는 변수에 넣는다
		var show_num=1; //프레임에 사진 노출 될 겟수

		var num=0; //이전이나 다음버튼클릭할때 증감하는 값
		var total=$(list).children().length; //전체 리스트의 li의 갯수를 가져옴
		var li_width=$("li:first",list).width();// <li>의 너비값을 저장
		
		/*
		li 태그 중 인덱스 값이 3보다 작은 <li> 태그만 복제합니다.
		그러므로 0,1,2 인덱스에 해당하는 <li> 태그가 복제되어
		<ul id="banner">에 추가됩니다.
		*/

		var copyObj=$(">li:lt("+show_num+")",list).clone(); //clone(); 복사하는 메서드
		list.append(copyObj);
		
		/*
		//다음 버튼을 클릭할 때 마다 이벤트 핸들러를 실행
		$(".next").on("click",function(){
			if(num==total){ //num값이 8일 경우 조건물 실행
				num=0;
				list.css("margin-left",num);
			}
			num++; //num값을 증가시킨다
			list.stop().animate({marginLeft:-li_width*num+"px"},500)
			return false;
		});
		
		//이전 버튼을 클릭할 때 마다 이벤트 핸들러를 실행
		$(".prev").on("click",function(){
			if(num==0){ //num값이 0일 경우 조건물 실행
				num=total;
				list.css("margin-left",-num*li_width+"px");
			}
			num--; //num값을 감소시킨다
			list.stop().animate({marginLeft:-li_width*num+"px"},500)
			return false;
		});
		*/
		var state=false;
		var playOn=false;
		var time=1000;
		var bannerAuto;
		function play(){
			if(!playOn){ //중복 실행 방지
				playOn=true;
				bannerAuto=setInterval(function(){$(".next").click();},time); //1초에 한번씩 next 버튼을 누른다.
			}
		}
		function stop(){
			if(playOn){
				playOn=false;
				clearInterval(bannerAuto); //bannerAuto를 멈춤
			}
		}

		play(); //function 은 정의 부분이고 play()는 실행부분이다

	});