//AUTHOR : Jiratchaya Yeeto

class Sleep {

  DateTime createDate;
  DateTime sleep;
  DateTime wakeUp;
  int calculateSleepTime;

  Sleep({this.createDate, this.sleep, this.wakeUp, this.calculateSleepTime});

  get getCreateDate {
    return this.createDate;
  }

  get getSleepTime {
    return this.sleep;
  }

  get getWakeUp {
    return this.wakeUp;
  }

  get getCalculateSleepTime {
    return this.calculateSleepTime;
  }

  calculateSleepTimeMethod() {
    var diff = wakeUp.difference(sleep);
    this.calculateSleepTime = diff.inHours;
    return calculateSleepTime;
  }

  void setCalculateSleepTime(int calculateSleepTime) {
    this.calculateSleepTime = calculateSleepTime;
  }


}