import {ProgressBar} from "utilities/progress_bar";

document.addEventListener("turbolinks:load", () => {
  const redBar = document.getElementById("progress-bar");
  const greenBar = document.getElementById("passing-bar");

  if (redBar && greenBar) {
    ProgressBar.start(redBar, greenBar);
  }
});
