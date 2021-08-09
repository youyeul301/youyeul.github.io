$(function(){
	var list=$(".mainbanner");
	var sublist=$(".sublist");
	var sub_num=1;
	var show_num=1;

	var num=0;
	var subnum=0;
	
	var total=$(list).children().length;
	var subtotal=$(sublist).children().length;
	var subwidth=$("li:first",sublist).width();
	var subcopy=$(">li:lt("+sub_num+")",sublist).clone();
	var li_width=$("li:first",list).width();
	var copyObj=$(">li:lt("+show_num+")",list).clone();
	sublist.append(subcopy);
	list.append(copyObj);
	
	var state=false;
	var playOn=false;
	var time=5000;
	var bannerAuto;
	function play(){
		if(!playOn){ //중복 실행 방지
			playOn=true;
			bannerAuto=setInterval(function(){
				if(num==total){ //num값이 8일 경우 조건물 실행
					num=0;
					list.css("margin-left",num);
				}
				num++; //num값을 증가시킨다
				list.stop().animate({marginLeft:-li_width*num+"px"},1000)
				return false;
			},time); //1초에 한번씩 next 버튼을 누른다.
		}
	}
	
	var state1=false;
	var playOn1=false;
	var time1=4000;
	var bannerAuto1;
	
	function subplay(){
		if(!playOn1){ //중복 실행 방지
			playOn1=true;
			bannerAuto1=setInterval(function(){
				if(subnum==subtotal){ //num값이 8일 경우 조건물 실행
					subnum=0;
					sublist.css("margin-left",subnum);
					
				}


				
				subnum++; //num값을 증가시킨다
				
				if(subnum==subtotal){
					$(".one_left>a").css("background","#c8c8c8");
					$(".one_left>a:eq(0)").css("background","black");
				}else{
					$(".one_left>a").css("background","#c8c8c8");
					$(".one_left>a:eq("+(subnum)+")").css("background","black");
				}
				
				sublist.stop().animate({marginLeft:-subwidth*subnum+"px"},1000);
				
				return false;
			},time1); //1초에 한번씩 next 버튼을 누른다.
		}
	}


	$(".one_left>a").on("click",function(){
		subnum=($(this).index())-2;
		$(".one_left>a").css("background","#c8c8c8");
		$(".one_left>a:eq("+(subnum)+")").css("background","black");
		sublist.stop().animate({marginLeft:-subwidth*subnum+"px"},1000);
	});
	subplay();
	function stop(){
		if(playOn1){
			playOn1=false;
			clearInterval(bannerAuto1); //bannerAuto를 멈춤
		}
	}
//	play();
	
	
})