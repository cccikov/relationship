/*
 * 共用js
 */
function iframeSrc(src){
	$("#iframe").attr("src",src);
}

function imgScale(){
	//图片放大
	$(".pic-clip").on("click", function() {
		var that = $(this);
		var _index = that.index();
		var top = that.offset().top;
		var left = that.offset().left;
		$("#black .img-wrap").html('');
		for(var i=0,len=$(".pic-clip").length;i<len;i++){
			$("<img src='"+$(".pic-clip").eq(i).find("img").attr("src")+"'/>").appendTo("#black .img-wrap");
		}
		$("#black img").eq(_index).addClass("active").siblings().removeClass("active");
		$('body').css("overflow","hidden");
		$("#black").css({
			"top": top,
			"left": left
		}).show().animate({
			"top": 0,
			"left": 0,
			"width": "100%",
			"height": "100%",
			"opacity": 1
		}, 300);
	});
	$(".black-close").on("click",function(){
		var _index = $(this).siblings(".img-wrap").find(".active").index();
		var imgObjs = $(".pic-clip");
		var top = imgObjs.eq(_index).offset().top;
		var left = imgObjs.eq(_index).offset().left;
		$('body').css("overflow","auto");
		$("#black").animate({
			"top":top,
			"left": left,
			"width": 90,
			"height": 90,
			"opacity": 0
		}, 300,function(){
			$("#black").hide();
		});
	});
	$(".right-btn").on("click",function(){
		var _index = $(this).siblings(".img-wrap").find(".active").index();
		var imgObjs = $(this).siblings(".img-wrap").find("img");
		var max = imgObjs.length;
		_index++;
		if(_index>=max){
			_index=max-1;
		}
		imgObjs.eq(_index).show();
	});
	$(".right-btn").on("click",function(){
		var _index = $(this).siblings(".img-wrap").find(".active").index();
		var imgObjs = $(this).siblings(".img-wrap").find("img");
		var max = imgObjs.length;
		_index++;
		if(_index>=max){
			_index=max-1;
		}
		console.log(_index);
		imgObjs.eq(_index).addClass("active").siblings().removeClass("active");
	});
	$(".left-btn").on("click",function(){
		var _index = $(this).siblings(".img-wrap").find(".active").index();
		var imgObjs = $(this).siblings(".img-wrap").find("img");
		_index--;
		if(_index<=0){
			_index=0;
		}
		console.log(_index);
		imgObjs.eq(_index).addClass("active").siblings().removeClass("active");
	});
	
	// 关系共享里自动适应高度textarea
	$(function() {
		$("textarea.auto").on("input", function() {
			var that = $(this);
			that.height("auto");
			if (that.height() < (that[0].scrollHeight - 12)) {
				that.height(that[0].scrollHeight - 12);
			}
		});
	});
}
