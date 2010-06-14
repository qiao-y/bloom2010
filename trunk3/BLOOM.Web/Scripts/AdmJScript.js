$(document).ready(function() {
        $(".menu_head").click(function() {   
      
            $(this).parent().find(".menu_body").slideDown('fast').show();   
      
            $(this).parent().hover(function() {   
                }, function(){   
                $(this).parent().find(".menu_body").slideUp('slow');   
            });   
      
            }).hover(function() {   
                $(this).css({color:"#F4AE34"});   
            }, function(){   
                $(this).css({color:"#000"});
            });



});  