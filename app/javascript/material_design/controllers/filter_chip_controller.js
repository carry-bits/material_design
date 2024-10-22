import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["target"];
  connect() {
    console.log("Hello from filter chip controller");
  }

  clickMessage() {
    console.log("click!");
    this.targetTarget.classList.add("test");
  }
}
