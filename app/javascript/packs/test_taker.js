import {ProgressBar} from "utilities/progress_bar";
import {Timer} from "utilities/timer";

Timer.start();

document.addEventListener("turbolinks:load", () => {
  const redBar = document.getElementById("progress-bar");
  const greenBar = document.getElementById("passing-bar");

  if (redBar && greenBar) {
    ProgressBar.start(redBar, greenBar);
  }
});
