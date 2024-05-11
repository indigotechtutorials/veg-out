import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chat-messages"
export default class extends Controller {
  static targets = ["message"]
  static values = { currentUserId: String }
  connect() {
    this.scrollToBottom()
  }

  messageTargetConnected(target) {
    this.scrollToBottom()
    console.log(target.dataset.userId)
    if (target.dataset.userId == this.currentUserIdValue) {
      console.log("Same user")
      target.classList.add("bg-indigo-500", "text-indigo-100")
    } else {
      target.classList.add("bg-gray-100")
    }
  }

  scrollToBottom() {
    this.element.scrollTop = this.element.scrollHeight
  }
}
