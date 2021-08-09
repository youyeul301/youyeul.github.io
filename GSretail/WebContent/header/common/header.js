$(function(){
	$("#gnbBt").on("click",function(){
		$("#companywrap").toggle();
	})
	
	$("#close_bt").on("click",function(){
		$("#companywrap").hide();
	})
	
	var im=false;
	$("#morelang").on("click",function(){
		if(!im){
			$("#morelang").css("background","url('header/image/language_bt.png')no-repeat").css("background-position","right 0 top 1px");
			im=!im;
		}else{
			$("#morelang").css("background","url('header/image/language_bt1.png')no-repeat").css("background-position","right 0 top 1px");
			$("#morelang").hover(function(){
				$("#morelang").css("background","url('header/image/language_bt.png')no-repeat").css("background-position","right 0 top 1px");
			},function(){
				$("#morelang").css("background","url('header/image/language_bt1.png')no-repeat").css("background-position","right 0 top 1px");
			})
			im=!im;
		}
		$(".lan_more").toggle();		
	})
	
	$(".dep1menu li").mouseover(function(){
		$(this).find($("ul")).css("display","block");
		$("#dep1_1").css("display","block");
	})
	$(".dep1menu li").mouseleave(function(){
		$(this).find($("ul")).css("display","none");
		$("#dep1_1").css("display","none");
	})
	
//	
//	var state=false;
//	$("#open_bt").on("click",function(){
//		$("#all_menu").stop().slideToggle("fast");
//		if(!state){
//			imgOff(this);
//			state=true;
//		}else{
//			imgOn(this);
//			state=false;
//		}
//		return false;
//	});
//	
//	
//	var xxFlag = false;
//	$("xx").click(function(){
//		if(!xxFlag){
//			$("bb").slideDown(1000, "linear", function(){
//				$("cc").css("background-image","url('')");
//			});
//			xxFlag = !xxFlag;
//		} else {
//			$("bb").slideUp(1000, "linear", function(){
//				$("cc").css("background-image","url('')");
//			});
//			xxFlag = !xxFlag;
//		}
//	});
})