$(function() {
  $('.button.top').button({
    icons: { primary: "ui-icon-arrowthickstop-1-n" },
    text: false
  });
  $('.button.up').button({
    icons: { primary: "ui-icon-arrowthick-1-n" },
    text: false
  });
  $('.button.down').button({
    icons: { primary: "ui-icon-arrowthick-1-s" },
    text: false
  });
  $('.button.bottom').button({
    icons: { primary: "ui-icon-arrowthickstop-1-s" },
    text: false
  });
  
  $('a.button.top').on('ajax:success', function() {
    var row = $(this).closest('tr');
    if(row.prev('tr').size() > 0)
      row.fadeOut(function() { row.insertBefore('#tab-priority tr:first').fadeIn(); });
  });
  
  $('a.button.up').on('ajax:success', function() {
    var row = $(this).closest('tr');
    if(row.prev('tr').size() > 0)
      row.fadeOut(function() { row.insertBefore(row.prev('tr')).fadeIn(); });
  });
  
  $('a.button.down').on('ajax:success', function() {
    var row = $(this).closest('tr');
    if(row.next('tr').size() > 0)
      row.fadeOut(function() { row.insertAfter(row.next('tr')).fadeIn(); });
  });
  
  $('a.button.bottom').on('ajax:success', function() {
    var row = $(this).closest('tr');
    if(row.next('tr').size() > 0)
      row.fadeOut(function() { row.insertAfter('#tab-priority tr:last').fadeIn(); });
  });
  
  $('input.delete').parent().parent().on('ajax:success', function() {
    var rowId = $(this).closest('tr').attr('class');
    $('.' + rowId).fadeOut();
  });
});