let map;

window.initMap = function() {
  map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: 35.6804, lng: 139.7690 },
    zoom: 13
  });

  searchGolfFacilities(map.getCenter());

};

function searchGolfFacilities(location) {
  const service = new google.maps.places.PlacesService(map);

  service.nearbySearch(
    {
      location: location,
      radius: 5000,
      type: ["golf_course"],
      keyword: "ゴルフ練習場",
    },
    (results, status) => {
      if (status === google.maps.places.PlaceServiceStatus.OK) {
        results.forEach((place) => createMarker(place));
      }
    }
  );
}

function createMarker(place) {
  const marker = new google.maps.Marker({
    map,
    position: place.geometry.location,
    title: place.name
  });

  const infoWindow = new google.maps.InfoWindow({
    content: `<strong>${place.name}</strong><br>${place.vicinity || ""}`
  });

  marker.addListener("click", () => {
    infoWindow.open(map, marker);
  });
}