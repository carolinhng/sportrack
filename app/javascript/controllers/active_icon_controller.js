import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="active-icon"
export default class extends Controller {
  static targets = ["home", "train", "data"];

  connect() {
  }

  active() {
    this.iconTarget.classList.add("active-icon");
  }
}
