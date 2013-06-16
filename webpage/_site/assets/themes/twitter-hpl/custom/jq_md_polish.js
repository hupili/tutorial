$(document).ready(function(){
	$("img").map( function(){
		var match = /^style=(.*)$/.exec($(this).attr('alt'));
		if (match){
			var styles = match[1].split(";");
			for (var i = 0; i < styles.length; i ++){
				//alert(styles[i]);
				if (styles[i] == "center"){
					$(this).css("display", "block");
					$(this).css("margin-left", "auto");
					$(this).css("margin-right", "auto");
					continue;
				}
				var r;
				if (r = /^width:(.+)$/.exec(styles[i])){
					$(this).css("width", r[1]);
				}
				if (r = /^height:(.+)$/.exec(styles[i])){
					$(this).css("height", r[1]);
				}
			}
		}
	})
});
