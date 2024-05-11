import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chat-messages"
export default class extends Controller {
  static targets = "message"
  connect() {
    this.scrollToBottom()
  }

  messageTargetConnected() {
    this.scrollToBottom()
  }

  scrollToBottom() {
    this.element.scrollTop = this.element.scrollHeight
  }
}
