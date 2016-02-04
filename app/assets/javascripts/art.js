$(document).on('mouseover','.art',function(){
  $(this).css({"border":"2px solid blue"});
});
$(document).on('mouseout','.art',function(){
  $(this).css({"border":"1px solid black"});
});
$(document).on('click','.art',function(){
  $(this).css({"border":"2px solid red"});
});
