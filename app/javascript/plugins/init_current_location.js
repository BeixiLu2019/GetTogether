const findUserLocation = () => {
 const input = document.querySelector('#search_current_location');
 if (input) {
  document.addEventListener('DOMContentLoaded', (event) => {
   const coords = navigator.geolocation.getCurrentPosition(function(pos) {
     const lct = pos.coords;
     input.value = `${lct.latitude}, ${lct.longitude}`;
   });
  });
 }
}

export { findUserLocation };

