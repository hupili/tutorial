$(document).ready(function(){
	$("code").map(function(){
		match = /^\$(.*)\$$/.exec($(this).html());
		if (match){
			//$(this).after("<span class=mathjax_inline>" + match + "</span>");
			//$(this).hide();
			$(this).replaceWith("<span class=hpl_mathjax_inline>" + $(this).html() + "</span>");
			MathJax.Hub.Queue(["Typeset",MathJax.Hub,$(this).get(0)]);
		}
	});
});
