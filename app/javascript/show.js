
document.addEventListener("turbo:load",function(){
  const mapShow = document.getElementById('mapshow')
  if (mapShow != undefined) {
    handler = Gmaps.build('Google');
    handler.buildMap({ provider: {disableDefaultUI: true}, internal: {id: 'mapshow'}}, function(){
      markers = handler.addMarkers(value);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
      handler.getMap().setZoom(17)
    });
  }
});
