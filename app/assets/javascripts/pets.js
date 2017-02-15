// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function(){
    var link = $("#demo01");
    $("#dislikecat").click(function(){
      var url = "/randompet";
      $.ajax({
        url: url,
        success: function(data){
          $("#petname")[0].innerHTML = data.name;
          $("#petbreed")[0].innerHTML = data.breed;
          $("#petsex")[0].innerHTML = data.sex;
          $("#petage")[0].innerHTML = data.age;
          $("#petsize")[0].innerHTML = data.size;
          $("#petdescript")[0].innerHTML = data.description;
          $("#petimage").attr("src", data.image);
          $('#petid')[0].innerHTML = data.id;
        }
      });
    });

    $("#likedog").click(function(){
      var petId = $('#petid')[0].innerHTML
      var url = "/favoritepet/" + petId;
      $.ajax({
        url: url,
        success: function(data){
          alert("Your pet has been added to your favorites!");
          $("#petname")[0].innerHTML = data.name;
          $("#petbreed")[0].innerHTML = data.breed;
          $("#petsex")[0].innerHTML = data.sex;
          $("#petage")[0].innerHTML = data.age;
          $("#petsize")[0].innerHTML = data.size;
          $("#petdescript")[0].innerHTML = data.description;
          $("#petimage").attr("src", data.image);
          $('#petid')[0].innerHTML = data.id;
        }
      });
    });
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

  !function(a){a.fn.animatedModal=function(n){function o(){m.css({"z-index":e.zIndexOut}),e.afterClose()}function t(){e.afterOpen()}var i=a(this),e=a.extend({modalTarget:"animatedModal",position:"fixed",width:"100%",height:"100%",top:"0px",left:"0px",zIndexIn:"9999",zIndexOut:"-9999",color:"#39BEB9",opacityIn:"1",opacityOut:"0",animatedIn:"zoomIn",animatedOut:"zoomOut",animationDuration:".6s",overflow:"auto",beforeOpen:function(){},afterOpen:function(){},beforeClose:function(){},afterClose:function(){}},n),d=a(".close-"+e.modalTarget),s=a(i).attr("href"),m=a("body").find("#"+e.modalTarget),l="#"+m.attr("id");m.addClass("animated"),m.addClass(e.modalTarget+"-off");var r={position:e.position,width:e.width,height:e.height,top:e.top,left:e.left,"background-color":e.color,"overflow-y":e.overflow,"z-index":e.zIndexOut,opacity:e.opacityOut,"-webkit-animation-duration":e.animationDuration,"-moz-animation-duration":e.animationDuration,"-ms-animation-duration":e.animationDuration,"animation-duration":e.animationDuration};m.css(r),i.click(function(n){n.preventDefault(),a("body, html").css({overflow:"hidden"}),s==l&&(m.hasClass(e.modalTarget+"-off")&&(m.removeClass(e.animatedOut),m.removeClass(e.modalTarget+"-off"),m.addClass(e.modalTarget+"-on")),m.hasClass(e.modalTarget+"-on")&&(e.beforeOpen(),m.css({opacity:e.opacityIn,"z-index":e.zIndexIn}),m.addClass(e.animatedIn),m.one("webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend",t)))}),d.click(function(n){n.preventDefault(),a("body, html").css({overflow:"auto"}),e.beforeClose(),m.hasClass(e.modalTarget+"-on")&&(m.removeClass(e.modalTarget+"-on"),m.addClass(e.modalTarget+"-off")),m.hasClass(e.modalTarget+"-off")&&(m.removeClass(e.animatedIn),m.addClass(e.animatedOut),m.one("webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend",o))})}}(jQuery);
