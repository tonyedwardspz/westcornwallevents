$(document).ready(function(e){
    applyActiveClass();
    injectMobileNav();

    $("#menu").click(function(e){
        $("#nav").toggle();
    });

    $(".hide_me").click(function(e){
        
        var offsetTop = $(window).scrollTop();
        
        $(".body_navigation").toggle();
    });
    
    $('.lazy-image').lazyload({
         threshold : 500
    });

    googleAdCheck();
});


$(window).resize(function(){
    
    if(window.innerWidth > 650) {
        $("#nav").removeAttr("style");
    }    
    if(window.innerWidth > 650) {
        $(".body_navigation").removeAttr("style");
    }  
});


var googleAdCheck = function(){
    if ($('#content').height() < 1000) {
        $('#sideSlot').remove();
    }
};


var applyActiveClass = function(){

    var myElement = $("body").attr('class');

    switch (myElement)
    {
        case "pageHome":
            $("li.home").addClass("navActive");
            break;
        case "page2014":
            $("li.2014").addClass("navActive");
            break;
        case "page2015":
            $("li.2015").addClass("navActive");
            break;
        case "pageAnnual":
            $("li.annual").addClass("navActive");
            break;
        case "pageSubmit":
            $("li.submit").addClass("navActive");
            break;
    }
};


var injectMobileNav = function(){
    $("#nav").addClass("js").before('<div id="menu" class="sprite nav-icon"></div>');
};
