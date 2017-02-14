// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

  
$(document).ready(function(){
    var link = $("#demo01");

    link.animatedModal();
    link.trigger('click');
    $("#nav-mobile").html($("#nav-main").html());
    $("#nav-trigger span").click(function(){
        if ($("nav#nav-mobile ul").hasClass("expanded")) {
            $("nav#nav-mobile ul.expanded").removeClass("expanded").slideUp(250);
            $(this).removeClass("open");
        } else {
            $("nav#nav-mobile ul").addClass("expanded").slideDown(250);
            $(this).addClass("open");
        }
    });
});
