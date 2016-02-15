
$(document).on('mouseover','.art',function(e){
  $(this).find('#art-text').css({"display":"block"});
});
$(document).on('mouseout','.art',function(e){
  $(this).find('#art-text').css({"display":"none"});
});
$(document).on('click','#blur',function(e){
  $('#img-active').css({
    "display": "none"
  });
  $('#blur').css({
    "display": "none"
  });
});

$(document).on('click','.art',function(e){
  if($('#img-active').css("display") == "block"){
    $('#img-active').css({
      "display": "none"
    });
    $('#blur').css({
      "display": "none"
    });
  }else{
    $("#img-active").attr('src', $(this).find("img").attr('src'));
    $('#img-active').css({
      "display": "block"
    });
    $('#blur').css({
      "display": "block"
    });
  }
});
