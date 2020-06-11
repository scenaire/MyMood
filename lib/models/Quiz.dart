//AUTHOR : Jiratchaya Yeeto

class Quiz {

  DateTime time;
  int twoQ;
  int nineQ;
  int eightQ;

  Quiz (int twoQ, int nineQ, int eightQ, DateTime time) {
    this.twoQ = twoQ;
    this.nineQ = nineQ;
    this.eightQ = eightQ;
    this.time = time;
  }

  get get2Q {
    return this.twoQ;
  }

  get get9Q {
    return this.nineQ;
  }

  get get8Q {
    return this.eightQ;
  }

  get getTime {
    return this.time;
  }

}