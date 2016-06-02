/*
 * 共用js
 */
function iframeSrc(src) {
	$("#iframe").attr("src", src);
}

function imgScale() {
	//图片放大
	$(".pic-clip").on("click", function() {
		var that = $(this);
		var _index = that.index();
		var top = that.offset().top;
		var left = that.offset().left;
		$("#black .img-wrap").html('');
		for (var i = 0, len = $(".pic-clip").length; i < len; i++) {
			$("<img src='" + $(".pic-clip").eq(i).find("img").attr("src") + "'/>").appendTo("#black .img-wrap");
		}
		$("#black img").eq(_index).addClass("active").siblings().removeClass("active");
		$('body').css("overflow", "hidden");
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
	$(".black-close").on("click", function() {
		var _index = $(this).siblings(".img-wrap").find(".active").index();
		var imgObjs = $(".pic-clip");
		var top = imgObjs.eq(_index).offset().top;
		var left = imgObjs.eq(_index).offset().left;
		$('body').css("overflow", "auto");
		$("#black").animate({
			"top": top,
			"left": left,
			"width": 90,
			"height": 90,
			"opacity": 0
		}, 300, function() {
			$("#black").hide();
		});
	});
	$(".right-btn").on("click", function() {
		var _index = $(this).siblings(".img-wrap").find(".active").index();
		var imgObjs = $(this).siblings(".img-wrap").find("img");
		var max = imgObjs.length;
		_index++;
		if (_index >= max) {
			_index = max - 1;
		}
		imgObjs.eq(_index).show();
	});
	$(".right-btn").on("click", function() {
		var _index = $(this).siblings(".img-wrap").find(".active").index();
		var imgObjs = $(this).siblings(".img-wrap").find("img");
		var max = imgObjs.length;
		_index++;
		if (_index >= max) {
			_index = max - 1;
		}
		console.log(_index);
		imgObjs.eq(_index).addClass("active").siblings().removeClass("active");
	});
	$(".left-btn").on("click", function() {
		var _index = $(this).siblings(".img-wrap").find(".active").index();
		var imgObjs = $(this).siblings(".img-wrap").find("img");
		_index--;
		if (_index <= 0) {
			_index = 0;
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
// 自定义时间格式
function formatDate(d) {
	var now = new Date(d);
	var year = now.getFullYear();
	var month = now.getMonth() + 1;
	month < 10 ? month = "0" + month : month = month;
	var day = now.getDate();
	day < 10 ? day = "0" + day : day = day;
	var hour = now.getHours();
	hour < 10 ? hour = "0" + hour : hour = hour;
	var minute = now.getMinutes();
	minute < 10 ? minute = "0" + minute : minute = minute;
	var second = now.getSeconds();
	second < 10 ? second = "0" + second : second = second;
	return year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;
}