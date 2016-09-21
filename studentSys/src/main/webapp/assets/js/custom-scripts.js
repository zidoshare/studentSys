/*------------------------------------------------------
    Author : www.webthemez.com
    License: Commons Attribution 3.0
    http://creativecommons.org/licenses/by/3.0/
---------------------------------------------------------  */

(function ($) {

    "use strict";
    var mainApp = {

        initFunction: function () {
            /*MENU 
            ------------------------------------*/
            $('#main-menu').metisMenu();
            $('.nav-btn').bind('click',function(){
                if($(this).hasClass('closed')){
                    $('.navbar-side').animate({left: '0px'});
                    $(this).removeClass('closed');
                    if($(window).width() > 768)
                        $('#page-wrapper').animate({'margin-left' : '260px'});
                }
                else{
                    $(this).addClass('closed');
                    $('.navbar-side').animate({left: '-260px'});
                    if($(window).width() > 768)
                        $('#page-wrapper').animate({'margin-left' : '0px'});
                }
            });

            $(window).bind("load resize", function () {
                if ($(this).width() < 768) {
                    $('nav.sidebar-collapse').addClass('nav-hidden');
                } else {
                    $('nav.sidebar-collapse').removeClass('nav-hidden');
                }
            });
            $('.bar-chart').cssCharts({type:"bar"});
            $('.donut-chart').cssCharts({type:"donut"}).trigger('show-donut-chart');
            $('.line-chart').cssCharts({type:"line"});

            $('.pie-thychart').cssCharts({type:"pie"});
       
	 
        },

        initialization: function () {
            mainApp.initFunction();

        }

    }
    // Initializing ///

    $(document).ready(function () {
        mainApp.initFunction(); 
		$("#sideNav").click(function(){
			if($(this).hasClass('closed')){
				$('.navbar-side').animate({left: '0px'});
				$(this).removeClass('closed');
				$('#page-wrapper').animate({'margin-left' : '260px'});
				
			}
			else{
			    $(this).addClass('closed');
				$('.navbar-side').animate({left: '-260px'});
				$('#page-wrapper').animate({'margin-left' : '0px'}); 
			}
		});
    });

}(jQuery));
