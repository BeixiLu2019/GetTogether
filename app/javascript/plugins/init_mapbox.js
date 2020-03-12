import mapboxgl from 'mapbox-gl';

const mapElement = document.getElementById('map');

const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/amylu/ck7nk3zs0075n1iphxvwp1b51'
  });
};

const addMarkersToMap = (map, marker) => {
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
};

const fitMapToMarkers = (map, marker) => {
  const bounds = new mapboxgl.LngLatBounds([marker.lng, marker.lat], [marker.lng, marker.lat]);
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    const marker = JSON.parse(mapElement.dataset.marker);
    addMarkersToMap(map, marker);
    fitMapToMarkers(map, marker);
  }
};

export { initMapbox };
