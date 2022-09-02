import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets=['Salon', 'Chambre', 'Salle de bains ou toilettes', 'Cuisine'];

  connect() {
  }

  display(event) {
    console.log(event)
  }
}
