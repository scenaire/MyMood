
import 'Mood.dart';

class MoodList {
  List<Mood> _moodList = [];
  Mood _currentMood;

  List<Mood> get moodList => _moodList;

  Mood get currentMood => _currentMood;

  set moodList(List<Mood> moodList) {
    _moodList = moodList;
  }

  set currentMood(Mood mood) {
    _currentMood = mood;
  }
}