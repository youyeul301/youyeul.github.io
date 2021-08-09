$(function(){
	var list=$("#banner");
	var banlist=$("#banner_foot");
	var show_num=1;
	var iconnum=0; 
	
	var num=0;
	var colornum=2;
	var total=$(list).children().length;
	var li_width=$("li:first",list).width();
	var copyObj=$(">li:lt("+show_num+")",list).clone();
	list.append(copyObj);
	
	$(".next").on("click",function(){
		if(num==total){
			num=0;
			list.css("margin-left",num);
		}
		if(colornum==9){
			$("li:nth-child("+(colornum-1)+") a",banlist).css("color","#222");
			colornum=1;
		}
		if(colornum!=0){
			$("li:nth-child("+(colornum-1)+") a",banlist).css("color","#222");
		}
		$("li:nth-child("+colornum+") a",banlist).css("color","#0072bc");
		
		colornum++;
		num++;
		iconnum++;
		if(iconnum==4){
			iconnum=0;
		}
		if(num==4){
			banlist.animate({marginLeft:(-li_width-100)*1+"px"},500);
		}else if(num==total){
			banlist.animate({marginLeft:(-li_width-100)*0+"px"},500);
		}
		$(".ico_event").animate({marginLeft:160*iconnum+"px"},500);
		list.stop().animate({marginLeft:-li_width*num+"px"},500);
		
		return false;
	})
	
	$(".prev").on("click",function(){
		if(num==0){ 
			num=total;
			list.css("margin-left",-num*li_width+"px");
		}
		num--;
		list.stop().animate({marginLeft:-li_width*num+"px"},500)
		return false;
	});
	
	var state=false;
	var playOn=false;
	var time=2000;
	var bannerAuto;
	function play(){
		if(!playOn){
			playOn=true;
			bannerAuto=setInterval(function(){$(".next").click();},time);
		}
	}
	
	function stop(){
		if(playOn){
			playOn=false;
			clearInterval(bannerAuto);
		}
	}
	$(".stop").on("click",function(){
		stop();
		$(".stop").css("display","none");
		$(".play").css("display","inline");
	});
	$(".play").on("click",function(){
		play();
		$(".play").css("display","none");
		$(".stop").css("display","inline");
	});
	play();
})