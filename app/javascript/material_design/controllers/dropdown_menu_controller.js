import { Controller } from "@hotwired/stimulus";
import { useClickOutside, useTransition } from "stimulus-use";

export default class extends Controller {
  static targets = ["menu"];
  static values = { open: Boolean };

  connect() {
    useTransition(this, {
      element: this.menuTarget,
      enterActive: "transition ease-out duration-100",
      enterFrom: "transform opacity-0 scale-95",
      enterTo: "transform opacity-100 scale-100",
      leaveActive: "transition ease-in duration-75",
      leaveFrom: "transform opacity-100 scale-100",
      leaveTo: "transform opacity-0 scale-95",
      hiddenClass: "hidden",
      transitioned: false,
    });

    useClickOutside(this);
    if (this.openValue) {
      this.openDropdown();
    } else {
      this.closeDropdown();
    }
  }

  clickOutside() {
    this.closeDropdown();
  }

  toggleDropdown() {
    if (this.menuTarget.classList.contains("hidden")) {
      this.openDropdown();
    } else {
      this.closeDropdown();
    }
  }

  openDropdown() {
    this.menuTarget.classList.remove("hidden");
    this.menuTarget.classList.add("show");
  }
  
  closeDropdown() {
    this.menuTarget.classList.remove("show");
    this.menuTarget.classList.add("hidden");
  }
}
