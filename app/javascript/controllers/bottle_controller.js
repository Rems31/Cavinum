import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="bottle"
export default class extends Controller {
  static targets = ["addAudio", "deleteAudio"];

  playAddSound() {
    if (this.hasAddAudioTarget) {
      this.addAudioTarget.play();
    }
  }

  playDeleteSound(event) {
    event.preventDefault(); // Empêche l’action immédiate pour laisser le temps au son de jouer
    if (this.hasDeleteAudioTarget) {
      this.deleteAudioTarget.play();
      setTimeout(() => {
        event.target.closest("form").submit(); // Soumet le formulaire après le son
      }, 500); // Délai pour laisser le son se jouer
    }
  }
}
