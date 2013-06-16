$(document).ready(function(){
	//alert("ss");
	$(".review_meta li").map(function(){
		var _value = $('.review_meta_value', $(this)).html();
		if ( /^\s*$/.exec(_value) ){
			$(this).hide();
		}
	});
});
