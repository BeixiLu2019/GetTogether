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
  console.log(marker);
  const element = document.createElement('div');
  element.className = 'marker';
  element.style.backgroundImage = `url('${marker.image_url}')`;
  element.style.backgroundSize = 'contain';
  element.style.width = '50px';
  element.style.height = '50px';
    new mapboxgl.Marker(element)
      .setLngLat([marker.lng, marker.lat])
      .addTo(map);
};

const fitMapToMarkers = (map, marker) => {
  const bounds = new mapboxgl.LngLatBounds([marker.lng, marker.lat], [marker.lng, marker.lat]);
  map.fitBounds(bounds, { padding: 70, maxZoom: 14});
};

const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    const marker = JSON.parse(mapElement.dataset.marker);
    console.log(marker);
    addMarkersToMap(map, marker);
    fitMapToMarkers(map, marker);
  }
};

export { initMapbox };
