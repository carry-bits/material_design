import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["text"];
  connect() {
    console.log("Hello from Stimulus controller inside the engine!");
  }

  changeColor() {
    this.textTarget.classList.add("test");
  }
}
