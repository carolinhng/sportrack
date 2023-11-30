import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="toggle"
export default class extends Controller {

  static targets = ["card","button"]

  toggleCards(event) {
    event.currentTarget.classList.toggle("card_exercice");
    event.currentTarget.classList.toggle("card_exercice_select");
  }
}
