$(document).ready () ->
  id = 0
  numArt = $('.image').length

  # Set previewer inner html based on item selected
  setPreviewInnerHtml = () ->
    $("#previewer .title").html($('#img' + id).find('.title').html())
    $("#previewer .media").html($('#img' + id).find('.media').html() + ',')
    $("#previewer .size").html($('#img' + id).find('.size').html())
    $("#previewer .price").html($('#img' + id).find('.price').html())

  # Update the previewer when an input in changed
  $('#edit input, #new input').bind 'input', ->
    switch $(this).attr('id')
      when 'artwork_title'  then  $('#edit .title, #new .title').html($(this).val())
      when 'artwork_media'  then  $('#edit .media, #new .media').html($(this).val())
      when 'artwork_size'   then  $('#edit .size, #new .size').html($(this).val())
      when 'artwork_price'  then  $('#edit .price, #new .price').html($(this).val())

  # ARROW FUNCTIONALITY
  $(document).on 'click','#arrow-right', (e) ->
    id += 1;
    id = 0 if id == numArt
    $('#previewer figure img').attr 'src', $('#img' + id).css("background").match('"(.*)"')[1]
    setPreviewInnerHtml()

  $(document).on 'click','#arrow-left', (e) ->
    id -= 1;
    id = numArt - 1 if id == -1
    $('#previewer figure img').attr 'src', $('#img' + id).css("background").match('"(.*)"')[1]
    setPreviewInnerHtml()

  $(document).on 'click','#x', (e) ->
    $('body').css 'overflow': 'auto'
    $('#previewer figure img').css 'display': 'none'
    $('summary').css 'display': 'none'

  $(document).on 'click','.image', (e) ->
    if !(window.location.href.slice(-5) == 'admin')
      $('body').css 'overflow': 'hidden'
      $('#previewer figure img').css 'display': 'block'
      $('summary').css 'display': 'block'
      id = parseInt($(this).attr('id').slice(3))
      $('#previewer figure img').attr 'src', $('#img' + id).css("background").match('"(.*)"')[1]
      setPreviewInnerHtml()

  # KEYDOWN FUNCTIONALTY
  $(document).keydown (event) ->
    if $('summary').css('display') == 'block'
      switch event.keyCode
        when 27
          $('body').css 'overflow': 'auto'
          $('#previewer figure img').css 'display': 'none'
          $('summary').css 'display': 'none'
        when 37
          id -= 1
          id = numArt - 1 if id == -1
          $('#previewer figure img').attr 'src', $('#img' + id).css("background").match('"(.*)"')[1]
          setPreviewInnerHtml()
        when 39
          id += 1
          id = 0 if id == numArt
          $('#previewer figure img').attr 'src', $('#img' + id).css("background").match('"(.*)"')[1]
          setPreviewInnerHtml()
    return
