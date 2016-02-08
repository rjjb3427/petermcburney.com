$(document).on('mouseover','.art',function(e){
  var x = $(this).attr('id').slice(-1);
  $('#art-text'+x).fadeIn().css({"display":"block"});
});
$(document).on('mouseout','.art',function(e){
  var x = $(this).attr('id').slice(-1);
  $('#art-text'+x).css({"display":"none"});
});
$(document).on('click','.art',function(){
  $(this).css({"border":"2px solid red"});
});
