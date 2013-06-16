$(function() {
	$.ajax({
		url: "/meta/article_list.xml",
		dataType: "xml",
		success: function( xmlResponse ) {
			articles = $( "article", xmlResponse );
			// Get article list data
			var data = articles.map(function() {
				return {
					value: $( "title", this ).text() + ", " +
					( $.trim( $( "date", this ).text() ) ),
					desc: $("description", this).text(),
					url: $("url", this).text()
				};
			}).get();

			// Make "search index"
			$( "#j_search" ).autocomplete({
				source: data,
				minLength: 1,
				select: function( event, ui ) {
					window.location.href = ui.item.url;
				},
				position: { my : "right top", at: "right bottom" }
			});

			// Make random post lists
			total = articles.length;
			select = 5;
			probability = 1.0 * select / total;
			articles.map(function(){
				_title = $( "title", this ).text();
				_date = $( "date", this ).text();
				_desc = $("description", this).text();
				_url = $("url", this).text();
				if (Math.random() <= probability){
					$("#j_random_posts").append(
					"<li>"	
					+ "<a href='" + _url + "'>" + _title + "</a>"
					+ ", " + _date
					+"</li>"
					);
				}
			});
		}
	});
});
