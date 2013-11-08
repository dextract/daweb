$(function() {
	$("a").bind('click',function() {
		var _this = $(this);
		_this.toggleClass('selected', 5);
		_this.next().toggleClass('dropdown', 500);
		$("a").not(_this).each(function() {
			$(this).next().addClass('dropdown', 500);
			$(this).removeClass('selected', 5);
		});
	});
});

$(function() {
    $("a").children(".menu_selected").each(function() {
        var _this = $(this);
        _this.parent().toggleClass('selected', 5);
        _this.parent().next().toggleClass('dropdown', 500);
        $("a").not(_this.parent()).each(function() {
            $(this).next().addClass('dropdown', 500);
            $(this).removeClass('selected', 5);
        });
    });
});

$(function() {
    $(".comment-form").hide();
});

$(function() {
    $(".post-title").click(function(){
        $(this).siblings(".post-thumb").slideToggle("slow");
        $(this).siblings(".post-content").slideToggle("slow");
    });
});

$(function() {
    $(".post-form-title").click(function(){
        $(this).siblings().slideToggle("slow");
    });
});

$(function() {
    $(".post-form td :submit").click(function(){
        event.preventDefault();

        var name = $("#name").val();
        var post = $("#post").val();

        var content =
            "<div class='post-container'>" +
                "<h3 class='post-title'>"+name+"</h3>" +
                "<div class='post-thumb'><img src='http://www.prostomac.com/wp-content/uploads/2013/04/dummy-escape-icon.jpg'/></div>" +
                "<div class='post-content'><p>"+post+"</p></div>" +
                "<div class='post-footer'><span class='name'>Name 1</span> on</div>" +
            "</div>";
        $(".content").prepend(content);

        $(".post-title:first").click(function(){
            $(this).siblings(".post-thumb").slideToggle("slow");
            $(this).siblings(".post-content").slideToggle("slow");
        });

    });
});

$(function() {
    $(".pesquisa td :submit").click(function() {
        event.preventDefault();
        window.location = "search.html";
        var search_val=$("#search_query").val();
        $("#search_results").empty();
        $("#search_results_header").empty();
        $("#search_results_header").append("Search results for: "+search_val);
    });
});