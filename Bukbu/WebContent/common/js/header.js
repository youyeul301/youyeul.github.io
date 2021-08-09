$(function(){
//	$(".site").hover(function(){
//		$(".family").css("background","#333 url('../images/ico_quick_1depth.png')no-repeat 140px center")
//	});
//	$(".site").mouseout(function(){
//		$(".family").css("background","#858585 url('../images/ico_quick_1depth.png')no-repeat 140px center")
//	});
//	$(".site").on("click",function(){
//		$(".family").css("background","#858585 url('../images/ico_quick_1depth.png')no-repeat 140px center")
//	});
	var con=0;

	$(".maindep>li").mouseover(function(){
		var dep=$(this).index();
		if(dep!=con){
		$(this).css("background","#fff");
		$(this).children("span").css("color","#004795");
		}
	});
	
	$(".maindep>li").mouseout(function(){
		var dep=$(this).index();
		if(dep!=con){
		$(this).css("background","none");
		$(this).children("span").css("color","#fff");
		}
	});

	
	$(".maindep>li").on("click",function(){
			$(".maindep>li").css("background","none");
			$(".maindep>li").children("span").css("color","#fff");
			$(".maindep>li").children("ul").css("display","none")
			$(this).css("background","#fff");
			$(this).children("span").css("color","#004795");
			$(this).children("ul").css("display","block");
			con=$(this).index();
	});
	
})
	