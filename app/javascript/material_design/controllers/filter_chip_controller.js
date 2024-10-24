import { Controller } from "@hotwired/stimulus";
import { useClickOutside, useTransition } from "stimulus-use";

export default class extends Controller {
  static targets = [
    "chevronIcon",
    "chip",
    "dropdown",
    "label",
    "leadingIcon",
    "selectedIcon",
    "trailingIcon",
  ];
  static values = { open: Boolean, selected: Boolean };

  connect() {
    this.setSelected();

    useTransition(this, {
      element: this.dropdownTarget,
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
    if (this.dropdownTarget.classList.contains("hidden")) {
      this.openDropdown();
    } else {
      this.closeDropdown();
    }
  }

  openDropdown() {
    this.enter();
    this.chevronIconTarget.classList.add("rotate-180");
    // this.chipTarget.classList.add("selected");
  }

  closeDropdown() {
    this.leave();
    this.chevronIconTarget.classList.remove("rotate-180");
    // this.chipTarget.classList.remove("selected");
  }

  setSelected() {
    if (this.selectedValue) {
      this.selectedIconTarget.classList.remove("hidden");
      this.leadingIconTarget.classList.add("hidden");
    }
  }

  toggleSelected() {
    this.selectedIconTarget.classList.toggle("hidden");
    this.leadingIconTarget.classList.toggle("hidden");
  }
}
