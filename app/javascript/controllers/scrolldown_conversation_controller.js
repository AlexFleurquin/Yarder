import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="activate-first-chatroom"
export default class extends Controller {
  static targets = ["conversation"]
  connect() {
    console.log("Hello!!!")
    console.log(this.conversationTarget)
  }

  scrolldown(event) {
    console.log(event)
    this.conversationTarget.scrollTo(0, this.conversationTarget.scrollHeight)
  }
}
