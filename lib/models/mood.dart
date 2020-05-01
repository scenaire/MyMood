
class Mood {

  String type;
  DateTime time;
  bool fav = false;
  String message = '';

  Mood(String type, DateTime time, String message, bool fav) {
    this.type = type;
    this.time = time;
    this.message = message;
    this.fav = fav;
  }

  get getMessage {
    return this.message;
  }

  get getType {
    return this.type;
  }

  
  

  
  }
