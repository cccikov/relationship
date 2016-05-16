$(function(){
	$("textarea").on("input",function(){
		var that = $(this);
		that.height("auto");
		if(that.height()<(that[0].scrollHeight-12)){
			that.height(that[0].scrollHeight-12);
		}
	});
});
