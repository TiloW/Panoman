$(window).on('resize', function() {
  innerDist = $('#grid ul').outerWidth() - $('#grid ul').width();
  width = $('#grid').parent().innerWidth() - innerDist;
  singleWidth = $('#grid li').outerWidth(true);
  count = Math.floor(width / singleWidth);
  
  dist = width - singleWidth*count;
  
  if(dist < 60)
    dist += singleWidth;
    
  singleDist = Math.floor(dist/2) + 'px';
  
  $('header, footer').css('width', ($('header').parent().width() - dist) + 'px');
    
  $('#grid, header, footer').css({
    'margin-left': singleDist,
    'margin-right': singleDist
  });
});

$(function() {
  $(window).trigger('resize');

  $('#grid li').on('click', function(event) {
    $('.overlay').fadeIn(function() {
      new SimplePanorama({
        elem: $('.panoContainer'),
        imagePath: $(event.currentTarget).find('img').attr('src').replace('_3.jpg', '_5.jpg'),
        modules: ['move_mousedown']
      });
    });
  });

  $('.overlay').on('click', function(event) {
    if(event.target === $('.overlay')[0]) {
      $('.overlay').stop();
      $('.overlay').hide();
      $('.panoContainer').empty();
    }
  });
});