export class Timer {
  static start() {
    const timeField = document.getElementById("time-limit");

    if (timeField) {
      new Timer(timeField).start();
    }
  }

  constructor(timeField) {
    this.timeField = timeField;
    this.startTime = timeField.dataset.start;
    this.limitTime = timeField.dataset.limit * 60;
  }

  start() {
    setInterval(() => this.changeRemainingTime(), 1000);
  }

  stop() {
    document.forms[0].submit();
  }

  changeRemainingTime() {
    const currentTime = parseInt(new Date().getTime()/1000);
    const remainingTime = this.limitTime - (currentTime - this.startTime);

    this.timeField.textContent = this.timeFormat(remainingTime);

    if (remainingTime <= 0) {
      this.stop();
    }
  }

  timeFormat(time) {
    const sec = time%60;
    const min = (time - sec)/60%60;
    const hour = (time - min*60 - sec)/3600;
    return `${hour}:${min}:${sec}`;
  }
}
