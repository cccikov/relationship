//登录
$(function() {
	
	//ie10以下模拟placeholder
	if ($(".placeholder").length > 0) {
		$("#username").add("#password").on("propertychange input keyup", function() {
			if ($(this).val() != '') {
				$(this).siblings(".placeholder").hide();
			}else{
				$(this).siblings(".placeholder").show();
			}
		});
	}
});