import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="preview"
export default class extends Controller {
  static targets = ["output"]

  connect() {
    console.log("hello")
  }

  preview(e) {
    e.preventDefault()

    var reader = new FileReader();

    reader.onload = function() {
      document.querySelector("#output").src = reader.result
    };

    reader.readAsDataURL(e.target.files[0]);
    this.outputTarget.classList.remove("d-none")
  }

}
