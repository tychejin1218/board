/* ################################################################################ 
## 로딩바 관련 함수 - 시작
################################################################################### */
/** 로딩바 보이기 */
function gfnStartLoading(){ 
	
	var width = $(window).width();	
	var height = $(window).height();
	
	// 화면을 가리는 레이어의 사이즈 조정
	$(".backLayer").width(width);
	$(".backLayer").height(height);
	
	// 화면을 가리는 레이어를 보여준다. (0.5초동안 30%의 농도의 투명도)
	$(".backLayer").fadeTo(500, 0.3);
	
	$("#loadingBar").show();	
}

/** 로딩바 숨기기 */
function gfnEndLoading(){ 

	$("loadingWrap").addClass('wrap-loading');
    $("#loadingBar").hide();    
}

/**
 * 로딩바 설정
 * @param pMarginTop
 */
function gfnSetLoadingBar(pMarginTop) { 
	
	var w = 140;
	var h = 120;
	var mL = -(w/2);
	var mH = -(h/2);
	
	var marginLeft = ""+mL+"px";
	var marginTop = ""+mH+"px";
	if (pMarginTop) {
		marginTop = pMarginTop;
	}
	
	$("body").append("<div id='loadingBar'></div>");
	$("#loadingBar").css({
	    "display":"none"
	  , "width":""+w+"px"
	  , "height":""+h+"px"
	  , "position":"fixed"
	  , "top":"45%"
	  , "left":"50%"
	  , "background":"url(/img/loadingBar.gif) no-repeat center #fff"
	  , "text-align":"center"
	  , "padding":"10px"
	  , "font":"normal 16px Tahoma, Geneva, sans-serif"
	  , "border":"0px solid #666"
	  , "margin-left":marginLeft
	  , "margin-top":marginTop
	  , "z-index":"100000"
	  , "overflow":"auto" 
	  , "opacity":"0.9"  
	});
}

/* ################################################################################ 
## 로딩바 관련 함수 - 종료
################################################################################### */
