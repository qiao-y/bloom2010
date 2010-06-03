$(document).ready(function () {
    $("#WEEK_1").addClass('temp').show();
    $("div[id^='WEEK']:not(#WEEK_1)").hide();
    
    $("#Atitle").click(function () {
        $("#WEEK_1").addClass('temp').toggle();
        $("div[id^='WEEK']:not(#WEEK_1)").hide();
    })
    $("#Btitle").click(function () {
        $("#WEEK_2").addClass('temp').toggle();
        $("div[id^='WEEK']:not(#WEEK_2)").hide();    
    })
    $("#Ctitle").click(function () {
        $("#WEEK_3").addClass('temp').toggle();
        $("div[id^='WEEK']:not(#WEEK_3)").hide();    
    })
    $("#Dtitle").click(function () {
        $("#WEEK_4").addClass('temp').toggle();
        $("div[id^='WEEK']:not(#WEEK_4)").hide();    
    })
    $("#Etitle").click(function () {
        $("#WEEK_5").addClass('temp').toggle();
        $("div[id^='WEEK']:not(#WEEK_5)").hide();    
    })
    
})