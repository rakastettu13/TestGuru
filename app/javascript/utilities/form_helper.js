export class FormHelper {

  constructor(link) {
    this.link = link;
    this.testId = link.dataset.testId;
  }

  linkHandler() {
    this.link.addEventListener("click", () => {
      event.preventDefault();
      this.swapElement();
    });
  }

  swapElement() {
    this.#set_elements();

    if (this.formInline.classList.contains("hide")) {
      this.testTitle.classList.add("hide");
      this.formInline.classList.remove("hide");
      this.link.textContent = "Отменить";
    } else {
      this.testTitle.classList.remove("hide");
      this.formInline.classList.add("hide");
      this.link.textContent = "Изменить";
    }
  }

  #set_elements() {
    this.testTitle = this.testTitle || document.querySelector(`.test-title[data-test-id="${this.testId}"]`);
    this.formInline = this.formInline || document.querySelector(`.form-inline[data-test-id="${this.testId}"]`);
  }
}
