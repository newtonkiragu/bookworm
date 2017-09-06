// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets
//= require toastr
<<<<<<< HEAD






=======
>>>>>>> 9e1cfe4d748906b6aaa06eeb2787fa57434393d6
document.addEventListener("turbolinks:load", function() {
 my_func();
})
function my_func() {
$(document).ready(function() {
(function(){
  	var showChar = 50;
    var ellipsestext = "...";

	$('.truncate').each(function() {
        var content = $(this).html();
        if(content.length > showChar) {

            var c = content.substr(0, showChar);
 			var h = content;
            var html = '<div class="truncate-text" style="display:block">' + c + '<span class="moreellipses">' + ellipsestext + '&nbsp;&nbsp;<a href="" class="moreless more">more</a></span></span></div><div class="truncate-text" style="display:none">' + h + '<a href="" class="moreless less">Less</a></span></div>';

            $(this).html(html);
        }

    });

    $(".moreless").click(function(){
		var thisEl = $(this);
        if(thisEl.hasClass("less")) {
        	thisEl.closest('.truncate-text').prev('.truncate-text').toggle();
    		thisEl.closest('.truncate-text').slideToggle();
        } else {
			thisEl.closest('.truncate-text').toggle();
			thisEl.closest('.truncate-text').next('.truncate-text').fadeToggle();
        }
	   	return false;
    });
	/* end iffe */
	}());

/* end ready */
});

}
