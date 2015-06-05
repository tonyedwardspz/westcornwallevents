$(document).ready(function(e){
    applyActiveClass();
    injectMobileNav();
});

$("#menu").click(function(e){
    $("#nav").toggle();
});

$(".hide_me").click(function(e){
    
    var offsetTop = $(window).scrollTop();

    if (offsetTop > 300){
        $(".body_navigation:eq( 1 )").toggle();
    }else{
        $(".body_navigation:eq( 0 )").toggle();
    }
});   

$(window).resize(function(){
    
    if(window.innerWidth > 650) {
        $("#nav").removeAttr("style");
    }    
    if(window.innerWidth > 650) {
        $(".body_navigation").removeAttr("style");
    }  
});

function applyActiveClass(){

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
}

function injectMobileNav(){
    $("#nav").addClass("js").before('<div id="menu"><img src="http://www.westcornwallevents.co.uk/images/nav-icon.png" alt="Navigation"></div>');
}
