$(function(){
	$(".img1,.main25").mouseover(function(){
		$(".mainGs25").find($(".findul")).css("display","block");
		$(".deplist").find($(".img2")).css("opacity","0.4");
		$(".deplist").find($(".img3")).css("opacity","0.4");
		$(".noneimg").css("display","none");
	})
	$(".img1,.main25").mouseleave(function(){
		$(".mainGs25").find($(".findul")).css("display","none");
		$(".deplist").find($(".img2")).css("opacity","1.0");
		$(".deplist").find($(".img3")).css("opacity","1.0");
		$(".noneimg").css("display","block");
	})

	
	$(".img2,.mainsuper").mouseover(function(){
		$(".mainSupermarket").find($(".findul")).css("display","block");
		$(".deplist").find($(".img1")).css("opacity","0.4");
		$(".deplist").find($(".img3")).css("opacity","0.4");
		$(".noneimg").css("display","none");
	})
	$(".img2,.mainsuper").mouseleave(function(){
		$(".mainSupermarket").find($(".findul")).css("display","none");
		$(".deplist").find($(".img1")).css("opacity","1.0");
		$(".deplist").find($(".img3")).css("opacity","1.0");
		$(".noneimg").css("display","block");
	})

	
	$(".img3,.mainwaston").mouseover(function(){
		$(".mainWastons").find($(".findul")).css("display","block");
		$(".deplist").find($(".img1")).css("opacity","0.4");
		$(".deplist").find($(".img2")).css("opacity","0.4");
		$(".noneimg").css("display","none");
	})
	$(".img3,.mainwaston").mouseleave(function(){
		$(".mainWastons").find($(".findul")).css("display","none");
		$(".deplist").find($(".img1")).css("opacity","1.0");
		$(".deplist").find($(".img2")).css("opacity","1.0");
		$(".noneimg").css("display","block");
	})
});