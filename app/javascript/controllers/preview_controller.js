import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="preview"
export default class extends Controller {
  static targets = ["output", "output1", "output2", "output3"]
  static values = { room: String }

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

  previewMultiple(e) {
    e.preventDefault()

    if(e.target.files[0]) {
      var reader1 = new FileReader();
      var room = this.roomValue

      reader1.onload = function() {
        document.querySelector(`#output1${room}`).src = reader1.result
      };

      reader1.readAsDataURL(e.target.files[0]);
      this.output1Target.classList.remove("d-none")
    }

    if(e.target.files[1]) {
      var reader2 = new FileReader();

      reader2.onload = function() {
        document.querySelector(`#output2${room}`).src = reader2.result
      };

      reader2.readAsDataURL(e.target.files[1]);
      this.output2Target.classList.remove("d-none")
    }

    if(e.target.files[2]) {
      var reader3 = new FileReader();

      reader3.onload = function() {
        document.querySelector(`#output3${room}`).src = reader3.result
      };

      reader3.readAsDataURL(e.target.files[2]);
      this.output3Target.classList.remove("d-none")
    }
  }
}
