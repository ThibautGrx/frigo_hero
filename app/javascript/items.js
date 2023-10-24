document.addEventListener("turbo:load", initItemsView);

function initItemsView() {
  const mapViewButton = document.getElementById("buttonmap");
  const mapView = document.getElementById("map");
  const listViewButton = document.getElementById("buttontable");
  const listView = document.getElementById("table");
  const items = document.querySelectorAll(".button-list");

  function onButtonMapClick() {
    buildMap();
    fadeOut(listView);
    fadeIn(mapView);
  }

  function onButtonListClick() {
    fadeOut(mapView);
    fadeIn(listView);
  }

  function buildMap() {
    handler = Gmaps.build("Google");
    handler.buildMap(
      {
        provider: {
          disableDefaultUI: true,
          zoomControl: true,
        },
        internal: {
          id: "map",
        },
      },
      function () {
        markers = handler.addMarkers(value);
        handler.bounds.extendWith(markers);
        handler.fitMapToBounds();
      }
    );
  }

  function goToItem() {
    Turbo.visit(this.dataset.itemUrl);
  }

  listViewButton.addEventListener("click", onButtonListClick);
  mapViewButton.addEventListener("click", onButtonMapClick);

  items.forEach((item) => {
    item.addEventListener("click", goToItem);
  });
}
