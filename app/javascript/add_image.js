function readURL(input) {

  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function(e) {
      document.getElementById('addphoto').attr('src', e.target.result);
    }

    reader.readAsDataURL(input.files[0]);
  }
}

document.addEventListener("turbo:load",function(){
  const addPhotoButton = document.getElementById('addphotobutton')
  if (addPhotoButton != undefined) {
    document.getElementById('addphoto').addEventListener('click',  function() {
      document.getElementById('addphotobutton').click()
    })
    document.getElementById("addphotobutton").change(function() { readURL(this); });
  }
});
