function initializeAutocomplete(id) {
    new google.maps.places.Autocomplete(document.getElementById(id), { types: ['geocode'] });
}

document.addEventListener('turbolinks:load', function() {
  document.getElementById('user_input_autocomplete_address').addEventListener('click', function(){
    initializeAutocomplete('user_input_autocomplete_address')
  });
});
