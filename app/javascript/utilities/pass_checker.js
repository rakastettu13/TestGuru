export class PassChecker {
  constructor(form) {
    this.form = form;
    this.value1 = form.user_password.value;
    this.value2 = form.user_password_confirmation.value;
  }

  compare() {
    if (this.value2 === "") {
      this.#hide(this.form, "check");
      this.#hide(this.form, "x");
    } else if (this.value1 === this.value2 ){
      this.#hide(this.form, "x");
      this.#show(this.form, "check");
    } else {
      this.#hide(this.form, "check");
      this.#show(this.form, "x");
    }
  }

  #hide(form, icon) {
    form.querySelectorAll(".octicon-" + icon).forEach((octicon) => octicon.classList.add("hide"));
  }

  #show(form, icon) {
    form.querySelectorAll(".octicon-" + icon).forEach((octicon) => octicon.classList.remove("hide"));
  }
}
