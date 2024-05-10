import { Controller } from "@hotwired/stimulus"
import { post } from "@rails/request.js"

// Connects to data-controller="geolocation"
export default class extends Controller {
  static values = { url: String, latitude: Number, longitude: Number }
  connect() {
    navigator.geolocation.getCurrentPosition((position) => {
      let latSame = position.coords.latitude.toFixed(6) == this.latitudeValue
      let longSame = position.coords.longitude.toFixed(6) == this.longitudeValue
      if (!latSame || !longSame) {
        // Update location if there in a new place
        this.postCoordinates(position.coords.latitude, position.coords.longitude);
      }
    });
  }

  async postCoordinates(latitude, longitude) {
    await post(this.urlValue, {
      body: {
        latitude: latitude,
        longitude: longitude,
      }
    })
  }
}
