function imageInput() {}

document.addEventListener("turbo:load", function () {
  const chooseFileButton = document.getElementById("addphotobutton");
  const addFileImage = document.getElementById("addphoto");

  function linkImageToFileInput() {
    addFileImage.addEventListener("click", function () {
      chooseFileButton.click();
    });
  }
  
  function loadImageWhenSelected() {
    chooseFileButton.addEventListener("change", function(e) {
      input = e.target
      replaceAddFileImage(input)
    });
  }
  
  function replaceAddFileImage() {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
  
      reader.onload = function (e) {
        document.getElementById("addphoto").setAttribute("src", e.target.result);
      };
      reader.readAsDataURL(input.files[0]);
    }
  }

  if (chooseFileButton != undefined) {
    linkImageToFileInput();
    loadImageWhenSelected();
  }
});
