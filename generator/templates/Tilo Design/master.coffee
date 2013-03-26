$(window).on 'resize', () ->
  innerDist = $('#grid ul').outerWidth() - $('#grid ul').width()
  width = $('#grid').parent().innerWidth() - innerDist
  singleWidth = $('#grid li').outerWidth(true)
  count = Math.floor(width / singleWidth)
  
  dist = width - singleWidth*count
  
  dist += singleWidth if dist < 60
    
  singleDist = Math.floor(dist/2) + 'px'
  
  $('header, footer').css('width', ($('header').parent().width() - dist) + 'px')
  
  $('footer').css('background-position-y', $(window).height() - $('footer').height() + 'px')
    
  $('#grid, header, footer').css
    'margin-left': singleDist
    'margin-right': singleDist

$ () ->
  $(window).trigger 'resize'

  $('#grid li').on 'click', (event) ->
    $('.overlay').fadeIn(1200)
    item = $(event.currentTarget)
    new SimplePanorama
      elem: $('.panoContainer')
      imagePath: item.attr 'data-imagePath'
      repeative: item.attr('data-repeative') isnt 'false'
      modules: ['move_mousedown']
      callback: () ->
        # TODO: Init Hotspots

  $('.overlay, .panoWrapper').on 'click', (event) ->
    if event.target is $('.overlay')[0] or event.target is $('.panoWrapper')[0]
      $('.overlay').stop()
      $('.overlay').hide()
      $('.panoContainer').empty()
      