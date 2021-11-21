$(".changebutton").click(function(){
    if($(".form").hasClass("formunactive")){
        $(this).removeClass("formunactive");
        $(this).addClass("formactive");
        $(this).siblings().addClass("")
    }
})