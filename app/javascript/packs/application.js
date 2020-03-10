import "bootstrap";
import { initAutocomplete } from '../plugins/init_autocomplete';
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';
import { initTimer } from '../plugins/init_timer';
import { findUserLocation } from '../plugins/init_current_location';

//autocomplete search bar
initAutocomplete();

// map import:
initMapbox();


findUserLocation();
initTimer();



