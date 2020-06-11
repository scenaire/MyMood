//AUTHOR : Jiratchaya Yeeto

class Article {

  String title;
  String content;
  String picturePath;
  String credits;

  Article({this.title, this.content, this.picturePath, this.credits});

  get getTitle {
    return this.title;
  }

  get getContent {
    return this.content;
  }

  get getPicturePath {
    return this.picturePath;
  }

  get getCredits {
    return this.credits;
  }

}