import {PassChecker} from "utilities/pass_checker"

document.addEventListener("input", () => {
  let form = document.forms[0];
  if (form.user_password_confirmation) {
    new PassChecker(form).compare();
  }
});
