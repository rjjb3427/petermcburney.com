
$(document).on('mouseout','.art',function(e){
  console.log("test");
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
    $('#img-active').css({
      "display": "block"
    });
    $('#blur').css({
      "display": "block"
    });
  }
});
