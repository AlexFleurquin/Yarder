import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets=["hidden"];

  connect() {
  }

  display(event) {
    let room = event.target.defaultValue
    this.hiddenTargets.forEach(i => {
      if (i.id === room) {
        i.classList.toggle("d-none")
      }
    })
  }
}
