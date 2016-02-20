var id = 0;
var numArt = 16;

$(document).on('mouseover','.art',function(e){
  $(this).find('#art-text').css({"display":"block"});
});
$(document).on('mouseout','.art',function(e){
  $(this).find('#art-text').css({"display":"none"});
});
$(document).on('click','#x',function(e){

  $('body').css({"overflow":"auto"});
  $('#img-active').css({"display": "none"});
  $('#blur').css({"display": "none"});
});

$(document).on('click','.art',function(e){
  $('body').css({"overflow":"hidden"});
  id = parseInt($(this).attr('id').slice(3));
  $("#img-active").attr('src', $(this).find("img").attr('src'));
  $('#img-active').css({"display": "block"});
  $('#blur').css({"display": "block"});
});

/* KEYDOWN FUNCTIONALTY */
$(document).keydown(function(event){
  if($('#blur').css("display") == "block"){
    switch(event.keyCode){
      case 37:
        id -= 1;
        if(id == -1){id = numArt - 1;}
        $("#img-active").attr('src', $('#art' + id).find("img").attr('src'));
        break;
      case 39:
        id += 1;
        if(id == numArt){id = 0;}
        $("#img-active").attr('src', $('#art' + id).find("img").attr('src'));
        break;
    }
  }
});

/* ARROW FUNCTIONALITY */
$(document).on('click','#arrow-right',function(e){
  id += 1;
  if(id == numArt){id = 0;}
  $("#img-active").attr('src', $('#art' + id).find("img").attr('src'));
});
$(document).on('click','#arrow-left',function(e){
  id -= 1;
  if(id == -1){id = numArt - 1;}
  $("#img-active").attr('src', $('#art' + id).find("img").attr('src'));
});
