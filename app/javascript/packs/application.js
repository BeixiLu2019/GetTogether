import "bootstrap";

//autocomplete search bar
import { initAutocomplete } from '../plugins/init_autocomplete';
initAutocomplete();

// map import:
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../javascript/plugins/init_mapbox';
initMapbox();

