var selectedCity = -1;

$(function() {
  populatePanoList(-1);
    
  $("#cityList").click(function() {
    var elem = $("#cityList option:selected");
    if(elem.attr("value") != selectedCity) {
      selectedCity = elem.attr("value");
      populatePanoList(selectedCity);
    }
  });
});

function populatePanoList(cityId) {
  var enabled = cityId != -1;
  var elem = $("#panoList select");
  elem.empty();
  elem.html('<option value="-1">NICHT BESCHRÄNKEN</option>');
  
  if(enabled) {
    elem.removeAttr("disabled");
    $.each(listedPanos[cityId], function(index, panoData) {
      elem.append('<option value="' + panoData[0] + '">' + panoData[1] + '</option>')
    });
  } else
    elem.attr("disabled", "disabled");
}
