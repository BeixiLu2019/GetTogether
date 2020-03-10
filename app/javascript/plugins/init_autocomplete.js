import places from 'places.js';

const initAutocomplete = () => {
  console.log("hi");
  const addressInput = document.getElementById('friend_places');
  console.log(addressInput);
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
