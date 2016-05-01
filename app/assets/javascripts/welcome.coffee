$(document).ready () ->
  curr = ''
  right = ''
  left = ''

  console.log $('.image').first().attr('id')
  console.log $('.image').last().attr('id')

  # Set previewer inner html based on item selected
  setPreviewInnerHtml = () ->
    $("#previewer .title").html(curr.find('.title').html())
    $("#previewer .media").html(curr.find('.media').html() + ',')
    $("#previewer .size").html(curr.find('.size').html())
    $("#previewer .price").html(curr.find('.price').html())

  # Update values and update src images
  updateValues = (value, edge) ->
    if value.attr('id') == undefined && edge == 'first'
      curr = $('.image').first()
    else if value.attr('id') == undefined && edge == 'last'
      curr = $('.image').last()
    else
      curr = value
    console.log curr.attr('id')
    right = curr.parent().next().find(".image")
    left = curr.parent().prev().find(".image")
    $('#previewer figure img').attr 'src', curr.css("background").match('"(.*)"')[1]

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
