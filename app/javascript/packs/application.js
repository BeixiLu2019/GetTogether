import "bootstrap";

//autocomplete search bar
import { initAutocomplete } from '../plugins/init_autocomplete';
initAutocomplete();

// map import:
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../javascript/plugins/init_mapbox';
initMapbox();

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
  text: "Are you sure you want to cancel this booking?",
  icon: "warning",
  dangerMode: true,
  buttons: true,
}, (value) => {
  if (value) {
    const link = document.querySelector('#delete');
    link.click();
  }
});







