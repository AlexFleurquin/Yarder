import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";


// Connects to data-controller="flatpickr"
export default class extends Controller {

  static targets = [ 'startDateInput', 'endDateInput' ]

  connect() {
    console.log("coucou");
    flatpickr(this.startDateInputTarget, {
      altInput: true,
      mode: 'range',
      "plugins": [new rangePlugin({ input: this.endDateInputTarget})]
    });
  }
}
