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
    $(".contacts").siblings().hide();
});

$(function() {
    $(".post-title").click(function(){
        if($(".post-content").is(":hidden") && (!($(".post-thumb").is(":hidden"))))
            $(this).siblings(".post-content").slideToggle("slow");
        else {
            $(this).siblings(".post-thumb").slideToggle("slow");
            $(this).siblings(".post-content").slideToggle("slow");
        }
    });
});

$(function() {
    $(".post-form-title").click(function(){
        $(this).siblings().slideToggle("slow");
    });
});

$(function() {
    $(".contacts").click(function(){
        $(this).siblings().toggle();
    });
});

$(function() {
    $(".post-form #button_row").click(function(){
        event.preventDefault();

        var name = $("#name").val();
        var post = $("#post").val();

        if(name=="" || post=="")
            alert("Nome ou mesnagem vazio");
        else {
            var content =
                "<div class='post-container'>" +
                    "<h3 class='post-title'>"+name+"</h3>" +
                    "<div class='post-thumb'><img src='http://www.prostomac.com/wp-content/uploads/2013/04/dummy-escape-icon.jpg'/></div>" +
                    "<div class='post-content'><p>"+post+"</p></div>" +
                    "<div class='post-footer'><img src='http://d1vu33opq27khs.cloudfront.net/application-com.LevelZed.DummyEscapeLite-icon'/><span class='name'><a href='#'>Name 1</a></span> on 20.02.2013</div>" +
                "</div>";
            $(".content").prepend(content);

            $(".post-title:first").click(function(){
                $(this).siblings(".post-thumb").slideToggle("slow");
                $(this).siblings(".post-content").slideToggle("slow");
            });
        }
    });
});

$(function() {
    $(".pesquisa td :submit").click(function() {

        var search_val=$("#search_query").val();

        $("#search_results_header").show();

    });
});

$(function() {
    $("#search_button_page").click(function() {
        event.preventDefault();

        $("#search_results_header").show();

    });
});



$(function() {
    $("ul.tabs").on("click", "li:not(.current)", function() {
        $(this).addClass("current").siblings().removeClass("current")
            .parents("#search_results").find("div.box").eq($(this).index()).fadeIn(150).siblings("div.box").hide();
    });
});