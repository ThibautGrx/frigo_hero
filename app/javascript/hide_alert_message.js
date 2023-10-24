function hideAlertMessage() {
  const alertMessage = document.querySelector(".alert")
  if (alertMessage != undefined){
    setTimeout(function () {
      document.querySelector(".alert").slideUp(500);
    }, 2000);
  }
}

document.addEventListener("turbo:load", hideAlertMessage);
