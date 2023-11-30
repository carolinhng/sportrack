import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-exercises"
export default class extends Controller {
  static values = {
    id: Number,
  }

  connect() {
  }

  add(e) {
    console.log(e.currentTarget)
  }
}
