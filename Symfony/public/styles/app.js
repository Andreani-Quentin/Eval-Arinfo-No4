$(document).ready(function(){       
 var scroll_start = 0;
 var startchange = $('#startchange');
 var offset = startchange.offset();
   $(document).scroll(function() { 
    scroll_start = $(this).scrollTop();
    if(scroll_start > offset.top) {
      $(".navbar").addClass("navbar-default");
      $(".navbar").removeClass("pt-5");
    } else {
      $('.navbar').removeClass("navbar-default");
    }
  });
});

$(document).ready(function(){
  $('.portfolio_box').hover(
    function() {
      $(this).find('.overlay').animate({bottom: '-20%'}, 'fast' );
      console.log("Toto");
    },function() {
      $(this).find('.overlay').animate({bottom: '-75%'}, 'fast' );
    }
  );
});

$(function() {
    /**
    * Smooth scrolling to page anchor on click
    **/
    $("a[href*='#']:not([href='#'])").click(function() {
        if (
            location.hostname == this.hostname
            && this.pathname.replace(/^\//,"") == location.pathname.replace(/^\//,"")
        ) {
            var anchor = $(this.hash);
            anchor = anchor.length ? anchor : $("[name=" + this.hash.slice(1) +"]");
            if ( anchor.length ) {
                $("html, body").animate( { scrollTop: anchor.offset().top }, 1500);
            }
        }
    });
});