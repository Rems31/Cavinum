import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["bottle"];

  filter(event) {
    const filterType = event.currentTarget.dataset.filter;

    this.bottleTargets.forEach((bottle) => {
      if (filterType === "all" || bottle.dataset.kind === filterType) {
        bottle.classList.remove("d-none");
        bottle.classList.add("mb-2");
      } else {
        bottle.classList.add("d-none");
        bottle.classList.remove("mb-2");
      }
    });
  }
}
