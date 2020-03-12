import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('friend_places');
  let placesInstance;
  if (addressInput) {
    placesInstance = places({
      container: addressInput,
      userDeviceLocation: true
    });
  placesInstance.configure({aroundLatLngViaIP: true})
  }
};

export { initAutocomplete };

const initAutocompleteTwo = () => {
  const addressInput = document.getElementById('activity_address');
  let placesInstance;
  if (addressInput) {
    placesInstance = places({
      container: addressInput,
      userDeviceLocation: true
    });
  placesInstance.configure({aroundLatLngViaIP: true})
  }
};

export { initAutocompleteTwo };
