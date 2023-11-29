import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="toggle"
export default class extends Controller {

  static targets = ["card","button"]

  toggleCards(event) {
    event.currentTarget.classList.toggle("card_exercice");
    event.currentTarget.classList.toggle("card_exercice_select");
  }

  toggleButton(e) {
    console.log(this.buttonTarget)
    this.buttonTarget.classList.toggle("d-none")
    e.currentTarget.classList.toggle("d-none")
  }

}
