function imageExists(src, callback) {
    var img = new Image;
    img.onload = function() {
        callback(src, true);
    };
    img.onerror = function() {
        callback(src, false);
    };
    img.src=src;
}
$(document).ready(function(){
	$(".review_link").map( function(){
		var me = $(this);
		var href = $(this).attr("href");
		var parser = document.createElement('a');
		parser.href = href; 
		var href_favicon = parser.protocol + "//" + parser.host + "/favicon.ico";
		//alert(href_favicon);
		imageExists(href_favicon, function(src, exists) {
			if (exists) {
				$('<img class="favicon tabular">').attr('src', src).appendTo(me);
			} else {
				// do nothing
			}
		});	
	})
});
