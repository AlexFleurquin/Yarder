import { Controller } from "@hotwired/stimulus"
import { end } from "@popperjs/core"
import Sortable from "sortablejs"



// Connects to data-controller="drag-and-drop"
export default class extends Controller {
  static targets = ['todo', 'inProgress', 'done']

  connect() {
    console.log(this.element)
    this.sortable = new Sortable(this.todoTarget, {
      group: 'shared',
      animation: 150,
      ghostClass: 'blue-background-class',
      onEnd: this.end.bind(this)
    });

    this.sortable = new Sortable(this.inProgressTarget, {
      group: 'shared',
      animation: 150,
      ghostClass: 'blue-background-class',
      onEnd: this.end.bind(this)
    });

    this.sortable = new Sortable(this.doneTarget, {
      group: 'shared',
      animation: 150,
      ghostClass: 'blue-background-class',
      onEnd: this.end.bind(this)
    });
  }

  end(event) {
    let url = event.item.dataset.move
    let csrf = document.querySelector('[name="csrf-token"]').content
    let data = new FormData()
    console.log(csrf)
    data.append("position", event.newIndex + 1)
    console.log(event)

    this.#fetchWithToken(url, {
      method: "PATCH",
      header: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: data
    })
  }

  #fetchWithToken(url, options) {
    let csrf = document.querySelector('[name="csrf-token"]').content
    options.headers = {
      "X-CSRF-Token": csrf,
      ...options.headers
    };

    return fetch(url, options).then((result) => {
        console.log(result)
      });
  }
}
