import {FormHelper} from "utilities/form_helper";

document.addEventListener("turbolinks:load", () => {
  const links = document.querySelectorAll(".form-inline-link");
  const errors = document.getElementById("resource-errors");


  if (links.length) {
    links.forEach((link) => {
      const formHelper = new FormHelper(link);

      formHelper.linkHandler();

      if (errors?.dataset.resourceId == formHelper.testId) {
        formHelper.swapElement();
      }
    });
  }
});
