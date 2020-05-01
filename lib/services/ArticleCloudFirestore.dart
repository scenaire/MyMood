import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mymood/Models/Article.dart';


class ArticleCloudFirestore {



  final CollectionReference articleCollection = Firestore.instance.collection("Article");

  //GET

  Future<List<Article>> retriveArticleData() async {

    QuerySnapshot snapshot = await articleCollection.getDocuments();

    List<Article> _articleList = [];


    snapshot.documents.forEach((document) {
      _articleList.add(new Article(title: document['title'], content: document['content'], picturePath: document['picturePath'], credits: document['credits']));
    });

    return _articleList;

  }


}