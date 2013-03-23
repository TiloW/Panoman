var updateSize = function() {
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
};

$(function() {
  $(window).on('resize', updateSize);
  updateSize();
});
