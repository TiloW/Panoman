var marker = null;
var map = null;
var zoom = 15;
var panoPos = null;
var placeMarker = false;
    
$(function(){
  panoPos = new google.maps.LatLng(
    $('#panorama_latitude').attr('value'), 
    $('#panorama_longitude').attr('value')
  );
  
  placeMarker = panoPos.lat() != 0;
  if(!placeMarker) {
    var geo = new google.maps.Geocoder();
    geo.geocode({ 
        'address': $(".breadcrumb a:first-child").text(), 
        'region' : 'de' 
      }, 
      function(result, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        panoPos = result[0].geometry.location;
        zoom = 12;
      } else {
        panoPos = new google.maps.LatLng(51.082822,10.303528);
        zoom = 5;
      }
      init();
    });
  }
  else
    init();
});
  
function init() {
  var mapOptions = {
    zoom: zoom,
    center: panoPos,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    disableDoubleClickZoom: true,
    streetViewControl: false
  };
  
  map = new google.maps.Map(document.getElementById('main-map'), mapOptions);
  
  if(placeMarker)
    marker = new google.maps.Marker({
      position: panoPos,
      map: map
    });
  
  google.maps.event.addListener(map, 'dblclick', function(event) {
    if(marker != null)
      marker.setMap(null);
    marker = new google.maps.Marker({
      position: event.latLng,
      map: map
    });
    $('#panorama_latitude').attr('value', event.latLng.lat().toFixed(6));
    $('#panorama_longitude').attr('value', event.latLng.lng().toFixed(6));
  });
  
  $('#sections').bind('tabsshow', function(event, ui) {
    console.log(event);
    console.log(ui);
   if(ui.panel.id == "tab-map") {
      google.maps.event.trigger(map, 'resize');
      map.setCenter(panoPos);
   }
  });
}