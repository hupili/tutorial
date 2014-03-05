$(document).ready(function(){
	$(".icon_bool").map( function(){
		var val = $(this).html().trim();
		var asset_path = $("#asset_path").attr("value");
		//alert(val);
		if (val == "true"){
			$(this).html("<img src='" + asset_path + "/icons/tick.png' />");
		} else if (val == "false"){
			$(this).html("<img src='" + asset_path + "/icons/cross.png' />");
		}
	})
});
