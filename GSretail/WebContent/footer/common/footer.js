$(function(){
	var state=false;
	$(".right_1_op").on("click",function(){
		if(!state){
			imgOff(this);
			$(".right_1").animate({
			    top:"-259px",
			    height: "toggle"
			  });
			state=true;
		}else{
			imgOn(this);
			$(".right_1").animate({
				height: "toggle",
				top:"-34px"
			  });
			state=false;
		}
		return false;
	});
	
	
	var still=false;
	$(".right_2_op").on("click",function(){
		if(!still){
			imgOff(this);
			$(".right_2").animate({
			    top:"-343px",
			    height: "toggle"
			  });
			still=true;
		}else{
			imgOn(this);
			$(".right_2").animate({
				height: "toggle",
				top:"-34px"
			  });
			still=false;
		}
		return false;
	});
	
	function imgOff(t){
		var img = $(t).find("img");
		img.attr("src",img.attr("src").replace("up","down")).attr("alt","닫기");
	}
	function imgOn(t){
		var img = $(t).find("img");
		img.attr("src",img.attr("src").replace("down","up")).attr("alt","열기");
	}
})