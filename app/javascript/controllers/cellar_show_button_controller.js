import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["cellarShow"]

  open(event) {
    event.preventDefault()
    this.cellarShowTarget.classList.toggle("d-none")
  }

  // close() {
  //   this.WineCellarSlotTarget.classList.add("hidden")
  // }
}
