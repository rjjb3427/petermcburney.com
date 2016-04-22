# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# src = ['assets/artwork/copic/numa.jpg','assets/artwork/copic/turtle.jpg','assets/artwork/sketches/snake.jpg',
#     'assets/artwork/copic/harley.jpg','assets/artwork/copic/owl.jpg','assets/artwork/sketches/turtles.jpg']
#
# test = getRandomInt(0, 5)
# # console.log test
#
# getRandomInt = (min, max) ->
#   Math.floor(Math.random() * (max - min + 1)) + min
#
# setInterval ->
#   console.log src[4]
# ,5000

$(document).ready () ->
  id = 0
  numArt = $('.image').length

  setPreviewInnerHtml = () ->
    $("#previewer .title").html($('#img' + id).find('.title').html())
    $("#previewer .media").html($('#img' + id).find('.media').html() + ',')
    $("#previewer .size").html($('#img' + id).find('.size').html())
    $("#previewer .price").html($('#img' + id).find('.price').html())

  # ARROW FUNCTIONALITY
  $(document).on 'click','#arrow-right', (e) ->
    id += 1;
    id = 0 if id == numArt
    $('#img-active').attr 'src', $('#img' + id).css("background").match('"(.*)"')[1]
    setPreviewInnerHtml()

  $(document).on 'click','#arrow-left', (e) ->
    id -= 1;
    id = numArt - 1 if id == -1
    $('#img-active').attr 'src', $('#img' + id).css("background").match('"(.*)"')[1]
    setPreviewInnerHtml()

  $(document).on 'click','#x', (e) ->
    $('body').css 'overflow': 'auto'
    $('#img-active').css 'display': 'none'
    $('summary').css 'display': 'none'

  $(document).on 'click','.image', (e) ->
    $('body').css 'overflow': 'hidden'
    $('#img-active').css 'display': 'block'
    $('summary').css 'display': 'block'
    id = parseInt($(this).attr('id').slice(3))
    $('#img-active').attr 'src', $('#img' + id).css("background").match('"(.*)"')[1]
    setPreviewInnerHtml()

  # KEYDOWN FUNCTIONALTY
  $(document).keydown (event) ->
    if $('summary').css('display') == 'block'
      switch event.keyCode
        when 27
          $('body').css 'overflow': 'auto'
          $('#img-active').css 'display': 'none'
          $('summary').css 'display': 'none'
        when 37
          id -= 1
          id = numArt - 1 if id == -1
          $('#img-active').attr 'src', $('#img' + id).css("background").match('"(.*)"')[1]
          setPreviewInnerHtml()
        when 39
          id += 1
          id = 0 if id == numArt
          $('#img-active').attr 'src', $('#img' + id).css("background").match('"(.*)"')[1]
          setPreviewInnerHtml()
    return
