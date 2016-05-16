//==========================这是微信改版共用js======================================

//onload
$(function(){
	//侧栏出现
	$("#sideBtn").on("touchstart",function(){
		if($("#sideBtn").attr("class").indexOf("active")==-1){
			$("#sideBtn").addClass("active");
			$("#content").hide();
			$("#sideBlock").show();
			
		}else{
			$("#sideBtn").removeClass("active");
			$("#sideBlock").hide();
			$("#content").show();
		}
	});

	//关闭app下载悬浮块  padding消失
	$("#closeDownload").on("touchstart",function(){
		$("#appDownload").hide();
		$("#sideBlock,#content").css("padding","46px 0 0");
	});
});
