import places from 'places.js';

const initAutocomplete = () => {
  console.log("hi");
  const addressInput = document.getElementById('friend_places');
  console.log(addressInput);
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
