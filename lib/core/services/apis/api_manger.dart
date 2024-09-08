import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/core/models/source_model.dart';

import '../../models/news_model.dart';

class NewsApi {
  // static Future<NewModel> getNews({String sourceId = '', String search = ''}) async {
  //   try {
  //     var url = Uri.https('newsapi.org', 'v2/everything', {
  //       "q": search,
  //       "searchIn": 'title',
  //       "sources": sourceId,
  //       "apiKey": '5a6dbc70f8964b9bae0d2d07a204dfce'
  //     });
  //
  //     http.Response response = await http.get(url);
  //
  //     if (response.statusCode == 200) {
  //       var json = jsonDecode(response.body);
  //       return NewModel.fromJson(json);
  //     } else {
  //       return NewModel(articles: []);
  //     }
  //   } catch (e) {
  //     return NewModel(articles: []);
  //   }
  // }

  static Future<NewModel> getNews({String sourceId = '', String search = ''}) async {
    try {
      var url = Uri.https('newsapi.org', 'v2/everything', {
        "q": search,
        "searchIn": 'title',
        "sources": sourceId,
        "apiKey": '5a6dbc70f8964b9bae0d2d07a204dfce'
      });

      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return NewModel.fromJson(json);
      } else {
        return NewModel(articles: []);
      }
    } catch (e) {
      return NewModel(articles: []);
    }
  }

  Future<List<ArticleData>> getSearchedNews(
      {required String searchQuery, required String category}) async {
    try {
      final Dio dio = Dio();
      Response response = await dio.get(
          'https://newsapi.org/v2/everything?q=$searchQuery&searchIn=title&category=$category&apiKey=5a6dbc70f8964b9bae0d2d07a204dfce');
      Map<String, dynamic> json = response.data;

      List<dynamic> articlesData = json['articles'];

      List<ArticleData> articles = [];

      for (var article in articlesData) {
        articles.add(ArticleData.fromJson(article));
      }

      return articles;
    } catch (e) {
      return [];
    }
  }

  static Future<SourceModel> getSources({required String id}) async {
    try {
      var url = Uri.parse(
          'https://newsapi.org/v2/top-headlines/sources?category=$id&apiKey=5a6dbc70f8964b9bae0d2d07a204dfce');
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return SourceModel.fromJson(json);
      } else {
        return SourceModel(sources: []);
      }
    } catch (e) {
      return SourceModel(sources: []);
    }
  }

}
