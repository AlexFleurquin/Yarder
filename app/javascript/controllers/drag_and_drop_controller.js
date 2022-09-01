import { Controller } from "@hotwired/stimulus"
import { end } from "@popperjs/core"
import Sortable from "sortablejs"

// Connects to data-controller="drag-and-drop"
export default class extends Controller {
  connect() {
    this.sortable = Sortable.create(this.element, {
      onEnd: this.end.bind(this)
    })
  }

  end(event) {
    console.log(event)
  }
}
