// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$.getRestUrlParam = function(name){
    var results = new RegExp('[\\?&]' + name + '=([^&#]*)').exec(window.location.href);
    return results !== null ? results[1] || 0 : null;
}

$(function() {
  $('.button').button();
  $('[type="submit"]').button();
  $('.accordion').accordion();
  $('#sections').tabs();
  $('#sticky').tabs();
  
  $('a.delete').on('ajax:success', function() {
    $(this).closest('tr').fadeOut();
  });
  
  $('.chkbtn.checked').button({
    icons: { primary: "ui-icon-check" },
    text: false
  });
  $('.chkbtn.unchecked').button({
    icons: { primary: "ui-icon-close" },
    text: false
  });
  
  $('.delete.button').button({
    icons: { primary: "ui-icon-trash" },
    text: false
  });
  
  $('.details.button').button({
    icons: { primary: "ui-icon-document" },
    text: false
  });
  
  $('.delete.button').button({
    icons: { primary: "ui-icon-trash" },
    text: false
  });
  
  $('.chkbtn').on('ajax:success', function() {
    $(this).children().toggleClass('ui-icon-check').toggleClass('ui-icon-close');
  });
  
  // FIXXME ?
  $('.chkbtn').dblclick(function() {
    alert("Bitte kein Doppelklick auf Checkboxes verwenden!\nDie Seite wird nun zur Vermeidung von Fehlern neu geladen.");
    window.location.reload();
  });
  
  var sid = $.getRestUrlParam("show_id");
  if(sid !== null) {
    var row = $(".row-id-" + sid);
    $(window).scrollTop(row.offset().top - 75);
    row.addClass("item-edited");
  }
  
  $('#sections').bind('tabsshow', function(event, ui) {
    $(window).trigger('resize');
  });
});