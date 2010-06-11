$(document).ready(function() {
    /*---------------------------------------------------------------------*/
    /*For sliding*/
    $(function() {
        $('#flashbox').smallslider({
            showText: false
        });
    });

    /*---------------------------------------------------------------------*/
    /*For ranking*/
    $("#WEEK_1").addClass('temp').show();
    $("div[id^='WEEK']:not(#WEEK_1)").hide();

    $("#Atitle").click(function() {
        $("#WEEK_1").addClass('temp').toggle();
        $("div[id^='WEEK']:not(#WEEK_1)").hide();
    })
    $("#Btitle").click(function() {
        $("#WEEK_2").addClass('temp').toggle();
        $("div[id^='WEEK']:not(#WEEK_2)").hide();
    })
    $("#Ctitle").click(function() {
        $("#WEEK_3").addClass('temp').toggle();
        $("div[id^='WEEK']:not(#WEEK_3)").hide();
    })
    $("#Dtitle").click(function() {
        $("#WEEK_4").addClass('temp').toggle();
        $("div[id^='WEEK']:not(#WEEK_4)").hide();
    })
    $("#Etitle").click(function() {
        $("#WEEK_5").addClass('temp').toggle();
        $("div[id^='WEEK']:not(#WEEK_5)").hide();
    })


    $("#POP_1").addClass('temp').show();
    $("div[id^='POP']:not(#POP_1)").hide();

    $("#Atitle2").click(function() {
        $("#POP_1").addClass('temp').toggle();
        $("div[id^='POP']:not(#POP_1)").hide();
    })
    $("#Btitle2").click(function() {
        $("#POP_2").addClass('temp').toggle();
        $("div[id^='POP']:not(#POP_2)").hide();
    })
    $("#Ctitle2").click(function() {
        $("#POP_3").addClass('temp').toggle();
        $("div[id^='POP']:not(#POP_3)").hide();
    })
    $("#Dtitle2").click(function() {
        $("#POP_4").addClass('temp').toggle();
        $("div[id^='POP']:not(#POP_4)").hide();
    })
    $("#Etitle2").click(function() {
        $("#POP_5").addClass('temp').toggle();
        $("div[id^='POP']:not(#POP_5)").hide();
    })

    /*------------------------------------------------------------------*/
    /*For further searching */
    $("#FurtherSearch").hide();
    $("#FSearch").click(function() {
        $("#FurtherSearch").addClass('F_Search').toggle();
    })




    /*--------------------------------------------------------------------*/
        var currentPosition = 0;
        var slideWidth = 397;
        var slides = $('.slide');
        var numberOfSlides = slides.length;

        $('#slidesContainer').css('overflow', 'hidden');


        // Wrap all .slides with #slideInner div
        slides
  .wrapAll('<div id="slideInner"></div>')
        // Float left to display horizontally, readjust .slides width
  .css({
      'float': 'left',
      'width': slideWidth
  });

        // Set #slideInner width equal to total width of all slides
        $('#slideInner').css('width', slideWidth * numberOfSlides);

        // Hide left arrow control on first load
        manageControls(currentPosition);

        // Create event listeners for .controls clicks
        $('.control')
    .bind('click', function() {
        // Determine new position
        currentPosition = ($(this).attr('id') == 'rightControl')
    ? currentPosition + 1 : currentPosition - 1;

        // Hide / show controls
        manageControls(currentPosition);
        // Move slideInner using margin-left
        $('#slideInner').animate({
            'marginLeft': slideWidth * (-currentPosition)
        });
    });

        // manageControls: Hides and shows controls depending on currentPosition
        function manageControls(position) {
            // Hide left arrow if position is first slide
            if (position == 0) { $('#leftControl').hide() }
            else { $('#leftControl').show() }
            // Hide right arrow if position is last slide
            if (position == numberOfSlides - 1) { $('#rightControl').hide() }
            else { $('#rightControl').show() }
        }
        
        
    
})


