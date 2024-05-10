import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="range"
export default class extends Controller {
  static targets = ["preview"]
  static values = { max: String }

  updatePreview(e) {
    if (this.hasMaxValue && e.target.value == 100) {
      this.previewTarget.innerHTML = this.maxValue
    } else {
      this.previewTarget.innerHTML = e.target.value
    }
  }
}
