document.addEventListener('turbo:load', function() {
  autocompleteInput = document.getElementById('user_input_autocomplete_address')
  if (autocompleteInput != undefined){
    new google.maps.places.Autocomplete(document.getElementById('user_input_autocomplete_address'), { types: ['geocode'] })
  }
});
