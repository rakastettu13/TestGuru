document.addEventListener("turbolinks:load", function() {
  let form = document.forms[0];
    form.addEventListener("input", function() {
      let value1 = form.user_password.value;
      let value2 = form.user_password_confirmation.value;
      
      if (value2 === "") {
        hide(form, "check");
        hide(form, "x");
      } else if (value1 === value2 ){
        hide(form, "x");
        show(form, "check");
      } else {
        hide(form, "check");
        show(form, "x");
      }
    });
});

function hide(form, icon) {
  form.querySelectorAll(".octicon-" + icon).forEach((octicon) => octicon.classList.add("hide"));
}

function show(form, icon) {
  form.querySelectorAll(".octicon-" + icon).forEach((octicon) => octicon.classList.remove("hide"));
}
