let map;
let markers = [];

window.initMap = function() {
  map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: 35.6804, lng: 139.7690 },
    zoom: 13
  });

  searchPlaces("ゴルフ練習場");

  document.getElementById("searchBtn").addEventListener("click", () => {
    const keyword = document.getElementById("keyword").value;
    searchPlaces(keyword);
  });

};

async function searchPlaces(keyword) {
  clearMarkers();

  const { Place } = await google.maps.importLibrary("places");

  const request = {
    textQuery: keyword,
    fields: ["displayName", "location"],
    language: "ja"
  };

  const { places } = await Place.searchByText(request);

  if (!places || places.length === 0) {
    console.log("検索結果なし");
    return;
  }

  places.forEach(place => {
    createMarker(place);
  });
} 

function createMarker(place) {
  const marker = new google.maps.Marker({
    position: place.location,
    map,
    title: place.displayName
  });

  markers.push(marker);

  const info = new google.maps.InfoWindow({
    content: `<strong>${place.displayName}</strong>`
  });

  marker.addListener("click", () => {
    info.open(map, marker);
  });
}

function clearMarkers() {
  markers.forEach(m => setMap(null));
  markers = [];
}