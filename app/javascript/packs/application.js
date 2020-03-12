import "bootstrap";
import { initAutocomplete } from '../plugins/init_autocomplete';
import { initAutocompleteTwo } from '../plugins/init_autocomplete';
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { findUserLocation } from '../plugins/init_current_location';
import { initMapbox } from '../plugins/init_mapbox';
import { initTimer } from '../plugins/init_timer';

findUserLocation();
//autocomplete search bar
initAutocomplete();
initAutocompleteTwo();

// map import:

initMapbox();

initTimer();

// sweet alert import:
import { initSweetalert } from '../plugins/init_sweetalert';

initSweetalert('#sweet-alert-demo', {
  title: "Confirmed",
  // closeOnClickOutside: false,
  button: false,
  timer: 3000,
  text: "You are going! Don't be late 🕙",
  icon: "success"
}, (value) => {
  console.log('yaya!!', value)
  const link = document.querySelector('#confirm');
  link.click();
});

initSweetalert('#sweet-alert-cancel', {
  text: "Are you sure you want to do this?",
  icon: "warning",
  dangerMode: true,
  buttons: true,
}, (value) => {
  if (value) {
    const link = document.querySelector('#delete');
    link.click();
  }
});

