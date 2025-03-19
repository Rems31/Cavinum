import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["radioButtons"]

  open(event) {
    event.preventDefault()
    this.radioButtonsTarget.classList.toggle("d-none")
  }

  close() {
    this.WineCellarSlotTarget.classList.add("hidden")
  }
}
