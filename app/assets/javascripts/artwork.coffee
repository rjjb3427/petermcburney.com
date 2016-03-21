# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

id = 0
numArt = 16

$(document).on 'mouseover','.art',(e) ->
  $(this).find('.art-text').css 'display':'block'
$(document).on 'mouseout','.art',(e) ->
  $(this).find('.art-text').css 'display':'none'

$(document).on 'click','#x',(e) ->
  $('body').css 'overflow': 'auto'
  $('#img-active').css 'display': 'none'
  $('.preview').css 'display': 'none'

$(document).on 'click','.art',(e) ->
  $('body').css 'overflow': 'hidden'
  $('#img-active').css 'display': 'block'
  $('.preview').css 'display': 'block'
  $('#img-active').attr 'src', $(this).find('img').attr('src')
  id = parseInt($(this).attr('id').slice(3))

# KEYDOWN FUNCTIONALTY
$(document).keydown (event) ->
  if $('.preview').css('display') == 'block'
    switch event.keyCode
      when 27
        $('body').css 'overflow': 'auto'
        $('#img-active').css 'display': 'none'
        $('.preview').css 'display': 'none'
      when 37
        id -= 1
        id = numArt - 1 if id == -1
        $('#img-active').attr 'src', $('#art' + id).find('img').attr('src')
      when 39
        id += 1
        id = 0 if id == numArt
        $('#img-active').attr 'src', $('#art' + id).find('img').attr('src')
  return

# ARROW FUNCTIONALITY
$(document).on 'click','#arrow-right', (e) ->
  id += 1;
  id = 0 if id == numArt
  $('#img-active').attr 'src', $('#art' + id).find('img').attr('src')

$(document).on 'click','#arrow-left', (e) ->
  id -= 1;
  id = numArt - 1 if id == -1
  $('#img-active').attr 'src', $('#art' + id).find('img').attr('src')
