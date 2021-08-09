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
	
	var im=false;
	$(".family").on("click",function(){
		if(im==false){
			$(".family").css("background","#333 url('../common/images/ico_quick_1depth_on.png')no-repeat 140px center")
			$(".f_family").slideDown()
			$("html, body").animate({scrollTop : 10000}, 600);
			im=true
		}else if(im==true){
			$(".family").css("background","#858585 url('../common/images/ico_quick_1depth.png')no-repeat 140px center")
			im=false;
			$(".f_family").slideUp()
			
		}
//		$(".f_family").slideToggle('slow');
	})
	$(".family").mouseover(function(){
		if(im==false){
			$(".family").css("background","#333 url('../common/images/ico_quick_1depth.png')no-repeat 140px center")
		}
	})

	$(".family").mouseout(function(){
		if(im==false){
				$(".family").css("background","#858585 url('../common/images/ico_quick_1depth.png')no-repeat 140px center")
			}
	});
})
	