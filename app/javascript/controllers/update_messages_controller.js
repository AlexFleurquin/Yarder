import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="update-messages"
export default class extends Controller {
  static targets = ["list", "form", "content"]
  static values = { chatroomId: Number }

  connect() {
    this.csrf = document.querySelector("[name='csrf-token']").content
  }

  async send(event) {
    event.preventDefault();

    const form = new FormData
    form.append('message[content]', this.contentTarget.value)

    const options = {
      method: "POST",
      headers: { "Accept": "application/json", "X-CSRF-TOKEN":  this.csrf},
      body: form
    }

    const response = await fetch(`/chatrooms/${this.chatroomIdValue}/messages`, options)
    const data = await response.json()

    this.listTarget.insertAdjacentHTML('beforeend', data.html)
  }
}
