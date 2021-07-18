export class ProgressBar {
  static start(redBar, greenBar) {
    const progressBar = new ProgressBar(redBar, greenBar);
      progressBar.changeWidth();
      progressBar.changeText();
  }

  constructor(redBar, greenBar) {
    this.redBar = redBar;
    this.greenBar = greenBar;
    this.redPercent = redBar.dataset.percent  + "%";
    this.greenPercent = greenBar.dataset.percent + "%";

  }

  changeWidth() {
    this.greenBar.style.width = this.greenPercent;
    this.redBar.style.width = (this.redBar.dataset.percent -
                               this.greenBar.dataset.percent) + "%";
  }

  changeText(){
    this.greenBar.textContent = this.greenPercent;

    if (this.redBar.style.width != '0%') {
      this.redBar.textContent = this.redPercent;
    }
  }
}
