enum MoodEnums {
  AWFUL,
  BAD,
  NORMAL,
  GOOD,
  JOYFUL
}

class Mood {

  MoodEnums mood;

  Mood () {
    mood = MoodEnums.NORMAL;
  }

  void setMood(MoodEnums newMood) {
    mood = newMood;
  }

  String getMoodinString() {
    var str;
    switch(mood) {
      case MoodEnums.BAD: str = "รู้สึกแย่"; break;
      case MoodEnums.NORMAL: str = "เฉยๆ"; break;
      case MoodEnums.GOOD: str = "รู้สึกดี"; break;
      case MoodEnums.JOYFUL: str = "มีความสุขมาก"; break;
      case MoodEnums.AWFUL : str = "เศร้า"; break;
      default : str = "พัง";
    }
    return str;
  }




}

