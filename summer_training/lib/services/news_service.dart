import 'package:dio/dio.dart';

import '../model/article.dart';


class NewsServices {
  Dio dio = Dio();

  Future<List<Article>> getNews(
      {required String path, required Map<String, dynamic> query}) async {
    Response respond = await dio.get(path, queryParameters: query);
    Map<String, dynamic> jsonData = respond.data;
    List<dynamic> articles = jsonData["articles"];
    List<Article> articlelist = [];
    for (var article in articles) {
      if (article["title"] == null ||
          article["content"] == null ||
          article["urlToImage"] == null) continue;
      articlelist.add(Article(
          title: article["title"],
          content: article["content"],
          urlToImage: article["urlToImage"]));
    }
    return articlelist;
  }
}