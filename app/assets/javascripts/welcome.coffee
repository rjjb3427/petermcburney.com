$(document).ready ->
  interval = 1

  animate = () ->
    if interval == 5
      $('#instafeed').animate {scrollLeft:'0px'}, 1000
      interval = 1
    else
      $('#instafeed').animate {scrollLeft:1280*interval+'px'}, 750
      interval += 1

  setInterval(animate, 10000)

$(document).ready () ->
  curr = ''
  right = ''
  left = ''

  # Set previewer inner html based on item selected
  setPreviewInnerHtml = () ->
    $("#previewer span").each ->
      $(this).html('')
    $("#previewer .title").html(curr.find('.title').html())
    $("#previewer .media").html(curr.find('.media').html())
    if curr.find('.size').html()
      $("#previewer .size").html(',' + curr.find('.size').html())
    $("#previewer .price").html(curr.find('.price').html())

  # Update values and update src images
  updateValues = (value, edge) ->
    if value.attr('id') == undefined && edge == 'first'
      curr = $('.image').first()
    else if value.attr('id') == undefined && edge == 'last'
      curr = $('.image').last()
    else
      curr = value
    right = curr.parent().next().find(".image")
    left = curr.parent().prev().find(".image")

    $('#previewer figure #image').attr 'src', curr.prop('style')['background'].match(/\(([^)]+)\)/)[1].replace(/\"/g, "")

  # Update the previewer when an input in changed
  $('#edit input, #new input').bind 'input', ->
    switch $(this).attr('id')
      when 'artwork_title'  then  $('#edit .title, #new .title').html($(this).val())
      when 'artwork_media'  then  $('#edit .media, #new .media').html($(this).val())
      when 'artwork_size'   then  $('#edit .size, #new .size').html($(this).val())
      when 'artwork_price'  then  $('#edit .price, #new .price').html($(this).val())

  # ARROW FUNCTIONALITY
  $(document).on 'click','#arrow-right', (e) ->
    updateValues(right, 'first')
    setPreviewInnerHtml()

  $(document).on 'click','#arrow-left', (e) ->
    updateValues(left, 'last')
    setPreviewInnerHtml()

  $(document).on 'click','#x', (e) ->
    $('body').css 'overflow': 'auto'
    $('summary').css 'display': 'none'

  $(document).on 'click','.image', (e) ->
    if !(window.location.href.slice(-5) == 'admin') && (!window.matchMedia("(max-width: 593px)").matches)
      $('body').css 'overflow': 'hidden'
      $('summary').css 'display': 'block'
      updateValues($(this),'')
      setPreviewInnerHtml()

  # KEYDOWN FUNCTIONALTY
  $(document).keydown (event) ->
    if $('summary').css('display') == 'block'
      switch event.keyCode
        when 27
          $('body').css 'overflow': 'auto'
          $('summary').css 'display': 'none'
        when 37
          updateValues(left, 'last')
          setPreviewInnerHtml()
        when 39
          updateValues(right, 'first')
          setPreviewInnerHtml()
    return
