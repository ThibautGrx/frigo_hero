function hideAlertMessage() {
  const alertMessage = document.querySelector(".alert")
  if (alertMessage != undefined){
    setTimeout(function () {
      fadeOut(alertMessage);
    }, 2000);
  }
}

document.addEventListener("turbo:load", hideAlertMessage);
