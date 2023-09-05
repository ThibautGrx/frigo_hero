document.addEventListener("turbo:load",function(){
  document.getElementById("buttonmap").addEventListener('click', function () {
    handler = Gmaps.build('Google');
    handler.buildMap({
        provider: {
          disableDefaultUI: true,
          zoomControl: true
        },
        internal: {
          id: 'map'
        }
      },
      function(){
        markers = handler.addMarkers(value);
        handler.bounds.extendWith(markers);
        handler.fitMapToBounds();
      }
    );
    document.getElementById("table").fadeOut("slow");
    document.getElementById("map").fadeIn("slow");
  });

  document.getElementById("buttontable").addEventListener('click', function () {
  document.getElementById("map").fadeOut("slow");
  document.getElementById("table").fadeIn("slow");
  });

  document.querySelector('.button_list').addEventListener('click',  function() {
      window.location = $(this).find('a').attr('href');
  })
  document.querySelector('.button_list').addEventListener("mouseover", function() {
      $(this).toggleClass('hover');
  });
});
